import os
import json
import shutil
import hashlib
import re

PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
STATE_FILE = os.path.join(PROJECT_ROOT, ".rokct", "install_state.json")
ROUTER_FILE = os.path.join(PROJECT_ROOT, "lib", "core", "presentation", "routes", "app_router.dart")
MAIN_FILE = os.path.join(PROJECT_ROOT, "lib", "main.dart")

def file_hash(path):
    if not os.path.exists(path):
        return None
    hasher = hashlib.sha256()
    with open(path, "rb") as f:
        while chunk := f.read(8192):
            hasher.update(chunk)
    return hasher.hexdigest()

def load_state():
    if os.path.exists(STATE_FILE):
        try:
            with open(STATE_FILE, "r", encoding="utf-8") as f:
                return json.load(f)
        except Exception:
            pass
    return {"packages": {}}

def save_state(state):
    os.makedirs(os.path.dirname(STATE_FILE), exist_ok=True)
    with open(STATE_FILE, "w", encoding="utf-8") as f:
        json.dump(state, f, indent=2)

def install_sdk_files_and_routes(sdk_name):
    sdk_path = os.path.join(PROJECT_ROOT, "sdk", sdk_name)
    manifest_path = os.path.join(sdk_path, "manifest.json")
    
    if not os.path.exists(manifest_path):
        print(f"[-] No manifest found for {sdk_name}")
        return False
        
    with open(manifest_path, "r", encoding="utf-8") as f:
        manifest = json.load(f)
        
    version = manifest.get("version", "1.0.0")
    installs = manifest.get("installs", [])
    routes = manifest.get("routes", [])
    
    state = load_state()
    package_state = state["packages"].get(sdk_name, {"version": "0.0.0", "files": {}, "routes": []})
    package_state["version"] = version
    package_state["routes"] = routes
    
    print(f"\n[*] Installing SDK: {sdk_name} (v{version})")
    
    # 1. Sync Files
    for entry in installs:
        from_rel = entry.get("from")
        to_rel = entry.get("to")
        if not from_rel or not to_rel:
            continue
            
        src_path = os.path.join(sdk_path, from_rel)
        dest_path = os.path.join(PROJECT_ROOT, to_rel)
        
        if not os.path.exists(src_path):
            print(f"  [-] Template source not found: {from_rel}")
            continue
            
        files_to_sync = []
        if os.path.isdir(src_path):
            for root, _, filenames in os.walk(src_path):
                for filename in filenames:
                    abs_src = os.path.join(root, filename)
                    rel_to_src = os.path.relpath(abs_src, src_path)
                    abs_dest = os.path.join(dest_path, rel_to_src)
                    rel_dest = os.path.relpath(abs_dest, PROJECT_ROOT).replace("\\", "/")
                    files_to_sync.append((abs_src, abs_dest, rel_dest))
        else:
            rel_dest = to_rel.replace("\\", "/")
            files_to_sync.append((src_path, dest_path, rel_dest))
            
        for file_src, file_dest, rel_dest in files_to_sync:
            upstream_hash = file_hash(file_src)
            os.makedirs(os.path.dirname(file_dest), exist_ok=True)
            shutil.copy2(file_src, file_dest)
            package_state["files"][rel_dest] = upstream_hash
            print(f"  [+] COPY: {rel_dest}")
            
    state["packages"][sdk_name] = package_state
    save_state(state)
    
    # 2. Update Routing & Main DI Registrations
    update_router_table()
    update_main_dependencies()
    return True

def update_router_table():
    if not os.path.exists(ROUTER_FILE):
        print(f"[-] router file not found: {ROUTER_FILE}")
        return
        
    state = load_state()
    
    all_imports = set()
    all_routes = []
    
    for pkg_name, pkg_data in state.get("packages", {}).items():
        pkg_routes = pkg_data.get("routes", [])
        for r in pkg_routes:
            path = r.get("path")
            page = r.get("page")
            rtype = r.get("type", "MaterialRoute")
            imp = r.get("import")
            
            if imp:
                all_imports.add(f"import '{imp}';")
                
            all_routes.append(f"    {rtype}(path: '{path}', page: {page}),")
            
    with open(ROUTER_FILE, "r", encoding="utf-8") as f:
        content = f.read()
        
    # Inject imports
    import_block = "\n".join(sorted(list(all_imports)))
    import_replacement = f"// @generated-imports-start\n{import_block}\n// @generated-imports-end"
    content = re.sub(
        r"// @generated-imports-start.*?// @generated-imports-end",
        import_replacement,
        content,
        flags=re.DOTALL
    )
    
    # Inject routes
    routes_block = "\n".join(all_routes)
    routes_replacement = f"// @generated-routes-start\n{routes_block}\n// @generated-routes-end"
    content = re.sub(
        r"// @generated-routes-start.*?// @generated-routes-end",
        routes_replacement,
        content,
        flags=re.DOTALL
    )
    
    with open(ROUTER_FILE, "w", encoding="utf-8") as f:
        f.write(content)
    print("[*] Successfully updated app_router.dart with generated routes and imports.")

def update_main_dependencies():
    if not os.path.exists(MAIN_FILE):
        print(f"[-] main.dart file not found: {MAIN_FILE}")
        return
        
    state = load_state()
    
    sdk_imports = []
    sdk_registrations = []
    
    # Generate imports and register statements for all active packages
    for pkg_name in sorted(state.get("packages", {}).keys()):
        # Shared SDK import and dependency call
        sdk_imports.append(f"import 'package:{pkg_name}/{pkg_name}.dart';")
        # Format className as CamelCase (e.g. auth_sdk -> AuthSdkDependencies)
        class_prefix = "".join(part.capitalize() for part in pkg_name.split("_"))
        sdk_registrations.append(f"  {class_prefix}Dependencies.register(GetIt.instance);")
        
    with open(MAIN_FILE, "r", encoding="utf-8") as f:
        content = f.read()
        
    # Inject imports
    imports_block = "\n".join(sdk_imports)
    imports_replacement = f"// @generated-sdk-imports-start\n{imports_block}\n// @generated-sdk-imports-end"
    content = re.sub(
        r"// @generated-sdk-imports-start.*?// @generated-sdk-imports-end",
        imports_replacement,
        content,
        flags=re.DOTALL
    )
    
    # Inject DI registrations
    di_block = "\n".join(sdk_registrations)
    di_replacement = f"// @generated-sdk-di-start\n{di_block}\n// @generated-sdk-di-end"
    content = re.sub(
        r"// @generated-sdk-di-start.*?// @generated-sdk-di-end",
        di_replacement,
        content,
        flags=re.DOTALL
    )
    
    with open(MAIN_FILE, "w", encoding="utf-8") as f:
        f.write(content)
    print("[*] Successfully updated main.dart with generated SDK imports and DI registrations.")

if __name__ == "__main__":
    update_router_table()
    update_main_dependencies()

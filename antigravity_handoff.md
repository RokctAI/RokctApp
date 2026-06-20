# Hand-off & Resumption Prompt for Jules/Antigravity

You are resuming the RokctApp modularization task. The goal is to decouple the monolithic application shell (`lib/`) by migrating logic into independent, decoupled domain SDKs located in `sdk/` (`auth_sdk`, `users_sdk`, `payments_sdk`, `wallet_sdk`, etc.).

---

## 1. Project Context & Rules
- **Locked Directory**: The folder `sdk_old/` is strictly locked. NEVER touch, modify, or write to it.
- **Offline constraint**: All `flutter pub get` or `flutter pub run` actions MUST run with `--offline`.
- **Decoupling Strategy**: Decouple domain packages from the host app shell by using abstract providers or function injection callbacks (e.g. Riverpod `.overrideWith` in `lib/` main app configuration).

---

## 2. Active Progress Status
- **`core_sdk`**: Complete. Emitted core networks, general models (`AddressData`, `LocationModel`, `LanguageData`), and generic callbacks/overrides.
- **`profile_sdk`**: Complete. Houses pure raw model structures (`ProfileData`).
- **`payments_sdk`**: Complete. Reverted ledger operations back to `wallet_sdk` to focus purely on card registrations and checkout flows.
- **`auth_sdk`**: Complete (Internal). Decoupled successfully from direct `FirebaseAuth`, `AppHelpers`, and `AppConstants` by using Riverpod callbacks (e.g. `isPhoneFirebaseProvider`, `getFlavorProvider`).
- **`users_sdk`**: Complete (Internal). Exposes models (`AddressNewModel`, `ReferralModel`) and profile states cleanly.

---

## 3. Current Task State & Next Steps
We just completed deleting duplicate notifier files from the host application shell (`lib/core/application/auth/...`) to prevent naming conflicts (`Ambiguous import` errors) and triggered a script to redirect their imports to the clean `auth_sdk` package instead.

Your next steps:
1. **Verify Redirect Run**: Make sure the script `C:\Users\sinya\.gemini\antigravity\brain\b11b689f-2e6a-42df-b648-ea3c61a8b02f\scratch\redirect_auth_imports.py` finishes running to redirect all old imports to the SDK packages.
2. **Execute Analyze**: Run `flutter analyze lib/` to inspect any remaining references inside the host app presentation pages.
3. **Register Overrides**: Provide dependency overrides in the main host application shell (like `lib/main.dart` or `dependency_manager.dart`) for the abstract providers defined in `auth_sdk` (such as `isPhoneFirebaseProvider`, `getFlavorProvider`, etc.).
4. **Repeat for `users_sdk`**: Once `auth_sdk` integration is fully verified compile-clean, delete duplicate notifier files for `users_sdk` (like profile and edit_profile) inside `lib/core/application/...`, redirect their imports, and override their dependencies.

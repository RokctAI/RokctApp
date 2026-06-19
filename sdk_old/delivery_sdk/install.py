import os
import sys

sdk_dir = os.path.dirname(os.path.abspath(__file__))
project_root = os.path.dirname(os.path.dirname(sdk_dir))
sys.path.append(os.path.join(project_root, ".rokct"))

from sdk_installer_base import install_sdk_files_and_routes

if __name__ == "__main__":
    install_sdk_files_and_routes("delivery_sdk")

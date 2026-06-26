import sys
import os
# Add .rokct to path to import the base installer
sys.path.append(os.path.join(os.getcwd(), '.rokct'))
import sdk_installer_base

if __name__ == '__main__':
    sdk_name = 'subscriptions_sdk'
    sdk_installer_base.install_sdk_files_and_routes(sdk_name)

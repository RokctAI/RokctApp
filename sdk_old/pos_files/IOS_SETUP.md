# iOS & macOS Release Setup Guide 🍎 desktop

Currently, native Apple builds (iOS/macOS) require specific signing secrets. If you decide to publish to the App Store or distribute for Mac, you must configure these **GitHub Secrets**.

## Required Secrets (Organization or Repo Level)

| Secret Name | Description | How to Generate (PowerShell) |
| :--- | :--- | :--- |
| **`IOS_P12_BASE64`** | Apple Distribution Certificate (.p12) | `[Convert]::ToBase64String([IO.File]::ReadAllBytes("path\to\dist.p12"))` |
| **`IOS_CERTIFICATE_PASSWORD`** | The password for the .p12 file | (Plain text password) |
| **`IOS_MOBILEPROVISION_BASE64`** | Provisioning Profile (.mobileprovision) | `[Convert]::ToBase64String([IO.File]::ReadAllBytes("path\to\app.mobileprovision"))` |
| **`IOS_GOOGLE_SERVICE_INFO_PLIST`** | Firebase Config (If using Firebase) | `[Convert]::ToBase64String([IO.File]::ReadAllBytes("ios\Runner\GoogleService-Info.plist"))` |

## How to Enable

1.  Add the secrets above to `GitHub Settings > Secrets > Actions`.
2.  Enable the **iOS Workflow**:
    *   Ensure `.github/workflows/release-ios.yml` exists.
3.  **macOS Builds**: 
    *   **Status**: ✅ **Enabled** via `.github/workflows/release-macos.yml`.
    *   **Requirements**: Same signing secrets as iOS.
    *   **Trigger**: Runs on `stable` releases (Quota Limited) or Manual Dispatch.

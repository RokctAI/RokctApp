# Agent Memory & Lessons Learned

**Rule**: Before asking a question or starting a task, the Agent **MUST** read this file to check for past lessons or user preferences.

## User Profiles
*   **[Name]**:
    *   **Safe ID**: [ray.dev.9ac2b1] (Used for filenames)
    *   **Role/Preferences**: [Details]
*   *(Agent: Add new users here as they appear)*

## Global Preferences
*   **Session Retention**: [Forever] (Options: Forever, 1 Month, 1 Week)
*   **Checkpoint Policy**: [Value] (Options: Frequent, Manual) -> *Set 'Frequent' for Cloud Agents*
*   [Active] Prefer "Frappe" for backend.
*   [Active] Prefer "Next.js + AI SDK" for frontend.
*   [Active] Prefer "Flutter" for mobile.
*   [Active] "Premium" design aesthetic is non-negotiable.
*   [Active] CRITICAL: The directory 'sdk_old/' is locked. Do not write, copy, or modify any files in it.


## Lessons Learned
*(Agent to append new lessons here when a mistake is made or a correction is received)*

*   **2026-06-21** - UI Migration TrKeys Deferral: Defer modularizing `tr_keys.dart` into individual SDKs until we migrate the UI layer. For now, they remain centralized in `core_sdk`.
*   **2026-06-29** - Modular Database Design Rule: Do not hardcode drift tables or companion queries from other SDKs inside `core_sdk`'s `app_database.dart` (or its helper methods like `_createInsertable` and `_idColumn`). All SDK-specific tables MUST be declared in their respective `manifest.json` database block and injected dynamically during installation, and CRUD queries must be managed natively in those SDKs.


## Safe ID
sinyage.f74d39

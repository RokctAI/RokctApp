# Moving Local Database to Core SDK

This document outlines the architectural proposal to migrate the application's central local database components from the host shell into the `core_sdk`.

## Current State
Currently, the SQLite (Drift) database and offline synchronization logic reside in the host app's `lib/core/` module:
- `lib/core/infrastructure/utils/app_database.dart`
- `lib/core/infrastructure/utils/drift_tables.dart`
- `lib/core/infrastructure/utils/background_sync_service.dart`

While they are under `lib/core/`, they act as application-level dependencies rather than modular SDK resources.

## Proposed Migration
We propose moving these files into the core SDK at the following destination paths:
- `sdk/core_sdk/lib/src/infrastructure/utils/app_database.dart`
- `sdk/core_sdk/lib/src/infrastructure/utils/drift_tables.dart`
- `sdk/core_sdk/lib/src/infrastructure/utils/background_sync_service.dart`

## Benefits of Centralization in Core SDK

1. **Shared Access Across All SDKs:**
   By placing the Drift tables and the `AppDatabase` class within `core_sdk`, every other domain SDK (`orders_sdk`, `kitchen_sdk`, `users_sdk`) can seamlessly read and write to the same offline-first data source. This allows SDKs to persist data locally without needing complex bridging logic from the host application.

2. **Unified Offline-First Schema:**
   Having a single `drift_tables.dart` within the core SDK acts as a centralized schema definition. Domain SDKs can define their specific table structures (e.g., `OrdersTable` or `ProductsTable`) and register them within the shared core database, preventing fragmentation of local storage.

3. **Centralized Background Synchronization:**
   Moving the `BackgroundSyncService` into `core_sdk` ensures that offline task queuing and background synchronization logic are standardized. If the `orders_sdk` caches a local order offline, the `core_sdk`'s background service can handle pushing that queue to the remote server automatically once network connectivity is restored, without the individual SDK needing to manage network state logic.

4. **Cleaner Host Shell:**
   The host application (`RokctApp`) becomes purely a consumer of features. Dependency injection at the app root becomes simpler, as the host merely initializes the `AppDatabase` provided by `core_sdk` and passes the reference down, instead of owning the schema logic itself.
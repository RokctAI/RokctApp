# SDK Indirect Communication Patterns in RokctApp

This document outlines the architectural patterns and mechanisms used to facilitate indirect communication between decoupled SDKs in the RokctApp repository. By avoiding direct code dependencies, we maintain clean boundaries, prevent circular dependencies, and allow SDKs to be developed, tested, and reused independently.

## Principles of Decoupling
To achieve a fully decoupled monorepo architecture, the following principles are enforced:
- **No Direct Imports:** Domain SDKs (like `orders_sdk` or `payments_sdk`) should not directly import classes from other domain SDKs unless explicitly defined as a dependency in `pubspec.yaml` (and even then, strictly limited).
- **Inversion of Control (IoC):** Host applications (the shell) resolve dependencies at runtime using Riverpod (`.overrideWith`) and dependency injection providers.
- **Event-Driven Side Effects:** Modules publish state changes (e.g., via a processing engine or event bus) rather than directly triggering side effects in other domains.

## Communication Mechanisms

### 1. Shared Storage (SharedPreferences / LocalStorage)
The `core_sdk` provides unified access to device storage (e.g., `CoreLocalStorage`). This acts as a shared data layer for primitives.
- **Example:**
  The `auth_sdk` handles login and writes the user's `Token` and role into `LocalStorage`. Later, the `orders_sdk` or `users_sdk` retrieves this token transparently via its injected HTTP client (which reads from `LocalStorage`) to authenticate API requests. They do not need to ask the `auth_sdk` for the token directly.

### 2. The Wallet as a Financial Canvas
The `wallet_sdk` acts as a central ledger and transactional canvas. Other SDKs do not manage currency balances directly; instead, they interact with the wallet ledger.
- **Example:**
  When a checkout occurs, the `orders_sdk` triggers a payment intent or records a balance deduction without directly executing the financial transaction. The gateway logic in `payments_sdk` or the ledger in `wallet_sdk` handles the actual balance modification based on the intent.

### 3. The Processing SDK: Generalized Workflow Engine
The `processing_sdk` is designed as an industry-agnostic state machine that orchestrates contract lifecycles (e.g., Orders, Bookings, Loans) without domain-specific dependencies.
- **Event Publishing:** It manages state transitions (e.g., `Placed -> Accepted -> Cooking`) and publishes state-change events.
- **Example:**
  When a cook starts preparing an order, the `processing_sdk` publishes a "Cook Starts Prep" event. The `orders_sdk` orchestration layer catches this event and can indirectly trigger the `comms_sdk` to send a push notification to the customer. Neither SDK knows about the inner workings of the other.

### 4. Dependency Injection via Riverpod
Abstract interfaces are defined within SDKs, but the concrete implementations or cross-SDK bridges are stitched together in the host app (`lib/main.dart` or dependency managers).
- **Example:**
  The `kitchen_sdk` requires an `OrderData` model. To avoid a circular dependency, it exposes an abstract repository interface. The host app uses Riverpod's `.overrideWith` to inject the concrete `OrderData` logic from `orders_sdk` into the `kitchen_sdk` providers at runtime.

### 5. Local Database / Offline-First Synchronization
SDKs can interact indirectly by reading from and writing to shared or synchronized local databases.
- **Example:**
  An offline POS app uses the `orders_sdk` to write a Cash Order to the local database with a temporary UUID. A background synchronization worker (driven by `connectivity_plus` and shared queues) monitors this database table and pushes the queue to the backend once online, effectively bridging offline data entry and server sync without tightly coupling the UI to the network stack.

## Conclusion
By leveraging the host app shell for dependency injection, utilizing shared primitives like local storage and the wallet ledger, and employing a generalized event/state engine, RokctApp's SDKs remain modular. This ensures that features can be developed independently while still contributing to a cohesive application experience.
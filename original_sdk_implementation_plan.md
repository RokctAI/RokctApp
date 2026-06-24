# SDK Architecture & Monorepo Plan

This plan defines the architectural boundaries, dependency graph, and implementation details for modularizing `RokctApp` into reusable, platform-agnostic SDKs. It addresses your concerns about code state integrity, separate product data models, and details how the Wallet behaves as a transactional canvas for other domains.

> [!IMPORTANT]
> **Implementation Sequence Note**: As per user instruction, we will implement the **`productivity_sdk`** first because it is the simplest, followed by the **`processing_sdk`**.
> **Translation Keys Deferral Note**: Individual SDK translation keys (`tr_keys.dart` segregation) will be deferred until the UI layer is migrated. Until then, translation keys remain centralized in `core_sdk`.


---

## The Wallet as a Canvas

The Wallet is the central financial ledger and transactional "canvas" of the Rokct ecosystem. Other domains/SDKs do not manage currency balances directly; instead, they publish transaction intents or trigger balance operations that write to the Wallet ledger.

### What Interacts with the Wallet?
1. **Orders (Checkout & Refunds)**: Deducts balance on customer purchases; credits balance on order returns/refunds or cashback awards.
2. **Shop/Merchant Order Earnings**: Credits the restaurant or store's merchant wallet when customer orders are completed.
3. **Parcels (Delivery)**: Deducts customer balance on parcel bookings.
4. **Loans (Polaris SDK)**: Deposits disbursed loan funds into the wallet; deducts scheduled loan repayments from the wallet.
5. **Subscriptions**: Deducts merchant/manager balance for restaurant/POS subscription plans.
6. **Drivers (Earnings & Payouts)**: Credits driver balance with delivery fees; deducts balance when the driver requests a bank payout/withdrawal.
7. **Referrals & Sign-up**: Credits sign-up bonuses or referral commission payouts to the user's wallet.
8. **Auth / User Profile**: Caches the wallet state (`Wallet` model with current balance) inside `LocalStorage` when users login or update their profile.
9. **Payments (Gateways)**: Interacts directly to fund the wallet (PayFast, Stripe, etc.) or withdraw funds out.

---

## List of Potential SDKs

To achieve clean separation of concerns and enable multi-platform deployment (e.g. Flutter, Next.js, Frappe), the application will be structured into the following SDK modules:

| SDK Name | Responsibility | Key Components | Status |
| :--- | :--- | :--- | :--- |
| **`core_sdk`** | Common utilities, storage, and networking foundation. | `HttpService`, `CoreLocalStorage`, standard API error envelopes. | **Done (Migrated)** |
| **`auth_sdk`** | Authentication, token lifecycle, and role-based permissions. | Login, registration, OTP, `UserRole`, session validity, OAuth. | **Initialized (Providers Pending)** |
| **`users_sdk`** | Active user profile management, address books, client directories, and guest registrations. | `UsersRepository`, user search mechanisms, profile update payloads, address models. | **Initialized (Providers Pending)** |
| **`profile_sdk`** | Shared raw user profile data models and state schemas. | `ProfileData` model and core response schema mappings. | **Done (Migrated)** |
| **`payments_sdk`** | Payment gateway wrappers, card registration, transaction status polling, and checkout flows. | PayFast, Stripe, transaction polling mechanisms. | **Done (Migrated)** |
| **`wallet_sdk`** | Financial ledgers, transaction records, and account balances. | `Wallet` model, transaction history, deposit triggers, withdrawal requests. | **Initialized (Reverted payment logic)** |
| **`revenue_sdk`** | Driver income, merchant/shop revenue calculations, POS daily sales metrics, tax rates/calculations, and financial reporting charts. | Income statistics models, tax models, revenue data aggregators, visual chart data generators. | **Planned** |
| **`shops_sdk`** | Shared store metadata, operational hours, seller registrations, delivery options, and category catalogs. | `ShopsRepository` interface, shop metadata models, delivery parameters. | **Initialized (as merchants_sdk)** |
| **`products_sdk`** | Shared product catalog, categories, search, and inventory interfaces. | Abstract product representation, catalog fetching, category hierarchies. | **Initialized (Compile Fixes Done)** |
| **`promotions_sdk`** | Coupons, discount models, referral rewards, invite bonuses, loyalty calculations, banner ads, and customer stories. | Coupon verification, referral bonus triggers, loyalty point matrices, banner ad models, stories repository. | **Planned** |
| **`weather_sdk`** | Weather status tracker and environmental conditions integrations. | Current temperature details, climate metrics. | **Planned** |
| **`order_sdk`** | Order placement, checkout calculations, cart math, and order histories. | Abstract order placement interfaces, generic cart math. | **Initialized (as orders_sdk)** |
| **`delivery_sdk`** | Real-time map locations, parcel routing, and courier assignments. | Driver telemetry tracking, location streams, route mapping. | **Planned** |
| **`booking_sdk`** | Generic resource scheduling, calendar availability slots, and reservation state management (supporting tables, salon sessions, accommodations, etc.). | Generic Reservable Resource models, booking slot generators, reservation lifecycle engines. | **Planned** |
| **`polaris_sdk`** | Loan applications, eligibility, and repayment trackers. | Credit checks, interest rates, installment agreements. | **Planned** |
| **`kitchen_kds_sdk`** | Kitchen ticket workflows, order status updates, offline synchronization for restaurant operators. | Kitchen display stream models, order status state machines. | **Initialized (as kitchen_sdk)** |
| **`legal_sdk`** | Help desks, FAQs, Terms of Service, and privacy policies. | FAQ database client, versioned policy documents. | **Planned** |
| **`fav_sdk`** | Shared favorites and bookmarks engine for customer product/shop wishlists and bookmarking. | Favorites repository, bookmark models, toggle handlers. | **Planned** |
| **`productivity_sdk`** | Team task tracking, checklists, workflow management, and operational action items. | Task repositories, checklist managers, workflow templates, action lists. | **Initialized** |
| **`hardware_sdk`** | Physical peripheral controller wrappers. | Bluetooth/USB ESC-POS printer connectors, device scanning. | **Planned** |
| **`comms_sdk`** | In-app chat, SMS notifications, and support tickets. | WebSocket chat connections, notification history. | **Planned** |
| **`desktop_sdk`** | Custom native desktop runners (windows/macos), CMake configurations, window management overrides, and desktop platform-specific shell logic. | Native platform runner assets, build files, desktop window overrides. | **Initialized** |
| **`subscriptions_sdk`** | Merchant and POS subscription plans, feature toggling matrices, payment link integration, and active state tracking. | Subscription plan models, billing frequency metrics, subscription state hooks. | **Done (Migrated)** |
| **`agent_sdk`** | Core AI coding assistants, agent operations, AI-based recommendations, local AI models execution, intelligent logic, clever coding features, and reasoning interfaces. | Chat completion repositories, recommendation endpoints, prompt templates, local model configurations, heuristic/clever coding rules. (Depends on `auth_sdk`, `users_sdk`, and `subscriptions_sdk`). | **Planned** |
| **`zones_sdk`** | Delivery zones management, polygon/map drawing, regional pricing/selling rules, and driver assignment boundaries. *(Note: To be developed in the final phase once the 6ammart repository is shared for forking)* | Zone polygons, map coordinate parsers, zone-specific pricing/delivery fee matrices. | **Planned** |
| **`loyalty_sdk`** | Loyalty card registration, point accumulation rules, and point-to-currency conversion flows. | Loyalty balance tracking, conversion matrices, reward tier models. | **Planned** |
| **`telephony_sdk`** | VoIP integrations, in-app calling wrappers, and call log histories. | Call state managers, audio stream controllers, VOIP signaling channels. | **Planned** |


> [!NOTE]
> **POS Offline-First Operations**:
> * **Offline Catalog Caching**: POS must cache the product catalog locally, allowing cashiers to search and display items even without a network connection.
> * **Local Order Progress**: When offline, changes in order status (e.g., Cook starting/finishing preparation, Cashier marking as ready) are tracked locally. These status transitions are queued and pushed to the server once the connection is restored.
> * **Offline Order Creation**: Cash and Pickup orders can be created offline. Delivery orders will also be processed locally, but their dispatch/delivery pickup requests will remain queued and only pushed to the server once the POS gets back online.
> * **Sync Queue Engine**: Shared synchronization queues and background workers (driven by `connectivity_plus` and storage triggers) will handle automated processing of the offline order queues.
> * **Reverted POS Files**: The POS files (`pos_files/`) have been reverted to their original state. Therefore, the printer peripheral integration inside POS will be relooked at and linked properly via `hardware_sdk` as part of the execution phase.
> * **Kitchen Dependency Challenge**: The KDS circular dependency between `kitchen_sdk` and the POS app's specific `OrderData` model will be resolved in a future phase once `users_sdk` and `orders_sdk` are created. For now, the KDS SDK only exposes the repository interface contract.
>
> **Backend Migration (Laravel to Frappe)**:
> * **Migration Scope**: The backend is transitioning from Laravel to Frappe. As a result, any legacy Laravel API routes and integer ID data models (`int?`) found in POS files must be updated to their corresponding Frappe routes and String ID representation models (`String?`) during integration.
>
> **Native Platform Runners (`windows/` and `macos/`)**:
> * **SDK Host**: The custom native desktop runner configurations (including CMake rules, custom window handlers, and native bridges) will be stored inside **`desktop_sdk`** (`sdk/desktop_sdk/windows` and `sdk/desktop_sdk/macos`).
> * **Automated Root Migration**: When `desktop_sdk` is installed via the composer script, it will automatically move/merge its `windows/` and `macos/` directories to the root of `RokctApp`. This keeps the main application shell clean of native desktop customization until the desktop integration is explicitly added.

---

### The Processing SDK: Generalized Workflow & State Engine

To prevent circular dependencies and enable reuse across unrelated domains, the **Processing Layer** is designed as a generalized, industry-agnostic **State Machine & Lifecycle Orchestration Engine**. 

It manages the state transitions of any **contract** (Order, Booking, Loan, or even abstract operational missions) and publishes events without knowing the details of the financial or communication layers.

### 1. Abstract Contract Lifecycles
Any operational unit is treated as a contract transitioning through defined milestones:
* **Order Contract**: `Placed -> Accepted -> Cooking -> Ready -> Dispatched -> Delivered`
* **Booking Contract**: `Booked -> Confirmed -> Active/Checked-In -> Completed/Checked-Out`
* **Loan Contract**: `Applied -> Underwriting -> Approved -> Disbursed -> Repaying -> Settled`
* **Mission Contract**: `Planned -> Dispatched -> In-Progress -> Target-Reached -> Completed`

### 2. Isolation & Event-Driven Architecture
The Processing SDK has two core constraints:
* **No Financial Dependencies**: It does not query or reference the `wallet_sdk` or payment gateways. Instead, it reads a read-only state flag (like `isPaid` or `paymentStatus`) on the contract.
* **No Direct Communication Side-Effects**: It does not call `comms_sdk` or notification services directly. It simply executes the state transition (e.g. `cooking`) and publishes a state-changed event.

### 3. Core Orchestrator Reaction
The upper business layers (e.g. `order_sdk`, `booking_sdk`, `polaris_sdk`) listen to the published state events from the Processing Engine and trigger the actual domain side-effects:
* **Approved Loan Event**: The Loan Orchestrator catches this and triggers the `wallet_sdk` to deposit funds.
* **Cook Starts Prep Event**: The Order Orchestrator catches this and triggers the `comms_sdk` to send a push notification to the customer.
* **Checked-In Event**: The Booking Orchestrator catches this and assigns a table/resource.

> [!CAUTION]
> **Locked Directory**: The directory `sdk_old/` is strictly locked. We must never write, copy, or modify any files inside `sdk_old/`.

---

## Code Integrity & Scope Distinction Rules

To ensure data representation remains accurate across different user types, we enforce the following constraints:

> [!IMPORTANT]
> **Rule 1: Full-Path Package Imports & Exports**
> When moving or copying source/template files from SDKs to the host application shell:
> * **Package Name Extraction**: Always read the application's package name from its `pubspec.yaml` (e.g. `name: rokctapp`).
> * **Full-Path Usage**: Replace all relative import and export statements (e.g., `import '../../utils.dart'`) with full package-path imports (e.g., `import 'package:rokctapp/core/utils/utils.dart'`) referencing the extracted package name to ensure correct and standardized compile resolution.
> * **Installer Automation**: The SDK installer engine (`sdk_composer.py` / `sdk_installer_base.py`) must respect and automate this rule. When deploying template code or linking packages, the installer must parse the host application's name and programmatically rewrite imports and exports.

> [!IMPORTANT]
> **Rule 2: Actor-Specific Views and Data Isolation**
> Most core data entities (e.g. Products, Orders, Users, Settings) are viewed, validated, and processed differently depending on the context of the user actor (Customer, Driver, Manager/Seller). 
> * **Concrete Example**: A Product model for a Customer is basic and does not contain sensitive details like "cost of sale". However, for a Manager, "cost of sale" is critical for inventory valuation and profit margins. 
> * **SDK Responsibility**: SDKs must only define the *raw core data primitives* or *minimal common properties* (like shared network structures or shared base classes).
> * **Consumer Feature Responsibility**: The platform-specific, view-specific representation models (which contain exact data types, UI helper fields, local properties, and specific endpoint mappings) **must remain completely isolated** within their consumer folders (`lib/customer/`, `lib/driver/`, `lib/manager/`).

> [!WARNING]
> **Rule 3: Avoid Blind Monolithic Merging**
> Never merge Customer, Driver, and Manager data representations (such as `ProductData` or `OrderData`) into a single model inside an SDK. Doing so creates type errors (e.g., `String` vs `int` representation mismatches) and pollutes the views with fields that are irrelevant to that actor.

> [!IMPORTANT]
> **Rule 4: Role-Based Access Control (RBAC) & UI Partitioning**
> When combining features, different logged-in roles (e.g., Waiter, Cook, Cashier, Manager) must be strictly partitioned at both the UI and data levels:
> * **UI Menu & Navigation Hiding**: The POS/Manager frontend must dynamically show or hide menu options and buttons based on the user's role. For example, a Waiter can access Table Bookings, but catalog management, editing products, and adding/modifying stock must be completely hidden and inaccessible to them.
> * **SDK Enforcement**: Permission checks and role flags (exposed via `auth_sdk`) must guard write/edit APIs to prevent unauthorized actions at the network level.

> [!IMPORTANT]
> **Rule 5: Safe Deferral of Similar/Role-Specific Code**
> To guarantee that the application builds successfully without regression, any logic currently residing in role-specific folders (`lib/customer/`, `lib/driver/`, or `lib/manager/`) that is similar but has minor functional or type differences **must remain separate and untouched** in its respective directory. We will not force these components into a shared SDK. Consolidating or merging these blocks is deferred until the core SDK setup is completed and fully verified.

> [!IMPORTANT]
> **Rule 6: Temporary Local Identifiers & Backend Remapping**
> When creating orders or registering profiles offline:
> * **Local ID Assignment**: Generate a temporary UUID locally (using `Uuid().v4()`) to serve as the local primary key.
> * **Background Remapping**: The background sync dispatcher enqueues the synchronization request (`appDatabase.enqueueSyncRequest`). Once network connection is restored and the backend responds with the official server-side ID, the local database must execute a remapping transaction to replace the temporary UUID with the official database ID across all cached tables.

> [!IMPORTANT]
> **Rule 7: Authoritative Inventory Writer vs. Sales Consumer**
> We must respect the logical division between inventory administration (Manager app) and front-desk sales operations (POS app), while ensuring future extensibility:
> * **Manager (Write-Authoritative)**: The Manager dashboard owns all write-heavy catalog operations (creating/editing products, updating stock counts, setting up brands/categories, translations, and store metadata).
> * **POS (Read-Optimized)**: The POS frontend is currently a read-only consumer of product and stock queries (optimized for fast checkout math and order placement) and lacks catalog editing views.
> * **Extensibility Design**: The underlying `products_sdk` will still expose the write/edit repository interfaces (e.g. `updateProduct`, `updateStock`). This allows us to easily unlock inventory editing directly inside the POS desktop app in the future when a user with the `manager` or `seller` role logs in.

---

## Verification Plan

### Automated Verification
* Run `flutter analyze` on the app and on each SDK individually to ensure there are zero import/type errors.
* Execute unit tests for each independent module.

### Manual Verification
* Inspect and compare file counts between the new structure and `lib_backup/` to ensure no active code files were deleted.

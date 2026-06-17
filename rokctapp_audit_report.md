# RokctApp Codebase Audit & SDK Breakdown

## 1. Current State Inventory

### Distinct Concerns Implemented
*   **Authentication & Identity**: Login, registration, OTP verification, forgot password, social login.
*   **User Profile & Addresses**: Managing profile data, delivery addresses, and user settings.
*   **Orders & Cart**: Shopping cart, placing orders, calculating prices, applying coupons, order history, repeating orders, refunds, and tipping.
*   **Products & Catalog**: Browsing products, categories, search, most sold, discounted, brands, and reviews.
*   **Wallet & Payments**: Wallet history, sending money, transactions, initiating payments (e.g. Stripe, Maksekeskus), tip processing, and cashbacks.
*   **Delivery & Parcels**: Parcel orders, deliveryman locations, delivery zones, assigning orders to drivers, and push notifications for status updates.
*   **Shop/Seller Management**: Manager dashboards, shop working days, shop payments, table management, subscriptions, and income statistics.
*   **Notifications**: Push notifications (FCM), read receipts, unread counts, and notifications statistics.
*   **Settings & Analytics**: App settings, translations, currencies, FAQs, unique visits (`rcore`).

### Duplication of Concerns
The codebase strictly divides concerns by `customer`, `driver`, and `manager` top-level directories, leading to massive duplication of both models and repository layers:
*   **Authentication**: Implemented three times:
    *   `lib/customer/repository/auth_repository.dart` (Customer Auth)
    *   `lib/manager/infrastructure/repositories/auth_repository.dart` (Manager Auth)
    *   `lib/driver/infrastructure/repositories/auth_repository_impl.dart` (Driver Auth)
*   **Orders**:
    *   `lib/customer/repository/orders_repository.dart` (Customer Orders)
    *   `lib/manager/infrastructure/repositories/orders_repository.dart` (Manager Orders)
    *   `lib/driver/infrastructure/repositories/orders_repository.dart` (Driver Orders)
*   **Models**: Identical data shapes are duplicated across flavors. E.g., `WalletHistoriesResponse` exists in both `lib/customer/models/response/wallet_histories_response.dart` and `lib/manager/infrastructure/models/response/wallet_histories_response.dart`. `OrderData`, `LoginResponse`, and `VerifyPhoneResponse` are also heavily duplicated across all three flavors.
*   **Dependency Injection**: `lib/core/domain/di/dependency_manager.dart` registers duplicate repositories for each flavor rather than using single shared repositories (e.g. `driverOrdersRepository` vs `managerOrdersRepository`).

### Flavor-Based Branching
Flavor branching heavily relies on `AppConstants.flavor` (`AppFlavor.customer`, `AppFlavor.manager`, `AppFlavor.driver`).
*   **UI Layer**: Hardcoded in widgets like `lib/core/presentation/pages/auth/login/login_screen.dart` (e.g. `if (flavor == AppFlavor.manager)` or `AppConstants.flavor == AppFlavor.customer`) to conditionally show UI elements (tabs, forms, texts).
*   **Business Logic Layer**: Controllers like `LoginNotifier` (`lib/core/application/auth/login/login_notifier.dart`), `RegisterNotifier` (`lib/core/application/auth/register/register_notifier.dart`), and `ResetPasswordNotifier` check the flavor to determine which role the user must have to log in, thus duplicating access-control logic inside view models rather than relying on standard token/API RBAC limits.

## 2. Backend Boundary Map

### App Ownership & Endpoints
*   **`paas`**: Acts as the primary backend for business operations.
    *   *Orders*: `/api/v1/method/paas.api.order.order...`
    *   *Products*: `/api/v1/method/paas.api.product.product...`
    *   *Payments & Wallet*: `/api/v1/method/paas.api.payment.payment...`
    *   *Delivery*: `/api/v1/method/paas.api.delivery.delivery.get_driver_location`
    *   *Users & Refunds*: `/api/v1/method/paas.api.user.user...`
*   **`rcore`**: Handles tenant-level analytics and control.
    *   *Settings/Analytics*: `/api/method/rcore.tenant.api.record_unique_visit` and `/api/method/rcore.tenant.api.report_client_error` (found in `lib/customer/repository/settings_repository.dart`).
*   **`lending` / Polaris**: No endpoints or logic for lending were found in the Flutter codebase (e.g. no `lending` or `loan` references), indicating it's either not yet implemented on the client or purely existing as a backend placeholder right now.

### Boundary Violations & Inconsistencies
*   **Direct API Bypassing**: There is a mix of standard REST endpoints (e.g., `/api/v1/dashboard/user/...`, `/api/v1/rest/...`) and Frappe RPC endpoints (`/api/v1/method/paas.api...`). This indicates two different backend shapes/frameworks (likely Laravel legacy vs. Frappe) being queried simultaneously.
*   **Logical Ownership Bypassed**: Payment and User endpoints are baked deeply into `paas` instead of an independent or decoupled service (e.g., `paas.api.payment.payment.initiate_stripe_payment` and `paas.api.user.user.create_order_refund`).
*   **Auth Inconsistencies**: Authentication largely uses Laravel-style `/api/v1/auth/login` and `/api/v1/auth/register` endpoints, rather than `rcore` site-level authentication. This splits session management between two API patterns.

## 3. Proposed SDK Boundaries

### 1. `AuthSDK` (Auth & Identity)
*   **Responsibility**: Manages user sessions, registration, login (OTP/Social/Password), token persistence, and device identity binding.
*   **Files Moving**: `lib/core/application/auth/*`, `AuthRepository` variations across all flavors, `userRepository.updateFirebaseToken`.
*   **Public Interface**:
    *   `login(identifier, password) -> AuthSession`
    *   `verifyOtp(code) -> AuthSession`
    *   `registerDevice(deviceFingerprint, fcmToken) -> void`
    *   `isDeviceBanned(deviceFingerprint) -> bool`
    *   `logout() -> void`
*   **Dependencies**: None.

### 2. `OrderSDK` (Orders & Cart)
*   **Responsibility**: Manages order creation, calculation, checkout flow, repeating orders, and cart status.
*   **Files Moving**: All `OrdersRepository` files (`lib/*/repository/orders_repository.dart`), Cart repositories, `OrderData` models.
*   **Public Interface**:
    *   `calculateCart(cartItems) -> OrderCalculation`
    *   `placeOrder(checkoutPayload) -> Order`
    *   `getOrderDetails(orderId) -> Order`
    *   `updateOrderStatus(orderId, status) -> Order`
*   **Dependencies**: `AuthSDK` (for token), `WalletPaymentSDK`.

### 3. `WalletPaymentSDK` (Wallet & Payments)
*   **Responsibility**: Abstracting wallet balances, transaction histories, checkouts, and initiating external payment gateways.
*   **Files Moving**: `WalletHistoriesResponse`, payment initiating endpoints (`initiate_*_payment`), tip process endpoints (`/api/v1/dashboard/user/wallet/histories`, etc.).
*   **Public Interface**:
    *   `getWalletBalance() -> Balance`
    *   `getTransactions(paginationArgs) -> TransactionList`
    *   `initiatePayment(orderId, gateway) -> PaymentIntent`
*   **Dependencies**: `AuthSDK`.

### 4. `DeliverySDK` (Delivery & Parcels)
*   **Responsibility**: Courier tasks, driver location pinging, parcel delivery operations, and delivery zones.
*   **Files Moving**: `ParcelRepository` variations, `get_driver_location` endpoints, push order screens.
*   **Public Interface**:
    *   `getDriverLocation(orderId) -> LocationData`
    *   `updateDriverLocation(locationData) -> void`
    *   `createParcelOrder(parcelData) -> ParcelOrder`
*   **Dependencies**: `AuthSDK`, `OrderSDK`.

### 5. `ProfileSDK` (User Management & Addresses)
*   **Responsibility**: Updating user profile details and maintaining address books.
*   **Files Moving**: `AddressRepository`, `UserRepository` (profile-specific endpoints like `/api/v1/dashboard/user/addresses`).
*   **Public Interface**:
    *   `getProfile() -> UserProfile`
    *   `saveAddress(addressData) -> Address`
*   **Dependencies**: `AuthSDK`.

### 6. `LendingSDK` (Lending / Polaris)
*   **Responsibility**: Loan applications, eligibility checks, and disbursement logic.
*   **Files Moving**: N/A (Currently missing in Flutter).
*   **Public Interface**:
    *   `checkEligibility() -> EligibilityResult`
    *   `applyForLoan(loanDetails) -> LoanApplication`
*   **Dependencies**: `AuthSDK`, `WalletPaymentSDK`.

## 4. Role-Awareness Strategy

*   **Current State**: Role logic is hardcoded using `AppFlavor` in the UI and Notifiers (e.g. `LoginNotifier` checking `if (currentFlavor == AppFlavor.manager && user.role != 'seller')`).
*   **Proposed Strategy**: **Composition and Gated Methods**.
    *   Instead of duplicating `OrdersRepository` three times, we have one `OrderSDK`.
    *   The `OrderSDK` will be initialized with the active `AuthSession`, which includes the user's verified role (`customer`, `manager`, `deliveryman`).
    *   Methods will dynamically append role-specific parameters or utilize specific backend endpoints if necessary, but expose a unified interface. For example, `orderSDK.listOrders()` internally checks the role to call `/api/v1/dashboard/seller/orders` vs `/api/v1/dashboard/deliveryman/orders` vs `/api/v1/dashboard/user/orders`.
    *   Alternatively, the backend should unify endpoints so `GET /api/orders` returns orders relevant to the token's role, stripping the role-awareness completely out of the Flutter SDK layer.
*   **UI Updates**: Move hardcoded role logic out of the UI. Instead of `if (flavor == AppFlavor.manager) showCookingTab()`, the SDK should provide a permissions object: `if (orderSDK.permissions.canManageOrderStatuses) showCookingTab()`.

## 5. Device Binding & Fraud Controls Readiness

*   **Current State**: The codebase registers **FCM (Firebase Cloud Messaging) tokens** (e.g., in `RegisterConfirmationNotifier`, `userRepository.updateFirebaseToken(fcmToken)`). There is **no device fingerprinting**, hardware binding, or concept of banned devices.
*   **What Needs to be Added**:
    *   A reliable device fingerprinting library (like `device_info_plus` mixed with secure storage UUID generation).
    *   Backend schema (`Device Token` doctype or similar) to map device fingerprints to user IDs and track a `banned` boolean.
    *   Intercepting 403 Device Banned errors universally on the client.
*   **Where it Belongs**: This belongs firmly inside the proposed **`AuthSDK`**. Registration and login payloads must be updated to include `device_fingerprint`.

## 6. Migration Risk & Sequencing

### Order of Operations
1.  **Extract `AuthSDK`**: Unify the scattered `AuthRepository` implementations and standardise session/token storage via `LocalStorage`.
2.  **Extract `WalletPaymentSDK`**: Move wallet models and payment APIs. It has few UI dependencies and is relatively isolated.
3.  **Extract `ProfileSDK`**: Centralize user and address mapping.
4.  **Extract `OrderSDK`**: Consolidate the 3x duplication of Orders. **(High Risk)**.
5.  **Extract `DeliverySDK`**: Pull courier and location logic out of Orders.
6.  **Implement `LendingSDK`**: Since it's largely placeholder/not yet present on the client, it can be built cleanly from scratch on top of `AuthSDK` and `WalletPaymentSDK`.

### High-Risk Areas
*   **UI/Business Logic Coupling**: `Notifiers` (like `LoginNotifier`, `RegisterNotifier`, `OrderNotifier`) are heavily coupled to `AppFlavor` and `DependencyManager` singletons. Extracting SDKs will require a major refactor of Riverpod providers.
*   **Order Module Entanglement**: The `OrdersRepository` (across all 3 flavors) is massive and ties deeply into pagination, real-time UI states, and cart calculations.

### Recommended First Step
**Extract `AuthSDK`**.
*Why:* Authentication is the absolute foundation. Every other SDK will depend on a unified `Session` and `Token` to make API calls. Currently, auth logic is replicated per flavor and heavily couples UI with `AppFlavor` checks. Consolidating this will immediately clean up the `core` layer, validate the SDK pattern, and enable secure device fingerprinting for fraud controls.

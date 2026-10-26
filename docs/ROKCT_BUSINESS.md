# ROKCT Business (ROKCT-branded manager, free local-only app)

This repo is the ROKCT-branded manager shell. It composes the same SDK set as `paas_manager` (see `composer.json`) with the manager persona (`.rokct/config/app_type`), built with the free local-tier flag. `paas_manager` stays the Juvo-branded demo; both point at the Juvo delivery-platform docker. Each app has its own SDK list, so they may diverge later.

Plan and decisions: project file `paas-manager-free-tier/plan.md`.

## What the free tier does
- Phone-only business app: in-store sales, receipts, stock, credit customers all work and stay on the device.
- The account is created in the backend; shop data is not uploaded until the shop may sync (`api.seller_subscription.get_sync_status`, commerce#187): subscriptions switched off on the backend, or an active plan.
- No customer orders and not visible in the customer app until synced.
- A plan is bought through the existing gateway webview (no store billing). On upgrade the local data uploads through the outbox.

## Build
- Dart define: `FREE_LOCAL_TIER=true` (base_sdk 1.96.0, core#358). Without it the app behaves like the paid manager.
- Copy/keep `composer.json` at the repo root, then run the compose scripts in `.rokct/` as for any shell.
- Store identity (chosen, not yet in a build): app name **ROKCT Business**, Android applicationId / iOS bundle id **`com.rokct.business`**. Must differ from `paas_manager` (`com.app.demo`).

## Still to do (not in this PR)
- Run compose to generate the Flutter project (pubspec, android, ios), then set applicationId / bundle id, app name, icons and splash for ROKCT Business.
- Firebase project and `google-services.json` for `com.rokct.business`, signing keys, Google web client ID: add the key names to the private secrets repo (`.env/production.env`), values by Ray.
- Build workflow and tour (`tour/app.tour.yaml`) with full coverage of the home SDK's screens, plus the free-tier line in the app; needs Ray's go for Build.
- Upgrade snapshot upload: enqueue every existing local row when the shop first becomes allowed to sync (outbox only holds changes made while queued).
- Nothing here has been compiled: no Flutter in the authoring environment.

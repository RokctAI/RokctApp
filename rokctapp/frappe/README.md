# rokctapp — frappe side

This is the frappe-side home of the rokctapp product. It currently carries only the
house Subscription Plan fixtures (Free / Basic / Pro / Team / Ultra).

The module joins the rokctapp compose template in the-rokct-protocol when its frappe
half is built. Fixtures under `src/fixtures/Subscription_Plan` are picked up by
control's loader-union once the module is composed or installed.

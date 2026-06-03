# API Reference: addons_body

Source file: `lib/manager/presentation/pages/main/foods/addons/addons_body.dart`

## Classes

### class `AddonsBody`

## Whitelisted API Endpoints

### `AddonsBody({super.key, required this.addonsController}); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Consumer(builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `LoadingList(verticalPadding: 16, itemBorderRadius: 0, itemPadding: 10, ) : SmartRefresher( controller: addonsController, physics: const NeverScrollableScrollPhysics(), enablePullDown: true, enablePullUp: true, onLoading: () => event.fetchMoreAddons(refreshController: addonsController), onRefresh: () => event.refreshAddons(refreshController: addonsController), child: ListView.builder( physics: const NeverScrollableScrollPhysics(), padding: REdgeInsets.only(top: 16), shrinkWrap: true, itemCount: state.addons.length, itemBuilder: (context, index) => AddonItem( addon: state.addons[index], onTap: ()`
*No documentation provided (generation failed).*

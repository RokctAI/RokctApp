# API Reference: tab_search

Source file: `lib/customer/presentation/pages/shop/widgets/tab_search.dart`

## Classes

### class `TabSearch`

## Whitelisted API Endpoints

### `TabSearch({super.key, required this.controller}); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Consumer(builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `ThemeWrapper(builder: (colors, theme)`
*No documentation provided (generation failed).*

### `AnimatedContainer(margin: EdgeInsets.only( top: ref.watch(shopProvider).isSearchEnabled ? 20 : 25, ), duration: const Duration(milliseconds: 400), width: ref.watch(shopProvider).isSearchEnabled ? MediaQuery.sizeOf(context).width - 24 : 40.r, padding: REdgeInsets.only(right: 12, top: 16), child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [ if (ref.watch(shopProvider).isSearchEnabled) Column( mainAxisAlignment: MainAxisAlignment.end, children: [ Text( AppHelpers.getTranslation(TrKeys.searchTheMenu), style: AppStyle.interNoSemi( size: 12, color: colors.textBlack, ), maxLines: 1, overflow: TextOverflow.fade, ), 4.verticalSpace, ], ) else 4.verticalSpace, TextField( controller: controller, cursorColor: colors.primary, readOnly: !ref.watch(shopProvider).isSearchEnabled, onChanged: (value)`
*No documentation provided (generation failed).*

### `Duration(seconds: 1), ()`
*No documentation provided (generation failed).*

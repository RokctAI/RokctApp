# API Reference: currency_page

Source file: `lib/customer/presentation/pages/profile/currency_page.dart`

## Classes

### class `CurrencyScreen`

## Whitelisted API Endpoints

### `CurrencyScreen({super.key, required this.colors}); @override ConsumerState<ConsumerStatefulWidget> createState() => _LanguagePageState(); } class _LanguagePageState extends ConsumerState<CurrencyScreen> { @override void initState()`
*No documentation provided (generation failed).*

### `deactivate()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: KeyboardDismisser( child: Container( decoration: BoxDecoration( color: widget.colors.backgroundColor.withValues(alpha: 0.96), borderRadius: BorderRadius.only( topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r), ), ), width: double.infinity, child: Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: state.isLoading ? const Loading() : Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ 8.verticalSpace, Center( child: Container( height: 4.r, width: 48.r, decoration: BoxDecoration( color: AppStyle.dragElement, borderRadius: BorderRadius.circular(40.r), ), ), ), 24.verticalSpace, TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.currencies), paddingHorizontalSize: 0, titleSize: 18, ), 24.verticalSpace, ListView.builder( shrinkWrap: true, itemCount: state.list.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

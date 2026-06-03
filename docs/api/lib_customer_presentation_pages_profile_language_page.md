# API Reference: language_page

Source file: `lib/customer/presentation/pages/profile/language_page.dart`

## Classes

### class `LanguageScreen`

## Whitelisted API Endpoints

### `LanguageScreen({super.key, required this.onSave, required this.colors}); @override ConsumerState<ConsumerStatefulWidget> createState() => _LanguagePageState(); } class _LanguagePageState extends ConsumerState<LanguageScreen> { @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: KeyboardDismisser( child: Container( decoration: BoxDecoration( color: widget.colors.backgroundColor.withValues(alpha: 0.96), borderRadius: BorderRadius.only( topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r), ), ), width: double.infinity, child: state.isLoading ? const Loading() : Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: SingleChildScrollView( child: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ 8.verticalSpace, Center( child: Container( height: 4.h, width: 48.w, decoration: BoxDecoration( color: AppStyle.dragElement, borderRadius: BorderRadius.all( Radius.circular(40.r), ), ), ), ), 24.verticalSpace, TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.language), paddingHorizontalSize: 0, titleSize: 18, ), 24.verticalSpace, ListView.builder( shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemCount: state.list.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `SelectItem(onTap: ()`
*No documentation provided (generation failed).*

# API Reference: languages_modal

Source file: `lib/core/presentation/components/languages_modal.dart`

## Classes

### class `LanguageScreen`

## Whitelisted API Endpoints

### `Function(LanguageData?)? afterUpdate; const LanguageScreen({super.key, required this.afterUpdate}); @override ConsumerState<LanguageScreen> createState() => _LanguagePageState(); } class _LanguagePageState extends ConsumerState<LanguageScreen> { @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: KeyboardDismisser( child: Container( decoration: BoxDecoration( color: AppStyle.mainBack, borderRadius: BorderRadius.only( topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r), ), ), child: state.isLoading ? const SizedBox(height: 200, child: Loading()) : SingleChildScrollView( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ const ModalDrag(), AppBarBottomSheet( title: AppHelpers.getTranslation(TrKeys.language), ), 24.verticalSpace, ListView.builder( shrinkWrap: true, itemCount: state.list.length, padding: EdgeInsets.zero, physics: const BouncingScrollPhysics(), itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `SelectItem(onTap: () => event.change(index), isActive: state.index == index, title: state.list[index].title ?? '', ); }, ), 24.verticalSpace, CustomButton( title: AppHelpers.getTranslation(TrKeys.save), onPressed: () async { await ref .read(languagesProvider.notifier) .makeSelectedLang( context, afterUpdate: widget.afterUpdate, ); if (context.mounted)`
*No documentation provided (generation failed).*

# API Reference: multi_translation_input_modal

Source file: `lib/manager/presentation/component/multi_translation_input_modal.dart`

## Classes

### class `MultiTranslationInputModal`

## Whitelisted API Endpoints

### `MultiTranslationInputModal({ super.key, required this.model, required this.label, required this.inputs, required this.save, this.modelId, }); @override ConsumerState<MultiTranslationInputModal> createState() => _MultiTranslationInputModalState(); } class _MultiTranslationInputModalState extends ConsumerState<MultiTranslationInputModal> { final List<LanguageData> _languages = LocalStorage.getActiveLanguages(); final LanguageData? _activeLanguage = LocalStorage.getLanguage(); late TextEditingController _textController; final Map<String, String> _inputs = {}; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: SafeArea( child: Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ const ModalDrag(), Row( crossAxisAlignment: CrossAxisAlignment.end, children: [ Expanded( child: UnderlinedTextField( label: widget.label, textController: _textController, descriptionText: state.translatedUsingAi ? AppHelpers.getTranslation( TrKeys.thisContentTranslatedUsingAI, ) : null, onChanged: (text)`
*No documentation provided (generation failed).*

### `PopupMenuItem(child: Text( e.title ?? '-', style: AppStyle.interNormal( color: AppStyle.black, ), ), onTap: ()`
*No documentation provided (generation failed).*

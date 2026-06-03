# API Reference: edit_extras_item_modal

Source file: `lib/manager/presentation/pages/main/foods/extras/details/widgets/edit_extras_item_modal.dart`

## Classes

### class `EditExtrasItemModal`

## Whitelisted API Endpoints

### `EditExtrasItemModal({ super.key, required this.group, required this.extras, }); @override ConsumerState<EditExtrasItemModal> createState() => _EditExtrasItemModalState(); } class _EditExtrasItemModalState extends ConsumerState<EditExtrasItemModal> { final _formKey = GlobalKey<FormState>(); @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Form(key: _formKey, child: Column( mainAxisSize: MainAxisSize.min, children: [ const ModalDrag(), TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.addNewExtras), ), 24.verticalSpace, UnderlinedTextField( label: AppHelpers.getTranslation(TrKeys.title), inputType: TextInputType.text, textCapitalization: TextCapitalization.sentences, textInputAction: TextInputAction.done, onChanged: event.setTitle, validator: AppValidators.emptyCheck, initialText: widget.extras.value, ), 36.verticalSpace, CustomButton( title: AppHelpers.getTranslation(TrKeys.save), isLoading: state.isLoading, onPressed: ()`
*No documentation provided (generation failed).*

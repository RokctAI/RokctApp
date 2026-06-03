# API Reference: create_new_group_item_modal

Source file: `lib/manager/presentation/pages/main/foods/extras/details/widgets/create_new_group_item_modal.dart`

## Classes

### class `CreateNewGroupItemModal`

## Whitelisted API Endpoints

### `CreateNewGroupItemModal({super.key, required this.group}); @override State<CreateNewGroupItemModal> createState() => _CreateNewGroupItemModalState(); } class _CreateNewGroupItemModalState extends State<CreateNewGroupItemModal> { final _formKey = GlobalKey<FormState>(); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Form(key: _formKey, child: Column( mainAxisSize: MainAxisSize.min, children: [ const ModalDrag(), TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.addNewExtras), ), 24.verticalSpace, UnderlinedTextField( label: AppHelpers.getTranslation(TrKeys.title), inputType: TextInputType.text, textCapitalization: TextCapitalization.sentences, textInputAction: TextInputAction.done, onChanged: event.setTitle, validator: AppValidators.emptyCheck, ), 36.verticalSpace, CustomButton( title: AppHelpers.getTranslation(TrKeys.save), isLoading: state.isLoading, onPressed: ()`
*No documentation provided (generation failed).*

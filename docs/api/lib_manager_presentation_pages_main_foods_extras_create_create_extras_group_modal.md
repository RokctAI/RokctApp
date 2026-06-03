# API Reference: create_extras_group_modal

Source file: `lib/manager/presentation/pages/main/foods/extras/create/create_extras_group_modal.dart`

## Classes

### class `CreateExtrasGroupModal`

## Whitelisted API Endpoints

### `CreateExtrasGroupModal({super.key}); @override State<CreateExtrasGroupModal> createState() => _CreateExtrasGroupModalState(); } class _CreateExtrasGroupModalState extends State<CreateExtrasGroupModal> { final _formKey = GlobalKey<FormState>(); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Form(key: _formKey, child: Column( mainAxisSize: MainAxisSize.min, children: [ const ModalDrag(), TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.addNewExtrasGroup), ), 24.verticalSpace, UnderlinedTextField( label: AppHelpers.getTranslation(TrKeys.title), inputType: TextInputType.text, textCapitalization: TextCapitalization.sentences, textInputAction: TextInputAction.done, onChanged: event.setTitle, validator: AppValidators.emptyCheck, ), 36.verticalSpace, CustomButton( title: AppHelpers.getTranslation(TrKeys.save), isLoading: state.isLoading, onPressed: ()`
*No documentation provided (generation failed).*

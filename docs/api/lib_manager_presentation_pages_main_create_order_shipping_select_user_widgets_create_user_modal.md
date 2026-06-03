# API Reference: create_user_modal

Source file: `lib/manager/presentation/pages/main/create_order/shipping/select_user/widgets/create_user_modal.dart`

## Classes

### class `CreateUserModal`

## Whitelisted API Endpoints

### `CreateUserModal({super.key}); @override State<CreateUserModal> createState() => _CreateUserModalState(); } class _CreateUserModalState extends State<CreateUserModal> { final _formKey = GlobalKey<FormState>(); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Form(key: _formKey, child: SingleChildScrollView( physics: const BouncingScrollPhysics(), child: Column( mainAxisSize: MainAxisSize.min, children: [ const ModalDrag(), TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.addUser), ), 24.verticalSpace, UnderlinedTextField( label: '${AppHelpers.getTranslation(TrKeys.firstname)}*', inputType: TextInputType.text, textCapitalization: TextCapitalization.sentences, textInputAction: TextInputAction.next, onChanged: event.setFirstname, validator: AppValidators.emptyCheck, ), 24.verticalSpace, UnderlinedTextField( label: '${AppHelpers.getTranslation(TrKeys.lastname)}*', inputType: TextInputType.text, textCapitalization: TextCapitalization.sentences, textInputAction: TextInputAction.next, onChanged: event.setLastname, validator: AppValidators.emptyCheck, ), 24.verticalSpace, UnderlinedTextField( label: '${AppHelpers.getTranslation(TrKeys.phoneNumber)}*', inputType: TextInputType.phone, textInputAction: TextInputAction.next, onChanged: event.setPhone, validator: AppValidators.emptyCheck, ), 24.verticalSpace, UnderlinedTextField( label: '${AppHelpers.getTranslation(TrKeys.email)}*', inputType: TextInputType.emailAddress, textCapitalization: TextCapitalization.none, textInputAction: TextInputAction.done, onChanged: event.setEmail, validator: AppValidators.emptyCheck, ), 24.verticalSpace, CustomButton( title: AppHelpers.getTranslation(TrKeys.save), isLoading: state.isLoading, onPressed: ()`
*No documentation provided (generation failed).*

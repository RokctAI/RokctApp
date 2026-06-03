# API Reference: update_extras_group_modal

Source file: `lib/manager/presentation/pages/main/foods/extras/update/update_extras_group_modal.dart`

## Classes

### class `UpdateExtrasGroupModal`

## Whitelisted API Endpoints

### `UpdateExtrasGroupModal({super.key, required this.group}); @override ConsumerState<UpdateExtrasGroupModal> createState() => _UpdateExtrasGroupModalState(); } class _UpdateExtrasGroupModalState extends ConsumerState<UpdateExtrasGroupModal> { final _formKey = GlobalKey<FormState>(); @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Form(key: _formKey, child: Column( mainAxisSize: MainAxisSize.min, children: [ const ModalDrag(), TitleAndIcon(title: AppHelpers.getTranslation(TrKeys.edit)), 24.verticalSpace, UnderlinedTextField( label: AppHelpers.getTranslation(TrKeys.title), inputType: TextInputType.text, textCapitalization: TextCapitalization.sentences, textInputAction: TextInputAction.done, onChanged: event.setTitle, validator: AppValidators.emptyCheck, initialText: widget.group.translation?.title, ), 36.verticalSpace, CustomButton( title: AppHelpers.getTranslation(TrKeys.save), isLoading: state.isLoading, onPressed: ()`
*No documentation provided (generation failed).*

# API Reference: add_category_modal

Source file: `lib/manager/presentation/pages/main/foods/create/details/add_category_modal.dart`

## Classes

### class `AddCategoryModal`

## Whitelisted API Endpoints

### `AddCategoryModal({super.key}); @override State<AddCategoryModal> createState() => _AddCategoryModalState(); } class _AddCategoryModalState extends State<AddCategoryModal> { final _formKey = GlobalKey<FormState>(); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Form(key: _formKey, child: Column( mainAxisSize: MainAxisSize.min, children: [ const ModalDrag(), TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.addNewCategory), ), 24.verticalSpace, Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `UnderlinedTextField(textController: ref .watch(allCategoriesProvider) .categorySubController, label: '${AppHelpers.getTranslation(TrKeys.subShopCategory)}*', suffixIcon: Icon( FlutterRemix.arrow_down_s_line, color: AppStyle.blackColor, size: 18.r, ), readOnly: true, validator: AppValidators.emptyCheck, onTap: () => AppHelpers.showCustomModalBottomSheet( paddingTop: MediaQuery.paddingOf(context).top + 100.h, context: context, modal: const FoodCategoriesModal(isSubCategory: true), isDarkMode: false, ), ); }, ), 24.verticalSpace, UnderlinedTextField( label: AppHelpers.getTranslation(TrKeys.categoryName), inputType: TextInputType.text, textCapitalization: TextCapitalization.sentences, textInputAction: TextInputAction.next, onChanged: event.setTitle, validator: AppValidators.emptyCheck, ), 24.verticalSpace, UnderlinedTextField( label: AppHelpers.getTranslation(TrKeys.input), inputType: TextInputType.number, textInputAction: TextInputAction.done, onChanged: event.setInput, inputFormatters: [FilteringTextInputFormatter.digitsOnly], ), 36.verticalSpace, CustomButton( title: AppHelpers.getTranslation(TrKeys.save), isLoading: state.isLoading, onPressed: ()`
*No documentation provided (generation failed).*

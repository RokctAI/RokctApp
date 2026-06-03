# API Reference: extras_group_details_modal

Source file: `lib/manager/presentation/pages/main/foods/extras/details/extras_group_details_modal.dart`

## Classes

### class `ExtrasGroupDetailsModal`

## Whitelisted API Endpoints

### `ExtrasGroupDetailsModal({super.key, required this.group}); @override ConsumerState<ExtrasGroupDetailsModal> createState() => _ExtrasGroupDetailsModalState(); } class _ExtrasGroupDetailsModalState extends ConsumerState<ExtrasGroupDetailsModal> { @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: Column( children: [ const ModalDrag(), ButtonsBouncingEffect( child: GestureDetector( onTap: () => AppHelpers.showCustomModalBottomSheet( context: context, modal: CreateNewGroupItemModal(group: widget.group), isDarkMode: false, ), child: Row( mainAxisAlignment: MainAxisAlignment.center, children: [ Icon( FlutterRemix.play_list_add_line, color: AppStyle.blue, size: 18.r, ), 10.horizontalSpace, Text( AppHelpers.getTranslation(TrKeys.addNewExtras), style: AppStyle.interSemi( size: 14, color: AppStyle.blue, letterSpacing: -0.3, ), ), ], ), ), ), UnderlinedTextField( label: '', readOnly: true, initialText: widget.group.translation?.title, onTap: () => AppHelpers.showCustomModalBottomSheet( context: context, modal: UpdateExtrasGroupModal(group: widget.group), isDarkMode: true, ), suffixIcon: widget.group.shopId == LocalStorage.getShop()?.id ? GestureDetector( onTap: () => AppHelpers.showCustomModalBottomSheet( context: context, isDarkMode: true, modal: DeleteExtrasGroupModal(group: widget.group), ), child: Icon( FlutterRemix.delete_bin_fill, size: 24.r, color: AppStyle.red, ), ) : const SizedBox.shrink(), ), Expanded( child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

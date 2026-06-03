# API Reference: delete_extras_group_modal

Source file: `lib/manager/presentation/pages/main/foods/extras/delete/delete_extras_group_modal.dart`

## Classes

### class `DeleteExtrasGroupModal`

## Whitelisted API Endpoints

### `DeleteExtrasGroupModal({super.key, required this.group}); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: Column( mainAxisSize: MainAxisSize.min, children: [ const ModalDrag(), 40.verticalSpace, Text( '${AppHelpers.getTranslation(TrKeys.areYouSureToDelete)} "${group.translation?.title}"?', textAlign: TextAlign.center, style: GoogleFonts.inter( fontSize: 18, color: AppStyle.blackColor, fontWeight: FontWeight.w500, letterSpacing: -14 * 0.02, ), ), 36.verticalSpace, Row( children: [ Expanded( child: CustomButton( title: AppHelpers.getTranslation(TrKeys.cancel), onPressed: context.maybePop, background: AppStyle.transparent, borderColor: AppStyle.blackColor, ), ), 16.horizontalSpace, Expanded( child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `CustomButton(title: AppHelpers.getTranslation(TrKeys.yes), isLoading: ref .watch(deleteExtrasGroupProvider) .isLoading, onPressed: () => ref .read(deleteExtrasGroupProvider.notifier) .deleteExtrasGroup( context, groupId: group.id, success: ()`
*No documentation provided (generation failed).*

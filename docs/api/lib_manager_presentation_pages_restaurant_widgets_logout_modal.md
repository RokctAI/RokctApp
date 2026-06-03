# API Reference: logout_modal

Source file: `lib/manager/presentation/pages/restaurant/widgets/logout_modal.dart`

## Classes

### class `LogoutModal`

## Whitelisted API Endpoints

### `LogoutModal({super.key, this.isDeleteAccount = false}); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: Padding( padding: REdgeInsets.symmetric(horizontal: 15), child: Column( mainAxisSize: MainAxisSize.min, children: [ const ModalDrag(), 12.verticalSpace, Text( AppHelpers.getTranslation( isDeleteAccount ? TrKeys.areYouSure : TrKeys.doYouReallyWantToLogout, ), style: AppStyle.interSemi(size: 16), textAlign: TextAlign.center, ), 40.verticalSpace, Row( children: [ Expanded( child: CustomButton( borderColor: AppStyle.black, background: AppStyle.transparent, textColor: AppStyle.black, title: AppHelpers.getTranslation(TrKeys.cancel), onPressed: ()`
*No documentation provided (generation failed).*

### `CustomButton(background: AppStyle.red, textColor: AppStyle.white, title: AppHelpers.getTranslation( TrKeys.deleteAccount, ), onPressed: ()`
*No documentation provided (generation failed).*

### `CustomButton(title: AppHelpers.getTranslation(TrKeys.logout), onPressed: ()`
*No documentation provided (generation failed).*

# API Reference: logout_modal

Source file: `lib/driver/presentation/pages/profile/widgets/logout_modal.dart`

## Classes

### class `LogoutModal`

## Whitelisted API Endpoints

### `LogoutModal({super.key, this.isDeleteAccount = false}); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Padding(padding: REdgeInsets.symmetric(horizontal: 15), child: Column( children: [ Text( AppHelpers.getTranslation( isDeleteAccount ? TrKeys.areYouSure : TrKeys.doYouReallyWantToLogout, ), style: AppStyle.interSemi(size: 16.sp), textAlign: TextAlign.center, ), 40.verticalSpace, Row( children: [ Expanded( child: CustomButton( borderColor: AppStyle.black, background: AppStyle.transparent, title: AppHelpers.getTranslation(TrKeys.cancel), onPressed: ()`
*No documentation provided (generation failed).*

### `CustomButton(background: AppStyle.red, textColor: AppStyle.white, title: AppHelpers.getTranslation(TrKeys.deleteAccount), onPressed: ()`
*No documentation provided (generation failed).*

### `CustomButton(title: AppHelpers.getTranslation(TrKeys.logout), onPressed: ()`
*No documentation provided (generation failed).*

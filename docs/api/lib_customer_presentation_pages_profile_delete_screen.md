# API Reference: delete_screen

Source file: `lib/customer/presentation/pages/profile/delete_screen.dart`

## Classes

### class `DeleteScreen`

## Whitelisted API Endpoints

### `DeleteScreen({ super.key, this.isDeleteAccount = false, required this.onDelete, required this.colors, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Column(mainAxisSize: MainAxisSize.min, children: [ Text( AppHelpers.getTranslation(TrKeys.areYouSure), style: AppStyle.interSemi(size: 16.sp, color: colors.textBlack), textAlign: TextAlign.center, ), isDeleteAccount ? Column( children: [ 16.verticalSpace, Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `CustomButton(background: AppStyle.red, textColor: AppStyle.white, title: AppHelpers.getTranslation(TrKeys.deleteAccount), onPressed: ()`
*No documentation provided (generation failed).*

### `CustomButton(title: AppHelpers.getTranslation(TrKeys.logout), onPressed: ()`
*No documentation provided (generation failed).*

### `LoginRoute()); }, ); }, ), ], ), 16.verticalSpace, CustomButton( borderColor: AppStyle.black, background: AppStyle.transparent, textColor: colors.textBlack, title: AppHelpers.getTranslation(TrKeys.cancel), onPressed: ()`
*No documentation provided (generation failed).*

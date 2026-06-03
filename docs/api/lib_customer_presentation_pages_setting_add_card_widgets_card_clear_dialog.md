# API Reference: card_clear_dialog

Source file: `lib/customer/presentation/pages/setting/add_card/widgets/card_clear_dialog.dart`

## Classes

### class `CardClearDialog`

## Whitelisted API Endpoints

### `CardClearDialog({ super.key, required this.cancel, required this.clear, required this.cardName, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Container(width: (MediaQuery.sizeOf(context).width - 60.w), decoration: BoxDecoration( color: AppStyle.white.withValues(alpha: 0.96), boxShadow: [ BoxShadow( color: AppStyle.white.withValues(alpha: 0.65), spreadRadius: 0, blurRadius: 60, offset: const Offset(0, 20), ), ], ), child: Column( mainAxisSize: MainAxisSize.min, children: [ Text( AppHelpers.getTranslation(TrKeys.clearCard1), style: AppStyle.interNormal(size: 16, color: AppStyle.black), ), Text( cardName, style: AppStyle.interSemi(size: 16, color: AppStyle.black), ), Text( AppHelpers.getTranslation(TrKeys.clearCard2), style: AppStyle.interNormal(size: 16, color: AppStyle.black), ), 50.verticalSpace, Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ CustomButton( title: AppHelpers.getTranslation(TrKeys.cancel), onPressed: ()`
*No documentation provided (generation failed).*

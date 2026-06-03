# API Reference: phone_verify

Source file: `lib/customer/presentation/pages/profile/phone_verify.dart`

## Classes

### class `PhoneVerify`

## Whitelisted API Endpoints

### `PhoneVerify({super.key}); @override Widget build(BuildContext context, ref)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: KeyboardDismisser( child: ThemeWrapper( builder: (colors, theme)`
*No documentation provided (generation failed).*

### `Container(margin: MediaQuery.of(context).viewInsets, decoration: BoxDecoration( color: colors.backgroundColor.withValues(alpha: 0.96), borderRadius: BorderRadius.only( topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r), ), ), width: double.infinity, child: Padding( padding: const EdgeInsets.all(16.0), child: SingleChildScrollView( child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween, mainAxisSize: MainAxisSize.min, children: [ Column( children: [ AppBarBottomSheet( title: AppHelpers.getTranslation( TrKeys.phoneNumber, ), ), Directionality( textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: IntlPhoneField( style: TextStyle(color: colors.textBlack), dropdownTextStyle: TextStyle( color: colors.textBlack, ), onChanged: (phoneNum)`
*No documentation provided (generation failed).*

### `BorderSide(color: AppStyle.differBorder, ), const BorderSide( color: AppStyle.differBorder, ), ), ), errorBorder: UnderlineInputBorder( borderSide: BorderSide.merge( const BorderSide( color: AppStyle.differBorder, ), const BorderSide( color: AppStyle.differBorder, ), ), ), border: const UnderlineInputBorder(), focusedErrorBorder: UnderlineInputBorder( borderSide: BorderSide.merge( const BorderSide( color: AppStyle.differBorder, ), const BorderSide( color: AppStyle.differBorder, ), ), ), disabledBorder: UnderlineInputBorder( borderSide: BorderSide.merge( const BorderSide( color: AppStyle.differBorder, ), const BorderSide( color: AppStyle.differBorder, ), ), ), focusedBorder: const UnderlineInputBorder(), ), ), ), ], ), Padding( padding: EdgeInsets.only(top: 30.h), child: CustomButton( background: !state.email.trim().isNotEmpty ? AppStyle.textGrey : colors.primary, isLoading: state.isLoading, title: AppHelpers.getTranslation(TrKeys.next), onPressed: ()`
*No documentation provided (generation failed).*

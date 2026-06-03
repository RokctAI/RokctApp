# API Reference: keep_logged_checkbox

Source file: `lib/customer/presentation/components/keep_logged_checkbox.dart`

## Classes

### class `KeepLoggedCheckbox`

## Whitelisted API Endpoints

### `KeepLoggedCheckbox({ super.key, required this.value, required this.onChanged, required this.colors, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Row(children: [ SizedBox( height: 24.r, width: 24.r, child: Transform.scale( scale: 1.2, child: Checkbox( side: BorderSide(color: colors.textBlack, width: 1.5.r), shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(4.r), ), checkColor: colors.backgroundColor, activeColor: colors.textBlack, value: value, onChanged: (value) => onChanged(value!), ), ), ), 8.horizontalSpace, Expanded( child: RichText( text: TextSpan( style: AppStyle.interNormal(size: 13, color: colors.textBlack), children: [ TextSpan( text: '${AppHelpers.getTranslation(TrKeys.iAcceptThe)} ', ), TextSpan( text: AppHelpers.getTranslation(TrKeys.privacyPolicy), style: AppStyle.interNormal( size: 13, color: colors.primary, textDecoration: TextDecoration.underline, ), recognizer: TapGestureRecognizer() ..onTap = ()`
*No documentation provided (generation failed).*

# API Reference: outline_bordered_text_field

Source file: `lib/manager/presentation/component/text_fields/outline_bordered_text_field.dart`

## Classes

### class `OutlinedBorderTextField`

## Whitelisted API Endpoints

### `Function(String)? onChanged; final VoidCallback? onTap; final String? Function(String?)? validation; final TextInputType? inputType; final String? initialText; final String? descriptionText; final bool readOnly; final bool isError; final bool isSuccess; final TextCapitalization? textCapitalization; final TextInputAction? textInputAction; const OutlinedBorderTextField({ super.key, required this.label, this.suffixIcon, this.onTap, this.obscure, this.validation, this.onChanged, this.textController, this.inputType, this.initialText, this.descriptionText, this.readOnly = false, this.isError = false, this.isSuccess = false, this.textCapitalization, this.textInputAction, this.hint, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ if (label != null) Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( label!, style: AppStyle.interNormal(size: 9, color: AppStyle.black), ), ], ), TextFormField( autocorrect: true, onTap: onTap, onChanged: onChanged, obscureText: !(obscure ?? true), obscuringCharacter: '*', controller: textController, validator: validation, style: AppStyle.interNormal(size: 15, color: AppStyle.black), cursorWidth: 1, cursorColor: AppStyle.black, keyboardType: inputType, initialValue: initialText, readOnly: readOnly, textCapitalization: textCapitalization ?? TextCapitalization.sentences, textInputAction: textInputAction, decoration: InputDecoration( suffixIconConstraints: BoxConstraints( maxHeight: 30.h, maxWidth: 30.h, ), suffixIcon: suffixIcon, hintText: hint ?? AppHelpers.getTranslation(TrKeys.typeSomething), hintStyle: AppStyle.interNormal( size: 13, color: AppStyle.black.withOpacity(.5), ), contentPadding: REdgeInsets.symmetric(horizontal: 0, vertical: 8), floatingLabelBehavior: FloatingLabelBehavior.always, fillColor: AppStyle.pendingDark, filled: false, enabledBorder: _border(AppStyle.black.withOpacity(.2)), errorBorder: _border(AppStyle.red.withOpacity(.2)), border: _border(AppStyle.black.withOpacity(.2)), focusedErrorBorder: _border(AppStyle.black.withOpacity(.2)), disabledBorder: _border(AppStyle.black.withOpacity(.2)), focusedBorder: _border(AppStyle.primary.withOpacity(.9)), ), ), if (descriptionText != null) Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ 4.verticalSpace, Text( descriptionText!, style: AppStyle.interRegular( letterSpacing: -0.3, size: 12, color: isError ? AppStyle.red : isSuccess ? AppStyle.textGrey : AppStyle.pendingDark, ), ), ], ), ], ); } UnderlineInputBorder _border(Color color)`
*No documentation provided (generation failed).*

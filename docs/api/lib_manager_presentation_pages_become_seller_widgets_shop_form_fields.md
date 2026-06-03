# API Reference: shop_form_fields

Source file: `lib/manager/presentation/pages/become_seller/widgets/shop_form_fields.dart`

## Classes

### class `ShopFormFields`

## Whitelisted API Endpoints

### `Function(String?) onDeliveryTypeChanged; final bool isSpecificNumberEnabled; const ShopFormFields({ super.key, required this.descController, required this.phoneController, required this.taxController, required this.deliveryTimeFromController, required this.deliveryTimeToController, required this.startPriceController, required this.pricePerKmController, required this.selectedDeliveryType, required this.deliveryTypeList, required this.onDeliveryTypeChanged, this.isSpecificNumberEnabled = false, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ _buildSectionTitle('Basic Information'), 12.verticalSpace, OutlinedBorderTextField( textController: descController, validation: AppValidators.emptyCheck, label: AppHelpers.getTranslation(TrKeys.description), ), 24.verticalSpace, if (isSpecificNumberEnabled) _buildPhoneField() else OutlinedBorderTextField( textController: phoneController, inputType: TextInputType.phone, validation: AppValidators.emptyCheck, label: AppHelpers.getTranslation(TrKeys.phoneNumber), ), 24.verticalSpace, OutlinedBorderTextField( textController: taxController, validation: AppValidators.emptyCheck, inputType: TextInputType.number, label: AppHelpers.getTranslation(TrKeys.tax), ), 24.verticalSpace, _buildDeliveryTypeDropdown(), 24.verticalSpace, _buildSectionTitle('Delivery Settings'), 12.verticalSpace, Row( children: [ Expanded( child: OutlinedBorderTextField( textController: deliveryTimeFromController, inputType: TextInputType.number, label: AppHelpers.getTranslation(TrKeys.deliveryTimeFrom), ), ), 16.horizontalSpace, Expanded( child: OutlinedBorderTextField( inputType: TextInputType.number, textController: deliveryTimeToController, label: AppHelpers.getTranslation(TrKeys.deliveryTimeTo), ), ), ], ), 24.verticalSpace, _buildSectionTitle('Pricing'), 12.verticalSpace, Row( children: [ Expanded( child: OutlinedBorderTextField( textController: startPriceController, inputType: TextInputType.number, label: AppHelpers.getTranslation(TrKeys.startPrice), ), ), 16.horizontalSpace, Expanded( child: OutlinedBorderTextField( inputType: TextInputType.number, textController: pricePerKmController, label: AppHelpers.getTranslation(TrKeys.pricePerKm), ), ), ], ), ], ); } Widget _buildSectionTitle(String title)`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.only(left: 4.w), child: Text( title, style: AppStyle.interSemi(size: 14, color: AppStyle.black), ), ); } Widget _buildPhoneField()`
*No documentation provided (generation failed).*

### `IntlPhoneField(disableLengthCheck: !AppConstants.isNumberLengthAlwaysSame, controller: phoneController, validator: (s)`
*No documentation provided (generation failed).*

### `BorderSide(color: AppStyle.differBorder), const BorderSide(color: AppStyle.differBorder), ), ), errorBorder: UnderlineInputBorder( borderSide: BorderSide.merge( const BorderSide(color: AppStyle.differBorder), const BorderSide(color: AppStyle.differBorder), ), ), border: const UnderlineInputBorder(), focusedErrorBorder: const UnderlineInputBorder(), disabledBorder: UnderlineInputBorder( borderSide: BorderSide.merge( const BorderSide(color: AppStyle.differBorder), const BorderSide(color: AppStyle.differBorder), ), ), focusedBorder: const UnderlineInputBorder(), ), ); } Widget _buildDeliveryTypeDropdown()`
*No documentation provided (generation failed).*

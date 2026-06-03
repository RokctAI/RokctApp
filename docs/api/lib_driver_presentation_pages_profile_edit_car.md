# API Reference: edit_car

Source file: `lib/driver/presentation/pages/profile/edit_car.dart`

## Classes

### class `EditCar`

## Whitelisted API Endpoints

### `EditCar({super.key}); @override ConsumerState<EditCar> createState() => _EditCarState(); } class _EditCarState extends ConsumerState<EditCar> { late TextEditingController brand; late TextEditingController model; late TextEditingController number; late TextEditingController color; late TextEditingController height; late TextEditingController weight; late TextEditingController length; late TextEditingController width; String? dropdownValue; String? imagePath; late ProfileEditNotifier event; late ProfileImageNotifier eventImage; late ProfileEditState state; late ProfileImageState stateImage; var items = [ TrKeys.benzine, TrKeys.diesel, TrKeys.gas, TrKeys.motorbike, TrKeys.bike, TrKeys.foot, ]; @override void initState()`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `KeyboardDisable(child: ListView( physics: const BouncingScrollPhysics(), padding: EdgeInsets.zero, shrinkWrap: true, children: [ Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( children: [ TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.carSettings), ), 24.verticalSpace, IgnorePointer( ignoring: AppHelpers.getDriverCantEdit(), child: DropdownButtonFormField( initialValue: dropdownValue, items: items.map((String item)`
*No documentation provided (generation failed).*

### `DropdownMenuItem(value: item, child: Text(AppHelpers.getTranslation(item)), ); }).toList(), onChanged: (String? newValue)`
*No documentation provided (generation failed).*

### `UnderlineInputBorder(borderSide: BorderSide(color: AppStyle.shimmerBase), ), errorBorder: InputBorder.none, border: const UnderlineInputBorder(), focusedErrorBorder: const UnderlineInputBorder(), disabledBorder: const UnderlineInputBorder( borderSide: BorderSide(color: AppStyle.shimmerBase), ), focusedBorder: const UnderlineInputBorder(), ), ), ), 24.verticalSpace, UnderlinedBorderTextField( readOnly: AppHelpers.getDriverCantEdit(), label: AppHelpers.getTranslation(TrKeys.carBrand), textController: brand, onChanged: (s)`
*No documentation provided (generation failed).*

# API Reference: select_date_modal

Source file: `lib/manager/presentation/component/select_date_modal.dart`

## Classes

### class `SelectDateModal`

## Whitelisted API Endpoints

### `Function(DateTime? date) onDateSaved; const SelectDateModal({ super.key, this.initialDate, required this.onDateSaved, }); @override State<SelectDateModal> createState() => _SelectDateModalState(); } class _SelectDateModalState extends State<SelectDateModal> { DateTime? _date; @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [ const ModalDrag(), Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.deliveryTime), ), ), Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: Text( AppHelpers.getTranslation(TrKeys.selectDeliveryDate), style: AppStyle.interNormal( size: 14, color: AppStyle.blackColor, letterSpacing: -0.3, ), ), ), SizedBox( height: 300.r, child: CupertinoTheme( data: const CupertinoThemeData(brightness: Brightness.light), child: CupertinoDatePicker( mode: CupertinoDatePickerMode.date, initialDateTime: _date, minimumDate: _date, onDateTimeChanged: (DateTime value)`
*No documentation provided (generation failed).*

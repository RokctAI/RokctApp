# API Reference: custom_date_picker

Source file: `lib/manager/presentation/component/custom_date_picker.dart`

## Classes

### class `CustomDatePicker`

## Whitelisted API Endpoints

### `CustomDatePicker({super.key, required this.range}); @override State<CustomDatePicker> createState() => _CustomDatePickerState(); } class _CustomDatePickerState extends State<CustomDatePicker> { final config = CalendarDatePicker2Config( calendarType: CalendarDatePicker2Type.range, selectedDayHighlightColor: AppStyle.primary, weekdayLabelTextStyle: AppStyle.interNormal( size: 14, letterSpacing: -0.3, color: AppStyle.blackColor, ), controlsTextStyle: AppStyle.interNormal( size: 14, letterSpacing: -0.3, color: AppStyle.blackColor, ), dayTextStyle: AppStyle.interNormal( size: 14, letterSpacing: -0.3, color: AppStyle.blackColor, ), disabledDayTextStyle: AppStyle.interNormal( size: 14, letterSpacing: -0.3, color: AppStyle.text, ), dayBorderRadius: BorderRadius.circular(10.r), ); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `CalendarDatePicker2(config: config, value: widget.range, onValueChanged: (values)`
*No documentation provided (generation failed).*

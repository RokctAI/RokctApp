# API Reference: custom_date_picker

Source file: `lib/driver/presentation/component/custom_date_picker.dart`

## Classes

### class `CustomDatePicker`

## Whitelisted API Endpoints

### `CustomDatePicker({ super.key, required this.range, required this.onChange, }); @override State<CustomDatePicker> createState() => _CustomDatePickerState(); } class _CustomDatePickerState extends State<CustomDatePicker> { final config = CalendarDatePicker2Config( calendarType: CalendarDatePicker2Type.range, selectedDayHighlightColor: AppStyle.primary, weekdayLabelTextStyle: AppStyle.interNormal( size: 14.sp, letterSpacing: -0.3, color: AppStyle.black, ), controlsTextStyle: AppStyle.interNormal( size: 14.sp, letterSpacing: -0.3, color: AppStyle.black, ), dayTextStyle: AppStyle.interNormal( size: 14.sp, letterSpacing: -0.3, color: AppStyle.black, ), disabledDayTextStyle: AppStyle.interNormal( size: 14.sp, letterSpacing: -0.3, color: AppStyle.text, ), dayBorderRadius: BorderRadius.circular(10.r), ); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

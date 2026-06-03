# API Reference: extension

Source file: `lib/core/infrastructure/utils/extension.dart`

## Whitelisted API Endpoints

### `TimeOfDay(hour: int.tryParse( this?.substring( (this?.indexOf("-") ?? 0) + 2, (this?.lastIndexOf(":") ?? 0), ) ?? '', ) ?? 0, minute: int.tryParse( this?.substring((this?.lastIndexOf(":") ?? 0) + 1) ?? '', ) ?? 0, ); } TimeOfDay get toStartTime { return TimeOfDay( hour: int.tryParse(this?.substring(0, (this?.indexOf(":") ?? 0)) ?? '') ?? 0, minute: int.tryParse( this?.substring( (this?.indexOf(":") ?? 0) + 1, (this?.indexOf(" ") ?? 0), ) ?? '', ) ?? 0, ); } TimeOfDay get toTimeOfDay { return TimeOfDay( hour: int.tryParse(this?.substring(0, this?.indexOf("-") ?? 0) ?? "") ?? 0, minute: int.tryParse(this?.substring((this?.indexOf("-") ?? 0) + 1) ?? "") ?? 0, ); } } extension Time on DateTime { DateTime get withoutTime => DateTime(year, month, day); DateTime addTime(String? time)`
*No documentation provided (generation failed).*

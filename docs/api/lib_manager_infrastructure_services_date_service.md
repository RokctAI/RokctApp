# API Reference: date_service

Source file: `lib/manager/infrastructure/services/date_service.dart`

## Classes

### class `DateService`

## Whitelisted API Endpoints

### `dateFormatForChat(DateTime? time)`
*No documentation provided (generation failed).*

### `DateFormat("HH:mm").format(time ?? DateTime.now()); } if ((DateTime.now().difference(time ?? DateTime.now()).inHours) > 24 && (DateTime.now().difference(time ?? DateTime.now()).inDays) < 7)`
*No documentation provided (generation failed).*

### `DateFormat("EEEE").format(time ?? DateTime.now()); } if ((DateTime.now().difference(time ?? DateTime.now()).inDays) < 365)`
*No documentation provided (generation failed).*

### `DateFormat("d MMM").format(time ?? DateTime.now()); } if ((DateTime.now().difference(time ?? DateTime.now()).inDays) > 365)`
*No documentation provided (generation failed).*

### `DateFormat("MMM/d/yyyy").format(time ?? DateTime.now()); } return DateFormat("HH:mm").format(time ?? DateTime.now()); } static DateTime dateFormatYMD(DateTime? time)`
*No documentation provided (generation failed).*

### `dateFormatMDYHm(DateTime? time)`
*No documentation provided (generation failed).*

### `DateFormat("MMM d, yyyy - HH:mm").format(time ?? DateTime.now()); } static String dateFormatYMDHm(DateTime? time)`
*No documentation provided (generation failed).*

### `DateFormat("yyyy-MM-dd HH:mm").format(time ?? DateTime.now()); } static String dateFormatDMY(DateTime? time)`
*No documentation provided (generation failed).*

### `DateFormat("d MMM, yyyy").format(time ?? DateTime.now()); } static String dateFormatDM(DateTime? time)`
*No documentation provided (generation failed).*

### `DateFormat("d MMMM").format(time ?? DateTime.now()); } return DateFormat("d MMMM, yyyy").format(time ?? DateTime.now()); } static String dateFormatForNotification(DateTime? time)`
*No documentation provided (generation failed).*

### `DateFormat("d MMM, h:mm a").format(time ?? DateTime.now()); } static String dateFormatDay(DateTime? time)`
*No documentation provided (generation failed).*

### `DateFormat("yyyy-MM-dd").format(time ?? DateTime.now()); } static String dateFormat(DateTime? time)`
*No documentation provided (generation failed).*

### `DateFormat("MMM d,yyyy").format(time ?? DateTime.now()); } static String dateFormatForOrder(DateTime? time)`
*No documentation provided (generation failed).*

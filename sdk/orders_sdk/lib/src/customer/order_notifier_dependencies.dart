import 'package:flutter/material.dart';
export 'package:wallet_sdk/wallet_sdk.dart';

class AppConnectivity {
  static Future<bool> Function() connectivity = () async => true;
}

class AppHelpers {
  static void Function(BuildContext, String) showCheckTopSnackBar = (context, msg) {};
  static void Function(BuildContext) showNoConnectionSnackBar = (context) {};
  static void Function(BuildContext, String) showCheckTopSnackBarInfo = (context, msg) {};
  static void Function(BuildContext, String) showCheckTopSnackBarDone = (context, msg) {};
  static bool Function(dynamic, dynamic) checkYesterday = (date, nextDate) => false;
  static String Function(String) getTranslation = (key) => key;
}

class AppConstants {
  static const double demoLatitude = 41.311081;
  static const double demoLongitude = 69.240562;
  static const int scheduleInterval = 30;
}

class Assets {
  static String imageMarker = "";
  static String userMarker = "";
}

class DependencyManager {
  static dynamic ordersRepository;
  static dynamic drawRepository;
  static dynamic shopsRepository;
  static dynamic cartRepository;
}

enum DeliveryTypeEnum { delivery, pickup }

class LoginRoute {
  const LoginRoute();
}

class LocalStorage {
  static dynamic getSelectedCurrency() => null;
  static dynamic getLanguage() => null;
  static dynamic getWalletData() => null;
  static String getToken() => "";
}

extension BuildContextPop on BuildContext {
  void maybePop(BuildContext context) {
    Navigator.of(context).pop();
  }
  
  // router and replaceRoute
  dynamic get router => this;
  void replaceRoute(dynamic route) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (context) => const Scaffold()),
    );
  }
}

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay plusMinutes({required int minute}) {
    DateTime today = DateTime.now();
    DateTime customDateTime = DateTime(
      today.year,
      today.month,
      today.day,
      hour,
      this.minute,
    );
    return TimeOfDay.fromDateTime(
      customDateTime.add(Duration(minutes: minute)),
    );
  }
}

extension StringTimeExtension on String? {
  TimeOfDay get toNextTime {
    return TimeOfDay(
      hour: int.tryParse(
            this?.substring(
                  (this?.indexOf("-") ?? 0) + 2,
                  (this?.lastIndexOf(":") ?? 0),
                ) ??
                '',
          ) ??
          0,
      minute: int.tryParse(this?.substring((this?.lastIndexOf(":") ?? 0) + 1) ?? '') ?? 0,
    );
  }

  TimeOfDay get toTimeOfDay {
    if (this == null) return const TimeOfDay(hour: 0, minute: 0);
    final parts = this!.split(':');
    if (parts.length >= 2) {
      return TimeOfDay(
        hour: int.tryParse(parts[0]) ?? 0,
        minute: int.tryParse(parts[1]) ?? 0,
      );
    }
    return const TimeOfDay(hour: 0, minute: 0);
  }

}

extension DateTimeExtension on DateTime {
  DateTime get withoutTime => DateTime(year, month, day);
}

class ImageCropperForMarker {
  Future<dynamic> resizeAndCircle(String? imageURL, int size) async {
    return null;
  }
}

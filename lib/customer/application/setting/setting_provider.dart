import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/customer/application/setting/setting_notifier.dart';
import 'package:rokctapp/customer/application/setting/setting_state.dart';

final settingProvider = NotifierProvider<SettingNotifier, SettingState>(
  () => SettingNotifier(),
);

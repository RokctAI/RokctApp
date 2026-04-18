import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rokctapp/customer/models/models.dart';
import 'package:rokctapp/core/infrastructure/utils/services.dart';

abstract class AppStyle {
  AppStyle._();

  // --- Common Colors ---
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF232B2F);
  static const Color blackColor = Color(0xFF000000);
  static const Color transparent = Color(0x00FFFFFF);
  static const Color textGrey = Color(0xFF898989);
  static const Color bgGrey = Color(0xFFF4F5F8);
  static const Color borderColor = Color(0xFFE6E6E6);
  static const Color hintColor = Color(0xFFA7A7A7);
  static const Color differBorderColor = Color(0xFFE0E0E0);
  static const Color shimmerBase = Color(0xFFE0E0E0);
  static const Color shimmerHighlight = Color(0xFFF5F5F5);
  static const Color tabBarBorderColor = Color(0xFFDEDFE1);
  static const Color bottomNavigationBarColor = Color(0xFF191919);
  static const Color dragElement = Color(0xFFC4C5C7);
  static const Color iconColor = Color(0xFFC4C4C4);
  static const Color starColor = Color(0xFFFFA826);
  static const Color red = Color(0xFFFF3D00);
  static const Color blue = Color(0xFF03758E);
  static const Color green = Color(0xFF16AA16);

  // --- Driver Specific ---
  static const Color blueColor = Color(0xff03758E);
  static const Color greenColor = Color(0xff16AA16);
  static const Color redColor = Color(0xffFF3D00);
  static const Color progressColor = Color(0xffF26110);
  static const Color orangeColor = Color(0xffF19204);
  static const Color bgRedColor = Color(0xffFFF2EE);
  static const Color greyColor = Color(0xffF4F5F8);
  static const Color iconsColor = Color(0xff232B2F);
  static const Color textColor = Color(0xff898989);
  static const Color blackColorOpacity = Color(0x06000000);
  static const Color bottomSheetIconColor = Color(0xffC4C5C7);
  static const Color toggleColor = Color(0xFFE7E7E7);
  static const Color toggleShadowColor = Color(0xFF6B6B6B);
  static const Color logOutBgColor = Color(0xFFB9B9B9);
  static const Color addCountColor = Color(0xFFF7F7F7);
  static const Color discountColor = Color(0xFFF3F3F3);
  static const Color shadowColor = Color(0xFF7D7D7D);
  static const Color pendingDark = Color(0xFFF19204);

  // --- Manager Specific ---
  static const Color bgColor = Color(0xFFFFF2EE);
  static const Color deepPurple = Color(0xFF673AB7);
  static const Color pending = Color(0xFFFEFAF2);
  static const Color iconButtonBack = Color(0xFFE9E9E6);
  static List<Color> primaryGradient = [
    AppStyle.primary.withOpacity(0.5),
    AppStyle.transparent,
  ];

  // --- Customer/Core Specific ---
  static const Color bottomNavigationBack = Color.fromRGBO(0, 0, 0, 0.06);
  static const Color unselectedBottomItem = Color(0xFFA1A1A1);
  static const Color unselectedTab = Color(0xFF929292);
  static const Color rate = Color(0xFFFFB800);
  static const Color divider = Color.fromRGBO(0, 0, 0, 0.04);
  static const Color shadow = Color(0x3FD8D8D8);
  static const Color mainBack = Color(0xFFF4F4F4);
  static const Color mainBackDark = Color(0xFF1E272E);
  static const Color success = Color(0xff31D0AA);

  // --- Dynamic Color Getters ---
  static Color get primaryColor => primary;
  static Color get primary =>
      _getColorFromSettings('primary_color', const Color(0xFFE23744));

  static Color get buttonFontColor =>
      _getColorFromSettings('primary_button_font_color', black);

  static Color _getColorFromSettings(String key, Color defaultColor) {
    final settings = LocalStorage.getSettingsList();
    final setting = settings.firstWhere(
      (s) => s.key == key,
      orElse: () => SettingsData(),
    );

    if (setting.value == null) return defaultColor;

    try {
      return Color(int.parse('0xFF${setting.value!.substring(1, 7)}'));
    } catch (e) {
      return defaultColor;
    }
  }

  // --- Font Styles (Unified with ScreenUtil) ---
  static TextStyle interBold({
    double size = 18,
    Color color = AppStyle.black,
    double letterSpacing = 0,
  }) => GoogleFonts.inter(
    fontSize: size.sp,
    fontWeight: FontWeight.bold,
    color: color,
    letterSpacing: letterSpacing.sp,
    decoration: TextDecoration.none,
  );

  static TextStyle interSemi({
    double size = 18,
    Color color = AppStyle.black,
    TextDecoration decoration = TextDecoration.none,
    double letterSpacing = 0,
    FontStyle? fontStyle,
  }) => GoogleFonts.inter(
    fontSize: size.sp,
    fontWeight: FontWeight.w700,
    color: color,
    letterSpacing: letterSpacing.sp,
    decoration: decoration,
    fontStyle: fontStyle,
  );

  static TextStyle interNoSemi({
    double size = 18,
    Color color = AppStyle.black,
    TextDecoration decoration = TextDecoration.none,
    double letterSpacing = 0,
  }) => GoogleFonts.inter(
    fontSize: size.sp,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: letterSpacing.sp,
    decoration: decoration,
  );

  static TextStyle interNormal({
    double size = 16,
    Color color = AppStyle.black,
    TextDecoration textDecoration = TextDecoration.none,
    double letterSpacing = 0,
    FontStyle? fontStyle,
  }) => GoogleFonts.inter(
    fontSize: size.sp,
    fontWeight: FontWeight.w500,
    color: color,
    letterSpacing: letterSpacing.sp,
    decoration: textDecoration,
    fontStyle: fontStyle,
  );

  static TextStyle interRegular({
    double size = 16,
    Color color = AppStyle.black,
    TextDecoration textDecoration = TextDecoration.none,
    double letterSpacing = 0,
    FontStyle? fontStyle,
  }) => GoogleFonts.inter(
    fontSize: size.sp,
    fontWeight: FontWeight.w400,
    color: color,
    letterSpacing: letterSpacing.sp,
    decoration: textDecoration,
    fontStyle: fontStyle,
  );
}

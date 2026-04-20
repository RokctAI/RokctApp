import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rokctapp/core/infrastructure/utils/services.dart';
import 'package:rokctapp/customer/models/models.dart';

abstract class AppStyle {
  AppStyle._();

  // --- Brand & Getters ---
  static const Color brandGreen = Color(0xFF83EA00); // Driver default
  static const Color brandRed = Color(0xFFE23744);   // Customer/Manager default

  static Color get primary =>
      _getColorFromSettings('primary_color', brandGreen);

  static Color get buttonFont =>
      _getColorFromSettings('primary_button_font_color', black);

  // --- Core Colors ---
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF232B2F);
  static const Color blackColor = Color(0xFF000000);
  static const Color transparent = Colors.transparent;
  
  // --- Backgrounds & Surfaces ---
  static const Color mainBack = Color(0xFFF4F4F4);
  static const Color mainBackDark = Color(0xFF1E272E);
  static const Color bgDark = Color(0xFF18191D);
  static const Color bgGrey = Color(0xFFF4F5F8);
  static const Color subCategory = Color(0xFFF6F6F6);
  static const Color profileModalBack = Color(0xFFF5F5F5);
  static const Color dontHaveAccBtnBack = Color(0xFFF8F8F8);
  static const Color dontHaveAnAccBackDark = Color(0xFF2B343B);
  static const Color enterOrderButton = Color(0xFFF4F8F7);
  static const Color logOutBg = Color(0xFFB9B9B9);
  
  // --- Text & Hints ---
  static const Color text = Color(0xFF898989); // from textColor
  static const Color textGrey = Color(0xFF898989);
  static const Color textHint = Color(0xFF939393);
  static const Color hint = Color(0xFFA7A7A7);   // from hintColor
  static const Color reviewText = Color(0xFF88887E);
  static const Color selectedItemsText = Color(0xFFA0A09C);
  static const Color locationAddress = Color(0xFF343434);
  static const Color selectedTextFromModal = Color(0xFF202020);

  // --- Borders & Dividers ---
  static const Color border = Color(0xFFE6E6E6); // from borderColor
  static const Color borderDark = Color(0xFF494B4D);
  static const Color differBorder = Color(0xFFE0E0E0);
  static const Color outlineButtonBorder = Color(0xFFD2D2D7);
  static const Color tabBarBorder = Color(0xFFDEDFE1);
  static const Color attachmentBorder = Color(0xFFDCDCDC);
  static const Color verticalDivider = Color(0xFFDDDDDA);
  static const Color divider = Color(0x0A000000); // 0.04 opacity

  // --- Status & Actions ---
  static const Color success = Color(0xFF31D0AA);
  static const Color red = Color(0xFFFF3D00);
  static const Color redBg = Color(0xFFFFF2EE);
  static const Color blue = Color(0xFF03758E);
  static const Color blueBonus = Color(0xFF0D5FFF);
  static const Color green = Color(0xFF16AA16);
  static const Color orange = Color(0xFFF19204);
  static const Color progress = Color(0xFFF26110);
  static const Color star = Color(0xFFFFA826);
  static const Color rate = Color(0xFFFFB800);
  static const Color pending = Color(0xFFFEFAF2);
  static const Color pendingDark = Color(0xFFF19204);

  // --- Specialty UI Elements ---
  static const Color bottomNavigationBar = Color(0xFF191919);
  static const Color orderButton = Color(0xFF323232);
  static const Color bottomBarDark = Color(0xFF444444);
  static const Color bottomBarLight = Color(0xFF000000);
  static const Color unselectedBottomItem = Color(0xFFA1A1A1);
  static const Color unselectedBottomBarItem = Color(0xFFB9B9B9);
  static const Color dot = Color(0xFFBDBEC1);
  static const Color switchBg = Color(0xFFD3D3D3);
  static const Color dragElement = Color(0xFFC4C5C7);
  static const Color dragElementDark = Color(0xFFE5E5E5);
  static const Color door = Color(0xFFFFC636);
  static const Color separatorDot = Color(0xFFD9D9D9);
  static const Color toggle = Color(0xFFE7E7E7);
  static const Color toggleShadow = Color(0xFF6B6B6B);
  static const Color icon = Color(0xFFC4C4C4);
  static const Color icons = Color(0xFF232B2F);
  static const Color socialButtonDark = Color(0xFF33393F);
  static const Color socialButtonLight = Color(0x40FFFFFF);
  static const Color addCount = Color(0xFFF7F7F7);
  static const Color discount = Color(0xFFF3F3F3);

  // --- Specific Logic Elements ---
  static const Color recommendBg = Color(0xFFE8C7B0);
  static const Color bannerBg = Color(0xFFF3DED4);
  static const Color discountProduct = Color(0xFFD21234);
  static const Color deepPurple = Color(0xFF673AB7);
  static const Color iconButtonBack = Color(0xFFE9E9E6);
  static const Color orderStatusProgressBack = Color(0xFFE7E7E7);
  
  // --- Shadows & Opacity ---
  static const Color shadow = Color(0x3FD8D8D8);
  static const Color shadowBottom = Color(0x33000000);
  static const Color shadowCart = Color(0xA6C2C2C2);
  static const Color blackWithOpacity = Color(0x20232B2F);
  static const Color blackColorOpacity = Color(0x06000000);
  static const Color shimmerBase = Color(0xFFE0E0E0);
  static const Color shimmerHighlight = Color(0xFFF5F5F5);

  static List<Color> primaryGradient = [
    AppStyle.primary.withOpacity(0.5),
    AppStyle.transparent,
  ];

  // --- Logic ---
  static Color _getColorFromSettings(String key, Color defaultColor) {
    final settings = LocalStorage.getSettingsList();
    final setting = settings.firstWhere(
      (s) => s.key == key,
      orElse: () => SettingsData(),
    );
    if (setting.value == null) return defaultColor;
    try {
      return Color(int.parse('0xFF${setting.value!.replaceAll('#', '').substring(0, 6)}'));
    } catch (e) {
      return defaultColor;
    }
  }

  // --- Fonts ---
  static TextStyle interBold({double size = 18, Color color = black, double letterSpacing = 0}) =>
      GoogleFonts.inter(fontSize: size.sp, fontWeight: FontWeight.bold, color: color, letterSpacing: letterSpacing.sp);

  static TextStyle interSemi({double size = 18, Color color = black, TextDecoration decoration = TextDecoration.none, double letterSpacing = 0}) =>
      GoogleFonts.inter(fontSize: size.sp, fontWeight: FontWeight.w700, color: color, letterSpacing: letterSpacing.sp, decoration: decoration);

  static TextStyle interNoSemi({double size = 18, Color color = black, TextDecoration decoration = TextDecoration.none, double letterSpacing = 0}) =>
      GoogleFonts.inter(fontSize: size.sp, fontWeight: FontWeight.w600, color: color, letterSpacing: letterSpacing.sp, decoration: decoration);

  static TextStyle interNormal({double size = 16, Color color = black, TextDecoration textDecoration = TextDecoration.none, double letterSpacing = 0}) =>
      GoogleFonts.inter(fontSize: size.sp, fontWeight: FontWeight.w500, color: color, letterSpacing: letterSpacing.sp, decoration: textDecoration);

  static TextStyle interRegular({double size = 16, Color color = black, TextDecoration textDecoration = TextDecoration.none, double letterSpacing = 0}) =>
      GoogleFonts.inter(fontSize: size.sp, fontWeight: FontWeight.w400, color: color, letterSpacing: letterSpacing.sp, decoration: textDecoration);
}
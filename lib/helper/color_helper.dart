import 'dart:ui';

class ColorHelper {
  static final ColorHelper getInstance = ColorHelper.internal();

  ColorHelper.internal();

  factory ColorHelper() {
    return getInstance;
  }

  Color blueColor = const Color(0xFF222C82);
  Color whiteColor = const Color(0xFFFFFFFF);
  Color greyColor = const Color(0xFF75777D);
  Color lightBlueColor = const Color(0xFF5EBCEF);
  Color yellowColor = const Color(0xFFC5A12E);
  Color bgColor = const Color(0xFFEBECEE);
  Color textColor = const Color(0xFF424752);
  Color imageColor = const Color(0xFFf2f2f2);
  Color iconColor = const Color(0xFF49A5E0);
  Color iconBgColor = const Color(0xFFDFEEF8);
  Color containerColor = const Color(0xFFF6F6F6);
  Color textColor2 = const Color(0xFF1B2643);
  Color textColor3 = const Color(0xFF545D74);
  Color textColor4 = const Color(0xFFACACAC);
  Color textColor5 = const Color(0xFF4B4B4B);
}

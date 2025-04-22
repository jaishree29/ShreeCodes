import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveBuilder {
  static const double mobileMaxWidth = 600;
  static const double tabletMaxWidth = 1024;
  static const double desktopMaxWidth = 1440;

  /// Get screen width using ScreenUtil
  static double _screenWidth() => ScreenUtil().screenWidth;

  static bool isMobile(BuildContext context) {
    return _screenWidth() <= mobileMaxWidth;
  }

  static bool isTablet(BuildContext context) {
    final width = _screenWidth();
    return width > mobileMaxWidth && width <= tabletMaxWidth;
  }

  static bool isDesktop(BuildContext context) {
    final width = _screenWidth();
    return width > tabletMaxWidth && width <= desktopMaxWidth;
  }

  static bool isLargeDesktop(BuildContext context) {
    return _screenWidth() > desktopMaxWidth;
  }
}

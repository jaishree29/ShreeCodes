import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/responsive_builder.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = MyColors.black,
    this.foregroundColor = Colors.white,
    this.textColor = Colors.white,
    required this.borderRadius,
    this.elevation = 0,
    required this.padding,
    required this.textPadding,
    this.borderSide = BorderSide.none,
    required this.fontSize,
    this.surfaceTintColor = MyColors.buttonSplash1,
    this.icon,
    this.iconColor,
    this.iconSize,
  });

  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color textColor;
  final double borderRadius;
  final double elevation;
  final EdgeInsets padding;
  final EdgeInsets textPadding;
  final BorderSide borderSide;
  final double fontSize;
  final Color surfaceTintColor;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBuilder.isMobile(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        overlayColor: surfaceTintColor,
        surfaceTintColor: surfaceTintColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          side: borderSide,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
      ),
      child: Padding(
        padding: textPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon != null
                ? Icon(
                    icon,
                    size: iconSize,
                    color: iconColor,
                  )
                : const SizedBox.shrink(),
            icon != null ? SizedBox(width: isMobile ? 8.sp : 2.sp) : const SizedBox.shrink(),
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Inter',
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

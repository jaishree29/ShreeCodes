import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaishree/utils/colors.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = MyColors.primaryColor,
    this.foregroundColor = Colors.white,
    this.textColor = Colors.white,
    required this.borderRadius,
    this.elevation = 0,
    required this.padding,
    required this.textPadding,
    this.borderSide = BorderSide.none,
    required this.fontSize,
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

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        overlayColor: Colors.transparent,
        surfaceTintColor: MyColors.secondaryColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          side: borderSide,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
      ),
      child: Padding(
        padding: textPadding,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

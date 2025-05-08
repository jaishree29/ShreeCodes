import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/responsive_builder.dart';

class SkillsCard extends StatefulWidget {
  final String icon;
  final String text;

  const SkillsCard({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  State<SkillsCard> createState() => _SkillsCardState();
}

class _SkillsCardState extends State<SkillsCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBuilder.isMobile(context);
    bool isTablet = ResponsiveBuilder.isTablet(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        width: isTablet ? 75.sp : 65.sp,
        height: isTablet ? 70.sp : 40.sp,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(isMobile ? 10.sp : 3.sp),
          border: Border.all(
            color: MyColors.textColor3.withOpacity(0.6),
            width: 0.3.sp,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: MyColors.textColor3.withOpacity(0.7),
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
                  BoxShadow(
                    color: MyColors.textColor3.withAlpha(
                      isMobile
                          ? 80
                          : isTablet
                              ? 80
                              : 50,
                    ),
                    blurRadius: isMobile
                        ? 4
                        : isTablet
                            ? 4
                            : 0,
                    spreadRadius: 0,
                    offset: Offset(
                      0,
                      isMobile
                          ? 4
                          : isTablet
                              ? 4
                              : 0,
                    ),
                  ),
                ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? 2.sp
                  : isTablet
                      ? 3.sp
                      : 7.sp,
              vertical: isMobile ? 1.sp : 7.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: MyColors.textColor2,
                    width: isMobile
                        ? 1.sp
                        : isTablet
                            ? 0.5.sp
                            : 0.3.sp,
                  ),
                  borderRadius: BorderRadius.circular(isMobile
                      ? 10.sp
                      : isTablet
                          ? 5.sp
                          : 4.sp),
                ),
                child: Padding(
                  padding: EdgeInsets.all(isMobile ? 5.sp : 2.sp),
                  child: Image.network(
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error);
                    },
                    widget.icon,
                    height: isMobile
                        ? 30.sp
                        : isTablet
                            ? 12.sp
                            : 10.sp,
                    width: isMobile
                        ? 30.sp
                        : isTablet
                            ? 12.sp
                            : 10.sp,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 15.sp : 3.sp),
              Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: MyColors.black,
                  fontSize: isMobile
                      ? 15.5.sp
                      : isTablet
                          ? 5.5.sp
                          : 4.5.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

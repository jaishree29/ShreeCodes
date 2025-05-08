import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/responsive_builder.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBuilder.isMobile(context);
    bool isTablet = ResponsiveBuilder.isTablet(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20.sp : 8.sp,
        vertical: isMobile ? 30.sp : 10.sp,
      ),
      child: isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Copyright section
                Text(
                  '\u00a9 2025 Jaishree Tiwari. All rights reserved.',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: isMobile ? 13.sp : 4.sp,
                    fontWeight: isMobile ? FontWeight.w500 : FontWeight.w400,
                    color: MyColors.textColor1,
                  ),
                ),
                isMobile ? SizedBox(height: 15.sp) : SizedBox.shrink(),
                Row(
                  mainAxisAlignment: isMobile
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: isMobile ? 13.sp : 4.sp,
                          fontWeight:
                              isMobile ? FontWeight.w500 : FontWeight.w400,
                          color: MyColors.textColor1,
                        ),
                      ),
                    ),
                    SizedBox(width: isMobile ? 20.sp : 8.sp),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Terms of Service',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: isMobile ? 13.sp : 4.sp,
                          fontWeight:
                              isMobile ? FontWeight.w500 : FontWeight.w400,
                          color: MyColors.textColor1,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Copyright section
                Text(
                  '\u00a9 2025 Jaishree Tiwari. All rights reserved.',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: isTablet ? 5.5.sp : 4.sp,
                    fontWeight: FontWeight.w400,
                    color: MyColors.textColor1,
                  ),
                ),

                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: isTablet ? 5.5.sp : 4.sp,
                          fontWeight: FontWeight.w400,
                          color: MyColors.textColor1,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.sp),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Terms of Service',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: isTablet ? 5.5.sp : 4.sp,
                          fontWeight: FontWeight.w400,
                          color: MyColors.textColor1,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}

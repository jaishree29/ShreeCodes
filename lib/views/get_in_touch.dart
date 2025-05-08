import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/responsive_builder.dart';
import 'package:jaishree/utils/url_launcher.dart';
import 'package:jaishree/utils/urls.dart';
import 'package:jaishree/widgets/elevated_button.dart';

class GetInTouch extends StatelessWidget {
  const GetInTouch({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBuilder.isMobile(context);
    bool isTablet = ResponsiveBuilder.isTablet(context);
    return Column(
      children: [
        SizedBox(height: isMobile ? 80.sp : 40.sp),
        Text(
          'Get in Touch',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: isMobile
                ? 28.sp
                : isTablet
                    ? 12.5.sp
                    : 9.sp,
            fontWeight: isMobile ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
        SizedBox(height: isMobile ? 20.sp : 5.sp),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile
                ? 10.sp
                : isTablet
                    ? 60.sp
                    : 105.sp,
          ),
          child: Text(
            'Interested in working together? Feel free to reach out for collaborations or just a friendly hello.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: isMobile
                  ? 15.5.sp
                  : isTablet
                      ? 7.sp
                      : 4.5.sp,
              fontWeight: FontWeight.w400,
              color: MyColors.textColor1,
            ),
          ),
        ),
        SizedBox(height: isMobile ? 50.sp : 10.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyElevatedButton(
              text: 'Email me',
              onPressed: () => UrlLauncherHelper.launchInNewTab(
                MyUrls.email,
                context: context,
              ),
              borderRadius: isMobile
                  ? 40.sp
                  : isTablet
                      ? 30.sp
                      : 20.sp,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile
                    ? 25.sp
                    : isTablet
                        ? 8.sp
                        : 3.sp,
                vertical: isMobile
                    ? 14.sp
                    : isTablet
                        ? 5.sp
                        : 2.5.sp,
              ),
              textPadding:
                  EdgeInsets.symmetric(horizontal: 3.sp, vertical: 2.5.sp),
              fontSize: isMobile
                  ? 13.sp
                  : isTablet
                      ? 5.sp
                      : 4.sp,
              icon: HugeIcons.strokeRoundedMail01,
              surfaceTintColor: MyColors.surfaceColor,
              iconSize: isMobile ? 14.sp : 5.sp,
            ),
            SizedBox(
              width: isMobile
                  ? 16.sp
                  : isTablet
                      ? 8.sp
                      : 5.sp,
            ),
            MyElevatedButton(
              text: 'Connect on LinkedIn',
              onPressed: () => UrlLauncherHelper.launchInNewTab(
                MyUrls.linkedin,
                context: context,
              ),
              borderSide: BorderSide(
                color: MyColors.textColor2,
                width: isMobile
                    ? 1.5.sp
                    : isTablet
                        ? 0.8.sp
                        : 0.3.sp,
              ),
              borderRadius: isMobile
                  ? 40.sp
                  : isTablet
                      ? 30.sp
                      : 20.sp,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile
                    ? 25.sp
                    : isTablet
                        ? 8.sp
                        : 3.sp,
                vertical: isMobile
                    ? 14.sp
                    : isTablet
                        ? 5.sp
                        : 2.5.sp,
              ),
              textPadding:
                  EdgeInsets.symmetric(horizontal: 3.sp, vertical: 2.5.sp),
              fontSize: isMobile
                  ? 13.sp
                  : isTablet
                      ? 5.sp
                      : 4.sp,
              icon: HugeIcons.strokeRoundedLinkedin02,
              backgroundColor: Colors.white,
              foregroundColor: MyColors.black,
              surfaceTintColor: MyColors.buttonSplash2,
              textColor: MyColors.black,
              iconSize: isMobile ? 13.5.sp : 4.5.sp,
            ),
          ],
        ),
        SizedBox(height: isMobile ? 80.sp : 40.sp),
      ],
    );
  }
}

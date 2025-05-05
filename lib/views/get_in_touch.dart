import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/url_launcher.dart';
import 'package:jaishree/utils/urls.dart';
import 'package:jaishree/widgets/elevated_button.dart';

class GetInTouch extends StatelessWidget {
  const GetInTouch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.sp),
        Text(
          'Get in Touch',
          style: GoogleFonts.inter(
            fontSize: 9.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5.sp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 105.sp),
          child: Text(
            'Interested in working together? Feel free to reach out for collaborations or just a friendly hello.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 4.5.sp,
              fontWeight: FontWeight.w400,
              color: MyColors.textColor1,
            ),
          ),
        ),
        SizedBox(height: 10.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyElevatedButton(
              text: 'Email me',
              onPressed: ()  => UrlLauncherHelper.launchInNewTab(
                MyUrls.email,
                context: context,
              ),
              borderRadius: 10.sp,
              padding: EdgeInsets.symmetric(horizontal: 3.sp, vertical: 2.5.sp),
              textPadding:
                  EdgeInsets.symmetric(horizontal: 3.sp, vertical: 2.5.sp),
              fontSize: 4.sp,
              icon: HugeIcons.strokeRoundedMail01,
              surfaceTintColor: MyColors.surfaceColor,
              iconSize: 5.sp,
            ),
            SizedBox(width: 5.sp),
            MyElevatedButton(
              text: 'Connect on LinkedIn',
              onPressed: () => UrlLauncherHelper.launchInNewTab(
                MyUrls.linkedin,
                context: context,
              ),
              borderSide: BorderSide(
                color: MyColors.textColor2,
                width: 0.3.sp,
              ),
              borderRadius: 10.sp,
              padding: EdgeInsets.symmetric(horizontal: 3.sp, vertical: 2.5.sp),
              textPadding:
                  EdgeInsets.symmetric(horizontal: 3.sp, vertical: 2.5.sp),
              fontSize: 4.sp,
              icon: HugeIcons.strokeRoundedLinkedin02,
              backgroundColor: Colors.white,
              foregroundColor: MyColors.black,
              surfaceTintColor: MyColors.buttonSplash2,
              textColor: MyColors.black,
              iconSize: 4.5.sp,
            ),
          ],
        ),
        SizedBox(height: 40.sp),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/image_strings.dart';
import 'package:jaishree/utils/url_launcher.dart';
import 'package:jaishree/utils/urls.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 33.sp, vertical: 40.sp),
      child: Row(
        children: [
          Container(
            width: 140.sp,
            height: 140.sp,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(MyImages.profileImage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(4.sp),
            ),
          ),
          SizedBox(
            width: 15.sp,
          ),
          SizedBox(
            width: 143.sp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About Me',
                  style: GoogleFonts.inter(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Text(
                  'I\'m a Flutter developer with a passion for creating elegant, user-centered mobile applications. With a background in both design and development, I bring a holistic approach to every project.',
                  style: GoogleFonts.inter(
                    fontSize: 4.5.sp,
                    fontWeight: FontWeight.w400,
                    color: MyColors.textColor1,
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Text(
                  'My journey in mobile development began 5 years ago, and I\'ve since worked with startups and established companies to deliver apps that users love. I believe in clean code, thoughtful architecture, and pixel-perfect implementation.',
                  style: GoogleFonts.inter(
                    fontSize: 4.5.sp,
                    fontWeight: FontWeight.w400,
                    color: MyColors.textColor1,
                  ),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      splashColor: MyColors.buttonSplash1,
                      onPressed: () =>
                          UrlLauncherHelper.launchInNewTab(MyUrls.github),
                      icon: HugeIcon(
                        icon: HugeIcons.strokeRoundedGithub,
                        size: 5.sp,
                        color: MyColors.black,
                      ),
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    IconButton(
                      splashColor: MyColors.buttonSplash1,
                      onPressed: () =>
                          UrlLauncherHelper.launchInNewTab(MyUrls.linkedin),
                      icon: HugeIcon(
                        icon: HugeIcons.strokeRoundedLinkedin02,
                        size: 5.sp,
                        color: MyColors.black,
                      ),
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    IconButton(
                      splashColor: MyColors.buttonSplash1,
                      onPressed: () =>
                          UrlLauncherHelper.launchInNewTab(MyUrls.twitter),
                      icon: HugeIcon(
                        icon: HugeIcons.strokeRoundedTwitter,
                        size: 5.sp,
                        color: MyColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

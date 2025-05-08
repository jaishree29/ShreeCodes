import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/image_strings.dart';
import 'package:jaishree/utils/responsive_builder.dart';
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
    bool isMobile = ResponsiveBuilder.isMobile(context);
    bool isTablet = ResponsiveBuilder.isTablet(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? 10.sp
            : isTablet
                ? 8.sp
                : 33.sp,
        vertical: isMobile ? 20.sp : 40.sp,
      ),
      child: isMobile
          ? Column(
              children: [
                Container(
                  width: 340.sp,
                  height: 340.sp,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(MyImages.profileImage),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                ),
                SizedBox(
                  height: 35.sp,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Me',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Text(
                        'I\'m a Flutter developer with a passion for creating elegant, user-centered mobile applications. With a background in both design and development, I bring a holistic approach to every project.',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15.5.sp,
                          fontWeight: FontWeight.w400,
                          color: MyColors.textColor1,
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Text(
                        'My journey in mobile development began 5 years ago, and I\'ve since worked with startups and established companies to deliver apps that users love. I believe in clean code, thoughtful architecture, and pixel-perfect implementation.',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15.5.sp,
                          fontWeight: FontWeight.w400,
                          color: MyColors.textColor1,
                        ),
                      ),
                      SizedBox(
                        height: 40.sp,
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
                              size: 15.sp,
                              color: MyColors.black,
                            ),
                          ),
                          SizedBox(
                            width: 5.sp,
                          ),
                          IconButton(
                            splashColor: MyColors.buttonSplash1,
                            onPressed: () => UrlLauncherHelper.launchInNewTab(
                                MyUrls.linkedin),
                            icon: HugeIcon(
                              icon: HugeIcons.strokeRoundedLinkedin02,
                              size: 16.sp,
                              color: MyColors.black,
                            ),
                          ),
                          SizedBox(
                            width: 16.sp,
                          ),
                          IconButton(
                            splashColor: MyColors.buttonSplash1,
                            onPressed: () => UrlLauncherHelper.launchInNewTab(
                                MyUrls.twitter),
                            icon: HugeIcon(
                              icon: HugeIcons.strokeRoundedTwitter,
                              size: 16.sp,
                              color: MyColors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60.sp,
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Container(
                  width: isTablet ? 150.sp : 140.sp,
                  height: isTablet ? 150.sp : 140.sp,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(MyImages.profileImage),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(isTablet ? 6.sp : 4.sp),
                  ),
                ),
                SizedBox(
                  width: isTablet ? 20.sp :  15.sp,
                ),
                SizedBox(
                  width: isTablet ? 170.sp :  143.sp,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Me',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: isTablet ? 12.5.sp : 9.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: isTablet ? 10.sp : 8.sp,
                      ),
                      Text(
                        'I\'m a Flutter developer with a passion for creating elegant, user-centered mobile applications. With a background in both design and development, I bring a holistic approach to every project.',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: isTablet ? 6.8.sp : 4.5.sp,
                          fontWeight: FontWeight.w400,
                          color: MyColors.textColor1,
                        ),
                      ),
                      SizedBox(
                        height: isTablet ? 10.sp :  8.sp,
                      ),
                      Text(
                        'My journey in mobile development began 5 years ago, and I\'ve since worked with startups and established companies to deliver apps that users love. I believe in clean code, thoughtful architecture, and pixel-perfect implementation.',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: isTablet ? 6.8.sp :  4.5.sp,
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
                              size: isTablet ? 7.sp : 5.sp,
                              color: MyColors.black,
                            ),
                          ),
                          SizedBox(
                            width: isTablet ? 7.sp : 5.sp,
                          ),
                          IconButton(
                            splashColor: MyColors.buttonSplash1,
                            onPressed: () => UrlLauncherHelper.launchInNewTab(
                                MyUrls.linkedin),
                            icon: HugeIcon(
                              icon: HugeIcons.strokeRoundedLinkedin02,
                              size: isTablet ? 7.sp : 5.sp,
                              color: MyColors.black,
                            ),
                          ),
                          SizedBox(
                            width: isTablet ? 7.sp : 5.sp,
                          ),
                          IconButton(
                            splashColor: MyColors.buttonSplash1,
                            onPressed: () => UrlLauncherHelper.launchInNewTab(
                                MyUrls.twitter),
                            icon: HugeIcon(
                              icon: HugeIcons.strokeRoundedTwitter,
                              size: isTablet ? 7.sp : 5.sp,
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

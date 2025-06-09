import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/responsive_builder.dart';
import 'package:jaishree/widgets/policy_dialog.dart';

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
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => PolicyDialog(
                            title: 'Privacy Policy',
                            sections: [
                              PolicySection(
                                title: 'Information Collection',
                                content: [
                                  'This portfolio website does not collect personal information or use cookies.',
                                  'Any contact information you provide is used solely to respond to your inquiries.',
                                ],
                              ),
                              PolicySection(
                                title: 'Data Usage',
                                content: [
                                  'Information shared via contact forms or emails is used strictly for communication purposes and is not stored or shared with third parties.',
                                ],
                              ),
                              PolicySection(
                                title: 'Data Protection',
                                content: [
                                  'This website is intended to showcase the work of Jaishree Tiwari and does not store any user data.',
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        surfaceTintColor: Colors.transparent,
                        overlayColor: Colors.transparent,
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
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => PolicyDialog(
                            title: 'Terms of Service',
                            sections: [
                              PolicySection(
                                title: 'Acceptance of Terms',
                                content: [
                                  'By accessing this website, you agree to use it solely for informational and personal, non-commercial purposes.',
                                ],
                              ),
                              PolicySection(
                                title: 'Intellectual Property',
                                content: [
                                  'All content, including text, images, and designs, is owned by Jaishree Tiwari and is protected by copyright.',
                                  'Unauthorized use, reproduction, or redistribution of content is prohibited.',
                                ],
                              ),
                              PolicySection(
                                title: 'Disclaimer',
                                content: [
                                  'This website is provided as-is without warranties of any kind. The content is for informational purposes only.',
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        surfaceTintColor: Colors.transparent,
                        overlayColor: Colors.transparent,
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
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => PolicyDialog(
                            title: 'Privacy Policy',
                            sections: [
                              PolicySection(
                                title: 'Information Collection',
                                content: [
                                  'This portfolio website does not collect personal information or use cookies.',
                                  'Any contact information you provide is used solely to respond to your inquiries.',
                                ],
                              ),
                              PolicySection(
                                title: 'Data Usage',
                                content: [
                                  'Information shared via contact forms or emails is used strictly for communication purposes and is not stored or shared with third parties.',
                                ],
                              ),
                              PolicySection(
                                title: 'Data Protection',
                                content: [
                                  'This website is intended to showcase the work of Jaishree Tiwari and does not store any user data.',
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        surfaceTintColor: Colors.transparent,
                        overlayColor: Colors.transparent,
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
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => PolicyDialog(
                            title: 'Terms of Service',
                            sections: [
                              PolicySection(
                                title: 'Acceptance of Terms',
                                content: [
                                  'By accessing this website, you agree to use it solely for informational and personal, non-commercial purposes.',
                                ],
                              ),
                              PolicySection(
                                title: 'Intellectual Property',
                                content: [
                                  'All content, including text, images, and designs, is owned by Jaishree Tiwari and is protected by copyright.',
                                  'Unauthorized use, reproduction, or redistribution of content is prohibited.',
                                ],
                              ),
                              PolicySection(
                                title: 'Disclaimer',
                                content: [
                                  'This website is provided as-is without warranties of any kind. The content is for informational purposes only.',
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        surfaceTintColor: Colors.transparent,
                        overlayColor: Colors.transparent,
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

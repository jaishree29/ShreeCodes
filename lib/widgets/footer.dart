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
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => PolicyDialog(
                            title: 'Privacy Policy',
                            sections: [
                              PolicySection(
                                title: 'Information Collection',
                                content: [
                                  'We collect minimal information required to provide you with the best experience. This includes:',
                                  '• Usage data to improve our service\n• Contact information when you reach out\n• Technical data for analytics and improvements',
                                ],
                              ),
                              PolicySection(
                                title: 'Data Usage',
                                content: [
                                  'Your data is used solely for:',
                                  '• Improving user experience\n• Analyzing website performance\n• Responding to your inquiries',
                                ],
                              ),
                              PolicySection(
                                title: 'Data Protection',
                                content: [
                                  'We implement security measures to protect your information:',
                                  '• Encryption of sensitive data\n• Regular security updates\n• Limited access to personal information',
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
                                  'By accessing and using this website, you accept and agree to be bound by the terms and provision of this agreement.',
                                ],
                              ),
                              PolicySection(
                                title: 'Use License',
                                content: [
                                  'Permission is granted to temporarily view the materials (information or software) on ShreeCodes\'s website for personal, non-commercial transitory viewing only.',
                                  'This is the grant of a license, not a transfer of title, and under this license you may not:',
                                  '• Modify or copy the materials\n• Use the materials for any commercial purpose\n• Attempt to decompile or reverse engineer any software contained on the website',
                                ],
                              ),
                              PolicySection(
                                title: 'Disclaimer',
                                content: [
                                  'The materials on ShreeCodes\'s website are provided on an \'as is\' basis. ShreeCodes makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.',
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
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => PolicyDialog(
                            title: 'Privacy Policy',
                            sections: [
                              PolicySection(
                                title: 'Information Collection',
                                content: [
                                  'We collect minimal information required to provide you with the best experience. This includes:',
                                  '• Usage data to improve our service\n• Contact information when you reach out\n• Technical data for analytics and improvements',
                                ],
                              ),
                              PolicySection(
                                title: 'Data Usage',
                                content: [
                                  'Your data is used solely for:',
                                  '• Improving user experience\n• Analyzing website performance\n• Responding to your inquiries',
                                ],
                              ),
                              PolicySection(
                                title: 'Data Protection',
                                content: [
                                  'We implement security measures to protect your information:',
                                  '• Encryption of sensitive data\n• Regular security updates\n• Limited access to personal information',
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
                                  'By accessing and using this website, you accept and agree to be bound by the terms and provision of this agreement.',
                                ],
                              ),
                              PolicySection(
                                title: 'Use License',
                                content: [
                                  'Permission is granted to temporarily view the materials (information or software) on ShreeCodes\'s website for personal, non-commercial transitory viewing only.',
                                  'This is the grant of a license, not a transfer of title, and under this license you may not:',
                                  '• Modify or copy the materials\n• Use the materials for any commercial purpose\n• Attempt to decompile or reverse engineer any software contained on the website',
                                ],
                              ),
                              PolicySection(
                                title: 'Disclaimer',
                                content: [
                                  'The materials on ShreeCodes\'s website are provided on an \'as is\' basis. ShreeCodes makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.',
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

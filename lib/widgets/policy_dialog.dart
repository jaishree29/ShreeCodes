import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/responsive_builder.dart';

class PolicyDialog extends StatelessWidget {
  final String title;
  final List<PolicySection> sections;

  const PolicyDialog({
    super.key,
    required this.title,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBuilder.isMobile(context);
    bool isTablet = ResponsiveBuilder.isTablet(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: isMobile
            ? MediaQuery.of(context).size.width * 0.9
            : isTablet
                ? MediaQuery.of(context).size.width * 0.7
                : MediaQuery.of(context).size.width * 0.5,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(isMobile ? 16.sp : 8.sp),
          boxShadow: [
            BoxShadow(
              color: MyColors.textColor3.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20.sp : 16.sp,
                vertical: isMobile ? 16.sp : 12.sp,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: MyColors.textColor3.withOpacity(0.3),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: isMobile
                          ? 20.sp
                          : isTablet
                              ? 9.sp
                              : 6.sp,
                      fontWeight: FontWeight.w600,
                      color: MyColors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      size: isMobile
                          ? 24.sp
                          : isTablet
                              ? 12.sp
                              : 8.sp,
                      color: MyColors.textColor1,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ],
              ),
            ),

            // Content
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20.sp : 16.sp,
                  vertical: isMobile ? 20.sp : 16.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: sections.map((section) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          section.title,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: isMobile
                                ? 16.sp
                                : isTablet
                                    ? 7.sp
                                    : 5.sp,
                            fontWeight: FontWeight.w500,
                            color: MyColors.black,
                          ),
                        ),
                        SizedBox(height: isMobile ? 12.sp : 8.sp),
                        ...section.content.map((paragraph) => Padding(
                              padding: EdgeInsets.only(
                                bottom: isMobile ? 16.sp : 12.sp,
                              ),
                              child: Text(
                                paragraph,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: isMobile
                                      ? 14.sp
                                      : isTablet
                                          ? 6.sp
                                          : 4.sp,
                                  height: 1.5,
                                  color: MyColors.textColor1,
                                ),
                              ),
                            )),
                        SizedBox(height: isMobile ? 20.sp : 16.sp),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PolicySection {
  final String title;
  final List<String> content;

  const PolicySection({
    required this.title,
    required this.content,
  });
}

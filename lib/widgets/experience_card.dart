import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/responsive_builder.dart';

class ExperienceCard extends StatelessWidget {
  final String role;
  final String company;
  final String duration;
  final String description;
  final List<String> achievements;
  final bool isLast;

  const ExperienceCard({
    super.key,
    required this.role,
    required this.company,
    required this.duration,
    required this.description,
    required this.achievements,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBuilder.isMobile(context);
    bool isTablet = ResponsiveBuilder.isTablet(context);

    return Padding(
      padding:
          isMobile ? EdgeInsets.only(right: 10.sp) : EdgeInsets.only(right: 0),
      child: Container(
        padding: EdgeInsets.only(
          left: isMobile
              ? 16.sp
              : isTablet
                  ? 12.sp
                  : 16.sp,
          right: isMobile
              ? 16.sp
              : isTablet
                  ? 12.sp
                  : 16.sp,
          top: isMobile ? 16.sp : 12.sp,
          bottom: isMobile ? 16.sp : 12.sp, // Simplified bottom padding
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(isMobile ? 12.sp : 4.sp),
          border: Border.all(color: MyColors.textColor3.withOpacity(0.4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              role,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: isMobile
                    ? 18.sp
                    : isTablet
                        ? 8.sp
                        : 6.sp,
                fontWeight: FontWeight.w600,
                color: MyColors.black,
              ),
            ),
            SizedBox(height: isMobile ? 8.sp : 4.sp),
            isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.textColor1,
                        ),
                      ),
                      Text(
                        duration,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12.sp,
                          color: MyColors.textColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Flexible(
                        child: Text(
                          company,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: isTablet ? 6.sp : 4.5.sp,
                            fontWeight: FontWeight.w500,
                            color: MyColors.textColor1,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          ' • $duration',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: isTablet ? 5.5.sp : 4.sp,
                            color: MyColors.textColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
            SizedBox(height: isMobile ? 12.sp : 6.sp),
            Text(
              description,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: isMobile
                    ? 14.sp
                    : isTablet
                        ? 5.5.sp
                        : 4.sp,
                color: MyColors.textColor1,
              ),
            ),
            SizedBox(height: isMobile ? 12.sp : 6.sp),
            ...achievements.map((achievement) => Padding(
                  padding: EdgeInsets.only(bottom: isMobile ? 6.sp : 3.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '•  ',
                        style: TextStyle(
                          fontSize: isMobile
                              ? 14.sp
                              : isTablet
                                  ? 5.5.sp
                                  : 4.sp,
                          color: MyColors.textColor1,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          achievement,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: isMobile
                                ? 14.sp
                                : isTablet
                                    ? 5.5.sp
                                    : 4.sp,
                            color: MyColors.textColor1,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

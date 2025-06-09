import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/responsive_builder.dart';
import 'package:jaishree/widgets/experience_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBuilder.isMobile(context);
    bool isTablet = ResponsiveBuilder.isTablet(context);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: isMobile ? 400.sp : 300.sp,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? 5.sp
            : isTablet
                ? 40.sp
                : 50.sp,
        vertical: 40.sp,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'My Experience',
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
          SizedBox(height: 3.sp),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? 16.sp
                  : isTablet
                      ? 10.sp
                      : 40.sp,
            ),
            child: Text(
              'A selection of my professional journey, highlighting key roles and achievements in mobile app development.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: isMobile
                    ? 15.5.sp
                    : isTablet
                        ? 7.5.sp
                        : 4.5.sp,
                fontWeight: FontWeight.w400,
                color: MyColors.textColor1,
              ),
            ),
          ),
          SizedBox(
            height: isMobile
                ? 40.sp
                : isTablet
                    ? 20.sp
                    : 15.sp,
          ),
          FixedTimeline.tileBuilder(
            theme: TimelineThemeData(
              nodePosition: 0.04, // Adjusted to move timeline slightly down
              color: MyColors.textColor3,
              indicatorTheme: IndicatorThemeData(
                position: 0.15, // Adjusted to align with card content
                size: isMobile ? 16.sp : 8.sp,
              ),
              connectorTheme: ConnectorThemeData(
                thickness: isMobile ? 2.sp : 1.sp,
              ),
            ),
            builder: TimelineTileBuilder.connected(
              connectionDirection: ConnectionDirection.before,
              itemCount: _experiences.length,
              contentsBuilder: (_, index) => Padding(
                padding: EdgeInsets.only(
                  left: isMobile ? 20.sp : 12.sp, // Increased left padding
                  bottom: index == _experiences.length - 1
                      ? 0
                      : (isMobile ? 40.sp : 20.sp),
                ),
                child: ExperienceCard(
                  role: _experiences[index].role,
                  company: _experiences[index].company,
                  duration: _experiences[index].duration,
                  description: _experiences[index].description,
                  achievements: _experiences[index].achievements,
                  isLast: index == _experiences.length - 1,
                ),
              ),
              indicatorBuilder: (_, index) => DotIndicator(
                color: MyColors.textColor2,
                size: isMobile ? 16.sp : 8.sp,
              ),
              connectorBuilder: (_, index, __) => SolidLineConnector(
                color: MyColors.textColor3,
                thickness: isMobile ? 2.sp : 1.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static final List<ExperienceData> _experiences = [
    ExperienceData(
      role: 'Flutter Developer',
      company: 'Work Binders Pvt. Ltd.',
      duration: 'Dec 2024 - Feb 2025',
      description: 'Developed a feature-rich e-commerce app using Flutter.',
      achievements: [
        'Built product search, filters, wishlist, cart, order tracking, and secure payments.',
        'Collaborated with designers for pixel-perfect UI.',
        'Integrated secure APIs for smooth payments and data management.',
        'Optimized app performance and responsiveness across devices.',
      ],
    ),
    ExperienceData(
      role: 'Flutter Developer',
      company: 'NotClg',
      duration: 'Sept 2024 - Dec 2024',
      description:
          'Developed a modern digital canteen platform using Flutter and Firebase to streamline meal ordering for students and canteen owners.',
      achievements: [
        'Created a digital canteen platform with Flutter and Firebase.',
        'Implemented real-time menus, order tracking, authentication, sorting, and payments.',
        'Enhanced user experience with efficient state management.',
        'Improved app security through secure authentication and data encryption.',
      ],
    ),
  ];
}

class ExperienceData {
  final String role;
  final String company;
  final String duration;
  final String description;
  final List<String> achievements;

  ExperienceData({
    required this.role,
    required this.company,
    required this.duration,
    required this.description,
    required this.achievements,
  });
}

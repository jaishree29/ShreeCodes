import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/image_strings.dart';
import 'package:jaishree/utils/responsive_builder.dart';
import 'package:jaishree/widgets/project_card.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final List<Map<String, dynamic>> projects = [
    {
      'imageUrl': MyImages.thatGirlImage,
      'title': 'E-Commerce App',
      'description':
          'ThatGirl: A complete e-commerce solution with product listing, cart, and payment integration.',
      'technologies': ['Flutter', 'Firebase', 'Laravel'],
      'url': 'https://github.com/jaishree29/thatGirlApp',
      'previewUrl':
          'https://drive.google.com/file/d/19suC99h31dLwKaI4Ukh3wIHHui68HnV4/view?usp=drive_link'
    },
    {
      'imageUrl': MyImages.resumeBuilderImage,
      'title': 'ProFile',
      'description':
          'An application for creating and managing resumes with various templates.',
      'technologies': ['Flutter', 'Provider', 'Firebase'],
      'url': 'https://github.com/jaishree29/resume-builder',
    },
    {
      'imageUrl': MyImages.resumeBuilderImage,
      'title': 'MyCanteen',
      'description':
          'A modern digital canteen application to streamline meal ordering for students and canteen owner.',
      'technologies': ['Flutter', 'Provider', 'Firebase'],
      'url': 'https://github.com/jaishree29/resume-builder',
      'previewUrl': 'https://drive.google.com/file/d/1Z5DJ-AaQrDo9VF4O31eyldgtyPPH2Qm9/view?usp=drive_link',
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBuilder.isMobile(context);
    bool isTablet = ResponsiveBuilder.isTablet(context);
    return Column(
      children: [
        Text(
          'Featured Projects',
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
                    : 90.sp,
          ),
          child: Text(
            'A selection of my recent work, showcasing mobile applications built with Flutter.',
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

        // Projects Grid
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile
                ? 20.sp
                : isTablet
                    ? 10.sp
                    : 40.sp,
          ),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              crossAxisSpacing: isMobile
                  ? 0.sp
                  : isTablet
                      ? 15.sp
                      : 10.sp,
              mainAxisSpacing: isMobile
                  ? 30.sp
                  : isTablet
                      ? 15.sp
                      : 10.sp,
              childAspectRatio: isMobile
                  ? 0.9
                  : isTablet
                      ? 0.93
                      : 1.03,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) => ProjectCard(
              imageUrl: projects[index]['imageUrl'],
              title: projects[index]['title'],
              description: projects[index]['description'],
              technologies: List<String>.from(projects[index]['technologies']),
              url: projects[index]['url'],
              previewUrl: projects[index]['previewUrl'],
            ),
          ),
        ),
        // SizedBox(height: 40.sp),
      ],
    );
  }
}

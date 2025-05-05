import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/widgets/project_card.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final List<Map<String, dynamic>> projects = [
    {
      'imageUrl': '',
      'title': 'E-Commerce App',
      'description':
          'A complete e-commerce solution with product listing, cart, and payment integration.',
      'technologies': ['Flutter', 'Firebase', 'Node.js'],
    },
    {
      'imageUrl': '',
      'title': 'Fitness Tracker',
      'description':
          'Mobile application for tracking workouts and nutrition with progress analytics.',
      'technologies': ['Flutter', 'BLoC', 'SQLite'],
    },
    {
      'imageUrl': '',
      'title': 'E-Commerce App',
      'description':
          'A complete e-commerce solution with product listing, cart, and payment integration.',
      'technologies': ['Flutter', 'Firebase', 'Node.js'],
    },
    {
      'imageUrl': '',
      'title': 'Fitness Tracker',
      'description':
          'Mobile application for tracking workouts and nutrition with progress analytics.',
      'technologies': ['Flutter', 'BLoC', 'SQLite'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Featured Projects',
          style: GoogleFonts.inter(
            fontSize: 9.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 3.sp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 90.sp),
          child: Text(
            'A selection of my recent work, showcasing mobile applications built with Flutter.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 4.5.sp,
              fontWeight: FontWeight.w400,
              color: MyColors.textColor1,
            ),
          ),
        ),
        SizedBox(height: 15.sp),

        // Projects Grid
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.sp),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.sp,
              mainAxisSpacing: 10.sp,
              childAspectRatio: 1.03,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) => ProjectCard(
              imageUrl: projects[index]['imageUrl'],
              title: projects[index]['title'],
              description: projects[index]['description'],
              technologies: List<String>.from(projects[index]['technologies']),
            ),
          ),
        ),

        SizedBox(height: 30.sp),
      ],
    );
  }
}

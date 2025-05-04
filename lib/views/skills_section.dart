import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/image_strings.dart';
import 'package:jaishree/widgets/skills_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // List of skill data (icon and text)
    final List<Map<String, String>> skills = [
      {'icon': MyImages.flutterIcon, 'text': 'Flutter'},
      {'icon': MyImages.flutterIcon, 'text': 'Dart'},
      {'icon': MyImages.flutterIcon, 'text': 'Firebase'},
      {'icon': MyImages.flutterIcon, 'text': 'Android'},
      {'icon': MyImages.flutterIcon, 'text': 'iOS'},
      {'icon': MyImages.flutterIcon, 'text': 'Git'},
      {'icon': MyImages.flutterIcon, 'text': 'Figma'},
      {'icon': MyImages.flutterIcon, 'text': 'REST API'},
    ];

    return Column(
      children: [
        SizedBox(height: 35.sp),
        Text(
          'Skills & Technologies',
          style: GoogleFonts.inter(
            fontSize: 9.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 3.sp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 90.sp),
          child: Text(
            'I specialize in Flutter development with a focus on creating beautiful, responsive, and performant mobile applications.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 4.5.sp,
              fontWeight: FontWeight.w400,
              color: MyColors.textColor1,
            ),
          ),
        ),
        SizedBox(height: 20.sp),
        SizedBox(
          height: 250.sp,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, 
                mainAxisSpacing: 7.sp,
                crossAxisSpacing: 7.sp,
                childAspectRatio: 0.5.sp, 
              ),
              itemCount: skills.length,
              itemBuilder: (context, index) => SkillsCard(
                icon: skills[index]['icon']!,
                text: skills[index]['text']!,
              ),
            ),
          ),
        ),
        SizedBox(height: 50.sp),
      ],
    );
  }
}

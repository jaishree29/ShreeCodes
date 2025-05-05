import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/image_strings.dart';
import 'package:jaishree/widgets/skills_card.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  int _selectedTabIndex = 0;

  final List<Map<String, String>> developmentSkills = [
    {'icon': MyImages.flutterIcon, 'text': 'Flutter'},
    {'icon': MyImages.dartIcon, 'text': 'Dart'},
    {'icon': MyImages.firebaseIcon, 'text': 'Firebase'},
    {'icon': MyImages.gitIcon, 'text': 'Git'},
    {'icon': MyImages.androidIcon, 'text': 'Android'},
    {'icon': MyImages.iosIcon, 'text': 'iOS'},
    {'icon': MyImages.cppIcon, 'text': 'C++'},
    {'icon': MyImages.mySqlIcon, 'text': 'SQL'},
  ];

  final List<Map<String, String>> designSkills = [
    {'icon': MyImages.figmaIcon, 'text': 'Figma'},
    {'icon': MyImages.prototypingIcon, 'text': 'Prototyping'},
    {'icon': MyImages.wireframingIcon, 'text': 'Wireframing'},
    {'icon': MyImages.uiuxIcon, 'text': 'UI/UX Design'},
    {'icon': MyImages.userResearchIcon, 'text': 'User Research'},
    {'icon': MyImages.usabilityTestingIcon, 'text': 'Usability Testing'},
    {'icon': MyImages.responsiveDesignIcon, 'text': 'Responsive Design'},
    {'icon': MyImages.animationIcon, 'text': 'Animation'},
  ];

  final List<Map<String, String>> tools = [
    {'icon': MyImages.vsCodeIcon, 'text': 'VS Code'},
    {'icon': MyImages.androidStudioIcon, 'text': 'Android Studio'},
    {'icon': MyImages.postmanIcon, 'text': 'Postman'},
    {'icon': MyImages.githubIcon, 'text': 'GitHub'},
    {'icon': MyImages.jiraIcon, 'text': 'Jira'},
    {'icon': MyImages.slackIcon, 'text': 'Slack'},
    {'icon': MyImages.trelloIcon, 'text': 'Trello'},
    {'icon': MyImages.notionIcon, 'text': 'Notion'},
  ];

  List<Map<String, String>> get _currentSkills {
    switch (_selectedTabIndex) {
      case 0:
        return developmentSkills;
      case 1:
        return designSkills;
      case 2:
        return tools;
      default:
        return developmentSkills;
    }
  }

  @override
  Widget build(BuildContext context) {
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
        SizedBox(height: 15.sp),

        // Tab Container
        Container(
          margin: EdgeInsets.symmetric(horizontal: 125.sp),
          decoration: BoxDecoration(
            color: MyColors.tabBg,
            borderRadius: BorderRadius.circular(2.sp),
          ),
          child: Row(
            children: [
              _buildTabButton(0, 'Development'),
              _buildTabButton(1, 'Design'),
              _buildTabButton(2, 'Tools'),
            ],
          ),
        ),

        SizedBox(height: 10.sp),

        // Skills Grid
        SizedBox(
          height: 125.sp,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.sp),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 7.sp,
                crossAxisSpacing: 7.sp,
                childAspectRatio: 0.5.sp,
              ),
              itemCount: _currentSkills.length,
              itemBuilder: (context, index) => SkillsCard(
                icon: _currentSkills[index]['icon']!,
                text: _currentSkills[index]['text']!,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabButton(int index, String text) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Padding(
          padding: EdgeInsets.all(1.sp),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2.sp),
            decoration: BoxDecoration(
              color: _selectedTabIndex == index
                  ? Colors.white
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(1.sp),
              boxShadow: [
                BoxShadow(
                  color: _selectedTabIndex == index
                      ? MyColors.textColor3
                      : Colors.transparent,
                  blurRadius: 0.3.sp,
                  spreadRadius: 0.2.sp,
                  offset: const Offset(0, 0.7),
                ),
              ]
            ),
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: 4.sp,
                  fontWeight: FontWeight.w500,
                  color: _selectedTabIndex == index ? MyColors.black : MyColors.textColor4,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

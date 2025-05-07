import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/image_strings.dart';
import 'package:jaishree/utils/responsive_builder.dart';
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
    {'icon': MyImages.goIcon, 'text': 'Golang'},
    {'icon': MyImages.cppIcon, 'text': 'C++'},
    {'icon': MyImages.javaIcon, 'text': 'Java'},
  ];

  final List<Map<String, String>> designSkills = [
    {'icon': MyImages.figmaIcon, 'text': 'Figma'},
    {'icon': MyImages.prototypingIcon, 'text': 'Prototyping'},
    {'icon': MyImages.wireframingIcon, 'text': 'Wireframing'},
    {'icon': MyImages.uiuxIcon, 'text': 'UI/UX Design'},
    // {'icon': MyImages.userResearchIcon, 'text': 'User Research'},
    // {'icon': MyImages.usabilityTestingIcon, 'text': 'Usability Testing'},
    // {'icon': MyImages.responsiveDesignIcon, 'text': 'Responsive Design'},
    // {'icon': MyImages.animationIcon, 'text': 'Animation'},
  ];

  final List<Map<String, String>> tools = [
    {'icon': MyImages.vsCodeIcon, 'text': 'VS Code'},
    {'icon': MyImages.androidStudioIcon, 'text': 'Android Studio'},
    {'icon': MyImages.postmanIcon, 'text': 'Postman'},
    {'icon': MyImages.githubIcon, 'text': 'GitHub'},
    {'icon': MyImages.miroIcon, 'text': 'Miro'},
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
    bool isMobile = ResponsiveBuilder.isMobile(context);
    bool isTablet = ResponsiveBuilder.isTablet(context);

    return Column(
      children: [
        SizedBox(
          height: isMobile
              ? 75.sp
              : isTablet
                  ? 30.sp
                  : 35.sp,
        ),
        Text(
          'Skills & Technologies',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: isMobile
                ? 28.sp
                : isTablet
                    ? 12.sp
                    : 9.sp,
            fontWeight: isMobile ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
        SizedBox(
            height: isMobile
                ? 16.sp
                : isTablet
                    ? 5.sp
                    : 3.sp),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? 16.sp
                  : isTablet
                      ? 70.sp
                      : 90.sp),
          child: Text(
            'I specialize in Flutter development with a focus on creating beautiful, responsive, and performant mobile applications.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: isMobile
                  ? 15.5.sp
                  : isTablet
                      ? 5.5.sp
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

        // Tab Container
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: isMobile
                ? 16.sp
                : isTablet
                    ? 105.sp
                    : 125.sp,
          ),
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

        SizedBox(
          height: isMobile
              ? 30.sp
              : isTablet
                  ? 20.sp
                  : 10.sp,
        ),

        // Skills Grid
        SizedBox(
          height: 125.sp,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.sp),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: isMobile ? 100.sp : 80.sp,
                crossAxisCount: isMobile ? 2 : 4,
                mainAxisSpacing: isMobile
                    ? 15.sp
                    : isTablet
                        ? 5.sp
                        : 7.sp,
                crossAxisSpacing: isMobile
                    ? 15.sp
                    : isTablet
                        ? 5.sp
                        : 7.sp,
                childAspectRatio: isMobile
                    ? 1.sp
                    : isTablet
                        ? 1.sp
                        : 0.5.sp,
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
    bool isMobile = ResponsiveBuilder.isMobile(context);
    bool isTablet = ResponsiveBuilder.isTablet(context);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Padding(
          padding: EdgeInsets.all(
            isMobile
                ? 3.sp
                : isTablet
                    ? 2.sp
                    : 1.sp,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: isMobile
                    ? 6.sp
                    : isTablet
                        ? 4.sp
                        : 2.sp),
            decoration: BoxDecoration(
              color: _selectedTabIndex == index
                  ? Colors.white
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(isMobile
                  ? 5.sp
                  : isTablet
                      ? 3.sp
                      : 1.sp),
              boxShadow: [
                BoxShadow(
                  color: _selectedTabIndex == index
                      ? MyColors.textColor3
                      : Colors.transparent,
                  blurRadius: 0.3.sp,
                  spreadRadius: 0.2.sp,
                  offset: const Offset(0, 0.7),
                ),
              ],
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: isMobile
                      ? 13.sp
                      : isTablet
                          ? 5.sp
                          : 4.sp,
                  fontWeight: isMobile ? FontWeight.w600 : FontWeight.w500,
                  color: _selectedTabIndex == index
                      ? MyColors.black
                      : MyColors.textColor4,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

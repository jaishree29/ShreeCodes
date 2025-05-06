import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/responsive_builder.dart';
import 'package:jaishree/views/about_section.dart';
import 'package:jaishree/views/get_in_touch.dart';
import 'package:jaishree/views/navbar.dart';
import 'package:jaishree/views/projects_section.dart';
import 'package:jaishree/views/skills_section.dart';
import 'package:jaishree/widgets/elevated_button.dart';
import 'package:jaishree/widgets/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBuilder.isMobile(context);
    bool isTablet = ResponsiveBuilder.isTablet(context);
    // bool isDesktop = ResponsiveBuilder.isDesktop(context);
    // bool isLargeDesktop = ResponsiveBuilder.isLargeDesktop(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: isMobile
          ? buildMobileDrawer(
              context,
              scrollToAbout: () => _scrollToSection(_aboutKey),
              scrollToSkills: () => _scrollToSection(_skillsKey),
              scrollToProjects: () => _scrollToSection(_projectsKey),
              scrollToContact: () => _scrollToSection(_contactKey),
            )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast),
        child: Column(
          children: [
            Navbar(
              scaffoldKey: _scaffoldKey,
              scrollToAbout: () => _scrollToSection(_aboutKey),
              scrollToSkills: () => _scrollToSection(_skillsKey),
              scrollToProjects: () => _scrollToSection(_projectsKey),
              scrollToContact: () => _scrollToSection(_contactKey),
            ),
            isMobile
                ? SizedBox(
                    height: 100,
                  )
                : SizedBox(
                    height: isTablet ? 120 : 35.sp,
                  ),
            Baseline(
              baseline: 17.sp, // This should match the font size
              baselineType: TextBaseline.alphabetic,
              child: isMobile
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          'Hello, I\'m ',
                          style: GoogleFonts.inter(
                            fontSize: 33.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              bottom: 0,
                              child: Transform.translate(
                                offset: Offset(0, -9.5.sp),
                                child: Container(
                                  width: 247.sp,
                                  height: 3.5.sp,
                                  color: MyColors.textColor3,
                                ),
                              ),
                            ),
                            Text(
                              'Jaishree Tiwari',
                              style: GoogleFonts.inter(
                                fontSize: 33.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          'Hello, I\'m ',
                          style: GoogleFonts.inter(
                            fontSize: isMobile ? 17.sp : 26.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              bottom: 0,
                              child: Transform.translate(
                                offset: Offset(0, isMobile ? -5.5.sp : -7.5.sp),
                                child: Container(
                                  width: isMobile ? 124.sp : 190.sp,
                                  height: isMobile ? 1.5.sp : 2.5.sp,
                                  color: MyColors.textColor3,
                                ),
                              ),
                            ),
                            Text(
                              'Jaishree Tiwari',
                              style: GoogleFonts.inter(
                                fontSize: isMobile ? 17.sp : 26.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
            SizedBox(
              height: isMobile
                  ? 20.sp
                  : isTablet
                      ? 10.sp
                      : 5.sp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? 20.sp
                      : isTablet
                          ? 10.sp
                          : 70.sp),
              child: Text(
                'Flutter Developer crafting beautiful, performant mobile experiences with clean code and thoughtful design.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: isMobile
                        ? 18.sp
                        : isTablet
                            ? 9.sp
                            : 6.sp,
                    color: MyColors.textColor1,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: isMobile
                  ? 50.sp
                  : isTablet
                      ? 10.sp
                      : 15.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyElevatedButton(
                  backgroundColor: MyColors.black,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile
                        ? 18.sp
                        : isTablet
                            ? 10.sp
                            : 3.sp,
                    vertical: isMobile
                        ? 16.sp
                        : isTablet
                            ? 10.sp
                            : 2.5.sp,
                  ),
                  borderRadius: 20.sp,
                  surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
                  text: 'Get in touch',
                  onPressed: () => _scrollToSection(_contactKey),
                  fontSize: isMobile
                      ? 13.sp
                      : isTablet
                          ? 10.sp
                          : 4.sp,
                  textPadding: EdgeInsets.symmetric(
                    horizontal: 3.sp,
                    vertical: 2.5.sp,
                  ),
                ),
                SizedBox(
                  width: isMobile
                      ? 16.sp
                      : isTablet
                          ? 10.sp
                          : 5.sp,
                ),
                MyElevatedButton(
                  backgroundColor: Colors.transparent,
                  borderSide: BorderSide(
                    color: MyColors.textColor2,
                    width: isMobile
                        ? 1.5.sp
                        : isTablet
                            ? 1.5.sp
                            : 0.3.sp,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile
                        ? 18.sp
                        : isTablet
                            ? 10.sp
                            : 3.sp,
                    vertical: isMobile
                        ? 16.sp
                        : isTablet
                            ? 10.sp
                            : 2.5.sp,
                  ),
                  borderRadius: 20.sp,
                  text: 'View Projects',
                  textColor: MyColors.black,
                  onPressed: () => _scrollToSection(_projectsKey),
                  fontSize: isMobile
                      ? 13.sp
                      : isTablet
                          ? 10.sp
                          : 4.sp,
                  textPadding: EdgeInsets.symmetric(
                    horizontal: 3.sp,
                    vertical: 2.5.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: isMobile
                  ? 120.sp
                  : isTablet
                      ? 50.sp
                      : 35.sp,
            ),
            AboutSection(
              key: _aboutKey,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: MyColors.bgColor,
                // borderRadius: BorderRadius.circular(10.sp),
              ),
              child: SkillsSection(
                key: _skillsKey,
              ),
            ),
            SizedBox(
              height: 35.sp,
            ),
            ProjectsSection(
              key: _projectsKey,
            ),
            SizedBox(
              height: 40.sp,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: MyColors.bgColor,
                // borderRadius: BorderRadius.circular(10.sp),
              ),
              child: GetInTouch(
                key: _contactKey,
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}

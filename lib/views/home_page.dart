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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ResponsiveBuilder.isMobile(context)
          ? buildMobileDrawer(context)
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast),
        child: Column(
          children: [
            Navbar(scaffoldKey: _scaffoldKey),
            SizedBox(height: 35.sp),
            Baseline(
              baseline: 17.sp, // This should match the font size
              baselineType: TextBaseline.alphabetic,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'Hello, I\'m ',
                    style: GoogleFonts.inter(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Transform.translate(
                          offset: Offset(0, -5.5.sp),
                          child: Container(
                            width: 124.sp,
                            height: 1.5.sp,
                            color: MyColors.textColor3,
                          ),
                        ),
                      ),
                      Text(
                        'Jaishree Tiwari',
                        style: GoogleFonts.inter(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.sp),
              child: Text(
                'Flutter Developer crafting beautiful, performant mobile experiences with clean code and thoughtful design.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 6.sp,
                    color: MyColors.textColor1,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 15.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyElevatedButton(
                  backgroundColor: MyColors.black,
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.sp,
                    vertical: 2.5.sp,
                  ),
                  borderRadius: 20.sp,
                  surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
                  text: 'Get in touch',
                  onPressed: () {},
                  fontSize: 4.sp,
                  textPadding: EdgeInsets.symmetric(
                    horizontal: 3.sp,
                    vertical: 2.5.sp,
                  ),
                ),
                SizedBox(
                  width: 5.sp,
                ),
                MyElevatedButton(
                  backgroundColor: Colors.transparent,
                  borderSide: BorderSide(
                    color: MyColors.textColor2,
                    width: 0.3.sp,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.sp,
                    vertical: 2.5.sp,
                  ),
                  borderRadius: 20.sp,
                  text: 'View Projects',
                  textColor: MyColors.black,
                  onPressed: () {},
                  fontSize: 4.sp,
                  textPadding: EdgeInsets.symmetric(
                    horizontal: 3.sp,
                    vertical: 2.5.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35.sp,
            ),
            AboutSection(),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: MyColors.bgColor,
                // borderRadius: BorderRadius.circular(10.sp),
              ),
              child: SkillsSection(),
            ),
            SizedBox(
              height: 35.sp,
            ),
            ProjectsSection(),
            SizedBox(
              height: 40.sp,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: MyColors.bgColor,
                // borderRadius: BorderRadius.circular(10.sp),
              ),
              child: GetInTouch(),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}

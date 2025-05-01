import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/image_strings.dart';
import 'package:jaishree/utils/responsive_builder.dart';
import 'package:jaishree/views/navbar.dart';

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
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Navbar(scaffoldKey: _scaffoldKey),
            Divider(
              color: Colors.grey.shade200,
            ),
            SizedBox(
              height: 20.sp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50.0,
                                height: 1.sp,
                                decoration: BoxDecoration(
                                  gradient: MyColors.linerGradient,
                                ),
                              ),
                              SizedBox(
                                width: 5.sp,
                              ),
                              Text(
                                'Welcome to my portfolio',
                                style: GoogleFonts.interTight(
                                  fontSize: 5.sp,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.textColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'I am a',
                                style: GoogleFonts.interTight(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              // SizedBox(
                              //   height: 1.sp,
                              // ),
                              AnimatedTextKit(
                                repeatForever: true,
                                pause: const Duration(milliseconds: 1000),
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    cursor: '|',
                                    'Flutter Developer',
                                    textStyle: GoogleFonts.interTight(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: MyColors.primaryColor,
                                    ),
                                    speed: const Duration(milliseconds: 80),
                                  ),
                                  TypewriterAnimatedText(
                                    cursor: '|',
                                    'Full-Stack Developer',
                                    textStyle: GoogleFonts.interTight(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: MyColors.primaryColor,
                                    ),
                                    speed: const Duration(milliseconds: 80),
                                  ),
                                  TypewriterAnimatedText(
                                    cursor: '|',
                                    'Tech Enthusiast',
                                    textStyle: GoogleFonts.interTight(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: MyColors.primaryColor,
                                    ),
                                    speed: const Duration(milliseconds: 80),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.sp,
                          ),
                          SizedBox(
                            width: 200.sp,
                            child: Text(
                              'Full-stack developer specializing in building exceptional digital experiences. Transforming ideas into elegant solutions through clean code and intuitive design.',
                              style: GoogleFonts.dmSans(
                                fontSize: 5.5.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 130.sp,
                        height: 130.sp,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(MyImages.profileImage),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/responsive_builder.dart';
import 'package:jaishree/views/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _visible = true;
      });
    });

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBuilder.isMobile(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1200),
              opacity: _visible ? 1.0 : 0.0,
              child: Text(
                "ShreeCodes",
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 28.sp : 24.sp,
                  color: MyColors.primaryColor,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

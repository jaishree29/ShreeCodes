import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaishree/views/splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if needed to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ShreeCodes',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
            ),
            home: child,
          );
        },
        child: SplashScreen(),
      ),
    );
  }
}

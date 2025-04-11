import 'package:flutter/material.dart';
import 'package:jaishree/views/splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShreeCodes',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
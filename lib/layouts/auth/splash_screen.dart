import 'dart:async';

import 'package:fab_hr/layouts/common_screens/constants_widgets.dart';
import 'package:fab_hr/layouts/dashboard/dashboardd.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String route = 'SplashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashBoardScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getSize(context).height,
      width: getSize(context).width,
      child: Image.asset(
        'assets/images/Intro.jpg',
        // fit: BoxFit.cover,
      ),
    );
  }
}

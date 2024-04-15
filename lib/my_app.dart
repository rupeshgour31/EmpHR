import 'package:fab_hr/layouts/auth/splash_screen.dart';
import 'package:fab_hr/route_helper.dart';
import 'package:fab_hr/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feb Hr',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.appThemeDark,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.black.withOpacity(0),
        ),
      ),
      routes: context.read<RouteHelper>().createRoutes(),
      initialRoute: _getInitialRoute(),
    );
  }

  String _getInitialRoute() {
    return SplashScreen.route;
  }
}

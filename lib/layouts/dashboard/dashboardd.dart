import 'package:fab_hr/layouts/attendance/attendance.dart';
import 'package:fab_hr/layouts/documents_show/documents_show.dart';
import 'package:fab_hr/layouts/home/home.dart';
import 'package:fab_hr/layouts/home/home_view_model.dart';
import 'package:fab_hr/layouts/profile/profile.dart';
import 'package:fab_hr/utils/app_colors.dart';
import 'package:fab_hr/utils/safearea_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class DashBoardScreen extends StatefulWidget {
  static const String route = 'DashBoardScreen';
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: SafeAreaScreen(
        childWidget: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,
          bottomSheet: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            child: WaterDropNavBar(
              bottomPadding: 12,
              backgroundColor: AppColors.whiteColor,
              onItemSelected: (int index) {
                setState(() {
                  selectedIndex = index;
                });
                pageController.animateToPage(
                  selectedIndex,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutQuad,
                );
              },
              iconSize: 30,
              waterDropColor: AppColors.appThemeDark,
              selectedIndex: selectedIndex,
              inactiveIconColor: AppColors.greyColor,
              barItems: <BarItem>[
                BarItem(
                  filledIcon: Icons.home,
                  outlinedIcon: Icons.home_outlined,
                ),
                BarItem(
                  filledIcon: Icons.fingerprint,
                  outlinedIcon: Icons.fingerprint_rounded,
                ),
                BarItem(
                  filledIcon: CupertinoIcons.person_solid,
                  outlinedIcon: CupertinoIcons.person,
                ),
                BarItem(
                  filledIcon: Icons.perm_contact_calendar_rounded,
                  outlinedIcon: Icons.perm_contact_calendar_outlined,
                ),
              ],
            ),
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: <Widget>[
              Provider<HomeViewModel>(
                create: (_) => HomeViewModel(),
                child: const HomeScreen(),
              ),
              const AttendanceScreen(),
              const ProfileScreen(),
              const DocumentsShow(),
            ],
          ),
        ),
      ),
    );
  }
}

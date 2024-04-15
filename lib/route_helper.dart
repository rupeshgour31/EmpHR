import 'package:fab_hr/layouts/anniversary/anniversary.dart';
import 'package:fab_hr/layouts/apply_for_leave/apply_for_leave.dart';
import 'package:fab_hr/layouts/ar_request/ar_request.dart';
import 'package:fab_hr/layouts/attendance/attendance.dart';
import 'package:fab_hr/layouts/auth/splash_screen.dart';
import 'package:fab_hr/layouts/birthday/birthday.dart';
import 'package:fab_hr/layouts/dashboard/dashboardd.dart';
import 'package:fab_hr/layouts/holiday/holiday_screen.dart';
import 'package:fab_hr/layouts/home/home_view_model.dart';
import 'package:fab_hr/layouts/manage_attendance/manage_attendance.dart';
import 'package:fab_hr/layouts/my_attendance/my_attendance.dart';
import 'package:fab_hr/layouts/my_income_tax/my_income_tax.dart';
import 'package:fab_hr/layouts/profile/profile.dart';
import 'package:fab_hr/layouts/support/support_dashboard.dart';
import 'package:fab_hr/layouts/team_leave/team_leave_detail.dart';
import 'package:fab_hr/transition.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RouteHelper with Transitions {
  final dash = HomeViewModel();
  Map<String, WidgetBuilder> createRoutes() {
    return {
      SplashScreen.route: (_) => const SplashScreen(),
      ProfileScreen.route: (_) => const ProfileScreen(),
      TeamLeaveDetail.route: (_) => const TeamLeaveDetail(),
      AttendanceScreen.route: (_) => const AttendanceScreen(),
      MyAttendance.route: (_) => const MyAttendance(),
      AnniversaryScreen.route: (_) => const AnniversaryScreen(),
      ApplyForLeave.route: (_) => const ApplyForLeave(),
      ArRequest.route: (_) => const ArRequest(),
      BirthdayScreen.route: (_) => const BirthdayScreen(),
      ManageAttendance.route: (_) => const ManageAttendance(),
      MyIncomeTax.route: (_) => const MyIncomeTax(),
      SupportDashboard.route: (_) => const SupportDashboard(),
      HolidayScreen.route: (_) => const HolidayScreen(),
      DashBoardScreen.route: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: HomeViewModel()),
            ],
            child: const DashBoardScreen(),
          ),
    };
  }
}

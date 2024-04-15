import 'package:fab_hr/layouts/common_screens/constants_widgets.dart';
import 'package:fab_hr/layouts/home/home_widgets/see_all_services.dart';
import 'package:fab_hr/layouts/home/home_widgets/see_reviews.dart';
import 'package:fab_hr/utils/app_colors.dart';
import 'package:fab_hr/utils/common_fontstyle.dart';
import 'package:fab_hr/utils/gradient_icon.dart';
import 'package:fab_hr/utils/safearea_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  static const String route = 'HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List services = [
    {
      'title': 'My Attendance',
      'icon': 'assets/icons/attendance_icon.svg',
    },
    {
      'title': 'Leave',
      'icon': 'assets/icons/apply_for_leave_icon.svg',
    },
    {
      'title': 'Manage Attendance',
      'icon': 'assets/icons/attendance_icon.svg',
    },
    {
      'title': 'My Income Tax',
      'icon': 'assets/icons/income_tax_icon.svg',
    },
    {
      'title': 'Birthday',
      'icon': 'assets/icons/birthday_icon.svg',
    },
    {
      'title': 'Anniversary',
      'icon': 'assets/icons/annivarsary_icon.svg',
    },
    {
      'title': 'Support',
      'icon': 'assets/icons/support_icon.svg',
    },
    {
      'title': 'Holiday Calendar',
      'icon': 'assets/icons/holiday_calender_icon.svg',
    },
    {
      'title': 'Regularize Attendance',
      'icon': 'assets/icons/ar_req_icon.svg',
    }
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeAreaScreen(
      childWidget: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          title: greeting(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: GestureDetector(
                onTap: null,
                child: GradientIcon(
                  SvgPicture.asset(
                    'assets/icons/notification_icon.svg',
                    color: AppColors.whiteColor,
                  ),
                  20.0,
                  [
                    Colors.red,
                    Colors.yellow.shade600,
                  ],
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            children: [
              const SeeReviews(),
              sizedBoxShow(height: 8),
              SeeAllServices(
                services: services,
              ),
              sizedBoxShow(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return Row(
        children: [
          GradientIcon(
            const Icon(CupertinoIcons.sun_dust),
            40.0,
            const [
              Colors.red,
              Colors.yellow,
            ],
          ),
          Text(
            'Good Morning',
            style: FontStyleGoogle.bold(AppColors.appThemeDark).s18,
          ),
        ],
      );
    }
    if (hour < 17) {
      return Row(
        children: [
          GradientIcon(
            const Icon(Icons.sunny),
            40.0,
            const [
              Colors.red,
              Colors.yellow,
            ],
          ),
          Text(
            'Good Afternoon',
            style: FontStyleGoogle.bold(AppColors.appThemeDark).s18,
          ),
        ],
      );
    }
    return Row(
      children: [
        GradientIcon(
          const Icon(CupertinoIcons.moon_stars_fill),
          40.0,
          const [
            Color(0xfef1f1f2),
            Color(0xff5742a9),
          ],
        ),
        Text(
          'Good Evening',
          style: FontStyleGoogle.bold(AppColors.appThemeDark).s18,
        ),
      ],
    );
  }
}

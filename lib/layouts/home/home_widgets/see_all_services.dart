import 'package:fab_hr/layouts/anniversary/anniversary.dart';
import 'package:fab_hr/layouts/apply_for_leave/apply_for_leave.dart';
import 'package:fab_hr/layouts/ar_request/ar_request_dashboard.dart';
import 'package:fab_hr/layouts/birthday/birthday.dart';
import 'package:fab_hr/layouts/common_screens/constants_widgets.dart';
import 'package:fab_hr/layouts/holiday/holiday_screen.dart';
import 'package:fab_hr/layouts/manage_attendance/manage_attendance.dart';
import 'package:fab_hr/layouts/my_attendance/my_attendance.dart';
import 'package:fab_hr/layouts/my_income_tax/my_income_tax.dart';
import 'package:fab_hr/layouts/support/support_dashboard.dart';
import 'package:fab_hr/utils/app_colors.dart';
import 'package:fab_hr/utils/common_fontstyle.dart';
import 'package:fab_hr/utils/gradient_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class SeeAllServices extends StatefulWidget {
  final List services;
  const SeeAllServices({
    Key? key,
    required this.services,
  }) : super(key: key);

  @override
  State<SeeAllServices> createState() => _SeeAllServicesState();
}

class _SeeAllServicesState extends State<SeeAllServices> {
  bool isList = false;

  void changeView() {
    setState(() {
      isList = !isList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Services',
              style: FontStyleGoogle.bold(AppColors.blackColor).s18,
            ),
            GestureDetector(
              onTap: () {
                changeView();
              },
              child: isList
                  ? GradientIcon(
                      Icon(
                        Icons.grid_view,
                        size: 30,
                        color: AppColors.whiteColor,
                      ),
                      35.0,
                      const [
                        Colors.red,
                        Colors.yellow,
                      ],
                    )
                  : GradientIcon(
                      Icon(
                        Icons.view_list_rounded,
                        size: 30,
                        color: AppColors.whiteColor,
                      ),
                      35.0,
                      const [
                        Colors.red,
                        Colors.yellow,
                      ],
                    ),
            ),
          ],
        ),
        sizedBoxShow(height: 8),
        isList
            ? ListView.builder(
                itemCount: widget.services.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      navigateRoute(widget.services[index]['title']);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(2, 2),
                            blurRadius: 12,
                            color: AppColors.greyColor.withOpacity(0.1),
                          ),
                        ],
                      ),
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        title: Text(
                          widget.services[index]['title'],
                          style:
                              FontStyleGoogle.bold(AppColors.appThemeDark).s16,
                        ),
                        leading: GradientIcon(
                          SvgPicture.asset(
                            widget.services[index]['icon'],
                            color: Colors.white,
                          ),
                          30.0,
                          [
                            if (index == 0 || index == 3 || index == 6)
                              const Color(0xfef1f1f2),
                            if (index == 0 || index == 3 || index == 6)
                              const Color(0xff5742a9),
                            if (index == 1 || index == 4 || index == 7)
                              const Color(0xff8fdb38),
                            if (index == 1 || index == 4 || index == 7)
                              const Color(0xff57e98f),
                            if (index == 2 || index == 5 || index == 8)
                              const Color(0xffb84595),
                            if (index == 2 || index == 5 || index == 8)
                              const Color(0xff9f2630),
                          ],
                        ),
                        trailing: GradientIcon(
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.whiteColor,
                            size: 30,
                          ),
                          30.0,
                          [
                            if (index == 0 || index == 3 || index == 6)
                              const Color(0xfef1f1f2),
                            if (index == 0 || index == 3 || index == 6)
                              const Color(0xff5742a9),
                            if (index == 1 || index == 4 || index == 7)
                              const Color(0xff8fdb38),
                            if (index == 1 || index == 4 || index == 7)
                              const Color(0xff57e98f),
                            if (index == 2 || index == 5 || index == 8)
                              const Color(0xffb84595),
                            if (index == 2 || index == 5 || index == 8)
                              const Color(0xff9f2630),
                          ],
                        ),
                      ),
                    ),
                  );
                })
            : GridView.builder(
                itemCount: widget.services.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      navigateRoute(widget.services[index]['title']);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(2, 2),
                            blurRadius: 12,
                            color: AppColors.greyColor.withOpacity(0.1),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.services[index]['title'],
                            textAlign: TextAlign.center,
                            style: FontStyleGoogle.bold(AppColors.appThemeDark)
                                .s16,
                          ),
                          sizedBoxShow(height: 8),
                          GradientIcon(
                            SvgPicture.asset(
                              widget.services[index]['icon'],
                              color: Colors.white,
                            ),
                            35.0,
                            [
                              if (index == 0 || index == 3 || index == 6)
                                const Color(0xfef1f1f2),
                              if (index == 0 || index == 3 || index == 6)
                                const Color(0xff5742a9),
                              if (index == 1 || index == 4 || index == 7)
                                const Color(0xff8fdb38),
                              if (index == 1 || index == 4 || index == 7)
                                const Color(0xff57e98f),
                              if (index == 2 || index == 5 || index == 8)
                                const Color(0xffb84595),
                              if (index == 2 || index == 5 || index == 8)
                                const Color(0xff9f2630),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ],
    );
  }

  navigateRoute(String title) {
    if (title == 'My Attendance') {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const MyAttendance(),
        ),
      );
    } else if (title == 'Leave') {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const ApplyForLeave(),
        ),
      );
    } else if (title == 'Manage Attendance') {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const ManageAttendance(),
        ),
      );
    } else if (title == 'My Income Tax') {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const MyIncomeTax(),
        ),
      );
    } else if (title == 'Birthday') {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const BirthdayScreen(),
        ),
      );
    } else if (title == 'Anniversary') {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const AnniversaryScreen(),
        ),
      );
    } else if (title == 'Support') {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const SupportDashboard(),
        ),
      );
    } else if (title == 'Holiday Calendar') {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const HolidayScreen(),
        ),
      );
    } else if (title == 'Regularize Attendance') {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const ArRequestDashboard(),
        ),
      );
    } else {
      null;
    }
  }
}

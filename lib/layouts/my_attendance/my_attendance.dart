import 'package:fab_hr/layouts/common_screens/constants_widgets.dart';
import 'package:fab_hr/utils/app_colors.dart';
import 'package:fab_hr/utils/common_fontstyle.dart';
import 'package:fab_hr/utils/gradient_icon.dart';
import 'package:fab_hr/utils/safearea_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_svg/flutter_svg.dart';

class MyAttendance extends StatefulWidget {
  static const String route = 'MyAttendance';
  const MyAttendance({Key? key}) : super(key: key);

  @override
  _MyAttendanceState createState() => _MyAttendanceState();
}

class _MyAttendanceState extends State<MyAttendance> {
  DateTime _currentDate = DateTime(2019, 2, 3);
  @override
  Widget build(BuildContext context) {
    return SafeAreaScreen(
      childWidget: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: BackButton(
            color: AppColors.appThemeDark,
          ),
          title: Text(
            'My Attendance',
            style: FontStyleGoogle.bold(AppColors.appThemeDark).s18,
          ),
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
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: Column(
            children: [
              CalendarCarousel<Event>(
                onDayPressed: (DateTime date, List<Event> events) {
                  this.setState(() => _currentDate = date);
                },
                weekendTextStyle:
                    FontStyleGoogle.medium(AppColors.redColor).s18,
                daysTextStyle: FontStyleGoogle.medium(AppColors.blackColor).s18,
                thisMonthDayBorderColor: AppColors.greenColor,
                customDayBuilder: (
                  bool isSelectable,
                  int index,
                  bool isSelectedDay,
                  bool isToday,
                  bool isPrevMonthDay,
                  TextStyle textStyle,
                  bool isNextMonthDay,
                  bool isThisMonthDay,
                  DateTime day,
                ) {
                  if (day.day == 5 ||
                      day.day == 6 ||
                      day.day == 7 ||
                      day.day == 15) {
                    return Container(
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          day.day.toString(),
                          style:
                              FontStyleGoogle.medium(AppColors.whiteColor).s18,
                        ),
                      ),
                    );
                  } else {
                    return null;
                  }
                },
                weekFormat: false,
                daysHaveCircularBorder: true,
                showOnlyCurrentMonthDate: false,
                // markedDatesMap: _markedDateMap,
                height: 390.0,
                // selectedDateTime: _currentDate,
                // daysHaveCircularBorder: false,
              ),
              sizedBoxShow(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      height: 28,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: i == 0
                            ? AppColors.redColor
                            : i == 1
                                ? AppColors.greenColor
                                : AppColors.yellowColor,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        i == 0
                            ? 'Leave'
                            : i == 1
                                ? 'Working'
                                : 'Holiday',
                        style: FontStyleGoogle.medium(AppColors.whiteColor).s16,
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

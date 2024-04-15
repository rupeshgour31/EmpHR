import 'package:fab_hr/layouts/common_screens/constants_widgets.dart';
import 'package:fab_hr/utils/app_colors.dart';
import 'package:fab_hr/utils/common_fontstyle.dart';
import 'package:fab_hr/utils/custom_tabbar.dart';
import 'package:fab_hr/utils/gradient_icon.dart';
import 'package:fab_hr/utils/input_text_form.dart';
import 'package:fab_hr/utils/safearea_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArRequestDashboard extends StatefulWidget {
  final int currentIndex;
  const ArRequestDashboard({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  _ArRequestDashboardState createState() => _ArRequestDashboardState();
}

class _ArRequestDashboardState extends State<ArRequestDashboard> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

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
            'AR Request',
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
        body: CustomTabBar(
          currentIndex: widget.currentIndex,
          tabs: const [
            Tab(text: "My AR"),
            Tab(text: "Request AR"),
            Tab(text: "Team's AR")
          ],
          children: <Widget>[
            Container(),
            reqLeave(),
            Container(),
          ],
        ),
      ),
    );
  }

  String value = 'Card Not Working';
  Widget reqLeave() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15, right: 25),
            width: getSize(context).width,
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
            child: DropdownButton<String>(
              value: value,
              underline: const SizedBox.shrink(),
              isExpanded: true,
              items: <String>[
                'Card Not Working',
                'Machine Not Working',
                'Miss Punch',
                'Power cut',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: FontStyleGoogle.semiBold(
                      AppColors.appThemeDark,
                    ).s16,
                  ),
                );
              }).toList(),
              onChanged: (_) {
                print(_);
              },
            ),
          ),
          sizedBoxShow(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 6.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'From:',
                      style: FontStyleGoogle.semiBold(
                        AppColors.blackColor.withOpacity(0.7),
                      ).s14,
                    ),
                    GestureDetector(
                      onTap: () => _showDialog(
                        CupertinoDatePicker(
                          initialDateTime: fromDate,
                          mode: CupertinoDatePickerMode.date,
                          use24hFormat: true,
                          // This is called when the user changes the date.
                          onDateTimeChanged: (DateTime newDate) {
                            setState(() => fromDate = newDate);
                          },
                        ),
                      ),
                      child: Text(
                        '${fromDate.day}-${fromDate.month}-${fromDate.year}',
                        style: FontStyleGoogle.bold(
                          AppColors.appThemeDark,
                        ).s18,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'To:',
                      style: FontStyleGoogle.semiBold(
                        AppColors.blackColor.withOpacity(0.7),
                      ).s14,
                    ),
                    GestureDetector(
                      onTap: () => _showDialog(
                        CupertinoDatePicker(
                          initialDateTime: toDate,
                          mode: CupertinoDatePickerMode.date,
                          use24hFormat: true,
                          // This is called when the user changes the date.
                          onDateTimeChanged: (DateTime newDate) {
                            setState(() => toDate = newDate);
                          },
                        ),
                      ),
                      child: Text(
                        '${toDate.day}-${toDate.month}-${toDate.year}',
                        style: FontStyleGoogle.bold(
                          AppColors.appThemeDark,
                        ).s18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          sizedBoxShow(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              'Remark:',
              style: FontStyleGoogle.semiBold(
                AppColors.blackColor.withOpacity(0.7),
              ).s16,
            ),
          ),
          sizedBoxShow(height: 10),
          CommonTextField(
            hintText: '',
            maxLines: 8,
            maxLength: 800,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 55,
              width: getSize(context).width * 0.9,
              margin: const EdgeInsets.only(top: 45),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    AppColors.appThemeDark,
                    AppColors.appThemeLight,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'Submit',
                style: FontStyleGoogle.semiBold(
                  AppColors.whiteColor,
                ).s18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}

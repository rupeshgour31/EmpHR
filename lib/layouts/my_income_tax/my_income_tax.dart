import 'package:fab_hr/utils/app_colors.dart';
import 'package:fab_hr/utils/common_fontstyle.dart';
import 'package:fab_hr/utils/gradient_icon.dart';
import 'package:fab_hr/utils/safearea_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyIncomeTax extends StatefulWidget {
  static const String route = 'MyIncomeTax';
  const MyIncomeTax({Key? key}) : super(key: key);

  @override
  _MyIncomeTaxState createState() => _MyIncomeTaxState();
}

class _MyIncomeTaxState extends State<MyIncomeTax> {
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
            'My Income Tax',
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
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

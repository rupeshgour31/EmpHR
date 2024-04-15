import 'package:fab_hr/utils/app_colors.dart';
import 'package:fab_hr/utils/common_fontstyle.dart';
import 'package:fab_hr/utils/custom_tabbar.dart';
import 'package:fab_hr/utils/gradient_icon.dart';
import 'package:fab_hr/utils/safearea_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocumentsShow extends StatefulWidget {
  const DocumentsShow({Key? key}) : super(key: key);

  @override
  _DocumentsShowState createState() => _DocumentsShowState();
}

class _DocumentsShowState extends State<DocumentsShow> {
  @override
  Widget build(BuildContext context) {
    return SafeAreaScreen(
      childWidget: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Documents',
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
          tabs: const [
            Tab(text: "Pay Slips"),
            Tab(text: "Policy"),
            Tab(text: "Assets")
          ],
          children: <Widget>[
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}

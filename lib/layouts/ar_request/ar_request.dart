import 'package:fab_hr/layouts/common_screens/constants_widgets.dart';
import 'package:fab_hr/utils/app_colors.dart';
import 'package:fab_hr/utils/common_fontstyle.dart';
import 'package:fab_hr/utils/gradient_icon.dart';
import 'package:fab_hr/utils/input_text_form.dart';
import 'package:fab_hr/utils/safearea_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArRequest extends StatefulWidget {
  static const String route = 'ArRequest';
  const ArRequest({Key? key}) : super(key: key);

  @override
  _ArRequestState createState() => _ArRequestState();
}

class _ArRequestState extends State<ArRequest> {
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
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: null,
              child: Container(
                height: 55,
                width: getSize(context).width * 0.45,
                margin: const EdgeInsets.only(left: 15, bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.greenColor,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Approve',
                  style: FontStyleGoogle.semiBold(
                    AppColors.whiteColor,
                  ).s18,
                ),
              ),
            ),
            GestureDetector(
              onTap: null,
              child: Container(
                height: 55,
                width: getSize(context).width * 0.45,
                margin: const EdgeInsets.only(right: 15, bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.redColor,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Reject',
                  style: FontStyleGoogle.semiBold(
                    AppColors.whiteColor,
                  ).s18,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 12,
                        color: AppColors.greyColor.withOpacity(0.1),
                      ),
                    ]),
                alignment: Alignment.center,
                child: ListTile(
                  contentPadding: const EdgeInsets.only(
                    top: 12,
                    left: 8,
                    right: 8,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: AppColors.appThemeDark,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/664?image=12',
                    ),
                  ),
                  title: Text(
                    'Test name',
                    style: FontStyleGoogle.bold(AppColors.blackColor).s16,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizedBoxShow(height: 8),
                      Text(
                        '12/1/2022  to  15/1/2022',
                        style: FontStyleGoogle.bold(
                          AppColors.blackColor.withOpacity(0.6),
                        ).s14,
                      ),
                      sizedBoxShow(height: 8),
                      Text(
                        'Casual Leave',
                        style: FontStyleGoogle.bold(
                          AppColors.blackColor.withOpacity(0.6),
                        ).s14,
                      ),
                    ],
                  ),
                ),
              ),
              sizedBoxShow(height: 20),
              Text(
                'Employee Request:',
                style: FontStyleGoogle.semiBold(
                  AppColors.blackColor.withOpacity(0.6),
                ).s18,
              ),
              sizedBoxShow(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 12,
                        color: AppColors.greyColor.withOpacity(0.1),
                      ),
                    ]),
                padding: const EdgeInsets.all(12),
                alignment: Alignment.topLeft,
                child: Text(
                  'Hello, \nI have some urgent work at home',
                  style: FontStyleGoogle.semiBold(
                    AppColors.blackColor.withOpacity(0.6),
                  ).s15,
                ),
              ),
              sizedBoxShow(height: 20),
              Text(
                'Add Remark:',
                style: FontStyleGoogle.semiBold(
                  AppColors.blackColor.withOpacity(0.6),
                ).s18,
              ),
              sizedBoxShow(height: 10),
              CommonTextField(
                hintText: '',
                maxLines: 8,
                maxLength: 500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

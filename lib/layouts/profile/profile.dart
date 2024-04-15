import 'package:fab_hr/layouts/common_screens/constants_widgets.dart';
import 'package:fab_hr/utils/app_colors.dart';
import 'package:fab_hr/utils/common_fontstyle.dart';
import 'package:fab_hr/utils/gradient_icon.dart';
import 'package:fab_hr/utils/safearea_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  static const String route = 'ProfileScreen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            'My Profile',
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.appThemeDark,
                backgroundImage: const NetworkImage(
                  "https://source.unsplash.com/user/c_v_r/1900x800",
                ),
              ),
              sizedBoxShow(height: 15),
              Text(
                'Test Username',
                style: FontStyleGoogle.bold(AppColors.blackColor).s16,
              ),
              sizedBoxShow(height: 15),
              personalDetail(),
              sizedBoxShow(height: 15),
              idAddressProof(),
              sizedBoxShow(height: 15),
              professionalExp(),
              sizedBoxShow(height: 15),
              educations(),
              sizedBoxShow(height: 15),
              bank(),
              sizedBoxShow(height: 15),
              official(),
              sizedBoxShow(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget personalDetail() {
    return Container(
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
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Personal detail:',
            style: FontStyleGoogle.bold(AppColors.blackColor).s16,
          ),
          sizedBoxShow(height: 10),
          Text(
            'Email:',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s14,
          ),
          sizedBoxShow(height: 5),
          Text(
            'test.dev@gmail.com',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s13,
          ),
          sizedBoxShow(height: 8),
          Text(
            'Mobile:',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s14,
          ),
          sizedBoxShow(height: 5),
          Text(
            '23423423423',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s13,
          ),
          sizedBoxShow(height: 8),
          Text(
            'Reporting to:',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s14,
          ),
          sizedBoxShow(height: 5),
          Text(
            'test dev',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s13,
          ),
          sizedBoxShow(height: 8),
        ],
      ),
    );
  }

  Widget idAddressProof() {
    return Container(
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
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'ID & Address Proof:',
            style: FontStyleGoogle.bold(AppColors.blackColor).s16,
          ),
          sizedBoxShow(height: 10),
          Text(
            'Email:',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s14,
          ),
          sizedBoxShow(height: 5),
          Text(
            'test.dev@gmail.com',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s13,
          ),
          sizedBoxShow(height: 8),
          Text(
            'Mobile:',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s14,
          ),
          sizedBoxShow(height: 5),
          Text(
            '23423423423',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s13,
          ),
          sizedBoxShow(height: 8),
          Text(
            'Reporting to:',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s14,
          ),
          sizedBoxShow(height: 5),
          Text(
            'test dev',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s13,
          ),
          sizedBoxShow(height: 8),
        ],
      ),
    );
  }

  Widget professionalExp() {
    return Container(
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
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Professional Experience:',
            style: FontStyleGoogle.bold(AppColors.blackColor).s16,
          ),
          sizedBoxShow(height: 10),
          Text(
            'Email:',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s14,
          ),
          sizedBoxShow(height: 5),
          Text(
            'test.dev@gmail.com',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s13,
          ),
          sizedBoxShow(height: 8),
          Text(
            'Mobile:',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s14,
          ),
          sizedBoxShow(height: 5),
          Text(
            '23423423423',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s13,
          ),
          sizedBoxShow(height: 8),
          Text(
            'Reporting to:',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s14,
          ),
          sizedBoxShow(height: 5),
          Text(
            'test dev',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s13,
          ),
          sizedBoxShow(height: 8),
        ],
      ),
    );
  }

  Widget educations() {
    return Container(
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
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Educational Experience:',
            style: FontStyleGoogle.bold(AppColors.blackColor).s16,
          ),
          sizedBoxShow(height: 10),
          Text(
            'Email:',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s14,
          ),
          sizedBoxShow(height: 5),
          Text(
            'test.dev@gmail.com',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s13,
          ),
          sizedBoxShow(height: 8),
          Text(
            'Mobile:',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s14,
          ),
          sizedBoxShow(height: 5),
          Text(
            '23423423423',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s13,
          ),
          sizedBoxShow(height: 8),
          Text(
            'Reporting to:',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s14,
          ),
          sizedBoxShow(height: 5),
          Text(
            'test dev',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s13,
          ),
          sizedBoxShow(height: 8),
        ],
      ),
    );
  }

  Widget bank() {
    return Container(
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
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Bank detail:',
            style: FontStyleGoogle.bold(AppColors.blackColor).s16,
          ),
          sizedBoxShow(height: 10),
          Text(
            'Email:',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s14,
          ),
          sizedBoxShow(height: 5),
          Text(
            'test.dev@gmail.com',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s13,
          ),
          sizedBoxShow(height: 8),
          Text(
            'Mobile:',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s14,
          ),
          sizedBoxShow(height: 5),
          Text(
            '23423423423',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s13,
          ),
          sizedBoxShow(height: 8),
          Text(
            'Reporting to:',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s14,
          ),
          sizedBoxShow(height: 5),
          Text(
            'test dev',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s13,
          ),
          sizedBoxShow(height: 8),
        ],
      ),
    );
  }

  Widget official() {
    return Container(
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
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Official detail:',
            style: FontStyleGoogle.bold(AppColors.blackColor).s16,
          ),
          sizedBoxShow(height: 10),
          Text(
            'Email:',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s14,
          ),
          sizedBoxShow(height: 5),
          Text(
            'test.dev@gmail.com',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s13,
          ),
          sizedBoxShow(height: 8),
          Text(
            'Mobile:',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s14,
          ),
          sizedBoxShow(height: 5),
          Text(
            '23423423423',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s13,
          ),
          sizedBoxShow(height: 8),
          Text(
            'Reporting to:',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s14,
          ),
          sizedBoxShow(height: 5),
          Text(
            'test dev',
            style: FontStyleGoogle.semiBold(AppColors.blackColor).s13,
          ),
          sizedBoxShow(height: 8),
        ],
      ),
    );
  }
}

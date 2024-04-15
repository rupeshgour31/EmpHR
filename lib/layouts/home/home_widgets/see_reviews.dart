import 'package:carousel_slider/carousel_slider.dart';
import 'package:fab_hr/layouts/ar_request/ar_request.dart';
import 'package:fab_hr/layouts/ar_request/ar_request_dashboard.dart';
import 'package:fab_hr/layouts/common_screens/constants_widgets.dart';
import 'package:fab_hr/utils/app_colors.dart';
import 'package:fab_hr/utils/common_fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SeeReviews extends StatelessWidget {
  const SeeReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Request for reviews',
              style: FontStyleGoogle.bold(AppColors.blackColor).s18,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const ArRequestDashboard(
                      currentIndex: 2,
                    ),
                  ),
                );
              },
              child: Text(
                'See All',
                style: FontStyleGoogle.semiBoldUnderline(AppColors.appThemeDark)
                    .s16,
              ),
            ),
          ],
        ),
        sizedBoxShow(height: 10),
        CarouselSlider(
          options: CarouselOptions(
            height: 130.0,
            autoPlay: true,
            initialPage: 0,
            enableInfiniteScroll: true,
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const ArRequest(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(8, 8, 0, 8),
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
                            'https://picsum.photos/66$i?image=${i + 12}'),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Test name $i',
                            style:
                                FontStyleGoogle.bold(AppColors.blackColor).s16,
                          ),
                          Text(
                            i == 2 ? 'Approved' : 'Pending',
                            style: FontStyleGoogle.semiBold(
                              i == 2
                                  ? AppColors.redColor
                                  : AppColors.yellowColor,
                            ).s16,
                          ),
                        ],
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
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:fab_hr/layouts/common_screens/constants_widgets.dart';
import 'package:fab_hr/utils/app_colors.dart';
import 'package:fab_hr/utils/common_fontstyle.dart';
import 'package:fab_hr/utils/gradient_icon.dart';
import 'package:fab_hr/utils/input_text_form.dart';
import 'package:fab_hr/utils/safearea_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class GenerateTicket extends StatefulWidget {
  static const String route = 'GenerateTicket';
  const GenerateTicket({Key? key}) : super(key: key);

  @override
  _GenerateTicketState createState() => _GenerateTicketState();
}

class _GenerateTicketState extends State<GenerateTicket> {
  XFile? attachmentSupport;
  final _imagePicker = ImagePicker();
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
            'Create Ticket',
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
              onTap: () {},
              child: Container(
                height: 55,
                width: getSize(context).width * 0.9,
                margin: const EdgeInsets.only(left: 15, bottom: 15),
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title:',
                style: FontStyleGoogle.semiBold(
                  AppColors.blackColor.withOpacity(0.7),
                ).s18,
              ),
              sizedBoxShow(height: 10),
              CommonTextField(
                hintText: '',
              ),
              sizedBoxShow(height: 10),
              Text(
                'Description:',
                style: FontStyleGoogle.semiBold(
                  AppColors.blackColor.withOpacity(0.7),
                ).s18,
              ),
              sizedBoxShow(height: 10),
              CommonTextField(
                hintText: '',
                maxLines: 6,
                maxLength: 500,
              ),
              sizedBoxShow(height: 10),
              Text(
                'Attach Document:',
                style: FontStyleGoogle.semiBold(
                  AppColors.blackColor.withOpacity(0.7),
                ).s18,
              ),
              sizedBoxShow(height: 10),
              GestureDetector(
                onTap: () {
                  imagePickOption(context, 4);
                },
                child: attachmentSupport != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          File(attachmentSupport!.path),
                          fit: BoxFit.cover,
                        ),
                      )
                    : DottedBorder(
                        borderType: BorderType.RRect,
                        color: AppColors.greyColor,
                        radius: const Radius.circular(8),
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          alignment: Alignment.center,
                          height: getSize(context).height * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: GradientIcon(
                            Icon(
                              Icons.image,
                              size: 45,
                              color: AppColors.whiteColor,
                            ),
                            45.0,
                            const [
                              Color(0xff8fdb38),
                              Color(0xff57e98f),
                            ],
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  imagePickOption(context, int imageNumber) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: Text(
            'Please select attachment',
            style: FontStyleGoogle.semiBold(
              AppColors.blackColor.withOpacity(0.7),
            ).s18,
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text(
                'Gallery',
                style: FontStyleGoogle.semiBold(
                  AppColors.appThemeDark,
                ).s15,
              ),
              onPressed: () {
                Navigator.pop(context);
                _pickPhoto(imageNumber);
              },
            ),
            CupertinoActionSheetAction(
              child: Text(
                'Camera',
                style: FontStyleGoogle.semiBold(
                  AppColors.appThemeDark,
                ).s15,
              ),
              onPressed: () {
                Navigator.pop(context);
                _capturePhoto(imageNumber);
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: FontStyleGoogle.semiBold(
                AppColors.redColor,
              ).s15,
            ),
          ),
        );
      },
    );
  }

  Future _capturePhoto(int imgNumber) async {
    final photo = await _imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (photo != null) {
      setState(() {
        attachmentSupport = photo;
      });
    }
  }

  Future _pickPhoto(int imgNumber) async {
    final photo = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (photo != null) {
      setState(() {
        attachmentSupport = photo;
      });
    }
  }
}

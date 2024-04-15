import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

SizedBox sizedBoxShow({
  double height = 0.0,
  double width = 0.0,
  Widget child = const SizedBox.shrink(),
}) =>
    SizedBox(
      height: height,
      width: width,
      child: child,
    );

Size getSize(context) {
  Size size = MediaQuery.of(context).size;
  return size;
}

printRocket(message) {
  return debugPrint('🚀🚀🚀 $message');
}

printBomb(message) {
  return debugPrint('🧨🧨🧨 $message');
}

printInsect(message) {
  return debugPrint('🐛🐛🐛 $message');
}

Widget alertDialog(title, content) {
  return CupertinoAlertDialog(
    title: Text(
      title,
    ),
    content: Text(
      content,
    ),
    actions: const <Widget>[
      CupertinoDialogAction(
        isDefaultAction: true,
        child: Text("Yes"),
      ),
      CupertinoDialogAction(
        child: Text("No"),
      )
    ],
  );
}

showToast(String s, bool isError) {
  return Fluttertoast.showToast(
    msg: s,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    // backgroundColor: isError ? AppColors.redColor : AppColors.greenColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

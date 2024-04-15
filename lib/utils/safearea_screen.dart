import 'package:flutter/material.dart';

class SafeAreaScreen extends StatelessWidget {
  final Widget childWidget;
  const SafeAreaScreen({Key? key, required this.childWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: childWidget,
    );
  }
}

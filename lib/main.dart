import 'package:fab_hr/my_app.dart';
import 'package:fab_hr/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    Provider<RouteHelper>(
      create: (_) => RouteHelper(),
      child: const MyApp(),
    ),
  );
}

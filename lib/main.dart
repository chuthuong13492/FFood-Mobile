import 'dart:io';

import 'package:ffood/Constant/route_constraint.dart';
import 'package:ffood/View/home.dart';
import 'package:ffood/View/notFoundScreen.dart';
import 'package:ffood/View/onboard.dart';
import 'package:ffood/View/sign_in.dart';
import 'package:ffood/View/start_up.dart';
import 'package:ffood/ViewModel/startup_viewModel.dart';
import 'package:ffood/setup.dart';
import 'package:ffood/theme/color.dart';
import 'package:ffood/utils/pageNavigation.dart';
import 'package:ffood/utils/request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  await setup();
  createRouteBindings();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FFood',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RoutHandler.LOGIN:
            return ScaleRoute(page: SignIn());
          case RoutHandler.ONBOARD:
            return ScaleRoute(page: OnBoardScreen());
          case RoutHandler.HOME:
            return CupertinoPageRoute(
                builder: (context) => HomePage(), settings: settings);
          default:
            return CupertinoPageRoute(
                builder: (context) => NotFoundScreen(), settings: settings);
        }
      },
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: StartUpView(),
    );
  }
}

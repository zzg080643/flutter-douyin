import 'dart:async';

import 'package:douyin/ui/util/widgetutil.dart';
import 'package:flutter/material.dart';

import '../homeview.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage();

  @override
  State<StatefulWidget> createState() {
    return WelcomePageState();
  }
}

class WelcomePageState extends State<WelcomePage> {
  WelcomePageState();

  static const duration = const Duration(seconds: 3);
  Timer timer;

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (timer) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return HomeView();
        }), (route) {
          return route == null;
        });
      });
    }
    return WidgetUtils.getImageFitJpg(
        "dy_splash", double.infinity, double.infinity, BoxFit.cover);
  }
}

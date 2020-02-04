import 'package:douyin/ui/ui/welcomepage.dart';
import 'package:flutter/material.dart';

import 'ui/homeview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
        primaryIconTheme: IconThemeData(color: Colors.white),
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
        textTheme: TextTheme(title: TextStyle(color: Colors.white)),
      ),
      home: new WelcomePage(),
    );
  }
}

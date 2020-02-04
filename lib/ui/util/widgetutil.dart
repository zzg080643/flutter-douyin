import 'package:flutter/material.dart';

class WidgetUtils {
  static Text getText(String text, double fontSize, Color color) {
    return Text(
      text,
      style: new TextStyle(
          fontSize: fontSize, fontFamily: 'FlamanteRoma', color: color),
    );
  }

  static Text getTextBold(String text, double fontSize, Color color) {
    return Text(
      text,
      style: new TextStyle(
          fontSize: fontSize,
          fontFamily: 'FlamanteRoma',
          color: color,
          fontWeight: FontWeight.bold),
    );
  }

  static Image getImage(String imageName, double width, double height) {
    return Image.asset(
      'assets/images/$imageName.png',
      width: width,
      height: height,
    );
  }

  static Image getImageFit(
      String imageName, double width, double height, BoxFit fit) {
    return Image.asset(
      'assets/images/$imageName.png',
      width: width,
      height: height,
      fit: fit,
    );
  }

  static Image getImageFitJpg(
      String imageName, double width, double height, BoxFit fit) {
    return Image.asset(
      'assets/images/$imageName.jpg',
      width: width,
      height: height,
      fit: fit,
    );
  }

  static Widget getLine(double height, Color color) {
    return Container(
      width: double.infinity,
      height: height,
      color: color,
    );
  }

  static Widget getMarginTop(double top, Widget child) {
    return Container(
      margin: EdgeInsets.only(top: top),
      child: child,
    );
  }

  static Widget getMarginLeft(double left, Widget child) {
    return Container(
      margin: EdgeInsets.only(left: left),
      child: child,
    );
  }

  static Border getShape(Color color) {
    return Border.all(
      color: color,
      style: BorderStyle.solid,
    );
  }
}

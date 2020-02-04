import 'dart:math';

import 'package:flutter/material.dart';

class SameCityBody extends StatefulWidget {
  SameCityBody();

  @override
  State createState() {
    return SameCityState();
  }
}

class SameCityState extends State<SameCityBody> {
  List<SameInfo> image = List();

  List infoData = [
    "这个问题热度是我看着一点点涨起来的",
    "问题是如何看待这段话",
    "不是单纯的探讨演员",
    "一直在看到关谷最后那段话之前",
    "其实我内心一直觉得",
    "没有想象过爱情公寓对爱粉来说的重要性吧",
  ];

  @override
  void initState() {
    for (int i = 0; i <= 5; i++) {
      int pkm = Random().nextInt(100);
      image.add(
          new SameInfo('assets/images/dy_pic$i.png', "$pkm km", infoData[i]));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "同城",
          style: new TextStyle(
              fontSize: 16.0, fontFamily: 'FlamanteRoma', color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: new Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child:
              ListView.builder(itemBuilder: (BuildContext context, int index) {
            return getListItem(index);
          }),
        ),
      ),
    );
  }

  Widget getListItem(int index) {
    if (index > 5) {
      return null;
    }
    if (index == 0) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/dy_loc_icon.png',
            width: 15,
            height: 15,
          ),
          Expanded(
            child: Text(
              "自动定位：舟山",
              style: new TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'FlamanteRoma',
                  color: Colors.white54),
            ),
          ),
          Text(
            "切换",
            style: new TextStyle(
                fontSize: 12.0,
                fontFamily: 'FlamanteRoma',
                color: Colors.white54),
          ),
          Image.asset(
            'assets/images/dy_icon_left.png',
            width: 15,
            height: 15,
          )
        ],
      );
    } else if (index == 1) {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Image.asset(
          'assets/images/dy_same_top.png',
          fit: BoxFit.fitWidth,
          height: 70,
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            getImageWidget(index - 2),
            getImageWidget(index - 1),
          ],
        ),
      );
    }
  }

  Widget getImageWidget(int index) {
    return Expanded(
      child: new Padding(
        padding: EdgeInsets.only(right: 5),
        child: SizedBox(
          child: Column(
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: 245, maxHeight: 260, minWidth: 400),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      image.elementAt(index).imagePath,
                      fit: BoxFit.fill,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 10, bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/dy_loc_icon_1.png',
                              width: 10,
                              height: 10,
                            ),
                            Expanded(
                              child: Text(
                                image.elementAt(index)._distance,
                                style: new TextStyle(
                                    fontSize: 10.0,
                                    fontFamily: 'FlamanteRoma',
                                    color: Colors.white),
                              ),
                            ),
                            Image.asset(
                              'assets/images/dy_boy.png',
                              width: 15,
                              height: 15,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Text(
                image.elementAt(index).msg,
                style: new TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'FlamanteRoma',
                    color: Colors.white),
              )
            ],
          ),
          height: 300,
        ),
      ),
      flex: 1,
    );
  }
}

class SameInfo {
  String _imagePath;

  String _distance;

  String _msg;

  SameInfo(this._imagePath, this._distance, this._msg);

  String get msg => _msg;

  String get distance => _distance;

  String get imagePath => _imagePath;
}

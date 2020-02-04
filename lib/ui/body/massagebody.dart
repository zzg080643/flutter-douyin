import 'package:douyin/ui/util/widgetutil.dart';
import 'package:flutter/material.dart';

class MessageBody extends StatefulWidget {
  MessageBody();

  @override
  State createState() {
    return MessageState();
  }
}

class MessageState extends State<MessageBody> {
  static List data = [
    {'text': '粉丝', 'icon': WidgetUtils.getImage('dy_fans', 37, 37)},
    {'text': '赞', 'icon': WidgetUtils.getImage('dy_dianzan', 37, 37)},
    {'text': '@我的', 'icon': WidgetUtils.getImage('dy_atme', 37, 37)},
    {'text': '评论', 'icon': WidgetUtils.getImage('dy_comment', 37, 37)}
  ];

  static List listdata = [
    {
      'text1': '抖音小助手',
      'text2': '# 假期的四种状态',
      'time': '昨天',
      'icon': WidgetUtils.getImage('dy_music_ic', 38, 38)
    },
    {
      'text1': '春节活动助手',
      'text2': '发财中国年集卡活动',
      'time': '今天',
      'icon': WidgetUtils.getImage('dy_zg', 38, 38)
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: WidgetUtils.getText("消息", 16.0, Colors.white),
          actions: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                child: WidgetUtils.getText("发起聊天", 14.0, Colors.white),
                margin: EdgeInsets.only(right: 20),
              ),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10, top: 15, right: 10),
          color: Colors.black,
          child: Column(
            children: <Widget>[
              getTopWidget(),
              WidgetUtils.getMarginTop(
                  20, WidgetUtils.getLine(1.0, Colors.white10)),
              WidgetUtils.getMarginTop(
                  20,
                  WidgetUtils.getImageFit(
                      'dy_same_top', double.infinity, 60, BoxFit.fitWidth)),
              WidgetUtils.getMarginTop(
                  20, WidgetUtils.getLine(1.0, Colors.white10)),
              WidgetUtils.getMarginTop(20, getBottomWidget()),
              WidgetUtils.getMarginTop(
                  30,
                  Align(
                    alignment: Alignment.topCenter,
                    child: WidgetUtils.getText("无更多消息", 12, Colors.grey),
                  )),
            ],
          ),
        ));
  }

  Widget getTopWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        getMessageIcon(0),
        getMessageIcon(1),
        getMessageIcon(2),
        getMessageIcon(3),
      ],
    );
  }

  Widget getMessageIcon(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        data[index]["icon"],
        Container(
          margin: EdgeInsets.only(top: 8),
          child: WidgetUtils.getText(data[index]["text"], 12, Colors.white),
        ),
      ],
    );
  }

  Widget getBottomWidget() {
    return Column(
      children: <Widget>[
        getListItem(0),
        WidgetUtils.getMarginTop(15, getListItem(1))
      ],
    );
  }

  Widget getListItem(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        listdata[index]["icon"],
        Expanded(
          child: WidgetUtils.getMarginLeft(
            15,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                WidgetUtils.getText(listdata[index]["text1"], 12, Colors.white),
                WidgetUtils.getMarginTop(
                    10,
                    WidgetUtils.getText(
                        listdata[index]["text2"], 10, Colors.white60)),
              ],
            ),
          ),
        ),
        WidgetUtils.getText(listdata[index]["time"], 12, Colors.white70),
      ],
    );
  }
}

import 'package:douyin/ui/util/widgetutil.dart';
import 'package:flutter/material.dart';

class PersonCenterBody extends StatefulWidget {
  PersonCenterBody();

  @override
  State createState() {
    return PersonCenterState();
  }
}

class PersonCenterState extends State<PersonCenterBody>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: 3, initialIndex: 0); // 和
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black,
        child: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: true,
                floating: true,
                forceElevated: boxIsScrolled,
                expandedHeight: 100.0,
                flexibleSpace: Container(
                  child: Image.asset(
                    'assets/images/dy_person_bg.png',
                    fit: BoxFit.cover,
                  ),
                ),
                actions: <Widget>[WidgetUtils.getImage("dy_msg", 20, 20)],
              )
            ];
          },
          body: Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: getPersonWidget()),
        ));
  }

  Widget getPersonWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        getFirstPanel(),
        getSecondPanel(),
        getThirdPanel(),
        getForthPanel(),
        getFifthPanel(),
        getSixthPanel()
      ],
    );
  }

  Widget getSixthPanel() {
    return WidgetUtils.getMarginTop(
      15,
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              height: 50,
              alignment: Alignment.center,
              color: Colors.black,
              child: TabBar(
                isScrollable: true,
                labelPadding: EdgeInsets.only(left: 30, right: 30),
                controller: _tabController,
                unselectedLabelColor: Colors.white60,
                unselectedLabelStyle: new TextStyle(
                  color: Colors.white60,
                ),
                indicatorColor: Colors.yellow,
                tabs: <Widget>[
                  Tab(child: WidgetUtils.getText("作品 0", 14.0, Colors.white)),
                  Tab(child: WidgetUtils.getText("动态 0", 14.0, Colors.white)),
                  Tab(child: WidgetUtils.getText("喜欢 0", 14.0, Colors.white))
                ],
              )),
          Container(
            width: double.infinity,
          )
        ],
      ),
    );
  }

  Widget getFifthPanel() {
    return WidgetUtils.getMarginTop(
        15,
        WidgetUtils.getImageFit(
            "dy_same_top", double.infinity, 30, BoxFit.cover));
  }

  Widget getForthPanel() {
    return WidgetUtils.getMarginTop(
        20, WidgetUtils.getText("3000w获赞    1关注   1000粉丝", 12, Colors.white70));
  }

  Widget getThirdPanel() {
    return WidgetUtils.getMarginTop(
        15,
        Row(
          children: <Widget>[
            Container(
              color: Colors.white12,
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                child: WidgetUtils.getText("上海", 10, Colors.white54),
              ),
            ),
            WidgetUtils.getMarginLeft(
              15,
              Container(
                color: Colors.white12,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                  child: WidgetUtils.getText("普陀第一大帅哥", 10, Colors.white54),
                ),
              ),
            ),
          ],
        ));
  }

  Widget getSecondPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        WidgetUtils.getMarginTop(
            10, WidgetUtils.getTextBold("执卿", 16.0, Colors.white)),
        WidgetUtils.getMarginTop(
            5, WidgetUtils.getText("抖音号:XXXXXXXXXX", 10.0, Colors.white)),
        WidgetUtils.getMarginTop(15,
            WidgetUtils.getText("你还没有填写个人简介，点击添加......", 14.0, Colors.white)),
      ],
    );
  }

  Widget getFirstPanel() {
    return Padding(
        padding: EdgeInsets.only(top: 10, left: 5, bottom: 10),
        child: Row(
          children: <Widget>[
            WidgetUtils.getImage("dy_boy", 60, 60),
            Expanded(
                child: WidgetUtils.getMarginLeft(
                    15,
                    Container(
                        child: RaisedButton(
                      onPressed: () {},
                      disabledColor: Colors.grey,
                      color: Colors.white12,
                      colorBrightness: Brightness.dark,
                      child: WidgetUtils.getText("编辑资料", 14.0, Colors.white),
                      padding: EdgeInsets.only(
                          left: 30, right: 30, top: 10, bottom: 10),
                    )))),
            WidgetUtils.getMarginLeft(
                15,
                MaterialButton(
                  child: WidgetUtils.getText("+ 好友", 14.0, Colors.white),
                  onPressed: () {},
                  disabledColor: Colors.grey,
                  color: Colors.white12,
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                )),
          ],
        ));
  }
}

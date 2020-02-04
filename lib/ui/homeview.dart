import 'package:douyin/ui/body/personcenterbody.dart';
import 'package:douyin/ui/body/samecitybody.dart';
import 'package:flutter/material.dart';

import 'package:douyin/ui/body/addbody.dart';
import 'package:douyin/ui/body/homebody.dart';
import 'package:douyin/ui/body/massagebody.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<HomeView> with SingleTickerProviderStateMixin {
  TabController controller;

  List<Widget> tabs = [
    new Tab(
      text: '首页',
    ),
    new Tab(
      text: '同城',
    ),
    new Tab(
      icon: new SizedBox(
        height: 30,
        child: Image.asset('assets/images/dy_house.png'),
      ),
    ),
    new Tab(
      text: '消息',
    ),
    new Tab(
      text: '我',
    )
  ];

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 5, vsync: this, initialIndex: 0);
    controller.addListener(() {
      if (controller.indexIsChanging) {
        _onTabChange();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onTabChange() {
    if (this.mounted) {
      this.setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: true,
      body: new TabBarView(controller: controller, children: [
        HomeBody(),
        SameCityBody(),
        AddBody(),
        MessageBody(),
        PersonCenterBody(),
      ]),
      bottomNavigationBar: Container(
          height: 50,
          alignment: Alignment.center,
          color: Colors.black,
          child: TabBar(
              controller: controller,
              indicatorColor: Colors.transparent,
              unselectedLabelColor: Colors.white60,
              labelColor: Colors.white,
              tabs: tabs)),
    );
  }
}

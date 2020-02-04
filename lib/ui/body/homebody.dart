import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class HomeBody extends StatefulWidget {
  HomeBody();

  @override
  State createState() {
    return HomeBodyState();
  }
}

class HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  IjkMediaController controller = IjkMediaController();

  ScrollController _scrollViewController;
  TabController _tabController;

  HomeBodyState();

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _tabController =
        TabController(vsync: this, length: 2, initialIndex: 1); // 和
    controller.setNetworkDataSource(
        "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4");
  }

  @override
  void dispose() {
    controller.dispose();
    _scrollViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: IjkPlayer(mediaController: controller),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: new AppBar(
              backgroundColor: Colors.black,
              leading: new IconButton(
                icon: new Opacity(
                  opacity: 0.6,
                  child: new SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset('assets/images/dy_live.png'),
                  ),
                ),
                onPressed: null,
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: new IconButton(
                    icon: new Opacity(
                      opacity: 0.6,
                      child: new SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('assets/images/dy_search.png'),
                      ),
                    ),
                    onPressed: null,
                  ),
                )
              ],
              centerTitle: true,
              title: TabBar(
                isScrollable: true,
                controller: _tabController,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: <Widget>[
                  Tab(
                      child: new Text("关注",
                          style: new TextStyle(
                              fontFamily: 'FlamanteRoma',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold))),
                  Tab(
                      child: new Text("推荐",
                          style: new TextStyle(
                              fontFamily: 'FlamanteRoma',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold))),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                margin: EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 80,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("@Hello Flutter",
                          style: new TextStyle(
                            color: Colors.white,
                            fontFamily: 'FlamanteRoma',
                            fontSize: 14.0,
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("#我们的未来式星辰大海#首页先这么吧",
                            style: new TextStyle(
                              color: Colors.white,
                              fontFamily: 'FlamanteRoma',
                              fontSize: 12.0,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                              width: 10,
                              child: Image.asset(
                                  'assets/images/dy_music_signal.png'),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text("执卿创作的原声--大好河山",
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'FlamanteRoma',
                                    fontSize: 10.0,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: new SizedBox(
                height: 350,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset('assets/images/dy_boy.png'),
                    )),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/images/dy_heart.png'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text("17.9w",
                          style: new TextStyle(
                            color: Colors.white,
                            fontFamily: 'FlamanteRoma',
                            fontSize: 10.0,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/images/dy_msg.png'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text("4808",
                          style: new TextStyle(
                            color: Colors.white,
                            fontFamily: 'FlamanteRoma',
                            fontSize: 10.0,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/images/dy_zhuan.png'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text("2479",
                          style: new TextStyle(
                            color: Colors.white,
                            fontFamily: 'FlamanteRoma',
                            fontSize: 10.0,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

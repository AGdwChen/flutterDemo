import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:math' as math;

import 'package:glread/GLRead/home/index.dart';
import 'package:glread/GLRead/audio/audio.dart';
import 'package:glread/GLRead/book/books.dart';
import 'package:glread/GLRead/me/me.dart';
import 'package:glread/GLRead/periodical/periodical.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'GLRead',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primaryColor: Colors.white,
      ),
      home: new AppRoot(),
    );
  }
}

class AppRoot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new AppRootState();
}

class AppRootState extends State<AppRoot> {
  static const String routeName = '/GLRead/navigation';
// 页面底部当前tab索引值
  int _tabIndex = 0;

  void _indexChange(newIndex)
  {
    setState(() {
      _tabIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    CupertinoTabBar tabBar = new CupertinoTabBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("Images/index/index.png"), size: 24.0),
          title: Text('首页'),
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('Images/index/magazine.png'),
              size: 24.0),
          title: Text('杂志'),
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('Images/index/smallClass.png'),
              size: 24.0),
          title: Text('小课'),
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('Images/index/books.png'), size: 24.0),
          title: Text('好书'),
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('Images/index/mine.png'), size: 24.0),
          title: Text('我的'),
        ),
      ],
      currentIndex: _tabIndex,
      onTap: (index) {
        // 底部TabItem的点击事件处理，点击时改变当前选择的Tab的索引值，则页面会自动刷新
        setState((){
          _tabIndex = index;
        });
      },
    );
    return new Container(
      // Prevent swipe popping of this page. Use explicit exit buttons only.
      child: new CupertinoTabScaffold(
        tabBar: tabBar,
        tabBuilder: (BuildContext context, int index) {
          return new DefaultTextStyle(
            style: const TextStyle(
              fontFamily: '.SF UI Text',
              fontSize: 17.0,
              color: CupertinoColors.black,
            ),
            child: new CupertinoTabView(
              builder: (BuildContext context) {
                switch (index) {
                  case 0:
                    return new IndexPage(onChanged: (index){
                      _indexChange(index);
                    });
                    break;
                  case 1:
                    return new PeriodicalListPage();
                    break;
                  case 2:
                    return new AudioListPage();
                    break;
                  case 3:
                    return new BookListPage();
                    break;
                  case 4:
                    return new MePage();
                    break;
                  default:
                }
              },
            ),
          );
        },
      ),
    );
  }
}

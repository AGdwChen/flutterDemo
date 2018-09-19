import 'dart:async';
import 'dart:math' as math;

import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glread/GLRead/me/cupertino_dialog_demo.dart';
import 'package:glread/Utility/Dialog/BDDialog.dart';

class MeHeader extends StatelessWidget {
  MeHeader({
    Key key,
    @required this.imgUri,
    @required this.userName,
    @required this.vipEndTime,
  })  : assert(imgUri != null),
        assert(userName != null),
        super(key: key);

  final String imgUri;
  final String userName;
  final String vipEndTime;

  Widget _userInfo() {
    if (vipEndTime == null) {
      return new Text(userName,
          textAlign: TextAlign.start,
          style: new TextStyle(fontSize: 17.0, color: Colors.white));
    } else {
      return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(userName,
              textAlign: TextAlign.start,
              style: new TextStyle(fontSize: 17.0, color: Colors.white)),
          new Text("Vip会员：" + vipEndTime + "到期",
              textAlign: TextAlign.start,
              style: new TextStyle(fontSize: 14.0, color: Colors.white))
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Container(
        child: new Row(
          children: <Widget>[
//            new ClipOval(),
//            new CircleAvatar(),
            new Container(
              margin: const EdgeInsets.only(
                  left: 20.0, top: 20.0, bottom: 20.0, right: 10.0),
              decoration: new BoxDecoration(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(40.0)),
                color: Colors.grey,
                image: new DecorationImage(
                    image: new NetworkImage(imgUri), fit: BoxFit.cover),
              ),
              width: 80.0,
              height: 80.0,
            ),
            new Expanded(
              child: _userInfo(),
            ),
          ],
        ),
      ),
      margin: const EdgeInsets.only(
          left: 20.0, top: 10.0, bottom: 0.0, right: 20.0),
      height: 120.0,
      decoration: new BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xffFB4B00),
            Color(0xffFA7D00),
            Color(0xffF7A200)
          ]),
          borderRadius: const BorderRadius.all(const Radius.circular(6.0))),
    );
  }
}

class MePage extends StatefulWidget {
  static const String routeName = '/cupertino/mypage';

  @override
  MePageState createState() => new MePageState();
}

class MePageState extends State<MePage> {
  Widget _buildListItem(String title, {Function onTapEvent}) {
    return new GestureDetector(
      onTap: () {
        print('ontap');
        if (onTapEvent != null) onTapEvent();
      },
      child: new Container(
        height: 54.0,
        color: Color(0x00000000),
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: new SafeArea(
            top: false,
            bottom: false,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(title),
                new Image.network(
                    'https://gjrwls.oss-cn-beijing.aliyuncs.com/uploadFile/Image/mine/go_icon.png',
                    width: 14.0,
                    height: 17.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _checkForUpdates() async {
    BDDialog dialog =
        new BDDialog(title: "dddd", subTitle: null, actionTitle: ["确定", "取消"]);
    String result = await dialog.DialogShow(context);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    final BuildContext mContext = context;
    return new CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('首页'),
      ),
      child: new DecoratedBox(
        decoration: const BoxDecoration(color: Color(0xFFEFEFF4)),
        child: new ListView(
//          padding: new EdgeInsets.symmetric(vertical: 2.0, horizontal: 0.0),
          children: <Widget>[
            new MeHeader(
                imgUri:
                    'https://gss2.bdstatic.com/-fo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike272%2C5%2C5%2C272%2C90/sign=6ec984b3b0315c60579863bdecd8a076/4034970a304e251f1bfdcc5eab86c9177f3e5309.jpg',
                userName: '小月',
                vipEndTime: "2018-11-12"),
            const Padding(padding: EdgeInsets.only(top: 32.0)),
            _buildListItem("我的余额", onTapEvent: () {
              print('onTapEvent');
//              Navigator.of(context, rootNavigator: true).push(new CupertinoPageRoute<void>(
//                builder: (BuildContext context) => new CupertinoDialogDemo(),
//              ));
              _checkForUpdates();
            }),
            new Divider(height: 1.0, indent: 20.0),
            _buildListItem("分享返现"),
            new Divider(height: 1.0, indent: 20.0),
          ],
        ),
      ),
    );
  }
}

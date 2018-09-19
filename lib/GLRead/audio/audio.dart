import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glread/GLRead/audio/audio_model.dart';
import 'package:glread/GLRead/net/glreadNetReq.dart';

class AudioListItemView extends StatelessWidget {
  AudioListItemView({
    Key key,
    @required this.source,
    @required this.ossPath,
  })  : assert(source != null),
        assert(ossPath != null),
        super(key: key);

  final AudioModel source;
  final String ossPath;
  @override
  Widget build(BuildContext context) {
    final Widget item = new GestureDetector(
      onTap: () {
        print("ontap");
//        Navigator.of(context, rootNavigator: true).push(new CupertinoPageRoute<void>(
//          builder: (BuildContext context) => new PerIndexPage(
//            bid:source.id,
//          ),
//        ));
      },
      child: new Container(
        margin: const EdgeInsets.only(
            left: 20.0, top: 12.0, bottom: 12.0, right: 20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new AspectRatio(
              aspectRatio: 2.3,
              child: new Material(
                borderRadius: BorderRadius.circular(4.0),
                child: new Image.network(ossPath + this.source.thumb,
                    fit: BoxFit.cover),
              )
            ),
            new Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(this.source.title,
                      style: TextStyle(fontSize: 15.0, height: 1.2),
                      maxLines: 2,
                      textAlign: TextAlign.left),
                  new Text(this.source.intro,
                      style: TextStyle(fontSize: 13.0, height: 1.2, color:Color(0xffa4a4a4)),
                      maxLines: 1,
                      textAlign: TextAlign.left),
                  new Text("¥" + this.source.price.toString(),
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.red, fontSize: 13.0, height: 1.2),
                      textAlign: TextAlign.left),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    return item;
  }
}

class AudioListPage extends StatefulWidget {
  static const String routeName = '/glread/audiolist';

  @override
  AudioListPageState createState() => new AudioListPageState();
}

class AudioListPageState extends State<AudioListPage> {
  int page = 1;
  List<AudioModel> dataSouce;
  String ossPath;

  _datasReqByPage(int page) async {
    var netReq = new glNetRequest();
    return await netReq.findCourseByPageFromNet(page);
  }

  creatListView(BuildContext context) {
    return new ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: dataSouce == null ? 0 : dataSouce.length,
        itemBuilder: (context, i) {
          return new AudioListItemView(source: dataSouce[i], ossPath: ossPath);
        });
  }

//****  针对分页的页面，使用FutureBuilder 请求数据不是最好选择，最好使用状态机，控制页面显示
  @override
  Widget build(BuildContext context) {
    if (dataSouce == null || dataSouce.length == 0) {
      print('builder');
      return new CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('小课'),
        ),
        child: new DecoratedBox(
          decoration: const BoxDecoration(color: Color(0xFFEFEFF4)),
          child: new FutureBuilder(
              future: _datasReqByPage(page),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return new Center(
                      child: new Card(
                        child: new Text('loading...'),
                      ),
                    );
                  default:
                    if (snapshot.hasError)
                      return new Text('Error:${snapshot.error}');
                    else {
                      ReqAudioListModel model =
                          ReqAudioListModel.fromJson(jsonDecode(snapshot.data));
                      dataSouce = model.data.resultData;
                      ossPath = model.data.osspath;
                      if (model.errCode != '0') {
                        return new Center(
                          child: new Card(
                            child: new Text(model.errMsg),
                          ),
                        );
                      } else {
                        return creatListView(context);
                      }
                    }
                }
              }),
        ),
      );
    } else {
      return new CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('小课'),
        ),
        child: new DecoratedBox(
            decoration: const BoxDecoration(color: Color(0xFFEFEFF4)),
            child: creatListView(context)),
      );
    }
  }
}

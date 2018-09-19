import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glread/GLRead/home/index_section.dart';
import 'package:glread/GLRead/net/glreadNetReq.dart';
import 'package:glread/GLRead/home/index_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:glread/GLRead/home/index_per.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({this.onChanged});
  final ValueChanged<int> onChanged;
  @override
  IndexPageState createState() => new IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  indexModel model;

  void _sectionIndex(int index) {
    print("more click" + index.toString());
    widget.onChanged(index);
  }

  void _netReq() {
    var netReq = new glNetRequest();
    netReq.indexFind((data) {
      indexModel backData = indexModel.fromJson(data);

      setState(() {
        model = backData;
      });
    }, errorCallback: (e) {
      print(e);
    });
  }

  // 顶部banner
  Widget _buildSwiper() {
    return new SizedBox(
      height: 120.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          Ads ads = model.data.ads[index];
          String imageUrl = model.data.osspath + ads.img;
          return new ClipRRect(
              borderRadius: new BorderRadius.all(new Radius.circular(6.0)),
              child: new Image.network(
                imageUrl,
                fit: BoxFit.fill,
              ));
        },
        itemCount: model.data.ads.length,
        viewportFraction: 0.8,
        scale: 0.9,
        loop: true,
        autoplay: true,
        autoplayDelay: 5000,
        index: 0,
        onTap: (int index) {
          print(index.toString());
        },
      ),
    );
  }

  // 期刊列表
  Widget _buildPerList() {
    return new indexPerList(
        dataList: model.data.periodicals.ndata, ossPath: model.data.osspath);
  }

  // 小课
  Widget _buildCourseRow(int index) {
    CourseNdata data = model.data.course.ndata[index];
    String imagePath = model.data.osspath + data.thumb;

    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        print("onTap" + index.toString());
      },
      child: new SafeArea(
        child: new Padding(
          padding: const EdgeInsets.only(
              left: 16.0, top: 8.0, bottom: 8.0, right: 8.0),
          child: new Row(
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(
                    left: 0.0, top: 8.0, bottom: 8.0, right: 8.0),
                decoration: new BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(3.0)),
                  color: Colors.grey,
                  image: new DecorationImage(
                      image: new NetworkImage(imagePath), fit: BoxFit.cover),
                ),
                width: 120.0,
                height: 90.0,
              ),
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      data.title,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: new TextStyle(fontSize: 15.0),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 8.0)),
                    new Text(
                      data.intro,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(color: Colors.grey, fontSize: 12.0),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 8.0)),
                    new Text(
                      "¥" + data.price.toString(),
                      style: new TextStyle(color: Colors.red, fontSize: 12.0),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (model == null) {
      _netReq();
      return new CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('首页'),
        ),
        child: new SafeArea(
            top: false,
            bottom: false,
            child: new Center(child: new Text("加载中"))),
      );
    } else {
      final List<Widget> items = new List<Widget>();
      items.add(new Padding(padding: EdgeInsets.only(top: 12.0)));
      items.add(_buildSwiper());
      items.add(new indexSection(
          title: "杂志",
          subTitle: "真相 趣味 良知",
          onPressed: () {
            _sectionIndex(1);
          }));
      items.add(_buildPerList());
      items.add(new indexSection(
          title: "小课",
          subTitle: "口袋名家 知史论道",
          onPressed: () {
            _sectionIndex(2);
          }));
      for (int i = 0; i < model.data.course.ndata.length; i++) {
        items.add(_buildCourseRow(i));
      }
      items.add(new indexSection(
          title: "好书",
          subTitle: "每周推荐 历史好书",
          onPressed: () {
            _sectionIndex(3);
          }));
      return new CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('首页'),
        ),
        child: new SafeArea(
          top: false,
          bottom: false,
          child: new ListView(
            children: items,
          ),
        ),
      );
    }
  }
}

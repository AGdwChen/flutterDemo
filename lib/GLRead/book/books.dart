import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glread/GLRead/book/book_model.dart';
import 'package:glread/GLRead/net/glreadNetReq.dart';

class BookListItemView extends StatelessWidget {
  BookListItemView({
    Key key,
    @required this.source,
    @required this.ossPath,
  })  : assert(source != null),
        assert(ossPath != null),
        super(key: key);

  final BookModel source;
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
            left: 20.0, top: 10.0, bottom: 0.0, right: 20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
              decoration: new BoxDecoration(
                borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
                color: Color(0xffe4e4e4),
              ),
              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(
                            left: 15.0, top: 15.0, bottom: 10.0, right: 10.0),
                        decoration: new BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(3.0)),
                          color: Colors.grey,
                          image: new DecorationImage(
                              image:
                                  new NetworkImage(ossPath + this.source.thumb),
                              fit: BoxFit.cover),
                        ),
                        width: 90.0,
                        height: 120.0,
                      ),
                      new Expanded(
                        child: new Text(this.source.intro,
                            style: TextStyle(
                                fontSize: 17.0,
                                height: 1.2,
                                color: Colors.black),
                            maxLines: 3,
                            textAlign: TextAlign.left),
                      ),
                    ],
                  ),
                  new Container(
                    decoration: new BoxDecoration(
                      borderRadius: const BorderRadius.vertical(bottom: const Radius.circular(4.0),),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(top: 8.0, left: 15.0, bottom: 8.0, right: 15.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Container(
                          width:200.0,
                          child: new Text(this.source.name,
                              style: TextStyle(fontSize: 13.0, height: 1.2),
                              maxLines: 2,
                              softWrap: false,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.left),
                        ),

                        new Text(this.source.press + "出版",
                            maxLines: 1,
                            softWrap: true,
                            style: TextStyle(
                                color: Colors.red, fontSize: 13.0, height: 1.2),
                            textAlign: TextAlign.left),
                      ],
                    ) ,
                  )
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

class BookListPage extends StatefulWidget {
  static const String routeName = '/glread/booklist';

  @override
  BookListPageState createState() => new BookListPageState();
}

class BookListPageState extends State<BookListPage> {
  int page = 1;
  String ossPath;
  List<BookModel> dataSouce;
  bool lastPage = false;
  bool playNetReq = false;

  _datasReqByPage(int pageNum) async {
    var netReq = new glNetRequest();
    playNetReq = true;
    netReq.findBookFromNet(pageNum, (data) {
      ReqBookListModel backData = ReqBookListModel.fromJson(data);
      List<BookModel> listData = backData.data.books;
      if (!mounted) return;
      ossPath = backData.data.osspath;
      if (listData.length > 0) {
        if (pageNum == 1) {
          setState(() {
            dataSouce = listData;
          });
        } else {
          if (listData.length > 0) {
            List<BookModel> oldSource = dataSouce;
            for (BookModel model in listData) {
              oldSource.add(model);
            }
            setState(() {
              dataSouce = oldSource;
            });
          }
        }
      } else {
        lastPage = true;
      }
      playNetReq = false;
    }, errorCallback: (e) {
      print(e);
      playNetReq = false;
    });
  }

  creatListView(BuildContext context) {
    if (dataSouce == null || dataSouce.length == 0) {
      return new Center(
          child: new Text("loading",
              style: TextStyle(fontSize: 15.0, height: 1.2),
              maxLines: 2,
              textAlign: TextAlign.left));
    } else {
      return new ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: dataSouce == null ? 0 : dataSouce.length,
          itemBuilder: (context, i) {
            if (i == dataSouce.length-1 && !lastPage && !playNetReq) {
              page += 1;
              _datasReqByPage(page);
            }
            return new BookListItemView(source: dataSouce[i], ossPath: ossPath);
          });
    }
  }

  @override
  void initState() {
    super.initState();
    _datasReqByPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('好书'),
      ),
      child: new DecoratedBox(
        decoration: const BoxDecoration(color: Color(0xFFEFEFF4)),
        child: creatListView(context),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:glread/GLRead/periodical/per_model.dart';
import 'package:glread/GLRead/net/glreadNetReq.dart';
import "package:glread/GLRead/periodical/per_index.dart";

class PerItemView extends StatelessWidget {
  PerItemView({
    Key key,
    @required this.source,
    @required this.ossPath,
  })  : assert(source != null),
        assert(ossPath != null),
        super(key: key);

  final PerModel source;
  final String ossPath;
  @override
  Widget build(BuildContext context) {
    final Widget item = new GestureDetector(
      onTap: () {
        print("ontap");
        Navigator.of(context, rootNavigator: true).push(new CupertinoPageRoute<void>(
          builder: (BuildContext context) => new PerIndexPage(
            bid:source.id,
          ),
        ));
      },
      child: new Container(
        margin: const EdgeInsets.only(
            left: 4.0, top: 12.0, bottom: 12.0, right: 4.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new AspectRatio(
              aspectRatio: 1.0,
              child: new Image.network(ossPath + this.source.thumb,
                  fit: BoxFit.cover),
            ),
            new Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0),
              child: new Text(this.source.title,
                  style: TextStyle(fontSize: 15.0, height: 1.2),
                  maxLines: 2,
                  textAlign: TextAlign.left),
              height: 50.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text("原价¥" + this.source.oldPrice.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.0,
                        decoration: TextDecoration.lineThrough)),
                new Text(
                  "¥" + this.source.price.toString(),
                  style: TextStyle(color: Colors.red, fontSize: 13.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    return item;
  }
}

class PerPage extends StatefulWidget {
  const PerPage({Key key, this.year, this.ossPath})
      : assert(year != null),
        assert(ossPath != null),
        super(key: key);

  final String year;
  final String ossPath;

  @override
  PerPageState createState() => new PerPageState();
}

class PerPageState extends State<PerPage> {
  List<PerModel> dataSouce;

  void _datasReqByYear(String year) {
    var netReq = new glNetRequest();
    netReq.selectByYearFromNet(year, (data) {
      perListModel backData = perListModel.fromJson(data);
      List<PerModel> listData = backData.data;
      if (!mounted) return;
      setState(() {
        dataSouce=listData;
      });
    }, errorCallback: (e) {
      print(e);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
//    _datasReqByYear(widget.year);
  }

  @override
  void dispose() {
    print("dispose"+widget.year);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (dataSouce == null) {
      _datasReqByYear(widget.year);
      return new Container(child: new Center(child: const Text('loading')));
    }
    else {
    return new Container(
      child: new SafeArea(
        top: false,
        bottom: true,
        child: new GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          padding: const EdgeInsets.all(4.0),
          childAspectRatio: 0.65,
          children: dataSouce.map((PerModel source) {
            return new PerItemView(
              source: source,
              ossPath: widget.ossPath,
            );
          }).toList(),
        ),
      ),
    );
    }
  }
}

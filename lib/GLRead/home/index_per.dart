import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glread/GLRead/home/index_model.dart';
import 'package:glread/GLRead/periodical/per_index.dart';
class indexPerList extends StatefulWidget {
  const indexPerList({this.dataList, this.ossPath});

  final List<PerNdata> dataList;
  final String ossPath;
  @override
  State<StatefulWidget> createState() => new indexPerListState();
}

class indexPerListState extends State<indexPerList> {

  // 期刊元素
  Widget _buildPerItem(int index) {
    PerNdata data = widget.dataList[index];
    String imagePath = widget.ossPath + data.thumb;
    return new GestureDetector(
      onTap: (){
        print("ontap");
        Navigator.of(context, rootNavigator: true).push(new CupertinoPageRoute<void>(
          builder: (BuildContext context) => new PerIndexPage(
            bid:data.id,
          ),
        ));
      },
      child: new Container(
        width: 136.0,
        margin:
        const EdgeInsets.only(left: 4.0, top: 12.0, bottom: 12.0, right: 4.0),
        decoration: new BoxDecoration(
          border: new Border.all(width: 10.0, color: Colors.white),
          borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
          color: Colors.white,
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Image.network(imagePath,
                width: 116.0, height: 116.0, fit: BoxFit.fill),
            new Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0)),
            new Text(data.title,
                style: TextStyle(fontSize: 15.0),
                maxLines: 1,
                textAlign: TextAlign.left),
            new Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text("原价¥" + data.oldPrice.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.0,
                        decoration: TextDecoration.lineThrough)),
                new Text(
                  "¥" + data.price.toString(),
                  style: TextStyle(color: Colors.red, fontSize: 13.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 215.0,
      color: Color(0xfffafafa),
      margin:
      const EdgeInsets.only(left: 0.0, top: 0.0, bottom: 0.0, right: 0.0),
      child: new ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            if (i < widget.dataList.length) {
              return _buildPerItem(i);
            }
          }),
    );
  }
}
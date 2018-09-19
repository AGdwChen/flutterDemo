import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class indexSection extends StatelessWidget {
  const indexSection({this.title, this.subTitle, @required this.onPressed});
  final String title;
  final String subTitle;

  /// The callback that is called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Padding(
      padding:
          const EdgeInsets.only(left: 14.0, top: 20.0, bottom: 12.0, right: 8.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(title,
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    )),
                const Padding(padding: EdgeInsets.only(top: 8.0)),
                new Text(subTitle,
                    style: TextStyle(
                      color: Color(0xFF8E8E93),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                    )),
              ],
            ),
          )),
          new CupertinoButton(
            padding: EdgeInsets.only(top: 23.0),
            child: const Text('更多',
                style: TextStyle(
                    color: Color(0xFFff0000),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300)),
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}

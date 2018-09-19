import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PerIndexPage extends StatefulWidget {
  const PerIndexPage({this.bid});

  final int bid;

  @override
  State<StatefulWidget> createState() => new PerIndexPageState();
}

class PerIndexPageState extends State<PerIndexPage> {
  @override
  void initState() {
    super.initState();
  }

  List<Color> relatedColors;

  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
        middle: new Text(widget.bid.toString()),
      ),
      child: new SafeArea(
        top: false,
        bottom: false,
        child: new ListView(

        ),
      ),
    );
  }
}
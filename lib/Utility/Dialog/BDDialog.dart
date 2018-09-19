import 'dart:async';
import 'dart:math' as math;

import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class BDDialog extends StatelessWidget {
  BDDialog({
    Key key,
    @required this.title,
    @required this.subTitle,
    @required this.actionTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final List<String> actionTitle;

  // ios 样式
  List<Widget> _iosActions(BuildContext context) {
    List<String> actions =
        (actionTitle == null || actionTitle.length == 0) ? ["确定"] : actionTitle;
    return actions.map((String value) {
      return new CupertinoDialogAction(
        child: new Text(value),
        onPressed: () {
          Navigator.pop(context, value);
        },
      );
    }).toList();
  }

  Widget _iosDialog(BuildContext context) {
    String diaTitle = (title == null || title.length == 0) ? "提示" : title;

    if (subTitle != null) {
      return new CupertinoAlertDialog(
        title: Text(diaTitle),
        content: Text(subTitle),
        actions: _iosActions(context),
      );
    } else {
      return new CupertinoAlertDialog(
        title: Text(diaTitle),
        actions: _iosActions(context),
      );
    }
  }

  // android dialog
  List<Widget> _androidActions(BuildContext context) {
    List<String> actions =
        (actionTitle == null || actionTitle.length == 0) ? ["确定"] : actionTitle;
    return actions.map((String value) {
      new FlatButton(
        child: new Text(value),
        onPressed: () {
          Navigator.pop(context, value);
        },
      );
    }).toList();
  }

  Widget _androidDialog(BuildContext context) {
    String diaTitle = (title == null || title.length == 0) ? "提示" : title;

    if (subTitle != null) {
      return new AlertDialog(
        title: Text(diaTitle),
        content: Text(subTitle),
        actions: _androidActions(context),
      );
    } else {
      return new AlertDialog(
        title: Text(diaTitle),
        actions: _androidActions(context),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return _iosDialog(context);
    } else if (Platform.isAndroid) {
      return _androidDialog(context);
    } else {
      return _androidDialog(context);
    }
  }

  Future<String> DialogShow(BuildContext context) async {
    return await showDialog<String>(context: context, builder: build);
  }
}

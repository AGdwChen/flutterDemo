import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glread/GLRead/periodical/per_page.dart';
import 'package:glread/GLRead/periodical/per_years.dart';
import 'package:glread/GLRead/net/glreadNetReq.dart';

class PeriodicalListPage extends StatefulWidget {
  static const String routeName = '/glread/scrollable-tabs';

  @override
  PeriodicalListPageState createState() => new PeriodicalListPageState();
}

class PeriodicalListPageState extends State<PeriodicalListPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  perYearsModel yearModel;
  void _yearsReq() {
    var netReq = new glNetRequest();
    netReq.selectYearFromNet((data) {
      perYearsModel backData = perYearsModel.fromJson(data);
      if (!mounted) return;
      setState(() {
        yearModel = backData;
      });
    }, errorCallback: (e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
//
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (yearModel == null) {
      _yearsReq();
      return new CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: Text('期刊'),
          ),
          child: new Center(
            child: const Text('加载中'),
          ));
    } else {
      if (_controller == null) {
        _controller = new TabController(
            vsync: this, length: yearModel.data.resultData.length);
      }
      return new Scaffold(
        appBar: new AppBar(
          title: const Text('期刊'),
          centerTitle: true,
//          backgroundColor: Colors.white,
          bottom: new TabBar(
            controller: _controller,
            isScrollable: true,
            indicator: const UnderlineTabIndicator(),
            tabs: yearModel.data.resultData
                .map((String value) => new Tab(text: value))
                .toList(),
          ),
        ),
        body: new TabBarView(
            controller: _controller,
            children: yearModel.data.resultData.map((String year) {
              return new PerPage(year: year, ossPath: yearModel.data.osspath);
            }).toList()),
      );
    }
  }
}

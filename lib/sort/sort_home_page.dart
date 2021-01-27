import 'package:flutter/material.dart';
import 'package:pdliuw_website/widget/air_app_bar_factory.dart';

///
/// SortHomePage
class SortHomePage extends StatefulWidget {
  @override
  _SortHomePageState createState() => _SortHomePageState();
}

class _SortHomePageState extends State<SortHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AirAppBarFactory.appBar(titleName: "分类"),
    );
  }
}

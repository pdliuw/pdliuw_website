import 'package:flutter/material.dart';
import 'package:pdliuw_website/widget/air_app_bar_factory.dart';

///
/// ArchiveHomePage
class ArchiveHomePage extends StatefulWidget {
  @override
  _ArchiveHomePageState createState() => _ArchiveHomePageState();
}

class _ArchiveHomePageState extends State<ArchiveHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AirAppBarFactory.appBar(titleName: "归档"),
    );
  }
}

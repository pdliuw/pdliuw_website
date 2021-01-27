import 'package:flutter/material.dart';
import 'package:pdliuw_website/widget/air_app_bar_factory.dart';

///
/// PersonHomePage
class PersonHomePage extends StatefulWidget {
  @override
  _PersonHomePageState createState() => _PersonHomePageState();
}

class _PersonHomePageState extends State<PersonHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AirAppBarFactory.appBar(titleName: "关于"),
    );
  }
}

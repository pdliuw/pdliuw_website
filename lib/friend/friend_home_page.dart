import 'package:flutter/material.dart';
import 'package:pdliuw_website/widget/air_app_bar_factory.dart';

///
/// FriendHomePage
class FriendHomePage extends StatefulWidget {
  @override
  _FriendHomePageState createState() => _FriendHomePageState();
}

class _FriendHomePageState extends State<FriendHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AirAppBarFactory.appBar(titleName: "友情链接"),
    );
  }
}

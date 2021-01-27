import 'package:flutter/material.dart';

///
/// HomeConfig
class HomeConfig {
  ///
  /// Home drawer list
  static final List<dynamic> homeDrawerList = [
//    {
//      "name": "首页",
//      "iconData": Icons.home,
//      "description": "首页",
//      "routeName": "/FriendHomePage",
//      "checked": true,
//    },
    {
      "name": "标签",
      "iconData": Icons.label,
      "description": "标签",
      "routeName": "/LabelHomePage",
      "checked": false,
    },
    {
      "name": "分类",
      "iconData": Icons.sort,
      "description": "分类",
      "routeName": "/SortHomePage",
      "checked": false,
    },
    {
      "name": "归档",
      "iconData": Icons.pie_chart,
      "description": "归档",
      "routeName": "/ArchiveHomePage",
      "checked": false,
    },
    {
      "name": "关于",
      "iconData": Icons.person,
      "description": "关于",
      "routeName": "/PersonHomePage",
      "checked": false,
    },
    {
      "name": "友情链接",
      "iconData": Icons.link,
      "description": "友情链接",
      "routeName": "/FriendHomePage",
      "checked": false,
    },
  ];
}

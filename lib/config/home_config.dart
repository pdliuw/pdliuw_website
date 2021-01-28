import 'package:flutter/material.dart';

///
/// HomeConfig
class HomeConfig {
  ///
  /// Home drawer list
  static final List<dynamic> homeDrawerList = [
    {
      "name": "label",
      "iconData": Icons.label,
      "description": "label",
      "routeName": "/LabelHomePage",
      "checked": false,
    },
    {
      "name": "sort",
      "iconData": Icons.sort,
      "description": "sort statistics",
      "routeName": "/SortHomePage",
      "checked": false,
    },
    {
      "name": "archive",
      "iconData": Icons.pie_chart,
      "description": "file timeline",
      "routeName": "/ArchiveHomePage",
      "checked": false,
    },
    {
      "name": "about",
      "iconData": Icons.person,
      "description": "about me",
      "routeName": "/PersonHomePage",
      "checked": false,
    },
    {
      "name": "link",
      "iconData": Icons.link,
      "description": "friend link",
      "routeName": "/FriendHomePage",
      "checked": false,
    },
  ];
}

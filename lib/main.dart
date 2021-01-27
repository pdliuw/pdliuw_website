import 'package:airoute/airoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pdliuw_website/EnvironmentGlobalConfig.dart';
import 'package:pdliuw_website/friend/friend_home_page.dart';
import 'package:pdliuw_website/person/person_home_page.dart';

import 'archive/archive_home_page.dart';
import 'home/home_page.dart';
import 'label/label_home_page.dart';
import 'language/chinese_cupertino_localizations.dart';
import 'sort/sort_home_page.dart';

///
/// application main
void main() {
  //application global operate error widget
  ErrorWidget.builder = (detail) {
    return Text("${detail.exceptionAsString()}");
  };
  runApp(Airoute.createMaterialApp(
    title: 'air website',
    debugShowCheckedModeBanner: EnvironmentGlobalConfig.isDebug(),
    initialRoute: "/HomePage",
    routes: {
      "/HomePage": (context) => HomePage(), //首页
      "/LabelHomePage": (context) => LabelHomePage(), //标签主页
      "/SortHomePage": (context) => SortHomePage(), //分类主页
      "/ArchiveHomePage": (context) => ArchiveHomePage(), //归档主页
      "/PersonHomePage": (context) => PersonHomePage(), //用户/关于主页
      "/FriendHomePage": (context) => FriendHomePage(), //友情链接主页
    },
    locale: const Locale('en', 'US'),
    localizationsDelegates: [
      DefaultCupertinoLocalizations.delegate,
      ChineseCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('en', 'US'),
      const Locale('zh', 'CH'),
    ],
    home: HomePage(),
  ));
}

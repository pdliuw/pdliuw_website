import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';

import 'package:pdliuw_website/config/home_config.dart';
import 'package:pdliuw_website/config/recommend_article_config.dart';
import 'package:pdliuw_website/config/string_language_file_config.dart';
import 'package:pdliuw_website/home/personal_config.dart';
import 'package:pdliuw_website/widget/air_app_bar_factory.dart';
import 'package:pdliuw_website/widget/air_text_widget.dart';
import 'package:pdliuw_website/widget/app_view_page_widget.dart';

import 'recommend_article_widget.dart';

///
/// HomePage
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Duration _duration = Duration(seconds: 2);
  bool _collapse = false;
  List<dynamic> _arrowList = [
    {
      "iconData": Icons.keyboard_arrow_up,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AirAppBarFactory.appBar(
        titleName: home_title_name,
        actions: _getArrowListWidget(),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Image.asset(
                "assets/personal_air_logo.jpeg",
                fit: BoxFit.contain,
              ),
              otherAccountsPictures: [
                Image.asset(
                  "assets/personal_air_logo.jpeg",
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  "assets/personal_air_logo.jpeg",
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  "assets/personal_air_logo.jpeg",
                  fit: BoxFit.contain,
                ),
              ],
              accountName: AirTextWidget.defaultStyle(
                data: "${PersonalConfig.accountName()}",
              ),
              accountEmail: AirTextWidget.defaultStyle(
                data: "${PersonalConfig.accountEmail()}",
              ),
            ),
            ListView.separated(
                itemCount: HomeConfig.homeDrawerList.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemBuilder: (context, index) {
                  dynamic element = HomeConfig.homeDrawerList[index];

                  dynamic name = element['name'];
                  dynamic description = element['description'];
                  dynamic routeName = element['routeName'];
                  bool checked = element['checked'];
                  IconData iconData = element['iconData'];
                  return ListTile(
                    selected: checked,
                    leading: Icon(
                      iconData,
                    ),
                    enableFeedback: true,
                    dense: true,
                    horizontalTitleGap: 0,
                    onTap: () {
                      for (int i = 0;
                          i < HomeConfig.homeDrawerList.length;
                          i++) {
                        dynamic operatorItem = HomeConfig.homeDrawerList[i];
                        if (i == index) {
                          operatorItem['checked'] = true;
                        } else {
                          operatorItem['checked'] = false;
                        }
                      }
                      setState(() {});
                      //close drawer
                      if (Scaffold.of(context).isDrawerOpen) {
                        Navigator.pop(context);
                      }
                      //open new page
                      Airoute.pushNamed(routeName: routeName);
                    },
                    title: AirTextWidget.defaultStyle(
                      data: name,
                      lineHeight: 1,
                      isLight: checked,
                    ),
                    subtitle: AirTextWidget.defaultStyle(
                      data: description,
                      lineHeight: 1,
                      isLight: checked,
                    ),
                  );
                }),
          ],
        ),
      ),
      body: Column(
        children: [
          AnimatedContainer(
            height: _collapse ? 0 : 200,
            duration: _duration,
            child: AppViewPageWidget(),
          ),
          Expanded(
            flex: 2,
            child: RecommendArticleWidget.defaultStyle(
              articleList: RecommendArticleConfig.recommendArticleList,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getArrowListWidget() {
    return _arrowList
        .map((e) => IconButton(
            icon: Icon(e['iconData']),
            onPressed: () {
              _onActionPressed(e);
            }))
        .toList();
  }

  ///
  /// action pressed
  _onActionPressed(dynamic data) {
    setState(() {
      _collapse = !_collapse;
      if (_collapse) {
        _arrowList.forEach((element) {
          element['iconData'] = Icons.keyboard_arrow_down;
        });
      } else {
        _arrowList.forEach((element) {
          element['iconData'] = Icons.keyboard_arrow_up;
        });
      }
    });
  }

  ///
  /// scale
  _scale() {}
}

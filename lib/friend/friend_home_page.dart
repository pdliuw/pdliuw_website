import 'package:flutter/material.dart';
import 'package:pdliuw_website/config/friend_config.dart';
import 'package:pdliuw_website/helper/launcher_helper.dart';
import 'package:pdliuw_website/widget/air_app_bar_factory.dart';
import 'package:pdliuw_website/widget/air_container_list_item_widget.dart';
import 'package:pdliuw_website/widget/air_text_widget.dart';

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
      body: GridView.count(
        crossAxisCount: 2,
        children: FriendConfig.friendList
            .map((e) => AirContainerListItemWidget.defaultStyle(
                    child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(e['avatar']),
                      onBackgroundImageError: (object, stackTrace) {},
                      radius: 30,
                    ),
                    AirTextWidget.defaultStyle(
                      data: e['name'],
                      textSize: AirTextSize.middle4,
                    ),
                    AirTextWidget.defaultStyle(
                      data: e['introduction'],
                    ),
                    Spacer(),
                    ElevatedButton.icon(
                      onPressed: () {
                        _openFriendWebsite(e['url']);
                      },
                      icon: Icon(Icons.looks),
                      label: Text("${e['title']}"),
                    ),
                  ],
                )))
            .toList(),
      ),
    );
  }

  ///
  /// open url
  _openFriendWebsite(String url) {
    LauncherHelper.openUrl(url: url);
  }
}

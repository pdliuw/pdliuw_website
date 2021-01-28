import 'package:bubble_timeline/timeline_item.dart';
import 'package:flutter/material.dart';
import 'package:pdliuw_website/config/archive_config.dart';
import 'package:pdliuw_website/config/string_language_file_config.dart';
import 'package:pdliuw_website/widget/air_app_bar_factory.dart';
import 'package:bubble_timeline/bubble_timeline.dart';

///
/// ArchiveHomePage
class ArchiveHomePage extends StatefulWidget {
  @override
  _ArchiveHomePageState createState() => _ArchiveHomePageState();
}

class _ArchiveHomePageState extends State<ArchiveHomePage> {
  double _bubbleRadius = 120;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AirAppBarFactory.appBar(titleName: archive_title_name),
      body: BubbleTimeline(
        bubbleDiameter: _bubbleRadius,
        items: ArchiveConfig.archiveList
            .map((e) => TimelineItem(
                  title: e['name'],
                  description: e["description"],
                  child: Container(
                    width: _bubbleRadius,
                    height: _bubbleRadius,
                    child: ClipOval(
                      child: Image.asset(
                        e['backgroundAssetPath'],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  bubbleColor: Colors.green,
                ))
            .toList(),
        stripColor: Colors.teal,
        scaffoldColor: Colors.white,
      ),
    );
  }
}

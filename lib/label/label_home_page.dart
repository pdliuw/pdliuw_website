import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pdliuw_website/config/label_config.dart';
import 'package:pdliuw_website/config/string_language_file_config.dart';
import 'package:pdliuw_website/widget/air_app_bar_factory.dart';
import 'package:pdliuw_website/widget/air_container_list_item_widget.dart';

///
/// LabelHomePage
class LabelHomePage extends StatefulWidget {
  @override
  _LabelHomePageState createState() => _LabelHomePageState();
}

class _LabelHomePageState extends State<LabelHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AirAppBarFactory.appBar(titleName: label_title_name),
      body: StaggeredGridView.countBuilder(
        shrinkWrap: false,
        crossAxisCount: 4,
        itemCount: LabelConfig.labelList.length,
        itemBuilder: (BuildContext context, int index) => Container(
          child: AirContainerListItemWidget.defaultStyle(
              onTapCallback: _labelContainerPressed,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: 0.0,
                        sigmaY: 0.0,
                      ),
                      child: Image.asset(
                        "${LabelConfig.labelList[index]['backgroundAssetPath']}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      TextButton(
                        child: Text('${LabelConfig.labelList[index]['name']}'),
                        onPressed: _buttonPressed,
                      ),
                    ],
                  ),
                ],
              )),
        ),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }

  ///
  /// label
  void _labelContainerPressed() {}

  ///
  /// button pressed
  void _buttonPressed() {}
}

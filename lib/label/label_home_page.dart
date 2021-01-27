import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pdliuw_website/config/label_config.dart';
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
      appBar: AirAppBarFactory.appBar(titleName: "标签"),
      body: StaggeredGridView.countBuilder(
        shrinkWrap: false,
        crossAxisCount: 4,
        itemCount: LabelConfig.labelList.length,
        itemBuilder: (BuildContext context, int index) => Container(
          child: AirContainerListItemWidget.defaultStyle(
              child: Stack(
            children: [
              Image.asset("assets/"),
              Column(
                children: [
                  TextButton(
                    child: Text('${LabelConfig.labelList[index]['name']}'),
                    onPressed: () {},
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
  void _labelPressed() {}
}

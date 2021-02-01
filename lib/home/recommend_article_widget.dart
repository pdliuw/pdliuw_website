import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pdliuw_website/widget/air_container_list_item_widget.dart';
import 'package:pdliuw_website/widget/air_text_widget.dart';

///
/// RecommendArticleWidget
class RecommendArticleWidget extends StatefulWidget {
  List<dynamic> _articleList;
  RecommendArticleWidget.defaultStyle({
    Key key,
    @required List<dynamic> articleList,
  }) : super(key: key) {
    this._articleList = articleList;
  }
  @override
  _RecommendArticleWidgetState createState() => _RecommendArticleWidgetState();
}

class _RecommendArticleWidgetState extends State<RecommendArticleWidget> {
  List<dynamic> articleFilteredList = [];
  @override
  void initState() {
    super.initState();
    //filter
    widget._articleList.forEach((element) {
      bool online = element['online'];
      if (online) {
        articleFilteredList.add(element);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.thumb_up,
              ),
              onPressed: null,
            ),
            AirTextWidget.defaultStyle(
              data: "favorite archive",
              textSize: AirTextSize.large2,
              lineHeight: 1,
            ),
          ],
        ),
        Expanded(
          child: StaggeredGridView.countBuilder(
            shrinkWrap: true,
            crossAxisCount: 4,
            itemCount: articleFilteredList.length,
            itemBuilder: (BuildContext context, int index) => Container(
              child: AirContainerListItemWidget.defaultStyle(
                  onTapCallback: _containerPressed,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 0.0,
                            sigmaY: 0.0,
                          ),
                          child: Image.asset(
                            "${articleFilteredList[index]['bgImageAssetsPath']}",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          TextButton(
                            child:
                                Text('${articleFilteredList[index]['title']}'),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(index == 0 ? 4 : 2, 2),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
        ),
      ],
    );
  }

  ///
  /// press
  _containerPressed() {}
}

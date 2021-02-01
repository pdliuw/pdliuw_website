import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:ui' as ui;

///
/// AppViewPageWidget
class AppDragStackWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ViewPageState();
  }
}

///
/// _ViewPageState
class _ViewPageState extends State<AppDragStackWidget> {
  bool _autoPlay = false;
  var _list = [
    "assets/banner/0.jpg",
    "assets/banner/1.jpg",
    "assets/banner/2.jpg",
    "assets/banner/3.jpg",
    "assets/banner/4.jpg",
    "assets/banner/5.jpg",
    "assets/banner/6.jpg",
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double stackWidth = ui.window.physicalSize.width / 3;
    return Swiper(
      autoplay: _autoPlay,
      indicatorLayout: PageIndicatorLayout.NONE,
      layout: SwiperLayout.TINDER,
      itemWidth: stackWidth,
      itemHeight: stackWidth * 2,
      curve: Curves.easeInCirc,
      onTap: (index) {},
      pagination: SwiperPagination(
          margin: EdgeInsets.all(0.0),
          builder: SwiperCustomPagination(
              builder: (BuildContext context, SwiperPluginConfig config) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: 15,
              ),
              child: ConstrainedBox(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: DotSwiperPaginationBuilder(
                                color: Colors.black12,
                                activeColor: Theme.of(context).primaryColor,
                                size: 10.0,
                                activeSize: 20.0)
                            .build(context, config),
                      ),
                    )
                  ],
                ),
                constraints: BoxConstraints.expand(height: 50.0),
              ),
            );
          })),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(5),
          child: Image.asset(
            "${_list[index]}",
            fit: BoxFit.fill,
          ),
        );
      },
      itemCount: _list.length,
      viewportFraction: 0.8,
      scale: 0.5,
    );
  }
}

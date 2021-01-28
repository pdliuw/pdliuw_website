import 'package:flutter/material.dart';
import 'package:pdliuw_website/widget/air_text_widget.dart';

///
/// ChartIndicatorWidget
class ChartIndicatorWidget extends StatefulWidget {
  final Color color;
  final String name;
  ChartIndicatorWidget.defaultStyle({
    @required this.color,
    @required this.name,
  }) {}
  @override
  _ChartIndicatorWidgetState createState() => _ChartIndicatorWidgetState();
}

class _ChartIndicatorWidgetState extends State<ChartIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 16,
          height: 16,
          color: widget.color,
        ),
        Container(
          width: 6,
          height: 6,
        ),
        AirTextWidget.defaultStyle(
          data: widget.name,
          lineHeight: 1,
        ),
      ],
    );
  }
}

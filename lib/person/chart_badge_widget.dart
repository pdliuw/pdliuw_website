import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

///
///ChartBadgeWidget
class ChartBadgeWidget extends StatefulWidget {
  final String asset;
  final double size;
  final Color borderColor;

  const ChartBadgeWidget.defaultStyle(
    this.asset, {
    Key key,
    @required this.size,
    @required this.borderColor,
  }) : super(key: key);
  @override
  _ChartBadgeWidgetState createState() => _ChartBadgeWidgetState();
}

class _ChartBadgeWidgetState extends State<ChartBadgeWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: widget.borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(widget.size * .15),
      child: Center(
        child: Image.asset(
          widget.asset,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

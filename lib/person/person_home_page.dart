import 'package:flutter/material.dart';
import 'package:pdliuw_website/config/person_config.dart';
import 'package:pdliuw_website/person/chart_indicator_widget.dart';
import 'package:pdliuw_website/widget/air_app_bar_factory.dart';
import 'package:fl_chart/fl_chart.dart';

///
/// PersonHomePage
class PersonHomePage extends StatefulWidget {
  @override
  _PersonHomePageState createState() => _PersonHomePageState();
}

class _PersonHomePageState extends State<PersonHomePage> {
  List<PieChartSectionData> _pieSectionDataList = [];
  PieTouchData _pieTouchData = PieTouchData(touchCallback: (response) {});
  @override
  void initState() {
    super.initState();

    PersonConfig.personChartDataList.forEach((element) {
      String name = element['name'];
      double value = element['value'];
      Color color = element['color'];

      _pieSectionDataList.add(
        PieChartSectionData(
          value: value,
          color: color,
          title: "$value",
          showTitle: true,
          titlePositionPercentageOffset: 0.5, //0.5:center
        ),
      );

      _pieTouchData.props.add(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AirAppBarFactory.appBar(titleName: "关于"),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PieChart(
                PieChartData(
                  sections: _pieSectionDataList,
                  pieTouchData: _pieTouchData,
                  borderData: FlBorderData(
                    show: false,
                  ),
                ),
                swapAnimationDuration: Duration(seconds: 2),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: PersonConfig.personChartDataList
                  .map((e) => Padding(
                        padding: EdgeInsets.only(top: 6, right: 6, bottom: 6),
                        child: ChartIndicatorWidget.defaultStyle(
                            color: e['color'], name: "${e['name']}"),
                      ))
                  .toList(),
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:pdliuw_website/config/sort_config.dart';
import 'package:pdliuw_website/config/string_language_file_config.dart';
import 'package:pdliuw_website/widget/air_app_bar_factory.dart';

///
/// SortHomePage
class SortHomePage extends StatefulWidget {
  @override
  _SortHomePageState createState() => _SortHomePageState();
}

class _SortHomePageState extends State<SortHomePage> {
  bool darkMode = false;
  bool useSides = true;
  double numberOfFeatures = 8;

  List<int> ticks;
  List<String> features;
  List<List<int>> data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ticks = [1, 5, 7, 14, 21, 28, 35];
    features = SortConfig.sortList.map((e) => "${e['name']}").toList();
    data = [
      [10, 20, 28, 5, 16, 15, 23, 19, 10],
      [15, 1, 4, 14, 23, 10, 22, 35, 10]
    ];
    //filter data
    features = features.sublist(0, numberOfFeatures.floor());
    data = data
        .map((graph) => graph.sublist(0, numberOfFeatures.floor()))
        .toList();

    return Scaffold(
      appBar: AirAppBarFactory.appBar(titleName: sort_title_name),
      body: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        color: darkMode ? Colors.black : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  useSides
                      ? Text(
                          'Polygon border',
                          style: darkMode
                              ? TextStyle(color: Colors.white)
                              : TextStyle(color: Colors.black),
                        )
                      : Text(
                          'Circular border',
                          style: darkMode
                              ? TextStyle(color: Colors.white)
                              : TextStyle(color: Colors.black),
                        ),
                  Switch(
                    value: this.useSides,
                    onChanged: (value) {
                      setState(() {
                        useSides = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Number of features',
                    style: TextStyle(
                        color: darkMode ? Colors.white : Colors.black),
                  ),
                  Expanded(
                    child: Slider(
                      value: this.numberOfFeatures,
                      min: 3,
                      max: 8,
                      divisions: 5,
                      onChanged: (value) {
                        setState(() {
                          numberOfFeatures = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: darkMode
                  ? RadarChart.dark(
                      ticks: ticks,
                      features: features,
                      data: data,
                      reverseAxis: true,
                      useSides: useSides,
                    )
                  : RadarChart.light(
                      ticks: ticks,
                      features: features,
                      data: data,
                      reverseAxis: true,
                      useSides: useSides,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

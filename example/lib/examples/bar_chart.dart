import 'package:flutter/material.dart';
import 'package:sa_v1_migration/sa_v1_migration.dart';
import 'package:simple_animations_example_app/widgets/example_page.dart';

class BarChartApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Bar(0.3, "2013"),
          Bar(0.5, "2014"),
          Bar(0.7, "2015"),
          Bar(0.8, "2016"),
          Bar(0.9, "2017"),
          Bar(0.98, "2018"),
          Bar(0.84, "2019"),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final double height;
  final String label;

  final int _baseDurationMs = 1000;
  final double _maxElementHeight = 100;

  Bar(this.height, this.label);

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      duration: Duration(milliseconds: (height * _baseDurationMs).round()),
      tween: Tween(begin: 0.0, end: height),
      builder: (context, animatedHeight) {
        return Column(
          children: <Widget>[
            Container(
              height: (1 - animatedHeight) * _maxElementHeight,
            ),
            Container(
              width: 20,
              height: animatedHeight * _maxElementHeight,
              color: Colors.blue,
            ),
            Text(label)
          ],
        );
      },
    );
  }
}

class BarChartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: "Bar Chart",
      pathToFile: "bar_chart.dart",
      delayStartup: false,
      builder: (context) => BarChartApplication(),
    );
  }
}

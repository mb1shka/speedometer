import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedometer/statistics/statistics_container.dart';

class StatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: StatisticsContainer(),
    );
  }

}
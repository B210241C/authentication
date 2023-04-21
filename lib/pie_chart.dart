import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:authentication/Summary.dart';




class Mypiechart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Food": 5,
      "Education": 3,
      "Health": 2,
      "Other": 1,
    };

    return PieChart(
      dataMap: dataMap,
      chartRadius: MediaQuery
          .of(context)
          .size
          .width / 2.5,
      chartType: ChartType.disc,
    );
  }
}

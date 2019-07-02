import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/schools_detail.dart';

class PointsLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<SchoolsDetailsInfoProvide>(
      builder: (context, child, val){
         print('进来了');
          var newSeriesListData = Provide.value<SchoolsDetailsInfoProvide>(context).customModel.seriesList;
          return new charts.TimeSeriesChart(newSeriesListData,
            animate: true,
          );
      },
    );
    
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
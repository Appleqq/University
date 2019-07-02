import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import '../model/schoolsDetail.dart';

class CustomSchoolsModel{

  List datas;
  List<charts.Series> seriesList;

  CustomSchoolsModel.fromList(List list){

    datas = list;
  }

  CustomSchoolsModel.fromModel(SchoolsDetailsModel model){

    seriesList = setLineChartData(model.data.item);

  }

  List<charts.Series<TimeSeriesSales, DateTime>>setLineChartData(List<Item> data){
    List <TimeSeriesSales>newData = [];
    for (Item item in data) {
      newData.add(new TimeSeriesSales(new DateTime(int.parse(item.year), 1, 1), double.parse(item.max)));
    }
    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: newData,
      )
    ];
  }

}

class LinearSales {
  final int x;
  final double y;

  LinearSales(this.x, this.y);
}

class TimeSeriesSales {
  final DateTime time;
  final double sales;

  TimeSeriesSales(this.time, this.sales);
}
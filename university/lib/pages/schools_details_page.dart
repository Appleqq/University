import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provide/provide.dart';
import '../provide/schools_detail.dart';
import '../pages/line_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../service/service_method.dart';
import 'dart:convert';

class SchoolsDetailPage extends StatelessWidget {

  final String schoolsId;
  SchoolsDetailPage(this.schoolsId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('schools'),
      ),
      body: FutureBuilder(
        future: _getDetailInfo(context),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Container(
              alignment: Alignment.center,
              width:ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(750),
              child: PointsLineChart(),
            );
          }else {
            return Container(
              child: Text('ddd'),
            );
          }
        },
      ),
    );
  }

  Future _getDetailInfo(BuildContext context) async{
     await Provide.value<SchoolsDetailsInfoProvide>(context).getTestOneYearInfo('2015', schoolsId);
     return '完成加载';
  }

}





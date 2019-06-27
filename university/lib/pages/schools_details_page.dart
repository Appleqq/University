import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provide/provide.dart';
import '../provide/schools_detail.dart';
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
             var data = Provide.value<SchoolsDetailsInfoProvide>(context).customModel.datas;
             print('5年的数据-----$data');
            return Container(
              child: Text('111'),
            );
          }else {
            return Container(
              child: Text('222'),
            );
          }
        },
      ),
    );
  }

  _getDetailInfo(BuildContext context){
     Provide.value<SchoolsDetailsInfoProvide>(context).getShcoolsInfoWithYear(['2015','2016','2017','2018'], schoolsId);
  }

  
}





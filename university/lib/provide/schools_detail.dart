import 'package:flutter/material.dart';
import '../model/schoolsDetail.dart';
import '../model/custom_schools_details.dart';
import '../service/service_method.dart';
import 'dart:convert';

class SchoolsDetailsInfoProvide extends ChangeNotifier{

  CustomSchoolsModel customModel = null;

    //省份ID
  String princeID = '11';//从11(北京)
  String isManth = '1'; //理科1 文科2

  List datasModel = [];
  List initYears = [];

  getShcoolsInfoWithYear(List years, String schoolsId){
    initYears = years;
    for (var year in years) {
      getOneYearInfo(year, schoolsId);
    }
  }

  Future getOneYearInfo(String year, String schoolsId) async {
      print('获取每年的数据 $year');
      String url = 'https://static-data.eol.cn/www/2.0/schoolprovinceindex/' + year + '/' + schoolsId + '/' + isManth + '1.json';
       await request(url).then((val){
            var responseData = json.decode(val.toString());
            print('step1获取完成每年的数据 $responseData');
            datasModel.add(SchoolsDetailsModel.fromJson(responseData));
            print('获取完成每年的数据 $datasModel');
            if(datasModel.length == initYears.length)
            {
               CustomSchoolsModel.fromList(datasModel);
               print('全部数据完成');
               notifyListeners();
            }
  
        });
    }
  
  }
  
  class Furtter {
}
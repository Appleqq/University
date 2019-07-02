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

  getTestOneYearInfo(String year, String schoolsId) async{
     request('schoolDetailTest').then((val){
      SchoolsDetailsModel model = SchoolsDetailsModel.fromJson(val);
      customModel = CustomSchoolsModel.fromModel(model);
      notifyListeners();

    });
  }
  
  
  }
  

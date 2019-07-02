import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/servcie_url.dart';

//可选参数
Future request(url, {formData}) async{
  try{
    print('开始获取数据。。。。。。');
    Response response;
    Dio dio = Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    dio.options.responseType = ResponseType.json;
    print('接口。。。。${serverPath[url]}');
    print('数据.....$formData');
    if(formData == null){
      response = await dio.get(serverPath[url]);
    }else
      response = await dio.post(serverPath[url], data: formData);

    if(response.statusCode == 200){
      return response.data;

    }else{
      throw Exception('后端接口异常');
    }
  }catch(e){
    return print('ERROR:=================>$e');
  }

}


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../service/service_method.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:convert';
import '../pages/schools_details_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  int page = 2;
  List <Map> hotSchoolsList=[];
  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(title: Text('大学热度排名'),),
      body: FutureBuilder(
        future: request('schoolList', formData:{'keyword': '','request_type': '2','uri':'apigkcx/api/school/hotlists',"local_type_id": '1',"local_province_id": "11","size": '10',"page": '1',}),
        builder: (context, snapshort){
          if(snapshort.hasData){
            var data = json.decode(snapshort.data.toString());
            List<Map> schoolDatas = (data['data']['item'] as List).cast(); 
            return EasyRefresh(
              refreshFooter: ClassicsFooter(
                key: _footerKey,
                bgColor: Colors.white,
                textColor: Colors.pink,
                moreInfoColor: Colors.pink,
                showMore: true,
                noMoreText: '',
                moreInfo: '加载中',
                loadReadyText: '上拉加载',
              ),
              child: ListView(
                children: <Widget>[
                  _getSchoolList(schoolDatas),
                ],
              ),
              loadMore: () async{
                print('加载更多。。。。');
                var formData = {'keyword': '','request_type': '2','uri':'apigkcx/api/school/hotlists',"local_type_id": '1',"local_province_id": "11","size": '10',"page": page.toString(),};
                print('formdata------$formData');
                await request('schoolList', formData: formData).then((val){
                 
                  var data = json.decode(val.toString());
                   print('schoolDatasTemp====$data');
                  List<Map> schoolDatasTemp = (data['data']['item'] as List).cast();
                  setState(() {
                    hotSchoolsList.addAll(schoolDatasTemp);
                    page++;
                  });

                });
              },
            );
          }else{
            return Center(
              child: Text('加载中'),
            );
          }  
        },
      ),
    );
  }

  Widget _getSchoolList(List<Map> schoolsList){
    if(schoolsList.length != 0){
      if(hotSchoolsList.length == 0)
      {
        hotSchoolsList.addAll(schoolsList);
      }
      print('hotSchools====$hotSchoolsList');
      List <Widget> listWidget = hotSchoolsList.map((val){
        return InkWell(
          onTap: (){
             Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => new SchoolsDetailPage(val['school_id:']),
            ),
        );
          },
          child: Container(
            width: ScreenUtil().setWidth(750),
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Row(
              children: <Widget>[
                Image.network('https://static-data.eol.cn/upload/logo/' + val['school_id'].toString() + '.jpg', width: 60, height: 60,),
                Container(
                  margin: EdgeInsets.only(left: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 5.0),
                        child: Text(val['name']),
                      ),
                      Row(
                        children: <Widget>[
                          _getSchoolType(val['type_name']),
                          _getSchoolType(val['dual_class_name']),
                          _getSchoolType(val['f985'].toString() == '1' ? '985' : ''),
                          _getSchoolType(val['f211'].toString() == '1' ? '211' : ''),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(180)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('热度', 
                            style: TextStyle(color: Colors.black38, fontSize:ScreenUtil().setSp(20))),
                          Container(
                            margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                            child: Text(val['view_total'],
                                        style: TextStyle(color: Colors.blueAccent, fontSize:ScreenUtil().setSp(20)),
                                      ),
                          ),
                        ],
                      ),
                      Text(val['province_name'],
                          style: TextStyle(color: Colors.black38, fontSize:ScreenUtil().setSp(20)),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ),
        );

      }).toList();

      return Wrap(
        spacing: 1,
        children: listWidget,
      );
    }else{
      return Text('没有数据');
    }
  }

  Widget _getSchoolType(String type){
    return Container(
      margin: EdgeInsets.only(left: 5.0),
      child: Text(type,
                style: TextStyle(color: Colors.black38, decoration: TextDecoration.underline, fontSize:ScreenUtil().setSp(20)),
              ),
    );
  }
}
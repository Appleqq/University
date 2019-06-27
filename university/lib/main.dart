import 'package:flutter/material.dart';
import './pages/index_page.dart';
import './provide/schools_detail.dart';
import 'package:provide/provide.dart';

void main(){

  var schoolsDetailsProvide = SchoolsDetailsInfoProvide();
  var providers = Providers();
  providers
  ..provide(Provider<SchoolsDetailsInfoProvide>.value(schoolsDetailsProvide));

  runApp(ProviderNode(child: MyApp(), providers: providers,));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '百姓生活+',
        debugShowCheckedModeBanner: false, ///去掉显示debug
        theme: ThemeData(
          primaryColor: Colors.pink,
        ),
        home: IndexPage(),
      ),
    );
  }
}

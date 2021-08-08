import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_wave_task/screens/home.dart';
import 'package:team_wave_task/screens/leagues.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=> Home(),),
        GetPage(name: '/leagues', page: ()=> Leagues()),
      ],
    );
  }
}

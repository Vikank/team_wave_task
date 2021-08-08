import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:team_wave_task/model/leagues_model.dart';
import '../screens/leagues.dart';
import 'package:get/get.dart';


class ApiServiceLeague{
  Future<List<Countrys>?> getLeagues(String country) async {
    try{
      var response = await http
          .get(Uri.parse("https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?c=$country"))
          .timeout(const Duration(seconds: 10), onTimeout: (){
        throw TimeoutException("connection time out, try again");
      });

      if(response.statusCode == 200){

        var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
        return LeaguesModel.fromJson(jsonResponse).countrys;
      } else {
        return null;
      }
    } on TimeoutException catch(_) {
      print("response timeout");
    }
  }
  Future<List<Countrys>?> getFilterLeagues(String country,String sport) async{
    try{
      var response = await http
          .get(Uri.parse("https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?c=$country&s=$sport"))
          .timeout(const Duration(seconds: 10), onTimeout: (){
        throw TimeoutException("connection time out, try again");
      });

      if(response.statusCode == 200){

        var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
        return LeaguesModel.fromJson(jsonResponse).countrys;
      } else {
        return null;
      }
    }on TimeoutException catch(_) {
      print("response timeout");
    }
  }
}
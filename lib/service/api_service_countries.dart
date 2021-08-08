import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:team_wave_task/model/countries.dart';


class ApiServiceCountry{
  Future<List<CountryElement>?> getCountries() async {
    try{
      var response = await http
          .get(Uri.parse("https://www.thesportsdb.com/api/v1/json/1/all_countries.php"))
          .timeout(const Duration(seconds: 10), onTimeout: (){
         throw TimeoutException("connection time out, try again");
      });

      if(response.statusCode == 200){


       return countryFromJson(response.body).countries;
      } else {
        return null;
      }
    } on TimeoutException catch(_) {
      print("response timeout");
    }
  }
}
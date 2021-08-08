import 'package:get/get.dart';
import 'package:team_wave_task/model/countries.dart';
import 'package:team_wave_task/service/api_service_countries.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController{
 var getCountry=<CountryElement>[].obs;
 ApiServiceCountry apiServiceCountry = ApiServiceCountry();
 var countryLoading = true.obs;

 void onInit(){
  callCountryMethod();
  super.onInit();
 }

 callCountryMethod() async{
  try{
   countryLoading.value = true;
   var result = await apiServiceCountry.getCountries();
   if (result != null) {
    getCountry.assignAll(result);
   } else {
    print("null");
   }
  } finally {
   countryLoading.value = false;
  }
  update();
 }
}
import 'package:get/get.dart';
import 'package:team_wave_task/model/leagues_model.dart';
import 'package:team_wave_task/service/api_service_leagues.dart';

class LeagueController extends GetxController{
  var getLeague = <Countrys>[].obs;
  ApiServiceLeague apiServiceLeague = ApiServiceLeague();
  var leagueLoading = true.obs;
  String countryName='';

  callLeagueMethod() async{
    try{
      leagueLoading.value = true;
      var result = await apiServiceLeague.getLeagues(countryName);
      if (result != null) {
        getLeague.assignAll(result);
      } else {
        print("null");
      }
    } finally {
      leagueLoading.value = false;
    }
    update();
  }


  searchData(String data) async{
    try{
      leagueLoading.value = true;
      getLeague.clear();
      var result = await apiServiceLeague.getFilterLeagues(countryName,data);
      if (result != null) {
        getLeague.assignAll(result);
      } else {

      }
    } finally {
      leagueLoading.value = false;
    }
    update();
  }



}
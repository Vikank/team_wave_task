// To parse this JSON data, do
//
//     final league = leagueFromJson(jsonString);

import 'dart:convert';

class LeaguesModel {
  late List<Countrys> _countrys;

  LeaguesModel({required List<Countrys> countrys}) {
    this._countrys = countrys;
  }

  List<Countrys> get countrys => _countrys;
  set countrys(List<Countrys> countrys) => _countrys = countrys;

  LeaguesModel.fromJson(Map<dynamic, dynamic> json) {
    if (json['countrys'] != null) {
      _countrys = <Countrys>[];
      json['countrys'].forEach((v) {
        _countrys.add(new Countrys.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._countrys != null) {
      data['countrys'] = this._countrys.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countrys{
  late String _strLeague;
  late String _strFacebook;
  late String _strTwitter;
  late String _strLogo;
  late String _strBanner;


  Countrys({
    required String strLeague,
    required String strFacebook,
    required String strTwitter,
    required String strLogo,
    required String strBanner,
}) {
    this._strLeague = strLeague;
    this._strFacebook = strFacebook;
    this._strTwitter = strTwitter;
    this._strLogo = strLogo;
    this._strBanner = strBanner;
  }

  String get strLeague => _strLeague;
  set strLeague(String strLeague) => _strLeague = strLeague;
  String get strFacebook => _strFacebook;
  set strFacebook(String strFacebook) => _strFacebook = strFacebook;
  String get strTwitter => _strTwitter;
  set strTwitter(String strTwitter) => _strTwitter = strTwitter;
  String get strLogo => _strLogo;
  set strLogo(String strLogo) => _strLogo = strLogo;
  String get strBanner => _strBanner;
  set strBanner(String strBanner) => _strBanner = strBanner;

  Countrys.fromJson(Map<String, dynamic> json){
    _strLeague = json['strLeague'];
    _strFacebook = json['strFacebook']==null ? '' : json['strFacebook'];
    _strTwitter = json['strTwitter']==null ? '' : json['strTwitter'];
    _strLogo = json['strLogo']==null ? '' : json['strLogo'];
    _strBanner = json['strBanner']==null?'':json['strBanner'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strLeague'] = this._strLeague;
    data['strFacebook'] = this._strFacebook;
    data['strTwitter'] = this._strTwitter;
    data['strLogo'] = this._strLogo;
    data['strBanner'] = this._strBanner;
    return data;
  }

}

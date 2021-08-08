// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

Country countryFromJson(String str) => Country.fromJson(json.decode(str));

String countryToJson(Country data) => json.encode(data.toJson());

class Country {
  Country({
    required this.countries,
  });

  List<CountryElement> countries;

  factory Country.fromJson(Map<dynamic, dynamic> json) => Country(
    countries: List<CountryElement>.from(json["countries"].map((x) => CountryElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
  };
}

class CountryElement {
  CountryElement({
    required this.nameEn,
  });

  String nameEn;

  factory CountryElement.fromJson(Map<dynamic, dynamic> json) => CountryElement(
    nameEn: json["name_en"],
  );

  Map<String, dynamic> toJson() => {
    "name_en": nameEn,
  };
}

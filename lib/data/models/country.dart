import 'package:intl/intl.dart';

class Country {
  String name;

  List<String> topLevelDomain;
  String alpha2Code;
  String alpha3Code;
  String? capital;

  String subregion;
  String region;
  String? population;

  String area;
  List<String>? borders;
  String nativeName;
  String flagSVG;

  Country({
    required this.name,
    this.capital,
    required this.flagSVG,
    required this.population,
    required this.region,
    required this.topLevelDomain,
    required this.subregion,
    required this.nativeName,
    required this.borders,
    required this.area,
    required this.alpha3Code,
    required this.alpha2Code,
  });

  static List<Country> fromList(List<dynamic> jsonList) => jsonList
      .map((element) => Country.fromJson(element as Map<String, dynamic>))
      .toList();

  Country.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        capital = json['capital'] ?? 'Does\'nt have a capital',
        flagSVG = json['flag'],
        population =
            NumberFormat('###,###,000').format(json['population']).toString(),
        region = json['region'],
        alpha2Code = json['alpha2Code'],
        alpha3Code = json['alpha3Code'],
        area = NumberFormat('###,###,###').format(json['area'] ?? 0).toString(),
        subregion = json['subregion'],
        nativeName = json['nativeName'],
        borders = (json['borders'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        topLevelDomain = (json['topLevelDomain'] as List<dynamic>)
            .map((e) => e as String)
            .toList();
}

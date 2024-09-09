import 'package:intl/intl.dart';

class Country {
  String name;

  //List<String> topLevelDomain;
  //String alpha2Code;
  //String alpha3Code;
  //List<String> callingCodes;
  String? capital;

  //String subregion;
  String region;
  String? population;

  //String demonym;
  //int area;
  //List<String> borders;
  //String nativeName;
  //String numericCode
  String flagSVG;

  Country({
    required this.name,
    this.capital,
    required this.flagSVG,
    required this.population,
    required this.region,
  });

  static List<Country> fromList(List<dynamic> jsonList) => jsonList.map((element) => Country.fromJson(element as Map<String,dynamic>)).toList();
  // {
  //   final listTest = ;
  //   final list = <Country>[];
  //   for(final e in jsonList){
  //     try{
  //       final obj = Country.fromJson(e as Map<String,dynamic>);
  //       list.add(obj);
  //     }
  //     catch (ex){
  //       print('error $ex parsing $e');
  //     }
  //   }
  //   print('List1.length: ${list.length}');
  //   print('List-Test.length: ${listTest.length}');
  //   return list;
  // }
  Country.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        capital = json['capital'] ?? 'Does\'nt have a capital',
        flagSVG = json['flag'],
        population = new NumberFormat('###,###,000').format(json['population']).toString(),
        region = json['region'] {
    // print("1) ${json['name']}");
    // print("2) ${json['capital']}");
    // print("3) ${json['flag']}");
    // print("4) ${json['population']}");
    // print("5) ${json['region']} \n\n");

  }
}

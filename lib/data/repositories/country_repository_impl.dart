import 'dart:convert';
import 'dart:js_interop';

import 'package:countries_app/data/models/country.dart';
import 'package:flutter/services.dart';

import '../../domain/repositories/CountryRepository.dart';

class CountryRepositoryImpl implements CountryRepository {
  @override
  Future<List<Country>> getAllCountries() async {
    final  response = await rootBundle.loadString("assets/data.json");

    print('YOU Are here!1');

    final data = await json.decode(response);
    // final jsonList = await data['item'].map((e) => Country.fromJson(e)).toList();
    // print('JsonList: ${jsonList}');
    final test = Country.fromList(data['items']);
    print (test.length);
    return test;
    //return await  data['items'].map((e) => Country.fromJson(e)).toList();
  }

  @override
  Future<List<Country>> getCountriesByRegion(String region) {
    // TODO: implement getCountriesByRegion
    throw UnimplementedError();
  }

  @override
  Future<Country> getCountryByCode(String code) {
    // TODO: implement getCountryByCode
    throw UnimplementedError();
  }
}

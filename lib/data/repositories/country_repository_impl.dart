import 'dart:convert';

import 'package:countries_app/data/models/country.dart';
import 'package:flutter/services.dart';

import '../../domain/repositories/country_repository.dart';

class CountryRepositoryImpl implements CountryRepository {
  @override
  Future<List<Country>> getAllCountries() async {
    final response = await rootBundle.loadString("assets/data.json");
    final data = await json.decode(response);

    return Country.fromList(data['items']);
  }

  @override
  Future<List<Country>> searchCountries({
    String? region,
    String? searchQuery,
  }) async {
    final response = await rootBundle.loadString("assets/data.json");
    final data = await json.decode(response);
    final countriesList = Country.fromList(data['items']);

    return countriesList
        .where((country) =>
            country.name
                .toString()
                .toLowerCase()
                .contains(searchQuery?.toLowerCase() ?? '') ||
            country.capital!
                .toString()
                .toLowerCase()
                .contains(searchQuery?.toLowerCase() ?? ''))
        .where((country) => country.region.contains(region ?? ''))
        .toList();
  }

  @override
  Future<Country> getCountryByCode(String code) {
    // TODO: implement getCountryByCode
    throw UnimplementedError();
  }
}

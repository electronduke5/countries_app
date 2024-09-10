import '../../data/models/country.dart';

abstract class CountryRepository {
  Future<List<Country>> getAllCountries();

  Future<Country> getCountryByCode(String code);

  Future<List<Country>> searchCountries({String? searchQuery, String? region});
}

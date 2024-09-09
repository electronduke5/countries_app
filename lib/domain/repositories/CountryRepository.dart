import '../../data/models/country.dart';

abstract class CountryRepository {
  Future<List<Country>> getAllCountries();

  Future<List<Country>> getCountriesByRegion(String region);

  Future<Country> getCountryByCode(String code);
}

part of 'country_cubit.dart';

class CountryState {
  final ModelStatus<List<Country>> countriesStatus;
  final ModelStatus<Country> countryStatus;
  final String? region;
  final String? searchQuery;

  CountryState(
      {
        this.countriesStatus = const IdleStatus(),
        this.countryStatus = const IdleStatus(),
      this.region,
      this.searchQuery});

  CountryState copyWith({
    ModelStatus<List<Country>>? countriesStatus,
    ModelStatus<Country>? countryStatus,
    String? region,
    String? searchQuery,
  }) =>
      CountryState(
        countriesStatus: countriesStatus ?? this.countriesStatus,
        countryStatus: countryStatus ?? this.countryStatus,
        region: region ?? this.region,
        searchQuery: searchQuery ?? this.searchQuery,
      );
}

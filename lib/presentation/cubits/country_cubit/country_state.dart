part of 'country_cubit.dart';

class CountryState {
  final ModelStatus<List<Country>> countriesStatus;
  final String? region;
  final String? searchQuery;

  CountryState(
      {this.countriesStatus = const IdleStatus(),
      this.region,
      this.searchQuery});

  CountryState copyWith({
    ModelStatus<List<Country>>? countriesStatus,
    String? region,
    String? searchQuery,
  }) =>
      CountryState(
        countriesStatus: countriesStatus ?? this.countriesStatus,
        region: region ?? this.region,
        searchQuery: searchQuery ?? this.searchQuery,
      );
}

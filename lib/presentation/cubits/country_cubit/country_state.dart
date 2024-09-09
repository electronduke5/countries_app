
part of 'country_cubit.dart';
class CountryState {
  final ModelStatus<List<Country>> countriesStatus;

  CountryState({this.countriesStatus = const IdleStatus()});

  CountryState copyWith({
    ModelStatus<List<Country>>? countriesStatus,
  }) =>
      CountryState(
        countriesStatus: countriesStatus ?? this.countriesStatus,
      );
}

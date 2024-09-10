import 'package:bloc/bloc.dart';
import 'package:countries_app/presentation/cubits/models_status.dart';
import 'package:countries_app/presentation/di/app_module.dart';

import '../../../data/models/country.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryState());

  final _repository = AppModule.getCountryRepository();

  Future<List<Country>?> getAllCountries() async {
    emit(state.copyWith(countriesStatus: const LoadingStatus()));
    try {
      final countries = await _repository.getAllCountries();
      emit(state.copyWith(
          countriesStatus: LoadedStatus<List<Country>>(countries)));
      return countries;
    } catch (e) {
      emit(state.copyWith(
          countriesStatus:
              FailedStatus(state.countriesStatus.message ?? e.toString())));
      return null;
    }
  }

  Future<List<Country>?> searchCountries(String searchQuery) async {
    emit(state.copyWith(countriesStatus: const LoadingStatus<List<Country>>()));
    try {
      final countries = await _repository.searchCountries(
        searchQuery: searchQuery,
        region: state.region,
      );
      emit(state.copyWith(
        countriesStatus: LoadedStatus<List<Country>>(countries),
        searchQuery: searchQuery,
        region: state.region,
      ));
      return countries;
    } catch (e) {
      emit(state.copyWith(
          countriesStatus:
              FailedStatus(state.countriesStatus.message ?? e.toString())));
      return null;
    }
  }

  Future<List<Country>?> getCountriesByRegion(String region) async {
    emit(state.copyWith(countriesStatus: const LoadingStatus<List<Country>>()));
    try {
      final countries = await _repository.searchCountries(
        region: region,
        searchQuery: state.searchQuery,
      );
      emit(state.copyWith(
        countriesStatus: LoadedStatus<List<Country>>(countries),
        region: region,
        searchQuery: state.searchQuery,
      ));
      return countries;
    } catch (e) {
      emit(state.copyWith(
          countriesStatus:
              FailedStatus(state.countriesStatus.message ?? e.toString())));
      return null;
    }
  }
}

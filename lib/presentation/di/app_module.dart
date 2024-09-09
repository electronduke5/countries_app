import 'package:countries_app/data/repositories/country_repository_impl.dart';
import 'package:countries_app/domain/repositories/CountryRepository.dart';
import 'package:get_it/get_it.dart';

class AppModule {
  static bool _provided = false;

  void provideDependencies() {
    if (_provided) return;
    _provideCountryRepository();
    _provided = true;
  }

  void _provideCountryRepository() {
    GetIt.instance.registerSingleton(CountryRepositoryImpl());
  }

  static CountryRepository getCountryRepository() {
    return GetIt.instance.get<CountryRepositoryImpl>();
  }
}

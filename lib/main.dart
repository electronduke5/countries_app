import 'package:countries_app/presentation/cubits/theme_cubit.dart';
import 'package:countries_app/presentation/cubits/country_cubit/country_cubit.dart';
import 'package:countries_app/presentation/di/app_module.dart';
import 'package:countries_app/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/custom_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppModule().provideDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(ThemeMode.system),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) => MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: context.read<ThemeCubit>().getCurrentThemeMode,
          theme: CustomTheme().themeDataLight,
          darkTheme: CustomTheme().themeDataDark,
          initialRoute: '/home_page',
          routes: {
            '/home_page': (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider<CountryCubit>(
                      create: (context) => CountryCubit()..getAllCountries(),
                    ),
                    BlocProvider(create: (context) => ThemeCubit(themeMode)),
                  ],
                  child: HomePage(),
                ),
            '/info_page': (context) => BlocProvider<CountryCubit>(
                  create: (context) => CountryCubit()..getAllCountries(),
                  child:  HomePage(),
                ),
          },
        ),
      ),
    );
  }
}

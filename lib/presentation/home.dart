import 'package:countries_app/domain/repositories/CountryRepository.dart';
import 'package:countries_app/main.dart';
import 'package:countries_app/presentation/cubits/ThemeCubit.dart';
import 'package:countries_app/presentation/cubits/country_cubit/country_cubit.dart';
import 'package:countries_app/presentation/cubits/models_status.dart';
import 'package:countries_app/presentation/widgets/country_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/country.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppBar(
            title: const Text('Where in the World?'),
            actions: [
              IconButton(
                  onPressed: () async {
                    await context.read<CountryCubit>().getAllCountries();
                    //context.read<ThemeCubit>().switchTheme();
                  },
                  icon: const Icon(Icons.sunny)),
            ],
          ),
          Expanded(
            child: BlocBuilder<CountryCubit, CountryState>(
              builder: (context, state) {
                if(state.countriesStatus.runtimeType == LoadedStatus<List<Country>>){
                  if (state.countriesStatus.item == null) {
                    return const Center(child: Text('Нет данных'));
                  }
                  return GridView.builder(
                    itemCount: state.countriesStatus.item?.length ?? 0,
                    itemBuilder: (context, index) {
                      return CountryCard(
                          country: state.countriesStatus.item![index]);
                    },
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                  );
                }
                print(state.countriesStatus.runtimeType);
                switch (state.countriesStatus.runtimeType) {
                  case LoadingStatus<List<Country>>():
                    return const Center(child: CircularProgressIndicator());
                  case LoadedStatus<List<Country>>():
                    if (state.countriesStatus.item == null) {
                      return const Center(child: Text('Нет данных'));
                    }
                    return GridView.builder(
                      itemCount: state.countriesStatus.item?.length ?? 0,
                      itemBuilder: (context, index) {
                        return CountryCard(
                            country: state.countriesStatus.item![index]);
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                    );
                  case FailedStatus<List<Country>>():
                    print(state.countriesStatus.message);
                    return Center(child: Text(state.countriesStatus.message.toString().length.toString() ?? 'Ошипка'),);
                  default:
                    return Center(child: Text(state.countriesStatus.message ?? state.countriesStatus.runtimeType.toString()),);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

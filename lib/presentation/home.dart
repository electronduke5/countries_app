import 'package:countries_app/presentation/cubits/country_cubit/country_cubit.dart';
import 'package:countries_app/presentation/cubits/models_status.dart';
import 'package:countries_app/presentation/widgets/country_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/country.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController searchController = TextEditingController();

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 45, 54, 1.0),
      appBar: AppBar(
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0, left: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: BlocBuilder<CountryCubit, CountryState>(
                        builder: (context, state) {
                          return TextField(
                            controller: searchController,
                            onChanged: (value) async {
                              await context
                                  .read<CountryCubit>()
                                  .searchCountries(value);
                            },
                            decoration: const InputDecoration(
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Search for a country...',
                                prefixIcon: Icon(Icons.search)),
                          );
                        },
                      ),
                    ),
                    Flexible(
                      child: DropdownButtonHideUnderline(
                        child: BlocBuilder<CountryCubit, CountryState>(
                          builder: (context, state) {
                            return DropdownButton<String>(
                              value: selectedValue,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              hint: const Text('Filter by Region'),
                              items: [
                                "Africa",
                                'America',
                                'Asia',
                                'Europe',
                                'Oceania'
                              ]
                                  .map<DropdownMenuItem<String>>(
                                    (String _value) => DropdownMenuItem<String>(
                                      child: Text(_value),
                                      value: _value,
                                    ),
                                  )
                                  .toList(),
                              borderRadius: BorderRadius.circular(5),
                              onChanged: (value) async {
                                selectedValue == value
                                    ? selectedValue = null
                                    : selectedValue = value;

                                context
                                    .read<CountryCubit>()
                                    .getCountriesByRegion(selectedValue ?? '');
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<CountryCubit, CountryState>(
                  builder: (context, state) {
                    if (state.countriesStatus.runtimeType ==
                        LoadedStatus<List<Country>>) {
                      if (state.countriesStatus.item?.isEmpty == true) {
                        return const Center(
                            child: Text(
                                'Oops.. It seems that there is no such country...'));
                      }
                      return GridView.builder(
                        itemCount: state.countriesStatus.item?.length ?? 0,
                        itemBuilder: (context, index) {
                          return CountryCard(
                              country: state.countriesStatus.item![index]);
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              MediaQuery.of(context).size.width < 900 ? 2 : 4,
                        ),
                      );
                    }
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
                            crossAxisCount: 4,
                          ),
                        );
                      case FailedStatus<List<Country>>():
                        print(state.countriesStatus.message);
                        return Center(
                          child: Text(state.countriesStatus.message
                              .toString()
                              .length
                              .toString()),
                        );
                      default:
                        return Center(
                          child: Text(
                            state.countriesStatus.message ??
                                state.countriesStatus.runtimeType.toString(),
                          ),
                        );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

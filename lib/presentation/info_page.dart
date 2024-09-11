import 'package:countries_app/data/models/country.dart';
import 'package:countries_app/presentation/widgets/naming_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoPage extends StatelessWidget {
  InfoPage({super.key});

  Country? country = Country(
      name: 'Angola',
      flagSVG: 'https://flagcdn.com/ao.svg',
      population: '32,866,268',
      region: 'Africa',
      capital: 'Luanda');

  //TODO: Заменить ! на null-safety

  @override
  Widget build(BuildContext context) {
    //country = ModalRoute.of(context)?.settings.arguments as Country?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Where in the World?'),
        actions: [
          IconButton(
              onPressed: () async {
                //context.read<ThemeCubit>().switchTheme();
              },
              icon: const Icon(Icons.sunny)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
              label: const Text('Back'),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.network(
                    country!.flagSVG,
                    height: 300,
                    width: 400,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            country!.name,
                            style: const TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const NamingTextWidget(
                                    name: 'Native Name',
                                    text: 'country!.nativeName',
                                  ),
                                  NamingTextWidget(
                                    name: 'Population',
                                    text: country!.population.toString(),
                                  ),
                                  NamingTextWidget(
                                    name: 'Region',
                                    text: country!.region,
                                  ),
                                  const NamingTextWidget(
                                    name: 'Sub Region',
                                    text: 'country!.subRegion',
                                  ),
                                  NamingTextWidget(
                                    name: 'Capital',
                                    text: country!.capital!,
                                  ),
                                ],
                              ),
                              const Spacer(flex: 1),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  NamingTextWidget(
                                    name: 'Top Level Domain',
                                    text: 'country!.topLevelDomain',
                                  ),
                                  NamingTextWidget(
                                    name: 'Currencies',
                                    text: 'country!.currencies',
                                  ),
                                  NamingTextWidget(
                                    name: 'Language',
                                    text: 'country!.languages',
                                  ),
                                ],
                              ),
                              const Spacer(flex: 4),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              children: [
                                const Text(
                                  'Border Countries:',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text('Country Name1')),
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Country Name2')),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

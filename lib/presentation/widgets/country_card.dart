import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/country.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({super.key, required this.country});

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(5.0),
                ),
                child: SvgPicture.network(
                  country.flagSVG,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Text(
                          country.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Population: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(country.population.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Region: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(country.region),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Capital: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(country.capital.toString()),
                    ],
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

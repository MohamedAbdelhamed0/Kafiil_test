import 'package:flutter/material.dart';
import 'package:kafill_test/widgets/countries_capitals_table.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CountriesCapitalsTable(),
      ],
    );
  }
}

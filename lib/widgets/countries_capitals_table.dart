import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:kafill_test/core/colors.dart';
import 'package:kafill_test/core/typography.dart';

class CountriesCapitalsTable extends StatefulWidget {
  const CountriesCapitalsTable({super.key});

  @override
  CountriesCapitalsTableState createState() => CountriesCapitalsTableState();
}

class CountriesCapitalsTableState extends State<CountriesCapitalsTable> {
  final List<Map<String, String>> countriesAndCapitals = List.generate(
    100,
    (index) => {
      'country': 'Country $index',
      'capital': 'Capital $index',
    },
  );

  int _currentPage = 0;
  final int _itemsPerPage = 5;

  @override
  Widget build(BuildContext context) {
    final startIndex = _currentPage * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage;
    final paginatedCountriesAndCapitals = countriesAndCapitals.sublist(
      startIndex,
      endIndex > countriesAndCapitals.length
          ? countriesAndCapitals.length
          : endIndex,
    );

    final numPages = (countriesAndCapitals.length / _itemsPerPage).ceil();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    border: TableBorder.all(color: Colors.transparent),
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                    },
                    children: [
                      TableRow(
                        decoration: const BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Country',
                              style: AppTypography.countryText,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Capital',
                              style: AppTypography.countryText,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ...paginatedCountriesAndCapitals.map((entry) {
                  int index = paginatedCountriesAndCapitals.indexOf(entry);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Table(
                          columnWidths: const {
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(1),
                          },
                          children: [
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    entry['country']!,
                                    style: AppTypography.capitalText,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    entry['capital']!,
                                    style: AppTypography.capitalText,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color:
                              index < paginatedCountriesAndCapitals.length - 1
                                  ? AppColors.greyColor
                                  : Colors.transparent,
                        ), // Divider between rows except the last one
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Page ${_currentPage + 1} of $numPages',
            style: AppTypography.countryText,
          ),
          const SizedBox(height: 8),
          NumberPaginator(
            showNextButton: true,
            showPrevButton: true,
            numberPages: numPages,
            onPageChange: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            initialPage: _currentPage,
            config: const NumberPaginatorUIConfig(
              buttonShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              buttonSelectedBackgroundColor: AppColors.primaryColor,
              buttonUnselectedForegroundColor: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

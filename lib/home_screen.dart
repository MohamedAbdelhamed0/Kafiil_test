import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafill_test/mian_screens/who_i_am_screen.dart';
import 'package:kafill_test/core/typography.dart';

import 'core/colors.dart';
import 'mian_screens/countries_screen.dart';
import 'mian_screens/services_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const WhoIAmScreen(),
    const CountriesScreen(),
    const ServicesScreen(),
  ];

  static const List<String> _titles = [
    'Who I Am',
    'Countries',
    'Services',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          _titles[_selectedIndex],
          style: AppTypography.appBarText,
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.circleUser),
            label: 'Who I Am',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.earthAmericas),
            label: 'Countries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Services',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedLabelStyle: AppTypography.bottomNavigationBar,
        unselectedLabelStyle: AppTypography.bottomNavigationBar,
        selectedItemColor: AppColors.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

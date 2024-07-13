import 'package:flutter/material.dart';
import 'package:kafill_test/core/colors.dart';
import 'package:kafill_test/core/typography.dart';
import 'auth_screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            titleTextStyle: AppTypography.appBarText,
            scrolledUnderElevation: 0),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor, // Bright blue
          brightness: Brightness.light, // Choose between light and dark theme
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

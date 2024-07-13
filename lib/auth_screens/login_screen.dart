import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kafill_test/core/colors.dart';
import 'package:kafill_test/auth_screens/register_screen.dart';
import 'package:kafill_test/core/typography.dart';
import 'package:kafill_test/widgets/custom_elevated_button.dart';
import 'package:kafill_test/widgets/custom_form_field.dart';

import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() {
    _emailController.text = 'john.doe@example.com';
    _passwordController.text = 'password123';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('Account Login'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            child: Text(
              'Skip',
              style: AppTypography.textButtonText,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            const Image(
              image: AssetImage('assets/images/Login-cuate 1.png'),
              width: 225,
              height: 225,
            ),
            const SizedBox(height: 16),
            CustomFormField(
              label: 'Email',
              controller: _emailController,
            ),
            const SizedBox(height: 16),
            CustomFormField(
              label: 'Password',
              isPassword: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.greyColor)),
                  activeColor: AppColors.primaryColor,
                  value: _rememberMe,
                  onChanged: (bool? value) {
                    setState(() {
                      _rememberMe = value ?? false;
                    });
                  },
                ),
                Text(
                  'Remember Me',
                  style: AppTypography.smallText.copyWith(fontSize: 12),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // Handle forgot password
                  },
                  child: Text(
                    'Forgot Password?',
                    style: AppTypography.smallText.copyWith(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomElevatedButton(
              onPressed: () {
                // Handle login logic
              },
              text: 'Login',
            ),
            const SizedBox(height: 16),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: AppTypography.smallText,
                  children: [
                    TextSpan(
                      text: 'Register',
                      style: AppTypography.textButtonText,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrationScreen(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

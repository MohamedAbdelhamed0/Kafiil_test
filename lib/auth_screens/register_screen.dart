import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafill_test/core/colors.dart';
import 'package:kafill_test/widgets/circular_avatar_with_add_button.dart';
import 'package:kafill_test/widgets/custom_elevated_button.dart';
import 'package:kafill_test/widgets/custom_form_field.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:kafill_test/widgets/favorite_social_media.dart';
import 'package:kafill_test/widgets/gender_selection.dart';
import 'package:kafill_test/widgets/skill_chip.dart';
import 'package:kafill_test/widgets/salary_widget.dart';

import '../home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _userTypeController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  int _currentStep = 0;
  int _emptyFieldsCount = 0;
  bool _showValidationMessage = false;
  late PageController _pageController;

  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentStep);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _showTemporaryMessage() {
    setState(() {
      _showValidationMessage = true;
    });
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _showValidationMessage = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: Column(
        children: [
          if (_showValidationMessage)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Color(0xFFFFF0ED),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.error_outline,
                        color: Color(0xFFF56342), size: 20),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Fill the required fields ($_emptyFieldsCount)',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          EasyStepper(
            activeStepBorderColor: AppColors.primaryColor,
            borderThickness: 5,
            activeStepBorderType: BorderType.normal,
            activeStep: _currentStep,
            fitWidth: true,
            activeStepTextColor: AppColors.primaryColor,
            finishedStepTextColor: AppColors.primaryColor,
            unreachedStepBorderType: BorderType.normal,
            lineStyle: LineStyle(
                lineLength: MediaQuery.sizeOf(context).width / 3,
                lineThickness: 2,
                activeLineColor: AppColors.primaryColor,
                finishedLineColor: AppColors.primaryColor,
                lineType: LineType.normal),
            internalPadding: 0,
            stepRadius: 20,
            finishedStepBackgroundColor: AppColors.primaryColor,
            activeStepIconColor: AppColors.primaryColor,
            finishedStepIconColor: Colors.white,
            showLoadingAnimation: false,
            enableStepTapping: false,
            steps: const [
              EasyStep(
                finishIcon: Icon(Icons.done),
                topTitle: true,
                icon: Icon(FontAwesomeIcons.one),
                title: 'Register',
              ),
              EasyStep(
                finishIcon: Icon(Icons.done),
                topTitle: true,
                icon: Icon(FontAwesomeIcons.two),
                title: 'Complete Data',
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentStep = index;
                });
              },
              children: [
                _buildRegisterStep(),
                _buildCompleteDataStep(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentStep > 0)
                  Expanded(
                    child: CustomElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentStep -= 1;
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        });
                      },
                      text: 'Previous',
                    ),
                  ),
                if (_currentStep > 0)
                  const SizedBox(width: 16), // Add space between buttons
                Expanded(
                  child: CustomElevatedButton(
                    onPressed: () {
                      if (_currentStep < 1) {
                        if (_formKey1.currentState!.validate()) {
                          setState(() {
                            _currentStep += 1;
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          });
                        } else {
                          _validateFields();
                          _showTemporaryMessage();
                        }
                      } else {
                        if (_formKey2.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        } else {
                          _validateFields();
                          _showTemporaryMessage();
                        }
                      }
                    },
                    text: _currentStep == 1 ? 'Submit' : 'Next',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _validateFields() {
    int emptyCount = 0;
    if (_firstNameController.text.isEmpty) emptyCount++;
    if (_lastNameController.text.isEmpty) emptyCount++;
    if (_emailController.text.isEmpty) emptyCount++;
    if (_passwordController.text.isEmpty) emptyCount++;
    if (_confirmPasswordController.text.isEmpty) emptyCount++;
    if (_userTypeController.text.isEmpty) emptyCount++;
    if (_dobController.text.isEmpty) emptyCount++;
    if (_descriptionController.text.isEmpty) emptyCount++;
    setState(() {
      _emptyFieldsCount = emptyCount;
    });
  }

  Widget _buildRegisterStep() {
    return Form(
      key: _formKey1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 9,
                  child: CustomFormField(
                    label: 'First Name',
                    isPassword: false,
                    controller: _firstNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                ),
                const Spacer(flex: 1),
                Expanded(
                  flex: 9,
                  child: CustomFormField(
                    label: 'Last Name',
                    controller: _lastNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomFormField(
              label: 'Email',
              isPassword: false,
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomFormField(
              label: 'Password',
              isPassword: true,
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomFormField(
              label: 'Confirm Password',
              isPassword: true,
              controller: _confirmPasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != _passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomFormField(
              label: 'User Type',
              isDropdown: true,
              dropdownItems: const ['Admin', 'User', 'Guest'],
              controller: _userTypeController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a user type';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompleteDataStep() {
    return Form(
      key: _formKey2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: CircularAvatarWithAddButton(
                size: 100.0,
                imageUrl:
                    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                onAdd: () {},
              ),
            ),
            const SizedBox(height: 16),
            CustomFormField(
              label: 'About',
              isMultiLine: true,
              controller: _descriptionController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a About';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            const CounterWidget(),
            const SizedBox(height: 16),
            CustomFormField(
              label: 'Date of Birth',
              isDate: true,
              controller: _dobController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your date of birth';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            GenderSelection(
              label: 'Gender',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            const SkillsCounter(),
            const SizedBox(height: 16),
            const FavoriteSocialMedia(),
          ],
        ),
      ),
    );
  }
}

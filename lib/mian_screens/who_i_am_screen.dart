import 'package:flutter/material.dart';
import 'package:kafill_test/widgets/circular_avatar_with_add_button.dart';
import 'package:kafill_test/widgets/custom_elevated_button.dart';
import 'package:kafill_test/widgets/custom_form_field.dart';
import 'package:kafill_test/widgets/favorite_social_media.dart';
import 'package:kafill_test/widgets/gender_selection.dart';
import 'package:kafill_test/widgets/skill_chip.dart';

class WhoIAmScreen extends StatefulWidget {
  const WhoIAmScreen({super.key});

  @override
  WhoIAmScreenState createState() => WhoIAmScreenState();
}

class WhoIAmScreenState extends State<WhoIAmScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() {
    _firstNameController.text = 'John   b';
    _lastNameController.text = 'Doe';
    _emailController.text = 'john.doe@example.com';
    _passwordController.text = 'password123';
    _aboutController.text =
        'I am a Flutter developer with 5 years of experience.';
    _salaryController.text = '50000';
    _birthDateController.text = '1990-01-01';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Center(
            child: CircularAvatarWithAddButton(
              size: 100.0,
              imageUrl:
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              onAdd: () {
                // Handle the add button tap
              },
            ),
          ),
          const SizedBox(height: 35),
          Row(
            children: [
              Expanded(
                flex: 9,
                child: CustomFormField(
                  label: 'First Name',
                  controller: _firstNameController,
                ),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 9,
                child: CustomFormField(
                  label: 'Last Name',
                  controller: _lastNameController,
                ),
              ),
            ],
          ),
          buildSizedBox(),
          CustomFormField(
            label: 'Email',
            controller: _emailController,
          ),
          buildSizedBox(),
          CustomFormField(
            label: 'Password',
            isPassword: true,
            controller: _passwordController,
          ),
          buildSizedBox(),
          CustomFormField(
            isMultiLine: true,
            label: 'About',
            controller: _aboutController,
          ),
          buildSizedBox(),
          CustomFormField(
            label: 'Salary',
            controller: _salaryController,
          ),
          buildSizedBox(),
          CustomFormField(
            label: 'BirthDate',
            isDate: true,
            controller: _birthDateController,
          ),
          buildSizedBox(),
          GenderSelection(
            label: 'Gender',
            onChanged: (value) {},
          ),
          buildSizedBox(),
          const SkillsCounter(),
          buildSizedBox(),
          const FavoriteSocialMedia(),
          buildSizedBox(),
          CustomElevatedButton(onPressed: () {}, text: 'Submit')
        ],
      ),
    );
  }

  SizedBox buildSizedBox() {
    return const SizedBox(height: 16);
  }
}

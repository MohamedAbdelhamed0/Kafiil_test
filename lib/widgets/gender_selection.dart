import 'package:flutter/material.dart';
import 'package:kafill_test/core/colors.dart';
import 'package:kafill_test/widgets/custom_form_field.dart';

class GenderSelection extends StatefulWidget {
  final String label;
  final ValueChanged<String> onChanged;

  const GenderSelection(
      {super.key, required this.label, required this.onChanged});

  @override
  GenderSelectionState createState() => GenderSelectionState();
}

class GenderSelectionState extends State<GenderSelection> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextAboveFormField(label: widget.label),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: const Text('Male'),
                value: 'Male',
                groupValue: _selectedGender,
                activeColor: AppColors.primaryColor,
                fillColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.primaryColor;
                  }
                  return Colors.grey;
                }),
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                    widget.onChanged(value!);
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: const Text('Female'),
                value: 'Female',
                groupValue: _selectedGender,
                activeColor: AppColors.primaryColor,
                fillColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.primaryColor;
                  }
                  return Colors.grey;
                }),
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                    widget.onChanged(value!);
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

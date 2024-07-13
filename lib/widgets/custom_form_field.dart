import 'package:flutter/material.dart';
import 'package:kafill_test/core/colors.dart';
import 'package:intl/intl.dart';

import '../core/typography.dart';

class CustomFormField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final bool isDate;
  final bool isMultiLine; // New parameter to support multi-line text input
  final bool isDropdown; // New parameter to support dropdown
  final TextEditingController controller;
  final List<String>? dropdownItems; // Items for the dropdown
  final String? Function(String?)? validator; // Validator function

  const CustomFormField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.isDate = false,
    this.isMultiLine = false, // Default is false
    this.isDropdown = false, // Default is false
    required this.controller,
    this.dropdownItems, // Dropdown items are optional
    this.validator, // Validator function
  });

  @override
  CustomFormFieldState createState() => CustomFormFieldState();
}

class CustomFormFieldState extends State<CustomFormField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextAboveFormField(label: widget.label),
        const SizedBox(
          height: 8,
        ),
        widget.isDropdown
            ? DropdownButtonFormField<String>(
                value: widget.controller.text.isEmpty
                    ? null
                    : widget.controller.text,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: AppColors.darkGreyColor,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: AppColors.darkGreyColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: AppColors.darkGreyColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: AppColors.darkGreyColor)),
                ),
                items: widget.dropdownItems!
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    widget.controller.text = value!;
                  });
                },
                validator: widget.validator ??
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select ${widget.label}';
                      }
                      return null;
                    },
              )
            : TextFormField(
                style: AppTypography.insideFromFieldText,
                cursorColor: AppColors.primaryColor,
                controller: widget.controller,
                obscureText: widget.isPassword ? _isObscured : false,
                readOnly: widget.isDate,
                maxLines: widget.isMultiLine
                    ? 5
                    : 1, // Allow up to 5 lines for multi-line input
                minLines: widget.isMultiLine ? 1 : 1, // Minimum 1 line
                decoration: InputDecoration(
                  disabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: AppColors.darkGreyColor)),
                  filled: true,
                  fillColor: AppColors.darkGreyColor,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: AppColors.darkGreyColor)),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: AppColors.darkGreyColor)),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: AppColors.darkGreyColor)),
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                        )
                      : widget.isDate
                          ? IconButton(
                              icon: const Icon(Icons.calendar_today),
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );
                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  setState(() {
                                    widget.controller.text = formattedDate;
                                  });
                                }
                              },
                            )
                          : null,
                ),
                keyboardType: widget.isPassword
                    ? TextInputType.text
                    : widget.isDate
                        ? TextInputType.datetime
                        : widget.isMultiLine
                            ? TextInputType.multiline
                            : TextInputType.emailAddress,
                validator: widget.validator ??
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter ${widget.label}';
                      }
                      if (widget.isPassword && value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      if (!widget.isPassword &&
                          !widget.isDate &&
                          !widget.isMultiLine &&
                          !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
              ),
      ],
    );
  }
}

class TextAboveFormField extends StatelessWidget {
  const TextAboveFormField({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: AppTypography.labelText,
    );
  }
}

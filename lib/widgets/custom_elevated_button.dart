import 'package:flutter/material.dart';
import 'package:kafill_test/core/colors.dart';
import '../core/typography.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomElevatedButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
            fixedSize: WidgetStatePropertyAll(Size(double.infinity, 50))),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTypography.elevatedButtonText,
        ),
      ),
    );
  }
}

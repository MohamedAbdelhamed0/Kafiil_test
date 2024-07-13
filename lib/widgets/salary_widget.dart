import 'package:flutter/material.dart';

import '../core/colors.dart';
import '../core/typography.dart';
import 'custom_form_field.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  CounterWidgetState createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;
  bool _isIncreasing = false;
  bool _isDecreasing = false;

  void _startIncreasing() {
    _isIncreasing = true;
    _increaseCounter();
  }

  void _stopIncreasing() {
    _isIncreasing = false;
  }

  void _increaseCounter() async {
    while (_isIncreasing) {
      setState(() {
        _counter++;
      });
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  void _startDecreasing() {
    _isDecreasing = true;
    _decreaseCounter();
  }

  void _stopDecreasing() {
    _isDecreasing = false;
  }

  void _decreaseCounter() async {
    while (_isDecreasing) {
      setState(() {
        _counter--;
      });
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextAboveFormField(label: 'salary'),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: AppColors.darkGreyColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _counter--;
                  });
                },
                onLongPress: _startDecreasing,
                onLongPressEnd: (_) => _stopDecreasing(),
                child: Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'SAR $_counter',
                  style: AppTypography.salaryText,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _counter++;
                  });
                },
                onLongPress: _startIncreasing,
                onLongPressEnd: (_) => _stopIncreasing(),
                child: Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

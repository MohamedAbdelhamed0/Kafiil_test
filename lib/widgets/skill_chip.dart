import 'package:flutter/material.dart';
import 'package:kafill_test/core/colors.dart';

import '../core/typography.dart';
import 'custom_form_field.dart';

class SkillChip extends StatelessWidget {
  final String skill;
  final VoidCallback onDelete;

  const SkillChip({super.key, required this.skill, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Chip(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.transparent)),
      backgroundColor: AppColors.accentColor,
      label: Text(
        skill,
        style: AppTypography.chipText,
      ),
      deleteIcon: const Center(
        child: Icon(
          Icons.close,
          size: 12,
          color: AppColors.primaryColor,
        ),
      ),
      onDeleted: onDelete,
    );
  }
}

class SkillsCounter extends StatefulWidget {
  const SkillsCounter({super.key});

  @override
  SkillsCounterState createState() => SkillsCounterState();
}

class SkillsCounterState extends State<SkillsCounter> {
  final List<String> _skills = ['Flutter', 'Dart', 'Firebase', 'REST API'];

  void _deleteSkill(String skill) {
    setState(() {
      _skills.remove(skill);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextAboveFormField(label: 'Skills'),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.darkGreyColor,
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              children: _skills.isEmpty
                  ? [
                      Text(
                        'No skills',
                        style: AppTypography.chipText
                            .copyWith(color: AppColors.primaryColor),
                      )
                    ]
                  : _skills.map((skill) {
                      return SkillChip(
                        skill: skill,
                        onDelete: () => _deleteSkill(skill),
                      );
                    }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

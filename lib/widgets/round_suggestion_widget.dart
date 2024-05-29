import 'package:flutter/material.dart';
import 'package:flutter_hiring_task/utils/app_colors.dart';

class RoundSuggestionWidget extends StatelessWidget {
  final String text;
  const RoundSuggestionWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.redColor)),
      child: Text(
        text,
        style: const TextStyle(color: AppColors.redColor, fontSize: 12),
      ),
    );
  }
}

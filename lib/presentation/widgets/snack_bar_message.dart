import 'package:arabicinyourhands/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SnackBarMessage extends StatelessWidget {
  const SnackBarMessage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(
        fontSize: 18,
        color: AppColors.whiteColor,
      ),
    );
  }
}

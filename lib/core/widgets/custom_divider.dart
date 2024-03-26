import 'package:chat_gpt/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.3,
      margin: const EdgeInsets.only(bottom: 20),
      color: AppColors.white.withOpacity(0.6),
    );
  }
}

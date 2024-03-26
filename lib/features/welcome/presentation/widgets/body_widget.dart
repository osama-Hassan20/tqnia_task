import 'package:tqnia_task/core/utils/app_colors.dart';
import 'package:tqnia_task/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.5,vertical: 12),
        child: Text(
          text,
          style: AppStyles.styleBold18(context),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
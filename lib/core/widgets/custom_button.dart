import 'package:chat_gpt/core/utils/app_colors.dart';
import 'package:chat_gpt/core/utils/app_styles.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onPressed});

  final String text;
  final VoidCallback? onPressed ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          backgroundColor: AppColors.green,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyles.styleBold18(context),
        ),
      ),
    );
  }
}

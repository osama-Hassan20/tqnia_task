import 'package:tqnia_task/core/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class AppBarBack extends StatelessWidget {
  const AppBarBack({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all( 20.0),
      child: Row(
        children: [
          IconButton(
            onPressed:onPressed,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
              weight: 6.75,
            ),
          ),
          Text(
            'Back',
            style: AppStyles.styleSemiBold16(context),
          ),
          const Spacer(),
          Image.asset(
            AppAssets.logo,
            width: 24,
            height: 24,
          )
        ],
      ),
    );
  }
}

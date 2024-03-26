import 'package:tqnia_task/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'welcome_list.dart';

class CustomIndicator extends StatelessWidget {
  CustomIndicator({Key? key, required this.welcomeController})
      : super(key: key);
  var welcomeController = PageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SmoothPageIndicator(
        controller: welcomeController,
        count: welcome.length,
        effect: const ExpandingDotsEffect(
          activeDotColor: AppColors.green,
          dotColor: Colors.grey,
          dotHeight: 2,
          expansionFactor: 1.01,
          dotWidth: 28,
          spacing: 12,
        ),
      ),
    );
  }
}

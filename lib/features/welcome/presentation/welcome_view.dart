import 'package:tqnia_task/core/utils/app_colors.dart';
import 'package:tqnia_task/features/welcome/presentation/widgets/welcome_view_body.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: AppColors.gray,
      body: WelcomeViewBody(),
    );
  }
}

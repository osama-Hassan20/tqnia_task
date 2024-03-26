import 'package:tqnia_task/core/utils/app_images.dart';
import 'package:tqnia_task/core/utils/app_styles.dart';
import 'package:tqnia_task/features/dashboard/presentation/dashboard_view.dart';
import 'package:tqnia_task/features/welcome/presentation/welcome_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/controllers/navigate.dart';
import '../../../../core/controllers/var.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goToNextView();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppAssets.logo),
        const SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ChatGPT',style: AppStyles.styleBold40(context),),
          ],
        )
      ],
    );
  }
  void goToNextView(){
    if(welcome != null ){
          nextSplashWidget = const DashboardView();
    }else{
      nextSplashWidget = const WelcomeView();
    }
    Future.delayed(const Duration(seconds: 3),(){
      navigateAndFinish(context, nextSplashWidget);
    }
    );
  }
}

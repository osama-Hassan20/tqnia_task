import 'package:tqnia_task/core/utils/app_images.dart';
import 'package:tqnia_task/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Image.asset(AppAssets.logo,width: 24,height: 24,),
        const SizedBox(height: 20,),
        Text('Welcome to',style: AppStyles.styleBold32(context),),
        Text('ChatGPT',style: AppStyles.styleBold32(context),),
        const SizedBox(height: 20,),
        Text('Ask anything, get yout answer',style: AppStyles.styleSemiBold16(context),),

      ],
    );
  }
}

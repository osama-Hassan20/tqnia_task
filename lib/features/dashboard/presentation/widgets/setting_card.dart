import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({
    super.key, required this.text, required this.image, required this.onTap, this.news = false,
  });
  final String text;
  final String image;
  final GestureTapCallback onTap;
  final bool? news;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: ListTile(
        leading: Image.asset(image,width: 20,height: 20,),
        title: Text(text,style: text=='Logout' ? AppStyles.styleMedium16(context).copyWith(color: AppColors.red):AppStyles.styleMedium16(context),),
        trailing: news ==true ? Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.orange,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 0.5),
          child: Text('NEW',style: AppStyles.styleSemiBold12(context),),): const SizedBox(),
      ),
    );
  }
}
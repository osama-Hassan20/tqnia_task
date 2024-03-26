
import 'package:tqnia_task/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

Widget buildMyMessage({required BuildContext context , required String message}) => Align(
  alignment: AlignmentDirectional.centerEnd,
  child: Container(
      width: double.infinity,
      margin: const EdgeInsets.only(right: 20,left: 80,top: 16,bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(8.0),
          topStart: Radius.circular(8.0),
          bottomStart: Radius.circular(8.0),
        ),
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message,style: AppStyles.styleSemiBold16(context),),
        ],
      )),
);
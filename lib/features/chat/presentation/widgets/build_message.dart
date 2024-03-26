import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:tqnia_task/core/utils/app_colors.dart';
import 'package:tqnia_task/core/utils/app_images.dart';
import 'package:tqnia_task/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/utils/app_styles.dart';

Widget buildMessage(
        {required BuildContext context,
        required String message,
        isLoading = false}) =>
    Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Container(
              // width: double.infinity,
              margin: const EdgeInsets.only(
                  left: 20, right: 60, top: 16, bottom: 12),
              padding: isLoading == true
                  ? const EdgeInsets.symmetric(
                      horizontal: 12,
                    )
                  : const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.20),
                borderRadius: const BorderRadiusDirectional.only(
                  topEnd: Radius.circular(8.0),
                  topStart: Radius.circular(8.0),
                  bottomEnd: Radius.circular(8.0),
                ),
              ),
              child: isLoading == true
                  ? LoadingAnimationWidget.waveDots(
                      color: AppColors.white,
                      size: 40,
                    )
                  : AnimatedTextKit(
                isRepeatingAnimation:false,
                  animatedTexts: [
                      TyperAnimatedText(
                        message,
                        textStyle: AppStyles.styleSemiBold16(context),
                      ),
                    ])
              // Text(
              //   message,
              //         style: AppStyles.styleSemiBold16(context),
              //       ),
              ),
        ),
        isLoading == false
            ? Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.thumb_up_alt_outlined,
                      color: AppColors.white.withOpacity(0.20),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.thumb_down_alt_outlined,
                      color: AppColors.white.withOpacity(0.20),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Image.asset(
                    AppAssets.copy,
                    width: 12,
                    height: 12,
                    color: AppColors.white.withOpacity(0.20),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        'Copy',
                        style: AppStyles.styleSemiBold14(context),
                      ))
                ],
              )
            : const SizedBox.shrink(),
      ],
    );

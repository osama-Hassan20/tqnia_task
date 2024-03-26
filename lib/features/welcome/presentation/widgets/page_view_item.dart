import 'package:tqnia_task/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import '../../domain/models/on_bording_model.dart';
import 'body_widget.dart';

Widget buildPageViewItem(BoardingModel model, context) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
                  model.image,
                  height: 20,
                ),
        const SizedBox(height: 10,),
        Text(
          model.title,
          style: AppStyles.styleMedium20(context),
        ),
        const SizedBox(height: 40,),
        ListView.separated(
          shrinkWrap: true,
          itemCount: model.body.length,
          itemBuilder: (context, index) {
            return BodyWidget(text: model.body[index]);
          },
          separatorBuilder: (context, index) =>const SizedBox(height: 20,),
        )
      ],
    );



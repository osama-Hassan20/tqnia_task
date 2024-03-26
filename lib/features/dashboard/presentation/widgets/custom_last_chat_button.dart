import 'package:tqnia_task/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_menu.dart';

class CustomLastChatButton extends StatelessWidget {
  const CustomLastChatButton({
    super.key, required this.chat,
  });
  final Map chat;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.messenger_outline,color: AppColors.white,),
              const SizedBox(width: 20,),
              Text(chat['message'],style: AppStyles.styleMedium16(context),),
              const Spacer(),
              GestureDetector(
                  onTapUp: (details) async {
                      double dx = details.globalPosition.dx;
                      double dy = details.globalPosition.dy;
                      double dx2 = MediaQuery.of(context).size.width - dx;
                      double dy2 = MediaQuery.of(context).size.width - dy;
                      await showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                          items: [
                            MyPopupMenuItem(
                              onClick: () {
                                Navigator.pop(context);
                              },
                              childWidget: Text('Edit'),
                            ),
                            MyPopupMenuItem(
                              onClick: () {
                                Navigator.pop(context);
                              },
                              childWidget: Text('Delete'),
                            ),
                          ]
                      );

                  },
                  child: const Icon(Icons.more_vert_outlined,color: AppColors.white,)),
              const Icon(Icons.arrow_forward_ios,color: AppColors.white,),
            ],
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
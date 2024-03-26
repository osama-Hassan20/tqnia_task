import 'package:tqnia_task/core/controllers/navigate.dart';
import 'package:tqnia_task/core/utils/app_styles.dart';
import 'package:tqnia_task/features/chat/chat_view.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class CustomNewChatButton extends StatelessWidget {
  const CustomNewChatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              navigateTo(context, const ChatView(),);
            },
            child: Row(
              children: [
                const Icon(
                  Icons.messenger_outline,
                  color: AppColors.white,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'New Chat',
                  style: AppStyles.styleBold16(context),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.white,
                ),
              ],
            ),
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

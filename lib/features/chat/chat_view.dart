import 'package:tqnia_task/core/utils/app_colors.dart';
import 'package:tqnia_task/features/chat/presentation/manager/cubit/cubit.dart';
import 'package:tqnia_task/features/chat/presentation/widgets/chat_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.gray,
      body: SafeArea(
        child: const ChatViewBody(),
      ),
    );
  }
}

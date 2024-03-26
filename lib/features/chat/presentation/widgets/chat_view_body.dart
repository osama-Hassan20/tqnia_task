import 'package:tqnia_task/core/utils/app_colors.dart';
import 'package:tqnia_task/core/utils/app_images.dart';
import 'package:tqnia_task/core/utils/app_styles.dart';
import 'package:tqnia_task/core/widgets/custom_divider.dart';
import 'package:tqnia_task/features/chat/presentation/manager/db_cubit/db_states.dart';
import 'package:tqnia_task/features/chat/presentation/widgets/appbar_back.dart';
import 'package:tqnia_task/features/chat/presentation/widgets/build_my_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/chat_model.dart';
import '../manager/cubit/cubit.dart';
import '../manager/cubit/state.dart';
import '../manager/db_cubit/db_cubit.dart';
import 'build_message.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    ScrollController scrollController = ScrollController();
    FocusNode focusNode = FocusNode();
    void scrollToEnd(){
      scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(seconds: 2), curve: Curves.easeOut);
    }
    return BlocConsumer<ChatCubit , ChatStates>(
        listener: (context, state) {
          if(state is SendMessageSuccessState){
            scrollToEnd();
          }
        },
    builder: (context, state) {
      var cubit = ChatCubit.get(context);
          return Column(
            children: [
              AppBarBack(
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const CustomDivider(),
              Flexible(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: cubit.chatList.length,
                  itemBuilder: (context, index) {
                    return index % 2 == 0
                        ? buildMyMessage(context: context , message: cubit.chatList[index].msg)
                        : buildMessage(context: context , message: cubit.chatList[index].msg);
                  },
                ),
              ),
              // LoadingAnimationWidget.staggeredDotsWave(
              //   color: AppColors.white,
              //   size: 16,
              // ),
              if(state is SendMessageLoadingState)
                buildMessage(context: context, isLoading: true,message: ''),

              // buildMyMessage(context),
              //  buildMessage(context),

              // const Spacer(),
              Container(
                height: 52,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.white.withOpacity(0.32),
                      width: 1,
                    )),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: TextFormField(
                          controller: messageController,
                          style: AppStyles.styleSemiBold16(context),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          cursorHeight: 28,
                          // autofocus: true,
                          focusNode: focusNode,
                          cursorColor: AppColors.white,
                        ),
                      ),
                    ),
                    BlocBuilder<DataBaseCubit , DataBaseStates>(
                      builder: (context , state){
                        return Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                              color: AppColors.green,
                              borderRadius: BorderRadius.circular(8)),
                          child: MaterialButton(
                              minWidth: 1.0,
                              onPressed: () async {
                                if(state is SendMessageLoadingState){
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text('You can\'t send multiple messages at same time'),
                                    backgroundColor: AppColors.green,
                                  ),);
                                }
                                if(messageController.text != ''){
                                  cubit.chatList.add(ChatModel(
                                    msg: messageController.text,
                                    chatIndex: 1,
                                  ),);

                                  await cubit.sendMessage(context: context,
                                    message: messageController.text,
                                  );
                                  focusNode.unfocus();
                                  DataBaseCubit.get(context).insertChat(message: messageController.text, boot: cubit.lastMessage!);
                                  messageController.clear();
                                }
                                // DioHelper.getData(url: MODELS);
                                // print(DioHelper.getData(url: MODELS).toString());
                                // if (cubit.chatImage != null) {
                                //   cubit.uploadImageMessage(
                                //       receiverId: userModel.uId!,
                                //       dateTime: DateTime.now().toString(),
                                //       text: messageController.text);
                                //   cubit.removeChatImage();
                                // }
                                // if (messageController.text != '') {
                                //   SocialCubit.get(context).sendMessage(
                                //     receiverId: userModel.uId!,
                                //     dateTime: DateTime.now().toString(),
                                //     text: messageController.text,
                                //   );
                                //   messageController.text = '';
                                // }
                              },
                              child: Image.asset(
                                AppAssets.send,
                              )),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
    }
    );
  }
}

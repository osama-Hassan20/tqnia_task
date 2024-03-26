import 'dart:developer';

import 'package:tqnia_task/core/controllers/const/api_key.dart';
import 'package:tqnia_task/core/utils/dio_helper.dart';
import 'package:tqnia_task/features/chat/domain/models/chat_model.dart';
import 'package:tqnia_task/features/chat/domain/models/models_model.dart';
import 'package:tqnia_task/features/chat/presentation/manager/cubit/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../db_cubit/db_cubit.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);

  List<ModelsModel>? modelsModel;

  Future<void> getModel() async {
    emit(GetModelsLoadingState());
    await DioHelper.getData(
      url: MODELS,
    ).then((value) {
      if (kDebugMode) {
        print(value.data);
      }
      List<ModelsModel> temp = [];
      for (var i in value.data['data']) {
        temp.add(i);
        log('temp = ${i['id']}');
      }
      modelsModel = ModelsModel.modelsFromSnapshot(temp);
      emit(GetModelsSuccessState());
    }).catchError((error) {
      log(
        error.toString(),
      );

      emit(GetModelsErrorState());
    });
  }

  ChatModel? chatModel;
  List<ChatModel> chatList = [];
  String? lastMessage;
  Future<void> sendMessage({required String message,required BuildContext context}) async {
    emit(SendMessageLoadingState());
    await DioHelper.postData(
      url: CHAT,
      data: {
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "user",
            "content": message,
          }
        ],
        "temperature": 0.7,
      },
    ).then((value) {
      // chatModel = ChatModel.fromJson(value.data['']);
      print(
          'chatModel!.msg ============== ${value.data['choices'][0]['message']['content']}');

      // for (var i in value.data['data']) {
      //   chatList.add(i);
      //   log('temp = ${i['id']}');
      // }
      chatList.add(ChatModel(
            msg: value.data['choices'][0]['message']['content'],
            chatIndex: 1,
          ),);
      lastMessage = value.data['choices'][0]['message']['content'];
      // DataBaseCubit.get(context).insertChat(message: message, boot: value.data['choices'][0]['message']['content']);
      // chatList = List.generate(
      //   value.data['choices'].length,
      //   (index) => ChatModel(
      //     msg: value.data['choices'][0]['message']['content'],
      //     chatIndex: 1,
      //   ),
      // );
      print('chatList = ${chatList[0].msg}');
      emit(SendMessageSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('error ${error.toString()}');
      }
      emit(SendMessageErrorState());
    });
  }
}

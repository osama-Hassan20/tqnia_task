import 'package:tqnia_task/core/utils/app_colors.dart';
import 'package:tqnia_task/core/utils/app_images.dart';
import 'package:tqnia_task/core/utils/app_styles.dart';
import 'package:tqnia_task/features/chat/presentation/manager/db_cubit/db_states.dart';
import 'package:tqnia_task/features/dashboard/presentation/widgets/setting_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_divider.dart';
import '../../../chat/presentation/manager/db_cubit/db_cubit.dart';
import 'custom_last_chat_button.dart';
import 'custom_new_chat_button.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBaseCubit, DataBaseStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: SizedBox(
            width: double.infinity,
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: CustomNewChatButton()),
                // Expanded(
                //   child: DataBaseCubit.get(context).allChat.isEmpty ? const SizedBox.shrink() : ListView.builder(
                //     itemBuilder: (context, index) => CustomLastChatButton(
                //         chat: DataBaseCubit.get(context).allChat[index]),
                //     itemCount: DataBaseCubit.get(context).allChat.length,
                //     shrinkWrap: true,
                //   ),
                // ),

                DataBaseCubit.get(context).allChat.isEmpty
                    ? SliverToBoxAdapter(
                        child: SizedBox(
                          child: Text(
                            DataBaseCubit.get(context)
                                .allChat
                                .length
                                .toString(),
                          ),
                        ),
                      )
                    : SliverList.builder(
                        itemCount: DataBaseCubit.get(context).allChat.length,
                        itemBuilder: (context, index) {
                          print(DataBaseCubit.get(context).allChat.length);
                          print('DataBaseCubit.get(context).allChat.length');
                          // return Text('data');
                          return CustomLastChatButton(
                            chat: DataBaseCubit.get(context).allChat[index],
                          );
                        },
                      ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const Expanded(
                        child: SizedBox(
                          height: 20,
                        ),
                      ),
                      const CustomDivider(),
                      SettingCard(
                          text: 'Clear conversations',
                          image: AppAssets.clear,
                          onTap: () {}),
                      SettingCard(
                          text: 'Upgrade to Plus',
                          image: AppAssets.account,
                          news: true,
                          onTap: () {}),
                      SettingCard(
                          text: 'Light mode',
                          image: AppAssets.mode,
                          onTap: () {}),
                      SettingCard(
                          text: 'Updates & FAQ',
                          image: AppAssets.update,
                          onTap: () {}),
                      SettingCard(
                          text: 'Logout',
                          image: AppAssets.logout,
                          onTap: () {}),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:tqnia_task/features/welcome/presentation/widgets/page_view_item.dart';
import 'package:tqnia_task/features/welcome/presentation/widgets/welcome_header.dart';
import 'package:tqnia_task/features/welcome/presentation/widgets/welcome_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_button.dart';
import '../manger/cubit/welcome/welcome_cubit.dart';
import '../manger/cubit/welcome/welcome_states.dart';
import 'custom_indicator.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WelcomeCubit(),
      child: BlocConsumer<WelcomeCubit, WelcomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var welcomeController = PageController();
          var cubit = WelcomeCubit.get(context);

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const WelcomeHeader(),
                  Expanded(
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: welcomeController,
                      onPageChanged: (index) {
                        if (index == welcome.length - 1) {
                          cubit.pageLast(index);
                        } else {
                          cubit.pageNotLast(index);
                        }
                      },
                      itemBuilder: (context, index) =>
                          buildPageViewItem(welcome[index],context),
                      itemCount: welcome.length,
                    ),
                  ),
                  CustomIndicator(welcomeController: welcomeController),
                  CustomButton(
                    onPressed: () {
                      if (cubit.isPageLast) {
                        cubit.submit(context);
                      } else {
                        welcomeController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.easeInOutCubicEmphasized,
                        );
                      }
                    },
                    text: cubit.textButton,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

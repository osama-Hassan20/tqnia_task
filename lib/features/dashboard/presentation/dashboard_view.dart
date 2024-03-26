import 'package:tqnia_task/core/utils/app_colors.dart';
import 'package:tqnia_task/features/dashboard/presentation/widgets/dashboard_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../chat/presentation/manager/db_cubit/db_cubit.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.black,
      body: const SafeArea(
        child: DashboardViewBody(),
      ),
    );
  }
}

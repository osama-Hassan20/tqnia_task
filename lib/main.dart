import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/controllers/blocobserver.dart';
import 'core/controllers/var.dart';
import 'core/utils/cache_helper.dart';
import 'core/utils/dio_helper.dart';
import 'features/chat/presentation/manager/cubit/cubit.dart';
import 'features/chat/presentation/manager/db_cubit/db_cubit.dart';
import 'features/splash/presentation/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  welcome = CacheHelper.getData(key:'welcome');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>DataBaseCubit()..createDatabase(),
        ),
        BlocProvider(
          create: (BuildContext context) => ChatCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily:'Raleway',
        ),
        home: const SplashView(),
      ),
    );
  }
}

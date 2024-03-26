import 'package:tqnia_task/features/dashboard/presentation/dashboard_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/controllers/navigate.dart';
import '../../../../../../core/utils/cache_helper.dart';
import 'welcome_states.dart';

class WelcomeCubit extends Cubit<WelcomeStates> {
  WelcomeCubit() : super(WelcomeInitState());

  static WelcomeCubit get(context) => BlocProvider.of(context);
  bool isPageLast = false;
  int screenIndex = 0;
  String textButton = 'Next';

  void pageLast(index) {
    isPageLast = true;
    screenIndex = index;
    textButton = 'Let\'s Chat';
    emit(PageLast());
  }

  void pageNotLast(index) {
    isPageLast = false;
    screenIndex = index;
    textButton = 'Next';
    emit(NotPageLast());
  }





  void submit(context) {
    CacheHelper.saveData(
        key: 'welcome',
        value: true
    ).then((value)
    {
      if(value!){

        navigateAndFinish(context, const DashboardView());


      }
    });
  }
}

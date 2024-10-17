import 'dart:async';

import 'package:stacked/stacked.dart';


import '../../../app/app.router.dart';
import '../../../app/utils.dart';

class SplashViewModel extends BaseViewModel{
late Timer _timer;
  void startTimer() async {


     _timer = Timer(const Duration(seconds: 7), () async {


      //navigationService.navigateTo(Routes.homeView);

      navigationService.navigateTo(Routes.homeView,);
    });


  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

}
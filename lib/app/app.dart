import 'package:samplemodel/views/screens/alarm/alarm_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../views/screens/home/home_view.dart';
import '../views/screens/splash/splash_view.dart';
import '../views/tools/settings.dart';


@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: AlarmView)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: Settings)
  ],
)
class AppSetup{}
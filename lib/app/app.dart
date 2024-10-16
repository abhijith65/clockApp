import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../views/screens/home/home_view.dart';
import '../views/screens/splash/splash_view.dart';
import '../views/tools/settings.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: HomeView)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class AppSetup{}
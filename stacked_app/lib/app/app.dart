import 'package:stacked_app/ui/views/home/home_view.dart';
import 'package:stacked_app/ui/views/login/login_view.dart';
import 'package:stacked_app/ui/views/splash_screen/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView),
    MaterialRoute(page: LoginPage),
    MaterialRoute(page: HomeView),
    
    
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  
  
  
)
class App {}

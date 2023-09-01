import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future runSplashLogic() async {
    await Future.delayed(const Duration(seconds: 5));

    _navigationService.replaceWithLoginPage();
  }
}

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../application/app/app.locator.dart';
import '../../../../application/app/constants/common.dart';
import '../../../../application/services/url_launcher_service.dart';

class BantuanViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _urlLauncherService = locator<URLLauncherService>();

  void navigateBack() => _navigationService.back();

  void callCallCenter() =>
      _urlLauncherService.call(Common.callCentrePhoneNumber);

  void emailHumasBankRaya() =>
      _urlLauncherService.sendEmail(Common.humasBankRayaEmail);
}

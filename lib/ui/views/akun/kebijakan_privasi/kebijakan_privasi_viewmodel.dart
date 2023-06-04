import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../application/app/app.locator.dart';

class KebijakanPrivasiViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateBack() => _navigationService.back();
}

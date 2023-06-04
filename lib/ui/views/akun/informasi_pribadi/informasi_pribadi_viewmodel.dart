import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../application/app/app.locator.dart';
import '../../../../application/models/user.dart';
import '../../../../application/services/local_db_service.dart';

class InformasiPribadiViewModel extends BaseViewModel {
  final _localDBService = locator<MaksimaLocalDBService>();
  final _navigationService = locator<NavigationService>();

  User? _user;

  User? get user => _user;

  void initialize() => _user = _localDBService.getUser();

  void navigateBack() => _navigationService.back();
}

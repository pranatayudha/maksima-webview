import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';

import '../../../application/app/app.locator.dart';
import '../../../application/app/app.router.dart';
import '../../../application/mixins/login_mixin.dart';
import '../../../application/services/connectivity_service.dart';
import '../../../flavors.dart';

class StartupViewModel extends BaseViewModel with LoginMixin {
  final _placesService = locator<PlacesService>();
  final _connectivityService = locator<ConnectivityService>();

  Future runStartupLogic() async {
    final connectivityResult = await _connectivityService.checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      navigationService.replaceWith(Routes.noNetwork);
    } else {
      _placesService.initialize(apiKey: F.variables['googleAPIKey'] as String);

      final hasUser = localDBService.maksimaUserBoxIsNotEmpty();

      if (hasUser) {
        await setTimeout(
          callback: navigationService.replaceWith(Routes.mainView),
        );
      } else {
        await setTimeout(
          callback: navigationService.replaceWith(Routes.loginView),
        );
      }
    }
  }

  Future<void> setTimeout({required callback}) async {
    Timer(
      const Duration(seconds: 5),
      () async => await callback,
    );
  }
}

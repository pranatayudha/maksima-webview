import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../application/app/app.locator.dart';
import '../../../flavors.dart';
import '../../../infrastructure/apis/user_api.dart';
import '../../infrastructure/apis/ritel_generate_token_api.dart';
import '../app/app.router.dart';
import '../enums/dialog_type.dart';
import '../services/local_db_service.dart';

mixin LoginMixin on BaseViewModel {
  final navigationService = locator<NavigationService>();
  final localDBService = locator<MaksimaLocalDBService>();
  final _userAPI = locator<UserAPI>();
  final _dialogService = locator<DialogService>();
  final _generateTokenAPI = locator<RitelGenerateTokenAPI>();
  String? personalNumber;
  String? password;

  Future login() async {
    final response = await runBusyFuture(_userAPI.loginSSO(
      userId: personalNumber,
      password: password,
      ipAddress: F.variables['ipAddress'] as String,
    ));

    response.fold(
      (errorMessage) {
        localDBService.removeToken();
        _showLoginErrorDialog(errorMessage);
      },
      (user) async {
        if (user.accessLevel != '10' && F.appFlavor != Flavor.STAGE) {
          runBusyFuture(_userAPI.logoutSSO(
            userId: user.userId,
            loginTicket: user.loginTicket,
          ));

          await _showLoginErrorDialog(
            'Mohon maaf, Pinang Maksima hanya dapat diakses oleh AO (Account Officer) yang sudah dimapping saja.',
          );

          await navigationService.replaceWith(Routes.loginView);
        } else {
          final responseMaksimaToken = await runBusyFuture(
            _generateTokenAPI.generateToken(
              user: user,
            ),
          );

          responseMaksimaToken.fold(
            (err) {
              localDBService.removeUser();
              localDBService.removeToken();
              localDBService.ritelRemoveToken();
              _showLoginErrorDialog(err);
            },
            (success) async {
              navigationService.replaceWith(Routes.mainView);
            },
          );
        }
      },
    );
  }

  Future _showLoginErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Login Gagal',
      description: errorMessage,
      mainButtonTitle: 'COBA LAGI',
    );
  }
}

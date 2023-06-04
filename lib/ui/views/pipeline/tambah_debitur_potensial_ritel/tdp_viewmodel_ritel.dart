import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../application/app/app.locator.dart';
import '../../../../application/app/app.router.dart';

class TDPViewModelRitel extends FutureViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Future futureToRun() async {}

  Future refreshData() async {
    notifyListeners();
  }

  void navigateToTDPPerorangan() => _navigationService.navigateTo(
        Routes.tDPPeroranganViewRitel,
        arguments: const TDPPeroranganViewRitelArguments(
          fromPipelineDetailsView: false,
          fromTDPViewRitel: true,
        ),
      );

  void navigateToTDPPerusahaanCv() => _navigationService.navigateTo(
        Routes.tDPPerusahaanCvViewRitel,
        arguments: const TDPPerusahaanCvViewRitelArguments(
          fromPipelineDetailsView: false,
          fromTDPViewRitel: true,
        ),
      );

  void navigationToTDDPerusahaanPt() => _navigationService.navigateTo(
        Routes.tDPPerusahaanPtViewRitel,
        arguments: const TDPPerusahaanPtViewRitelArguments(
          fromPipelineDetailsView: false,
          fromTDPViewRitel: true,
        ),
      );

  void navigateToMainView() =>
      _navigationService.clearStackAndShow(Routes.mainView);
}

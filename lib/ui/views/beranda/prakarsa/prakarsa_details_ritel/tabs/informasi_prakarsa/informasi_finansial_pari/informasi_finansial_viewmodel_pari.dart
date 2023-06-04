import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../application/models/ritel_informasi_finansial_menu_stepper_pari.dart';
import '../../../../../../../../infrastructure/apis/ritel_prakarsa_api.dart';

class InformasiFinansialViewModelPari extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final RitelPrakarsaAPI _ritelPrakarsaAPI = locator<RitelPrakarsaAPI>();

  String prakarsaId;
  String pipelineId;
  int loanTypesId;
  int status;
  int codeTable;

  InformasiFinansialViewModelPari({
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  void navigateBack() {
    _navigationService.navigateTo(
      Routes.prakarsaDetailsViewRitel,
      arguments: PrakarsaDetailsViewRitelArguments(
        index: 1,
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        codeTable: 4,
      ),
    );
  }

  Future initialize() async {
    setBusy(true);
    await stepperInformasiFinansialPari(prakarsaId);
    setBusy(false);
  }

  RitelFinansialMenuStepperPari? _ritelFinansialMenuStepperPari;

  RitelFinansialMenuStepperPari get ritelFinansialMenuStepperPari =>
      _ritelFinansialMenuStepperPari!;

  Future stepperInformasiFinansialPari(String id) async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.stepperMenuInformasiFinansialPari(id),
    );

    res.fold(
      (error) => error,
      (result) {
        _ritelFinansialMenuStepperPari =
            RitelFinansialMenuStepperPari.fromJson(result);
      },
    );
  }

  void navigateToMutasiTransaksiPari() async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.fetchMutasiTransaksiPari(prakarsaId),
    );
    res.fold(
      (error) => _navigationService.navigateTo(
        Routes.mutasiTransaksiPariView,
        arguments: MutasiTransaksiPariViewArguments(
          prakarsaId: prakarsaId,
          pipelineId: pipelineId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      ),
      (result) {
        _navigationService.navigateTo(
          Routes.mutasiTransaksiDetail,
          arguments: MutasiTransaksiDetailArguments(
            ritelMutasiTransaksiPariModel: result,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable,
          ),
        );
      },
    );
  }

  void navigateToMutasiRekeningPari() {
    _navigationService.navigateTo(
      Routes.mutasiRekeningPariView,
      arguments: MutasiRekeningPariViewArguments(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
      ),
    );
  }
}

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../application/models/ritel_informasi_finansial_menu_stepper.dart';
import '../../../../../../../../infrastructure/apis/ritel_prakarsa_api.dart';
import '../../../../../../../../infrastructure/apis/ritel_riwayat_projek_api.dart';

class InformasiFinansialViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final RitelPrakarsaAPI _ritelPrakarsaAPI = locator<RitelPrakarsaAPI>();
  final RitelRiwayatProyekAPI _ritelPrakarsaRiwayatProyekApi =
      locator<RitelRiwayatProyekAPI>();

  final String prakarsaId;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;

  InformasiFinansialViewModel({
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
        codeTable: codeTable,
      ),
    );
  }

  Future initialize() async {
    setBusy(true);
    await stepperInformasiFinansial(prakarsaId);
    setBusy(false);
  }

  void navigateToMutasiRekening() {
    _navigationService.navigateTo(
      Routes.mutasiRekeningView,
      arguments: MutasiRekeningViewArguments(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
      ),
    );
  }

  RitelFinansialMenuStepper? _ritelFinansialMenuStepper;

  RitelFinansialMenuStepper get ritelFinansialMenuStepper =>
      _ritelFinansialMenuStepper!;

  Future stepperInformasiFinansial(String id) async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.stepperMenuInformasiFinansial(id, codeTable),
    );

    res.fold(
      (error) => error,
      (result) {
        _ritelFinansialMenuStepper = RitelFinansialMenuStepper.fromJson(result);
      },
    );
  }

  void navigateToDataLaporanFinansial() {
    if (_ritelFinansialMenuStepper!.informasiFinansial! == true) {
      _navigationService.navigateTo(
        Routes.informasiFinansialViewPeriodOne,
        arguments: InformasiFinansialViewPeriodOneArguments(
          prakarsaId: prakarsaId,
          pipelineId: pipelineId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      );
    } else {
      _navigationService.navigateTo(
        Routes.informasiFinansialFormPeriodOne,
        arguments: InformasiFinansialFormPeriodOneArguments(
          prakarsaId: prakarsaId,
          pipelineId: pipelineId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      );
    }
  }

  void navigateToRiwayatProyek() async {
    final res = await runBusyFuture(_ritelPrakarsaRiwayatProyekApi
        .fetchRiwayatProyek(prakarsaId, codeTable));

    res.fold(
      (error) => _navigationService.navigateTo(
        Routes.riwayatProjekView,
        arguments: RiwayatProjekViewArguments(
          prakarsaId: prakarsaId,
          pipelineId: pipelineId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      ),
      (ritelRiwayatProjek) => _navigationService.navigateTo(
        Routes.riwayatProjekDetails,
        arguments: RiwayatProjekDetailsArguments(
          ritelRiwayatProjek: ritelRiwayatProjek,
          pipelineId: pipelineId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      ),
    );
  }
}

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../application/app/app.locator.dart';
import '../../../../../../../application/app/app.router.dart';
import '../../../../../../../application/app/constants/common.dart';
import '../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../application/helpers/initial_code_table_formatter.dart';
import '../../../../../../../application/models/ritel_prakarsa_info_prakarsa.dart';
import '../../../../../../../application/models/ritel_prakarsa_perorangan.dart';
import '../../../../../../../infrastructure/apis/ritel_informasi_pinjaman_api.dart';
import '../../../../../../../infrastructure/apis/ritel_prakarsa_api.dart';
import '../../../../../../../infrastructure/apis/ritel_trade_checking_api.dart';
import '../../../../../../../infrastructure/apis/ritel_upload_crr_api.dart';

class InformasiPrakarsaViewModel extends FutureViewModel {
  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final RitelPrakarsaAPI _ritelPrakarsaAPI = locator<RitelPrakarsaAPI>();
  final RitelInformasiPinjamanAPI _ritelInformasiPinjamanAPI =
      locator<RitelInformasiPinjamanAPI>();
  final RitelUploadCRRAPI _ritelUploadCRRAPI = locator<RitelUploadCRRAPI>();
  final RitelTradeCheckingAPI _ritelTradeCheckingAPI =
      locator<RitelTradeCheckingAPI>();

  String prakarsaId;
  String pipelinesId;
  int codeTable;

  RitelPrakarsaPerorangan ritelPrakarsaPerorangan;
  int loanTypesId;
  int status;

  InformasiPrakarsaViewModel({
    required this.prakarsaId,
    required this.pipelinesId,
    required this.ritelPrakarsaPerorangan,
    required this.loanTypesId,
    required this.codeTable,
    required this.status,
  });

  dynamic get ritelInfoPrakarsa {
    // ignore: prefer-conditional-expressions
    if (codeTable == Common.CodeTable.Perorangan ||
        codeTable == Common.CodeTable.PARI) {
      return _ritelPrakarsaInfoPrakarsaPerorangan;
    } else {
      return _ritelPrakarsaInfoPrakarsaPTCV;
    }
  }

  RitelPrakarsaInfoPrakarsaPerorangan? _ritelPrakarsaInfoPrakarsaPerorangan;
  RitelPrakarsaInfoPrakarsaPTCV? _ritelPrakarsaInfoPrakarsaPTCV;
  String prakarsaType = '';

  @override
  Future futureToRun() async {
    setBusy(true);
    prakarsaType = InitialCodeTableFormatter.getPrakarsaType(codeTable);
    if (codeTable == Common.CodeTable.Perorangan ||
        codeTable == Common.CodeTable.PARI) {
      await fetchInfoPrakarsaPerorangan();
    } else {
      await fetchInfoPrakarsaPTCV();
    }
    setBusy(false);
  }

  Future fetchInfoPrakarsaPerorangan() async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.fetchInfoPrakarsaPerorangan(prakarsaId),
    );

    res.fold(
      (l) => _showErrorDialog('Gagal memuat data'),
      (ritelPrakarsaInfoPrakarsa) {
        _ritelPrakarsaInfoPrakarsaPerorangan = ritelPrakarsaInfoPrakarsa;
      },
    );
  }

  Future fetchInfoPrakarsaPTCV() async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.fetchInfoPrakarsaPTCV(prakarsaId, codeTable),
    );

    res.fold(
      (l) => _showErrorDialog('Gagal memuat data'),
      (ritelPrakarsaInfoPrakarsa) {
        _ritelPrakarsaInfoPrakarsaPTCV = ritelPrakarsaInfoPrakarsa;
      },
    );
  }

  void navigateToInformasiDebitur() {
    if (codeTable == 4) {
      _navigationService.navigateTo(
        Routes.informasiDebiturPari,
        arguments: InformasiDebiturPariArguments(
          prakarsaId: prakarsaId,
          pipelinesId: pipelinesId,
          status: status,
        ),
      );
    } else {
      _navigationService.navigateTo(
        Routes.informasiDebiturView,
        arguments: InformasiDebiturViewArguments(
          prakarsaId: prakarsaId,
          pipelinesId: pipelinesId,
          status: status,
        ),
      );
    }
  }

  void navigateToTradeChecking() async {
    final res = await runBusyFuture(
      _ritelTradeCheckingAPI.fetchTradeChecking(
        prakarsaId: prakarsaId,
        codeTable: codeTable,
      ),
    );

    res.fold(
      (errorMessage) => _navigationService.navigateTo(
        Routes.tradeCheckingView,
        arguments: TradeCheckingViewArguments(
          prakarsaId: prakarsaId,
          pipelineId: pipelinesId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      ),
      (tradeChecking) => _navigationService.navigateTo(
        Routes.tradeCheckingDetails,
        arguments: TradeCheckingDetailsArguments(
          ritelTradeChecking: tradeChecking,
          pipelineId: pipelinesId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      ),
    );
  }

  void navigateToInformasiPerusahaan() {
    _navigationService.navigateTo(
      Routes.informasiPerusahaanView,
      arguments: InformasiPerusahaanViewArguments(
        codeTable: codeTable,
        prakarsaId: prakarsaId,
        status: status,
        pipelineId: pipelinesId,
      ),
    );
  }

  void navigateToInformasiPengurusView() async {
    await _navigationService.navigateTo(
      Routes.informasiPengurusView,
      arguments: InformasiPengurusViewArguments(
        codeTable: codeTable,
        pipelineId: pipelinesId,
        status: status,
        prakarsaId: prakarsaId,
      ),
    );

    fetchInfoPrakarsaPTCV();
  }

  // void navigateToLegalitasUsaha() {
  //   _navigationService.navigateTo(
  //     Routes.legalitasUsahaView,
  //     arguments: LegalitasUsahaViewArguments(
  //       prakarsaId: prakarsaId,
  //       ritelPrakarsaPerorangan: ritelPrakarsaPerorangan,
  //       pipelineId: pipelinesId,
  //       loanTypesId: loanTypesId,
  //     ),
  //   );
  // }

  void navigateToLegalitasUsaha() {
    if (codeTable == 1) {
      _navigationService.navigateTo(
        Routes.legalitasUsahaView,
        arguments: LegalitasUsahaViewArguments(
          prakarsaId: prakarsaId,
          ritelPrakarsaPerorangan: ritelPrakarsaPerorangan,
          pipelineId: pipelinesId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      );
    } else if (codeTable == 2) {
      _navigationService.navigateTo(
        Routes.legalitasUsahaPerusahaanCvView,
        arguments: LegalitasUsahaPerusahaanCvViewArguments(
          prakarsaId: prakarsaId,
          pipelineId: pipelinesId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      );
    } else if (codeTable == 3) {
      _navigationService.navigateTo(
        Routes.legalitasUsahaPerusahaanPtView,
        arguments: LegalitasUsahaPerusahaanPtViewArguments(
          prakarsaId: prakarsaId,
          pipelineId: pipelinesId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      );
    } else {
      _navigationService.navigateTo(
        Routes.legalitasUsahaPariView,
        arguments: LegalitasUsahaPariViewArguments(
          prakarsaId: prakarsaId,
          ritelPrakarsaPerorangan: ritelPrakarsaPerorangan,
          pipelineId: pipelinesId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      );
    }
  }

  // void navigateToLegalitasUsahaPerusahaanPt() {
  //   if (loanTypesId == 1) {
  //     _navigationService.navigateTo(
  //       Routes.legalitasUsahaPerusahaanPtView,
  //       arguments: LegalitasUsahaPerusahaanPtViewArguments(
  //         prakarsaId: prakarsaId,
  //         ritelPrakarsaInformasiPerusahaan: ritelPrakakarsaInformasiPerusahaan,
  //         pipelineId: pipelinesId,
  //         loanTypesId: loanTypesId,
  //         status: status,
  //         codeTable: 3,
  //       ),
  //     );
  //   }
  // }

  // void navigateToLegalitasUsahaPerusahaanCv() {
  //   if (loanTypesId == 1) {
  //     _navigationService.navigateTo(
  //       Routes.legalitasUsahaPerusahaanCvView,
  //       arguments: LegalitasUsahaPerusahaanCvViewArguments(
  //         prakarsaId: prakarsaId,
  //         ritelPrakarsaInformasiPerusahaan: ritelPrakakarsaInformasiPerusahaan,
  //         pipelineId: pipelinesId,
  //         loanTypesId: loanTypesId,
  //         status: status,
  //         codeTable: 2,
  //       ),
  //     );
  //   }
  // }

  void navigateToInformasiAgunanLkn() {
    if (codeTable != 4) {
      _navigationService.navigateTo(
        Routes.informasiAgunanViewRitel,
        arguments: InformasiAgunanViewRitelArguments(
          prakarsaId: prakarsaId,
          pipelineId: pipelinesId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      );
    } else {
      _navigationService.navigateTo(
        Routes.informasiAgunanViewPari,
        arguments: InformasiAgunanViewPariArguments(
          prakarsaId: prakarsaId,
          pipelineId: pipelinesId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: 4,
        ),
      );
    }
  }

  void navigateToHasilPreScreening() {
    if (codeTable == 3 || codeTable == 2) {
      _navigationService.navigateTo(
        Routes.hasilPrescreeningViewPerusahaanCVRitel,
        arguments: HasilPrescreeningViewPerusahaanCVRitelArguments(
          pipelineFlagId: ritelPrakarsaPerorangan.pipeline_flagId!,
          codeTable: codeTable.toString(),
          fromPrakarsaDetails: false,
        ),
      );
    } else {
      _navigationService.navigateTo(
        Routes.hasilPrescreeningViewRitel,
        arguments: HasilPrescreeningViewRitelArguments(
          pipelineflagId: ritelPrakarsaPerorangan.pipeline_flagId,
          name: ritelPrakarsaPerorangan.fullName,
          ktpNum: ritelPrakarsaPerorangan.ktpNum,
          fromPrakarsaDetails: true,
        ),
      );
    }
  }

  void navigateToInformasiFinansial() {
    if (codeTable == 4) {
      _navigationService.navigateTo(
        Routes.informasiFinansialViewPari,
        arguments: InformasiFinansialViewPariArguments(
          prakarsaId: prakarsaId,
          pipelineId: pipelinesId,
          loanTypesId: loanTypesId,
          codeTable: codeTable,
          status: status,
        ),
      );
    } else {
      _navigationService.navigateTo(
        Routes.informasiFinansialView,
        arguments: InformasiFinansialViewArguments(
          prakarsaId: prakarsaId,
          pipelineId: pipelinesId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      );
    }
  }

  void navigateToInformasiNonFinansial() async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.fetchPrakarsaNonFinansial(prakarsaId, codeTable),
    );

    res.fold(
      (errorMessage) => _navigationService.navigateTo(
        Routes.informasiNonFinasialPageOneA,
        arguments: InformasiNonFinasialPageOneAArguments(
          prakarsaId: prakarsaId,
          name: ritelPrakarsaPerorangan.fullName ?? '',
          pipelineId: pipelinesId,
          loanTypesId: loanTypesId,
          codeTable: codeTable,
        ),
      ),
      (summaryNonFinansial) => _navigationService.navigateTo(
        Routes.summaryInformasiNonFinansial,
        arguments: SummaryInformasiNonFinansialArguments(
          fullName: ritelPrakarsaPerorangan.fullName ?? '',
          summaryNonFinansial: summaryNonFinansial,
          prakarsaId: prakarsaId,
          pipelineId: pipelinesId,
          loanTypesId: loanTypesId,
          codeTable: codeTable,
        ),
      ),
    );
  }

  Future navigateToInformasiPinjaman() async {
    if (codeTable == 4) {
      final res = await runBusyFuture(
        _ritelInformasiPinjamanAPI.initInformasiPinjamanPari(prakarsaId),
      );

      res.fold(
        (errorMessage) => _showErrorDataFromInitDialog(),
        (dataFromInit) => _navigationService.navigateTo(
          Routes.informasiPinjamanDetailsPari,
          arguments: InformasiPinjamanDetailsPariArguments(
            ritelInformasiPinjaman: dataFromInit,
            pipelinesId: pipelinesId,
            loanTypesId: loanTypesId,
            prakarsaId: prakarsaId,
            status: status,
            codeTable: codeTable,
          ),
        ),
      );
    } else {
      final res = await runBusyFuture(_ritelInformasiPinjamanAPI
          .initInformasiPinjaman(prakarsaId, prakarsaType));

      res.fold(
        (errorMessage) => _showErrorDataFromInitDialog(),
        (dataFromInit) => _navigationService.navigateTo(
          Routes.informasiPinjamanDetailsRitel,
          arguments: InformasiPinjamanDetailsRitelArguments(
            ritelInformasiPinjaman: dataFromInit,
            pipelinesId: pipelinesId,
            loanTypesId: loanTypesId,
            prakarsaId: prakarsaId,
            status: status,
            codeTable: codeTable,
          ),
        ),
      );
    }
  }

  void navigateToUploadCRR() async {
    final res = await runBusyFuture(
      _ritelUploadCRRAPI.fetchCRR(
        prakarsaId: prakarsaId,
        prakarsaType: prakarsaType,
      ),
    );

    res.fold(
      (error) {
        _navigationService.navigateTo(
          Routes.uploadCRRView,
          arguments: UploadCRRViewArguments(
            prakarsaId: prakarsaId,
            pipelineId: pipelinesId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable,
          ),
        );
      },
      (url) {
        _navigationService.navigateTo(
          Routes.uploadCRRDetails,
          arguments: UploadCRRDetailsArguments(
            prakarsaId: prakarsaId,
            pipelineId: pipelinesId,
            loanTypesId: loanTypesId,
            url: url,
            status: status,
            codeTable: codeTable,
          ),
        );
      },
    );
  }

  Future _showErrorDataFromInitDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Invalid',
      description:
          'Beberapa isian ada yang kosong pada halaman Informasi Finansial, silahkan periksa kembali.',
      mainButtonTitle: 'OK',
    );
  }

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Gagal',
      description: errorMessage,
      mainButtonTitle: 'COBA LAGI',
    );
  }
}

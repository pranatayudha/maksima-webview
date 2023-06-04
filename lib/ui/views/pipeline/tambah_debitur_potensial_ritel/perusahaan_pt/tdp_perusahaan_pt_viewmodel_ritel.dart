// ignore_for_file: unused_import

import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../application/app/app.locator.dart';
import '../../../../../application/app/app.router.dart';
import '../../../../../application/app/constants/custom_color.dart';
import '../../../../../application/enums/bottom_sheet_type.dart';
import '../../../../../application/enums/dialog_type.dart';
import '../../../../../application/models/ritel_list_informasi_pengurus_pemilik_pt.dart';
import '../../../../../application/models/ritel_stepper_perusahaan_pipeline.dart';
import '../../../../../application/services/local_db_service.dart';
import '../../../../../infrastructure/apis/ritel_pipeline_perusahaan_pt_api.dart';
import '../../../../../infrastructure/apis/ritel_screening_api.dart';

class TDPPerusahaanPtViewModel extends FutureViewModel {
  String? pipelineId;
  bool? fromPipelineDetailsView;
  bool? fromTDPViewRitel;
  int? statusPipeline;

  TDPPerusahaanPtViewModel({
    this.pipelineId,
    this.fromPipelineDetailsView = false,
    this.fromTDPViewRitel = false,
    this.statusPipeline,
  });

  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final RitelPipelinePerusahaanPtAPI _ritelPipelinePerusahaanPtAPI =
      locator<RitelPipelinePerusahaanPtAPI>();
  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final RitelScreeningAPI _ritelScreeningAPI = locator<RitelScreeningAPI>();

  int _informasiPerusahaanPtCompleted = 0;
  int _informasiPengurusPtCompleted = 0;
  int _informasiLainnyaPtCompleted = 0;

  int get informasiPerusahaanPtCompleted => _informasiPerusahaanPtCompleted;

  int get informasiPengurusPtCompleted => _informasiPengurusPtCompleted;

  int get informasiLainnyaPtCompleted => _informasiLainnyaPtCompleted;

  bool get allFormsCompleted =>
      _informasiPerusahaanPtCompleted == 2 &&
      _informasiPengurusPtCompleted == 2 &&
      _informasiLainnyaPtCompleted == 2;

  bool get checkInformasiPerusahaanPtCompleted =>
      _informasiPerusahaanPtCompleted == 2;

  bool get checkInformasiPengurusPtCompleted =>
      _informasiPengurusPtCompleted == 2;

  bool get checkLainnyaCompleted => _informasiLainnyaPtCompleted == 2;

  bool get hasPipelineId => pipelineId != null;

  @override
  Future futureToRun() async {
    setBusy(true);
    await getStepperPipeline();
    await getListPengurusPemilikPipeline();
    setBusy(false);
  }

  List<RitelListPengurusPerusahaanPTModel> _ritelListPengurusPerusahaanModel =
      [];
  List<RitelListPengurusPerusahaanPTModel>
      get ritelListPengurusPerusahaanModel => _ritelListPengurusPerusahaanModel;

  Future getListPengurusPemilikPipeline() async {
    final res = await _ritelPipelinePerusahaanPtAPI
        .getListPengurusPemilikPipelineAPI(pipelineId!, 3);
    log(res.toString());

    res.fold(
      (error) {
        log(error);
      },
      (result) {
        final listPengurus = List<RitelListPengurusPerusahaanPTModel>.from(
          result.map(
            (i) => RitelListPengurusPerusahaanPTModel.fromJson(
              i as Map<String, dynamic>,
            ),
          ),
        );
        _ritelListPengurusPerusahaanModel = listPengurus;
      },
    );
  }

  RitelStepperPerusahaanModel? _ritelStepperPerusahaanModel;
  RitelStepperPerusahaanModel get ritelStepperPerusahaanModel =>
      _ritelStepperPerusahaanModel!;

  Future getStepperPipeline() async {
    final res = await runBusyFuture(
      _ritelPipelinePerusahaanPtAPI.getStepperPipelineMenu(pipelineId!),
    );

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (result) => _ritelStepperPerusahaanModel = result,
    );
  }

  Future getFlag() async {
    if (fromPipelineDetailsView == true) {
      final getPipelineFlag = _localDBService.getPerusahaanPtFlag();
      _informasiPerusahaanPtCompleted =
          getPipelineFlag!['informasi_perusahaan_pt']!;
      _informasiPengurusPtCompleted = getPipelineFlag['informasi_pengurus_pt']!;
      _informasiLainnyaPtCompleted = getPipelineFlag['informasi_lainnya_pt']!;
      notifyListeners();
    }

    if (fromTDPViewRitel != true) {
      final getPipelineFlag = _localDBService.getPerusahaanPtFlag();
      _informasiPerusahaanPtCompleted =
          getPipelineFlag!['informasi_perusahaan_pt']!;
      _informasiPengurusPtCompleted = getPipelineFlag['informasi_pengurus_pt']!;
      _informasiLainnyaPtCompleted = getPipelineFlag['informasi_lainnya_pt']!;
      notifyListeners();
    } else {
      _localDBService.removePerusahaanPtFlag();
    }
  }

  void navigateToPipelineDetailsView() async {
    final res = await runBusyFuture(
      _ritelPipelinePerusahaanPtAPI.savePipeline(pipelineId!),
    );

    res.fold(
      (errorMessage) => null,
      (successMap) async {
        await _navigationService.navigateTo(
          Routes.pipelineDetailsPtViewRitel,
          arguments: PipelineDetailsPtViewRitelArguments(
            id: pipelineId!,
            debiturType: 'Perusahaan PT',
            statusPipeline: ritelStepperPerusahaanModel.informasiLainnya! &&
                    ritelStepperPerusahaanModel.informasiPengurusPemilik! &&
                    ritelStepperPerusahaanModel.informasiPerusahaan!
                ? 2
                : 1,
          ),
        );
      },
    );
  }

  Future checkCompletedForm() async {
    if (pipelineId == null) {
      final response = await _dialogService.showCustomDialog(
        variant: DialogType.base,
        title: 'Batal?',
        description:
            'Apakah Anda yakin akan membatalkan proses tambah debitur perusahaan ini?',
        data: {'color': CustomColor.primaryRed80},
        mainButtonTitle: 'Batal',
      );

      if (response!.confirmed) {
        _navigationService.navigateTo(Routes.tDPViewRitel);
      }
    } else {
      navigateToPipelineDetailsView();
    }
  }

  Future navigateToInformasiPerusahaanPt() async {
    if (pipelineId == null) {
      _navigationService.navigateTo(
        Routes.informasiPerusahaanPtView,
        arguments: InformasiPerusahaanPtViewArguments(
          pipelineId: pipelineId,
          fromTdpPerusahaanPtView: true,
        ),
      );
    } else {
      final response = await runBusyFuture(_ritelPipelinePerusahaanPtAPI
          .getInformasiPerushaanPt(pipelineId!, 3));

      response.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (ritelInformasiPerusahaanPt) => _navigationService.navigateTo(
          Routes.informasiPerusahaanPtView,
          arguments: InformasiPerusahaanPtViewArguments(
            pipelineId: pipelineId,
            fromTdpPerusahaanPtView: true,
            ritelInformasiPerusahaanPt: ritelInformasiPerusahaanPt,
            fromPipelineDetailsView: fromPipelineDetailsView,
          ),
        ),
      );
    }
  }

  Future navigateToInformasiPengurusPt() async {
    _navigationService.navigateTo(
      Routes.informasiPengurusPemilikBoardView,
      arguments: InformasiPengurusPemilikBoardViewArguments(
        pipelineId: pipelineId,
      ),
    );
  }

  Future navigateToInformasiLainnyaPt() async {
    if (!ritelStepperPerusahaanModel.informasiLainnya!) {
      _navigationService.navigateTo(
        Routes.informasiLainnyaPtView,
        arguments: InformasiLainnyaPtViewArguments(
          pipelineId: pipelineId,
          fromTdpPerusahaanPtView: true,
        ),
      );
    } else {
      final response = await runBusyFuture(
        _ritelPipelinePerusahaanPtAPI.getInformasiLainnya(pipelineId!, 3),
      );

      response.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (ritelInformasiLainnyaPt) => _navigationService.navigateTo(
          Routes.informasiLainnyaPtView,
          arguments: InformasiLainnyaPtViewArguments(
            pipelineId: pipelineId!,
            fromTdpPerusahaanPtView: true,
            ritelInformasiLainnyaPt: ritelInformasiLainnyaPt,
            fromPipelineDetailsView: fromPipelineDetailsView,
          ),
        ),
      );
    }
  }

  Future savePipeline() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.confirmation,
      data: {
        'title': 'Konfirmasi',
      },
    );

    if (response != null && response.confirmed) {
      // ignore: no-boolean-literal-compare
      final res = await runBusyFuture(
        _ritelPipelinePerusahaanPtAPI.savePipeline(pipelineId!),
      );

      res.fold(
        (errorMessage) {
          _showErrorDialog(errorMessage);
          notifyListeners();
        },
        (successMap) {
          _showSuccessDialog(
            successMessage: 'Berhasil menambahkan data pipeline perusahaan PT!',
            isContinue: true,
          );
          notifyListeners();
        },
      );
    }
  }

  Future _showSuccessDialog({
    required String successMessage,
    required bool isContinue,
  }) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    if (isContinue) {
      _navigationService.navigateTo(
        Routes.pipelineDetailsPtViewRitel,
        arguments: PipelineDetailsPtViewRitelArguments(
          id: pipelineId!,
          debiturType: 'Perusahaan PT',
          statusPipeline: ritelStepperPerusahaanModel.informasiLainnya! &&
                  ritelStepperPerusahaanModel.informasiPengurusPemilik! &&
                  ritelStepperPerusahaanModel.informasiPerusahaan!
              ? 2
              : 1,
        ),
      );
    } else {
      _navigationService.back();
    }
  }

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Gagal',
      description: errorMessage,
      mainButtonTitle: 'COBA LAGI',
    );
  }

  Future showKonfirmasiPreScreeningDialog() async {
    final getPipelineFlag = _localDBService.getPerusahaanPtFlag();

    String? pipelineFlagId;
    final responseDataDiri = await runBusyFuture(
      _ritelPipelinePerusahaanPtAPI.getInformasiPerushaanPt(pipelineId!, 3),
    );
    responseDataDiri.fold((l) => null, (r) {
      pipelineFlagId = r.pipeline_flagId;
    });

    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.confirmation,
      data: {
        'title': 'Konfirmasi Pre-Screening',
        'description':
            'Kesalahan penginputan data yang menyebabkan Pre-Screening DITOLAK, maka Pre-Screening harus diproses kembali dari awal',
      },
    );

    if (response != null && response.confirmed) {
      final res = await runBusyFuture(
        _ritelPipelinePerusahaanPtAPI.savePipeline(pipelineId!),
      );

      res.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (successMap) async {
          final resPrescreen =
              await _ritelScreeningAPI.runPrescreening(pipelineFlagId!);

          resPrescreen.fold(
            (errorMessage) => _showErrorDialog(errorMessage),
            (success) => _navigationService.navigateTo(
              Routes.pipelineSuccessViewRitel,
              arguments: PipelineSuccessViewRitelArguments(
                pipelineId: pipelineId,
                debiturName: getPipelineFlag!['debiturName'].split('.') > 1
                    ? getPipelineFlag['debiturName']
                    : 'PT. ${getPipelineFlag['debiturName']}',
                codeTable: 3,
              ),
            ),
          );
        },
      );
    }
  }
}

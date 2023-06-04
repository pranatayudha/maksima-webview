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
import '../../../../../infrastructure/apis/ritel_pipeline_perusahaan_cv_api.dart';
import '../../../../../infrastructure/apis/ritel_pipeline_perusahaan_pt_api.dart';
import '../../../../../infrastructure/apis/ritel_screening_api.dart';

class TDPPerusahaanCvViewModel extends FutureViewModel {
  String? pipelineId;
  bool? fromPipelineDetailsView;
  bool? fromTDPViewRitel;
  int? statusPipeline;

  TDPPerusahaanCvViewModel({
    this.pipelineId,
    this.fromPipelineDetailsView = false,
    this.fromTDPViewRitel = false,
    this.statusPipeline,
  });

  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final RitelPipelinePerusahaanCvAPI _ritelPipelinePerusahaanCvAPI =
      locator<RitelPipelinePerusahaanCvAPI>();
  final RitelPipelinePerusahaanPtAPI _ritelPipelinePerusahaanPtAPI =
      locator<RitelPipelinePerusahaanPtAPI>();
  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final RitelScreeningAPI _ritelScreeningAPI = locator<RitelScreeningAPI>();

  int _informasiPerusahaanCvCompleted = 0;
  int _informasiPengurusCvCompleted = 0;
  int _informasiLainnyaCvCompleted = 0;

  int get informasiPerusahaanCvCompleted => _informasiPerusahaanCvCompleted;

  int get informasiPengurusCvCompleted => _informasiPengurusCvCompleted;

  int get informasiLainnyaCvCompleted => _informasiLainnyaCvCompleted;

  bool get allFormsCompleted =>
      _informasiPerusahaanCvCompleted == 2 &&
      _informasiPengurusCvCompleted == 2 &&
      _informasiLainnyaCvCompleted == 2;

  bool get checkInformasiPerusahaanCvCompleted =>
      _informasiPerusahaanCvCompleted == 2;

  bool get checkInformasiPengurusCvCompleted =>
      _informasiPengurusCvCompleted == 2;

  bool get checkLainnyaCompleted => _informasiLainnyaCvCompleted == 2;

  bool get hasPipelineId => pipelineId != null;

  @override
  Future futureToRun() async {
    setBusy(true);
    await getStepperPipeline();
    await getListPengurusPemilikPipeline();
    // getFlag();
    setBusy(false);
  }

  List<RitelListPengurusPerusahaanPTModel> _ritelListPengurusPerusahaanModel =
      [];
  List<RitelListPengurusPerusahaanPTModel>
      get ritelListPengurusPerusahaanModel => _ritelListPengurusPerusahaanModel;

  Future getListPengurusPemilikPipeline() async {
    final res = await _ritelPipelinePerusahaanPtAPI
        .getListPengurusPemilikPipelineAPI(pipelineId!, 2);

    res.fold(
      (error) {
        error;
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
      _ritelPipelinePerusahaanCvAPI.getStepperPipelineCVMenu(pipelineId!),
    );

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (result) => _ritelStepperPerusahaanModel = result,
    );
  }

  Future getFlag() async {
    if (fromPipelineDetailsView == true) {
      final getPipelineFlag = _localDBService.getPerusahaanCvFlag();
      _informasiPerusahaanCvCompleted =
          getPipelineFlag!['informasi_perusahaan_cv']!;
      _informasiPengurusCvCompleted = getPipelineFlag['informasi_pengurus']!;
      _informasiLainnyaCvCompleted = getPipelineFlag['informasi_lainnya']!;
      notifyListeners();
    }

    if (fromTDPViewRitel != true) {
      final getPipelineFlag = _localDBService.getPerusahaanCvFlag();
      _informasiPerusahaanCvCompleted =
          getPipelineFlag!['informasi_perusahaan_cv']!;
      _informasiPengurusCvCompleted = getPipelineFlag['informasi_pengurus']!;
      _informasiLainnyaCvCompleted = getPipelineFlag['informasi_lainnya']!;
      notifyListeners();
    } else {
      _localDBService.removePerusahaanCvFlag();
    }
  }

  void navigateToPipelineDetailsView() async {
    final res = await runBusyFuture(
      _ritelPipelinePerusahaanCvAPI.savePipeline(pipelineId!),
    );

    res.fold(
      (errorMessage) => null,
      (successMap) async {
        await _navigationService.navigateTo(
          Routes.pipelineDetailsCvViewRitel,
          arguments: PipelineDetailsCvViewRitelArguments(
            id: pipelineId!,
            debiturType: 'Perusahaan CV',
            statusPipeline: ritelStepperPerusahaanModel.informasiLainnya! &&
                    ritelStepperPerusahaanModel.informasiPengurusPemilik! &&
                    ritelStepperPerusahaanModel.informasiPerusahaan!
                ? 2
                : 1,
            codeTable: 2,
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

  Future navigateToInformasiPerusahaanCv() async {
    if (pipelineId == null) {
      _navigationService.navigateTo(
        Routes.informasiPerusahaanCvView,
        arguments: InformasiPerusahaanCvViewArguments(
          pipelineId: pipelineId,
          fromTdpPeroranganView: true,
        ),
      );
    } else {
      final response = await runBusyFuture(_ritelPipelinePerusahaanCvAPI
          .getInformasiPerushaanCv(pipelineId!, 2));

      response.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (ritelInformasiPerusahaanCv) {
          _navigationService.navigateTo(
            Routes.informasiPerusahaanCvView,
            arguments: InformasiPerusahaanCvViewArguments(
              pipelineId: pipelineId,
              fromTdpPeroranganView: true,
              ritelInformasiPerusahaanCv: ritelInformasiPerusahaanCv,
              fromPipelineDetailsView: fromPipelineDetailsView,
            ),
          );
        },
      );
    }
  }

  Future navigateToInformasiPengurus() async {
    _navigationService.navigateTo(
      Routes.informasiPengurusPemilikBoardCvView,
      arguments: InformasiPengurusPemilikBoardCvViewArguments(
        pipelineId: pipelineId,
      ),
    );
  }

  Future navigateToInformasiLainnya() async {
    if (!ritelStepperPerusahaanModel.informasiLainnya!) {
      _navigationService.navigateTo(
        Routes.informasiLainnyaCvView,
        arguments: InformasiLainnyaCvViewArguments(
          pipelineId: pipelineId,
          fromTdpPerusahaanView: true,
        ),
      );
    } else {
      final response = await runBusyFuture(
        _ritelPipelinePerusahaanCvAPI.getInformasiLainnya(pipelineId!, 2),
      );

      response.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (ritelInformasiLainnya) => _navigationService.navigateTo(
          Routes.informasiLainnyaCvView,
          arguments: InformasiLainnyaCvViewArguments(
            pipelineId: pipelineId!,
            fromTdpPerusahaanView: true,
            ritelInformasiLainnya: ritelInformasiLainnya,
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
        _ritelPipelinePerusahaanCvAPI.savePipeline(pipelineId!),
      );

      res.fold(
        (errorMessage) {
          _showErrorDialog(errorMessage);
          notifyListeners();
        },
        (successMap) {
          _showSuccessDialog(
            successMessage: 'Berhasil menambahkan data pipeline perusahaan CV!',
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
        Routes.pipelineDetailsCvViewRitel,
        arguments: PipelineDetailsCvViewRitelArguments(
          id: pipelineId!,
          debiturType: 'Perusahaan CV',
          statusPipeline: ritelStepperPerusahaanModel.informasiLainnya! &&
                  ritelStepperPerusahaanModel.informasiPengurusPemilik! &&
                  ritelStepperPerusahaanModel.informasiPerusahaan!
              ? 2
              : 1,
          codeTable: 4,
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
    final getPipelineFlag = _localDBService.getPerusahaanCvFlag();

    String? pipelineFlagId;
    final responseDataDiri = await runBusyFuture(
      _ritelPipelinePerusahaanCvAPI.getInformasiPerushaanCv(pipelineId!, 2),
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
        _ritelPipelinePerusahaanCvAPI.savePipeline(pipelineId!),
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
                    : 'CV. ${getPipelineFlag['debiturName']}',
                codeTable: 2,
              ),
            ),
          );
        },
      );
    }
  }
}

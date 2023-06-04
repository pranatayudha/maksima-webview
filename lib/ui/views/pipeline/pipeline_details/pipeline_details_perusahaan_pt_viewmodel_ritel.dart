import 'dart:io';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../application/app/app.locator.dart';
import '../../../../application/app/app.router.dart';
import '../../../../application/enums/bottom_sheet_type.dart';
import '../../../../application/enums/dialog_type.dart';
import '../../../../application/models/ritel_informasi_lainnya_pt.dart';
import '../../../../application/models/ritel_informasi_pengurus_pt.dart';
import '../../../../application/models/ritel_informasi_perusahaan_pt.dart';
import '../../../../application/services/local_db_service.dart';
import '../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../infrastructure/apis/ritel_pipeline_perusahaan_pt_api.dart';
import '../../../../infrastructure/apis/ritel_screening_api.dart';

class PipelineDetailsPerusahaanPtViewModelRitel extends FutureViewModel {
  final String pipelineId;
  final int? statusPipeline;

  PipelineDetailsPerusahaanPtViewModelRitel({
    required this.pipelineId,
    this.statusPipeline,
  });

  final RitelPipelinePerusahaanPtAPI _ritelPipelinePerusahaanPtAPI =
      locator<RitelPipelinePerusahaanPtAPI>();
  final DialogService _dialogService = locator<DialogService>();
  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final RitelScreeningAPI _ritelScreeningAPI = locator<RitelScreeningAPI>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();

  RitelInformasiPerusahaanPt? _ritelInformasiPerusahaanPt;

  RitelInformasiPerusahaanPt? get informasiPerusahaanPt =>
      _ritelInformasiPerusahaanPt;
  List<RitelInformasiPengurusPT>? _ritelInformasiPengurusPT;

  List<RitelInformasiPengurusPT>? get informasiPengurusPT =>
      _ritelInformasiPengurusPT;
  RitelInformasiLainnyaPt? _ritelInformasiLainnyaPt;

  RitelInformasiLainnyaPt? get informasiLainnya => _ritelInformasiLainnyaPt;

  @override
  Future futureToRun() async {
    _clearFile();

    await _getData();
    if (_ritelInformasiPerusahaanPt != null) {
      await _prepopulateImagesPerusahaanPt();
    }
    if (_ritelInformasiLainnyaPt != null) {
      if (_ritelInformasiLainnyaPt!.visitPath!.isNotEmpty) {
        await _prepopulateImagesLainnya();
      }
    } else {
      _ritelInformasiLainnyaPt = null;
    }
  }

  Future _getData() async {
    final response = await runBusyFuture(
      _ritelPipelinePerusahaanPtAPI.getById(pipelineId, '3'),
    );

    response.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (pipelineData) async {
        _ritelInformasiPerusahaanPt = pipelineData['informasi_perusahaan_pt'];
        await _prepopulateImagesPerusahaanPt();
        _ritelInformasiPengurusPT = pipelineData['informasi_pengurus_pt'] != []
            ? pipelineData['informasi_pengurus_pt']
            : null;
        if (pipelineData['informasi_lainnya_pt'] != null) {
          _ritelInformasiLainnyaPt = pipelineData['informasi_lainnya_pt'];
          if (_ritelInformasiLainnyaPt!.visitPath!.isNotEmpty) {
            await _prepopulateImagesLainnya();
          }
        }
      },
    );
  }

  Future refreshData() async {
    await _getData();
    notifyListeners();
  }

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Error',
      description: errorMessage,
      mainButtonTitle: 'OK',
    );
  }

  void navigateToHasilScreeningView() => _navigationService.navigateTo(
        Routes.hasilPrescreeningViewRitel,
        arguments: HasilPrescreeningViewRitelArguments(
          pipelineflagId: _ritelInformasiPerusahaanPt!.pipeline_flagId!,
          name: _ritelInformasiPerusahaanPt!.companyName,
          ktpNum: _ritelInformasiPerusahaanPt!.companyNpwpNum,
          fromPrakarsaDetails: false,
        ),
      );

  void navigateToHasilScreeningPTView() => _navigationService.navigateTo(
        Routes.hasilPrescreeningViewPerusahaanCVRitel,
        arguments: HasilPrescreeningViewPerusahaanCVRitelArguments(
          pipelineFlagId: _ritelInformasiPerusahaanPt!.pipeline_flagId!,
          codeTable: '3',
        ),
      );

  String? _fotoKtpPengurusPt;

  String? get fotoKtpPengurusPt => _fotoKtpPengurusPt;
  String? _fotoNpwpDebitur;

  String? get fotoNpwpDebitur => _fotoNpwpDebitur;

  File? _fotoKtpPengurusPt1;

  File? get fotoKtpPengurusPt1 => _fotoKtpPengurusPt1;
  File? _fotoNpwpDebitur1;

  File? get fotoNpwpDebitur1 => _fotoNpwpDebitur1;

  //
  File? _fotoKtpPengurusPt2;

  File? get fotoKtpPengurusPt2 => _fotoKtpPengurusPt2;
  File? _fotoNpwpDebitur2;

  File? get fotoNpwpDebitur2 => _fotoNpwpDebitur2;

  //
  File? _fotoKtpPengurusPt3;

  File? get fotoKtpPengurusPt3 => _fotoKtpPengurusPt3;
  File? _fotoNpwpDebitur3;

  File? get fotoNpwpDebitur3 => _fotoNpwpDebitur3;

  //
  File? _fotoKtpPengurusPt4;

  File? get fotoKtpPengurusPt4 => _fotoKtpPengurusPt4;
  File? _fotoNpwpDebitur4;

  File? get fotoNpwpDebitur4 => _fotoNpwpDebitur4;

  String? _fotoNpwpPerusahaanPt;
  String? get fotoNpwpPerusahaanPt => _fotoNpwpPerusahaanPt;

  String? _fotoAktaPendirian;
  String? get fotoAktaPendirian => _fotoAktaPendirian;

  String? _fotoAktaPerubahanTerakhir;
  String? get fotoAktaPerubahanTerakhir => _fotoAktaPerubahanTerakhir;

  String? _fotosKKumhamPendirian;
  String? get fotosKumhamPendirian => _fotosKKumhamPendirian;

  String? _fotosKkumhamPerubahaanTerakhir;
  String? get fotosKkumhamPerubahaanTerakhir => _fotosKkumhamPerubahaanTerakhir;

  Future _prepopulateImagesPerusahaanPt() async {
    if (_ritelInformasiPerusahaanPt!.companyNpwpPath != null &&
        _ritelInformasiPerusahaanPt!.companyNpwpPath!.isNotEmpty) {
      _fotoNpwpPerusahaanPt =
          await _getPublicFile(_ritelInformasiPerusahaanPt!.companyNpwpPath!);
      notifyListeners();
    }

    if (_ritelInformasiPerusahaanPt!.deedEstPath != null &&
        _ritelInformasiPerusahaanPt!.deedEstPath!.isNotEmpty) {
      _fotoAktaPendirian =
          await _getPublicFile(_ritelInformasiPerusahaanPt!.deedEstPath!);
      notifyListeners();
    }

    if (_ritelInformasiPerusahaanPt!.latestDeedPath != null &&
        _ritelInformasiPerusahaanPt!.latestDeedPath!.isNotEmpty) {
      _fotoAktaPerubahanTerakhir =
          await _getPublicFile(_ritelInformasiPerusahaanPt!.latestDeedPath!);
      notifyListeners();
    }

    if (_ritelInformasiPerusahaanPt!.skKumhamPath != null &&
        _ritelInformasiPerusahaanPt!.skKumhamPath!.isNotEmpty) {
      _fotosKKumhamPendirian =
          await _getPublicFile((_ritelInformasiPerusahaanPt!.skKumhamPath!));
      notifyListeners();
    }

    if (_ritelInformasiPerusahaanPt!.latestSkKumhamPath != null &&
        _ritelInformasiPerusahaanPt!.latestSkKumhamPath!.isNotEmpty) {
      _fotosKkumhamPerubahaanTerakhir = await _getPublicFile(
        _ritelInformasiPerusahaanPt!.latestSkKumhamPath!,
      );
      notifyListeners();
    }
  }

  String? _fotoKunjunganSatu;

  String? get fotoKunjunganSatu => _fotoKunjunganSatu;
  String? _fotoKunjunganDua;

  String? get fotoKunjunganDua => _fotoKunjunganDua;
  String? _fotoKunjunganTiga;

  String? get fotoKunjunganTiga => _fotoKunjunganTiga;
  String? _fotoKunjunganEmpat;

  String? get fotoKunjunganEmpat => _fotoKunjunganEmpat;
  String? _fotoKunjunganLima;

  String? get fotoKunjunganLima => _fotoKunjunganLima;

  Future _prepopulateImagesLainnya() async {
    if (_ritelInformasiLainnyaPt!.visitPath!.length == 2) {
      if (_ritelInformasiLainnyaPt!.visitPath![0]['path'] != null) {
        _fotoKunjunganSatu = await _getPublicFile(
          _ritelInformasiLainnyaPt!.visitPath![0]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaPt!.visitPath![1]['path'] != null) {
        _fotoKunjunganDua = await _getPublicFile(
          _ritelInformasiLainnyaPt!.visitPath![1]['path']!,
        );
        notifyListeners();
      }
    } else if (_ritelInformasiLainnyaPt!.visitPath!.length == 3) {
      if (_ritelInformasiLainnyaPt!.visitPath![0]['path'] != null) {
        _fotoKunjunganSatu = await _getPublicFile(
          _ritelInformasiLainnyaPt!.visitPath![0]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaPt!.visitPath![1]['path'] != null) {
        _fotoKunjunganDua = await _getPublicFile(
          _ritelInformasiLainnyaPt!.visitPath![1]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaPt!.visitPath![2]['path'] != null) {
        _fotoKunjunganTiga = await _getPublicFile(
          _ritelInformasiLainnyaPt!.visitPath![2]['path']!,
        );
        notifyListeners();
      }
    } else if (_ritelInformasiLainnyaPt!.visitPath!.length == 4) {
      if (_ritelInformasiLainnyaPt!.visitPath![0]['path'] != null) {
        _fotoKunjunganSatu = await _getPublicFile(
          _ritelInformasiLainnyaPt!.visitPath![0]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaPt!.visitPath![1]['path'] != null) {
        _fotoKunjunganDua = await _getPublicFile(
          _ritelInformasiLainnyaPt!.visitPath![1]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaPt!.visitPath![2]['path'] != null) {
        _fotoKunjunganTiga = await _getPublicFile(
          _ritelInformasiLainnyaPt!.visitPath![2]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaPt!.visitPath![3]['path'] != null) {
        _fotoKunjunganEmpat = await _getPublicFile(
          _ritelInformasiLainnyaPt!.visitPath![3]['path']!,
        );
        notifyListeners();
      }
    } else {
      if (_ritelInformasiLainnyaPt!.visitPath![0]['path'] != null) {
        _fotoKunjunganSatu = await _getPublicFile(
          _ritelInformasiLainnyaPt!.visitPath![0]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaPt!.visitPath![1]['path'] != null) {
        _fotoKunjunganDua = await _getPublicFile(
          _ritelInformasiLainnyaPt!.visitPath![1]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaPt!.visitPath![2]['path'] != null) {
        _fotoKunjunganTiga = await _getPublicFile(
          _ritelInformasiLainnyaPt!.visitPath![2]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaPt!.visitPath![3]['path'] != null) {
        _fotoKunjunganEmpat = await _getPublicFile(
          _ritelInformasiLainnyaPt!.visitPath![3]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaPt!.visitPath![4]['path'] != null) {
        _fotoKunjunganLima = await _getPublicFile(
          _ritelInformasiLainnyaPt!.visitPath![4]['path']!,
        );
        notifyListeners();
      }
    }
  }

  void navigateToTDPPerusahaanPtView() {
    if (_ritelInformasiPerusahaanPt != null ||
        _ritelInformasiPengurusPT!.isNotEmpty ||
        _ritelInformasiLainnyaPt != null) {
      _localDBService.replacePerusahaanPtFlag({
        'informasi_perusahaan_pt': _ritelInformasiPerusahaanPt != null ? 2 : 0,
        'informasi_pengurus_pt': _ritelInformasiPengurusPT!.isNotEmpty ? 2 : 0,
        'informasi_lainnya_pt': _ritelInformasiLainnyaPt != null ? 2 : 0,
        'debiturName': _ritelInformasiPerusahaanPt!.companyName!,
      });
    }
    _navigationService.navigateTo(
      Routes.tDPPerusahaanPtViewRitel,
      arguments: TDPPerusahaanPtViewRitelArguments(
        pipelineId: pipelineId,
        fromPipelineDetailsView: true,
        statusPipeline: statusPipeline,
      ),
    );
  }

  void navigateToPipelineView() => _navigationService.clearStackAndShow(
        Routes.mainView,
        arguments: const MainViewArguments(index: 1),
      );

  Future showKonfirmasiPreScreeningDialog() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.confirmation,
      data: {
        'title': 'Konfirmasi Pre-Screening',
        'description':
            'Kesalahan penginputan data yang menyebabkan Pre-Screening DITOLAK, maka Pre-Screening harus diproses kembali dari awal',
      },
    );

    if (response != null && response.confirmed) {
      final res = await _ritelScreeningAPI
          .runPrescreening(_ritelInformasiPerusahaanPt!.pipeline_flagId!);

      res.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (success) => _navigationService.navigateTo(
          Routes.pipelineSuccessViewRitel,
          arguments: PipelineSuccessViewRitelArguments(
            pipelineId: pipelineId,
            debiturName: _ritelInformasiPerusahaanPt!.companyName!,
          ),
        ),
      );
    }
  }

  Future<String> _getPublicFile(String url) async {
    String tempUrl = '';
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(url),
    );

    res.fold(
      (err) => tempUrl = '',
      (success) => tempUrl = success,
    );

    return tempUrl;
  }

  String? ktpPath;

  Future<String> getPublicFileKTP(String url) async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(url),
    );

    res.fold(
      (err) => ktpPath = '',
      (success) => ktpPath = success,
    );

    return ktpPath!;
  }

  String? npwpPath;

  Future<String> getPublicFileNPWP(String url) async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(url),
    );

    res.fold(
      (err) => npwpPath = '',
      (success) => npwpPath = success,
    );

    return npwpPath!;
  }

  void _clearFile() {
    _fotoNpwpPerusahaanPt = null;
    _fotoAktaPendirian = null;
    _fotoAktaPerubahanTerakhir = null;
    _fotoAktaPerubahanTerakhir = null;
    _fotosKKumhamPendirian = null;
    _fotosKkumhamPerubahaanTerakhir = null;
  }

  bool get checkFotoKunjunganSatu =>
      fotoKunjunganSatu != null &&
      fotoKunjunganDua == null &&
      fotoKunjunganTiga == null &&
      fotoKunjunganEmpat == null &&
      fotoKunjunganLima == null;

  bool get checkFotoKunjunganDua =>
      fotoKunjunganSatu != null &&
      fotoKunjunganDua != null &&
      fotoKunjunganTiga == null &&
      fotoKunjunganEmpat == null &&
      fotoKunjunganLima == null;

  bool get checkFotoKunjunganTiga =>
      fotoKunjunganSatu != null &&
      fotoKunjunganDua != null &&
      fotoKunjunganTiga != null &&
      fotoKunjunganEmpat == null &&
      fotoKunjunganLima == null;

  bool get checkFotoKunjunganEmpat =>
      fotoKunjunganSatu != null &&
      fotoKunjunganDua != null &&
      fotoKunjunganTiga != null &&
      fotoKunjunganEmpat != null &&
      fotoKunjunganLima == null;

  bool get checkFotoKunjunganLima =>
      fotoKunjunganSatu != null &&
      fotoKunjunganDua != null &&
      fotoKunjunganTiga != null &&
      fotoKunjunganEmpat != null &&
      fotoKunjunganLima != null;
}

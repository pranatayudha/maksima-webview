import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../application/app/app.locator.dart';
import '../../../../application/app/app.router.dart';
import '../../../../application/enums/bottom_sheet_type.dart';
import '../../../../application/enums/dialog_type.dart';
import '../../../../application/models/ritel_informasi_lainnya_cv.dart';
import '../../../../application/models/ritel_informasi_pengurus_cv.dart';
import '../../../../application/models/ritel_informasi_perusahaan_cv.dart';
import '../../../../application/services/local_db_service.dart';
import '../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../infrastructure/apis/ritel_pipeline_perusahaan_cv_api.dart';
import '../../../../infrastructure/apis/ritel_screening_api.dart';

class PipelineDetailsPerusahaanCvViewModelRitel extends FutureViewModel {
  final String pipelineId;
  final int? statusPipeline;
  final int codeTable;

  PipelineDetailsPerusahaanCvViewModelRitel({
    required this.pipelineId,
    this.statusPipeline,
    required this.codeTable,
  });

  final RitelPipelinePerusahaanCvAPI _ritelPipelinePerusahaanCvAPI =
      locator<RitelPipelinePerusahaanCvAPI>();
  final DialogService _dialogService = locator<DialogService>();
  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final RitelScreeningAPI _ritelScreeningAPI = locator<RitelScreeningAPI>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();

  RitelInformasiPerusahaanCV? _ritelInformasiPerusahaanCv;

  RitelInformasiPerusahaanCV? get informasiPerusahaanCv =>
      _ritelInformasiPerusahaanCv;
  List<RitelInformasiPengurusCV>? _ritelInformasiPengurusCV;

  List<RitelInformasiPengurusCV>? get informasiPengurusCv =>
      _ritelInformasiPengurusCV;
  int pengurusCvIndex = 0;
  RitelInformasiLainnyaCv? _ritelInformasiLainnyaCv;
  int informasiPengurusDataNavigatorIndex = 0;

  RitelInformasiLainnyaCv? get informasiLainnyaCv => _ritelInformasiLainnyaCv;

  @override
  Future futureToRun() async {
    _clearFile();

    await _getData();
    if (_ritelInformasiPerusahaanCv != null) {
      await _prepopulateImagesPerusahaan();
    }

    if (_ritelInformasiPengurusCV != null) {
      await _prepopulateImagesPengurus();
    }

    if (_ritelInformasiLainnyaCv != null) {
      if (_ritelInformasiLainnyaCv!.visitPath!.isNotEmpty) {
        await _prepopulateImagesLainnya();
      }
    } else {
      _ritelInformasiLainnyaCv = null;
    }
  }

  Future _getData() async {
    final response = await runBusyFuture(
      _ritelPipelinePerusahaanCvAPI.getById(pipelineId, '2'),
    );

    response.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (pipelineData) async {
        _ritelInformasiPerusahaanCv = pipelineData['informasi_perusahaan'];
        await _prepopulateImagesPerusahaan();
        _ritelInformasiPengurusCV = pipelineData['informasi_pengurus'] != []
            ? pipelineData['informasi_pengurus']
            : null;
        if (pipelineData['informasi_lainnya'] != null) {
          _ritelInformasiLainnyaCv = pipelineData['informasi_lainnya'];
          if (_ritelInformasiLainnyaCv!.visitPath!.isNotEmpty) {
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

  void navigateToTDPPerusahaanCvView() {
    if (_ritelInformasiPerusahaanCv != null ||
        _ritelInformasiPengurusCV!.isNotEmpty ||
        _ritelInformasiLainnyaCv != null) {
      _localDBService.replacePerusahaanCvFlag({
        'informasi_perusahaan_cv': _ritelInformasiPerusahaanCv != null ? 2 : 0,
        'informasi_pengurus': _ritelInformasiPengurusCV!.isNotEmpty ? 2 : 0,
        'informasi_lainnya': _ritelInformasiLainnyaCv != null ? 2 : 0,
        'debiturName': _ritelInformasiPerusahaanCv!.companyName!,
      });
    }
    _navigationService.navigateTo(
      Routes.tDPPerusahaanCvViewRitel,
      arguments: TDPPerusahaanCvViewRitelArguments(
        pipelineId: pipelineId,
        fromPipelineDetailsView: true,
        statusPipeline: statusPipeline,
      ),
    );
  }

  void changeInformasiPengurusDataNavigatorIndex(int index) async {
    informasiPengurusDataNavigatorIndex = index;
    await getPublicFileKTP(_ritelInformasiPengurusCV![index].ktpPath!);
    await getPublicFileKTPSelfie(
      _ritelInformasiPengurusCV![index].ktpSelfiePath!,
    );
    await getPublicFileNPWP(_ritelInformasiPengurusCV![index].npwpPath!);
    await getPublicFileKK(_ritelInformasiPengurusCV![index].kkPath!);

    if (_ritelInformasiPengurusCV![index].spouseKtpPath != null ||
        _ritelInformasiPengurusCV![index].marriagePath != null) {
      await getPublicFileSpouseKTP(
        _ritelInformasiPengurusCV![index].spouseKtpPath!,
      );
      await getPublicFileMarriage(
        _ritelInformasiPengurusCV![index].marriagePath!,
      );
    }

    if (_ritelInformasiPengurusCV![index].divorcePath != null) {
      await getPublicFileDivorce(
        _ritelInformasiPengurusCV![index].divorcePath!,
      );
    }

    if (_ritelInformasiPengurusCV![index].deathCertificatePath != null) {
      await getPublicFileDeathCertificate(
        _ritelInformasiPengurusCV![index].deathCertificatePath!,
      );
    }
    notifyListeners();
  }

  Future _prepopulateImagesPengurus() async {
    if (_ritelInformasiPengurusCV![0].ktpPath != null) {
      await getPublicFileKTP(_ritelInformasiPengurusCV![0].ktpPath!);
    }

    if (_ritelInformasiPengurusCV![0].ktpSelfiePath != null) {
      await getPublicFileKTPSelfie(
        _ritelInformasiPengurusCV![0].ktpSelfiePath!,
      );
    }

    if (_ritelInformasiPengurusCV![0].npwpPath != null) {
      await getPublicFileNPWP(_ritelInformasiPengurusCV![0].npwpPath!);
    }

    if (_ritelInformasiPengurusCV![0].kkPath != null) {
      await getPublicFileKK(_ritelInformasiPengurusCV![0].kkPath!);
    }

    if (_ritelInformasiPengurusCV![0].spouseKtpPath != null ||
        _ritelInformasiPengurusCV![0].marriagePath != null) {
      await getPublicFileSpouseKTP(
        _ritelInformasiPengurusCV![0].spouseKtpPath!,
      );
      await getPublicFileMarriage(
        _ritelInformasiPengurusCV![0].marriagePath!,
      );
    }

    if (_ritelInformasiPengurusCV![0].divorcePath != null) {
      await getPublicFileDivorce(
        _ritelInformasiPengurusCV![0].divorcePath!,
      );
    }

    if (_ritelInformasiPengurusCV![0].deathCertificatePath != null) {
      await getPublicFileDeathCertificate(
        _ritelInformasiPengurusCV![0].deathCertificatePath!,
      );
    }
  }

  String? _fotoNpwpPerusahaanCv;

  String? get fotoNpwpPerusahaanCv => _fotoNpwpPerusahaanCv;
  String? _fotoAktaPendirian;

  String? get fotoAktaPendirian => _fotoAktaPendirian;
  String? _fotoAktaPerubahanTerakhir;

  String? get fotoAktaPerubahanTerakhir => _fotoAktaPerubahanTerakhir;
  String? _fotosKKumhamPendirian;

  String? get fotosKKumhamPendirian => _fotosKKumhamPendirian;
  String? _fotosKkumhamPerubahaanTerakhir;

  String? get fotosKkumhamPerubahaanTerakhir => _fotosKkumhamPerubahaanTerakhir;

  Future _prepopulateImagesPerusahaan() async {
    if (_ritelInformasiPerusahaanCv!.companyNpwpPath != null &&
        _ritelInformasiPerusahaanCv!.companyNpwpPath!.isNotEmpty) {
      _fotoNpwpPerusahaanCv =
          await _getPublicFile(_ritelInformasiPerusahaanCv!.companyNpwpPath!);
      notifyListeners();
    }

    if (_ritelInformasiPerusahaanCv!.deedEstPath != null &&
        _ritelInformasiPerusahaanCv!.deedEstPath!.isNotEmpty) {
      _fotoAktaPendirian =
          await _getPublicFile(_ritelInformasiPerusahaanCv!.deedEstPath!);
      notifyListeners();
    }

    if (_ritelInformasiPerusahaanCv!.latestDeedPath != null &&
        _ritelInformasiPerusahaanCv!.latestDeedPath!.isNotEmpty) {
      _fotoAktaPerubahanTerakhir =
          await _getPublicFile(_ritelInformasiPerusahaanCv!.latestDeedPath!);
      notifyListeners();
    }

    if (_ritelInformasiPerusahaanCv!.skKumhamPath != null &&
        _ritelInformasiPerusahaanCv!.skKumhamPath!.isNotEmpty) {
      _fotosKKumhamPendirian =
          await _getPublicFile(_ritelInformasiPerusahaanCv!.skKumhamPath!);
      notifyListeners();
    }
    if (_ritelInformasiPerusahaanCv!.latestSkKumhamPath != null &&
        _ritelInformasiPerusahaanCv!.latestSkKumhamPath!.isNotEmpty) {
      _fotosKkumhamPerubahaanTerakhir = await _getPublicFile(
        _ritelInformasiPerusahaanCv!.latestSkKumhamPath!,
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
    if (_ritelInformasiLainnyaCv!.visitPath!.length == 2) {
      if (_ritelInformasiLainnyaCv!.visitPath![0]['path'] != null) {
        _fotoKunjunganSatu = await _getPublicFile(
          _ritelInformasiLainnyaCv!.visitPath![0]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaCv!.visitPath![1]['path'] != null) {
        _fotoKunjunganDua = await _getPublicFile(
          _ritelInformasiLainnyaCv!.visitPath![1]['path']!,
        );
        notifyListeners();
      }
    } else if (_ritelInformasiLainnyaCv!.visitPath!.length == 3) {
      if (_ritelInformasiLainnyaCv!.visitPath![0]['path'] != null) {
        _fotoKunjunganSatu = await _getPublicFile(
          _ritelInformasiLainnyaCv!.visitPath![0]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaCv!.visitPath![1]['path'] != null) {
        _fotoKunjunganDua = await _getPublicFile(
          _ritelInformasiLainnyaCv!.visitPath![1]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaCv!.visitPath![2]['path'] != null) {
        _fotoKunjunganTiga = await _getPublicFile(
          _ritelInformasiLainnyaCv!.visitPath![2]['path']!,
        );
        notifyListeners();
      }
    } else if (_ritelInformasiLainnyaCv!.visitPath!.length == 4) {
      if (_ritelInformasiLainnyaCv!.visitPath![0]['path'] != null) {
        _fotoKunjunganSatu = await _getPublicFile(
          _ritelInformasiLainnyaCv!.visitPath![0]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaCv!.visitPath![1]['path'] != null) {
        _fotoKunjunganDua = await _getPublicFile(
          _ritelInformasiLainnyaCv!.visitPath![1]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaCv!.visitPath![2]['path'] != null) {
        _fotoKunjunganTiga = await _getPublicFile(
          _ritelInformasiLainnyaCv!.visitPath![2]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaCv!.visitPath![3]['path'] != null) {
        _fotoKunjunganEmpat = await _getPublicFile(
          _ritelInformasiLainnyaCv!.visitPath![3]['path']!,
        );
        notifyListeners();
      }
    } else {
      if (_ritelInformasiLainnyaCv!.visitPath![0]['path'] != null) {
        _fotoKunjunganSatu = await _getPublicFile(
          _ritelInformasiLainnyaCv!.visitPath![0]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaCv!.visitPath![1]['path'] != null) {
        _fotoKunjunganDua = await _getPublicFile(
          _ritelInformasiLainnyaCv!.visitPath![1]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaCv!.visitPath![2]['path'] != null) {
        _fotoKunjunganTiga = await _getPublicFile(
          _ritelInformasiLainnyaCv!.visitPath![2]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaCv!.visitPath![3]['path'] != null) {
        _fotoKunjunganEmpat = await _getPublicFile(
          _ritelInformasiLainnyaCv!.visitPath![3]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnyaCv!.visitPath![4]['path'] != null) {
        _fotoKunjunganLima = await _getPublicFile(
          _ritelInformasiLainnyaCv!.visitPath![4]['path']!,
        );
        notifyListeners();
      }
    }
  }

  void _clearFile() {
    _fotoNpwpPerusahaanCv = null;
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

  void navigateToPipelineView() {
    _navigationService.clearStackAndShow(
      Routes.mainView,
      arguments: const MainViewArguments(index: 1),
    );
  }

  void navigateToHasilScreeningView() => _navigationService.navigateTo(
        Routes.hasilPrescreeningViewRitel,
        arguments: HasilPrescreeningViewRitelArguments(
          pipelineflagId: _ritelInformasiPerusahaanCv!.pipeline_flagId!,
          name: _ritelInformasiPerusahaanCv!.companyName,
          ktpNum: _ritelInformasiPerusahaanCv!.companyNpwpNum,
          fromPrakarsaDetails: false,
        ),
      );

  void navigateToHasilScreeningCvView() => _navigationService.navigateTo(
        Routes.hasilPrescreeningViewPerusahaanCVRitel,
        arguments: HasilPrescreeningViewPerusahaanCVRitelArguments(
          pipelineFlagId: _ritelInformasiPerusahaanCv!.pipeline_flagId!,
          codeTable: '2',
          fromPrakarsaDetails: true,
        ),
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
          .runPrescreening(_ritelInformasiPerusahaanCv!.pipeline_flagId!);

      res.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (success) => _navigationService.navigateTo(
          Routes.pipelineSuccessViewRitel,
          arguments: PipelineSuccessViewRitelArguments(
            pipelineId: pipelineId,
            debiturName: _ritelInformasiPerusahaanCv!.companyName!,
          ),
        ),
      );
    }
  }

  Future<String> _getPublicFile(String url) async {
    String _tempUrl = '';
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(url),
    );

    res.fold(
      (err) => _tempUrl = '',
      (success) => _tempUrl = success,
    );

    return _tempUrl;
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

  String? ktpSelfiePath;

  Future<String> getPublicFileKTPSelfie(String url) async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(url),
    );

    res.fold(
      (err) => ktpSelfiePath = '',
      (success) => ktpSelfiePath = success,
    );

    return ktpSelfiePath!;
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

  String? kkPath;

  Future<String> getPublicFileKK(String url) async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(url),
    );

    res.fold(
      (err) => kkPath = '',
      (success) => kkPath = success,
    );

    return kkPath!;
  }

  String? spouseKtpPath;

  Future<String> getPublicFileSpouseKTP(String url) async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(url),
    );

    res.fold(
      (err) => spouseKtpPath = '',
      (success) => spouseKtpPath = success,
    );

    return spouseKtpPath!;
  }

  String? marriagePath;

  Future<String> getPublicFileMarriage(String url) async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(url),
    );

    res.fold(
      (err) => marriagePath = '',
      (success) => marriagePath = success,
    );

    return marriagePath!;
  }

  String? divorcePath;

  Future<String> getPublicFileDivorce(String url) async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(url),
    );

    res.fold(
      (err) => divorcePath = '',
      (success) => divorcePath = success,
    );

    return divorcePath!;
  }

  String? deathCertificatePath;

  Future<String> getPublicFileDeathCertificate(String url) async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(url),
    );

    res.fold(
      (err) => deathCertificatePath = '',
      (success) => deathCertificatePath = success,
    );

    return deathCertificatePath!;
  }
}

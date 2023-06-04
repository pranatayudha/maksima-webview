// ignore_for_file: unused_import, no_leading_underscores_for_local_identifiers

import 'dart:developer' as developer;

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../application/app/app.locator.dart';
import '../../../../application/app/app.router.dart';
import '../../../../application/app/constants/common.dart';
import '../../../../application/enums/bottom_sheet_type.dart';
import '../../../../application/enums/dialog_type.dart';
import '../../../../application/models/ritel_informasi_data_diri.dart';
import '../../../../application/models/ritel_informasi_lainnya.dart';
import '../../../../application/models/ritel_informasi_usaha.dart';
import '../../../../application/services/local_db_service.dart';
import '../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../infrastructure/apis/ritel_pipeline_perorangan_api.dart';
import '../../../../infrastructure/apis/ritel_screening_api.dart';

class PipelineDetailsViewModelPari extends FutureViewModel {
  final String pipelineId;
  final int? statusPipeline;

  PipelineDetailsViewModelPari({
    required this.pipelineId,
    this.statusPipeline,
  });

  final RitelPipelinePeroranganAPI _ritelPipelinePeroranganAPI =
      locator<RitelPipelinePeroranganAPI>();
  final DialogService _dialogService = locator<DialogService>();
  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final RitelScreeningAPI _ritelScreeningAPI = locator<RitelScreeningAPI>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();

  RitelInformasiDataDiri? _ritelInformasiDataDiri;

  RitelInformasiDataDiri? get informasiDataDiri => _ritelInformasiDataDiri;
  RitelInformasiUsaha? _ritelInformasiUsaha;

  RitelInformasiUsaha? get informasiUsaha => _ritelInformasiUsaha;
  RitelInformasiLainnya? _ritelInformasiLainnya;

  RitelInformasiLainnya? get informasiLainnya => _ritelInformasiLainnya;

  @override
  Future futureToRun() => _getData();

  Future _getData() async {
    final response = await runBusyFuture(
      _ritelPipelinePeroranganAPI.getById(pipelineId, '4'),
    );

    response.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (pipelineData) async {
        _ritelInformasiDataDiri = pipelineData['informasi_data_diri'];
        await _prepopulateImagesDataDiri();
        // ignore: prefer-conditional-expressions
        if (pipelineData['informasi_usaha'] != null) {
          _ritelInformasiUsaha = pipelineData['informasi_usaha'];
        } else {
          _ritelInformasiUsaha = null;
        }
        if (pipelineData['informasi_lainnya'] != null) {
          _ritelInformasiLainnya = pipelineData['informasi_lainnya'];
          if (_ritelInformasiLainnya?.visitPath != null &&
              (_ritelInformasiLainnya?.visitPath?.isNotEmpty ?? false)) {
            await _prepopulateImagesLainnya();
          }
        } else {
          _ritelInformasiLainnya = null;
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

  void navigateToTDPPeroranganView() {
    if (_ritelInformasiDataDiri != null ||
        _ritelInformasiUsaha != null ||
        _ritelInformasiLainnya != null) {
      _localDBService.replacePeroranganFlag({
        'informasi_data_diri': _ritelInformasiDataDiri != null
            ? _ritelInformasiDataDiri?.religion != null
                ? 2
                : 1
            : 0,
        'informasi_usaha': _ritelInformasiUsaha != null
            ? _ritelInformasiUsaha?.economy_sectorsId != null
                ? 2
                : 1
            : 0,
        'informasi_lainnya': _ritelInformasiLainnya != null
            ? _ritelInformasiLainnya?.etaToCB != null
                ? 2
                : 1
            : 0,
        'idAccountPARI': _ritelInformasiDataDiri?.idAccountPari ?? '',
        'religion': _ritelInformasiDataDiri?.religion ?? '',
        'lastEducation': _ritelInformasiDataDiri?.lastEducation ?? '',
        'dataDiriAddress': {
          'tagLocation': {
            'name': _ritelInformasiDataDiri?.tagLocation?.name ?? '',
            'latLng': _ritelInformasiDataDiri?.tagLocation?.latLng ?? '',
          },
          'detail': _ritelInformasiDataDiri?.detail ?? '',
          'postalCode': _ritelInformasiDataDiri?.postalCode ?? '',
          'province': _ritelInformasiDataDiri?.province ?? '',
          'city': _ritelInformasiDataDiri?.city ?? '',
          'district': _ritelInformasiDataDiri?.district ?? '',
          'village': _ritelInformasiDataDiri?.village ?? '',
          'rt': _ritelInformasiDataDiri?.rt ?? '',
          'rw': _ritelInformasiDataDiri?.rw ?? '',
        },
        'debiturName': _ritelInformasiDataDiri?.fullName,
      });
    }

    _navigationService.navigateTo(
      Routes.tDPPeroranganViewPari,
      arguments: TDPPeroranganViewPariArguments(
        pipelineId: pipelineId,
        fromPipelineDetailsView: true,
        statusPipeline: statusPipeline,
      ),
    );
  }

  String? _fotoKtpDebitur;

  String? get fotoKtpDebitur => _fotoKtpDebitur;
  String? _fotoKtpSelfie;

  String? get fotoKtpSelfie => _fotoKtpSelfie;
  String? _fotoNpwpDebitur;

  String? get fotoNpwpDebitur => _fotoNpwpDebitur;
  String? _fotoKartuKeluargaDebitur;

  String? get fotoKartuKeluargaDebitur => _fotoKartuKeluargaDebitur;
  String? _fotoKtpPasangan;

  String? get fotoKtpPasangan => _fotoKtpPasangan;
  String? _fotoAktaNikah;

  String? get fotoAktaNikah => _fotoAktaNikah;
  String? _fotoAktaCerai;

  String? get fotoAktaCerai => _fotoAktaCerai;
  String? _suratKematian;

  String? get suratKematian => _suratKematian;

  Future _prepopulateImagesDataDiri() async {
    if (_ritelInformasiDataDiri!.ktpPath != null &&
        _ritelInformasiDataDiri!.ktpPath!.isNotEmpty) {
      _fotoKtpDebitur = await _getPublicFile(_ritelInformasiDataDiri!.ktpPath!);
      notifyListeners();
    }

    if (_ritelInformasiDataDiri!.ktpSelfiePath != null &&
        _ritelInformasiDataDiri!.ktpSelfiePath!.isNotEmpty) {
      _fotoKtpSelfie =
          await _getPublicFile(_ritelInformasiDataDiri!.ktpSelfiePath!);
      notifyListeners();
    }

    if (_ritelInformasiDataDiri!.npwpPath != null &&
        _ritelInformasiDataDiri!.npwpPath!.isNotEmpty) {
      _fotoNpwpDebitur =
          await _getPublicFile(_ritelInformasiDataDiri!.npwpPath!);
      notifyListeners();
    }

    if (_ritelInformasiDataDiri!.kkPath != null &&
        _ritelInformasiDataDiri!.kkPath!.isNotEmpty) {
      _fotoKartuKeluargaDebitur =
          await _getPublicFile(_ritelInformasiDataDiri!.kkPath!);
      notifyListeners();
    }

    if (_ritelInformasiDataDiri!.maritalStatus == Common.kawin &&
        _ritelInformasiDataDiri!.spouseKtpPath != null &&
        _ritelInformasiDataDiri!.spouseKtpPath!.isNotEmpty) {
      _fotoKtpPasangan =
          await _getPublicFile(_ritelInformasiDataDiri!.spouseKtpPath!);
      notifyListeners();
    }

    if (_ritelInformasiDataDiri!.maritalStatus == Common.kawin &&
        _ritelInformasiDataDiri!.marriagePath != null &&
        _ritelInformasiDataDiri!.marriagePath!.isNotEmpty) {
      _fotoAktaNikah =
          await _getPublicFile(_ritelInformasiDataDiri!.marriagePath!);
      notifyListeners();
    }

    if (_ritelInformasiDataDiri!.maritalStatus == Common.ceraiHidup &&
        _ritelInformasiDataDiri!.divorcePath != null &&
        _ritelInformasiDataDiri!.divorcePath!.isNotEmpty) {
      _fotoAktaCerai =
          await _getPublicFile(_ritelInformasiDataDiri!.divorcePath!);
      notifyListeners();
    }

    if (_ritelInformasiDataDiri!.maritalStatus == Common.ceraiMati &&
        _ritelInformasiDataDiri!.deathCertificatePath != null &&
        _ritelInformasiDataDiri!.deathCertificatePath!.isNotEmpty) {
      _suratKematian =
          await _getPublicFile(_ritelInformasiDataDiri!.deathCertificatePath!);
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
    if (_ritelInformasiLainnya!.visitPath!.length == 2) {
      if (_ritelInformasiLainnya!.visitPath![0]['path'] != null) {
        _fotoKunjunganSatu = await _getPublicFile(
          _ritelInformasiLainnya!.visitPath![0]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnya!.visitPath![1]['path'] != null) {
        _fotoKunjunganDua = await _getPublicFile(
          _ritelInformasiLainnya!.visitPath![1]['path']!,
        );
        notifyListeners();
      }
    } else if (_ritelInformasiLainnya!.visitPath!.length == 3) {
      if (_ritelInformasiLainnya!.visitPath![0]['path'] != null) {
        _fotoKunjunganSatu = await _getPublicFile(
          _ritelInformasiLainnya!.visitPath![0]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnya!.visitPath![1]['path'] != null) {
        _fotoKunjunganDua = await _getPublicFile(
          _ritelInformasiLainnya!.visitPath![1]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnya!.visitPath![2]['path'] != null) {
        _fotoKunjunganTiga = await _getPublicFile(
          _ritelInformasiLainnya!.visitPath![2]['path']!,
        );
        notifyListeners();
      }
    } else if (_ritelInformasiLainnya!.visitPath!.length == 4) {
      if (_ritelInformasiLainnya!.visitPath![0]['path'] != null) {
        _fotoKunjunganSatu = await _getPublicFile(
          _ritelInformasiLainnya!.visitPath![0]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnya!.visitPath![1]['path'] != null) {
        _fotoKunjunganDua = await _getPublicFile(
          _ritelInformasiLainnya!.visitPath![1]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnya!.visitPath![2]['path'] != null) {
        _fotoKunjunganTiga = await _getPublicFile(
          _ritelInformasiLainnya!.visitPath![2]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnya!.visitPath![3]['path'] != null) {
        _fotoKunjunganEmpat = await _getPublicFile(
          _ritelInformasiLainnya!.visitPath![3]['path']!,
        );
        notifyListeners();
      }
    } else {
      if (_ritelInformasiLainnya!.visitPath![0]['path'] != null) {
        _fotoKunjunganSatu = await _getPublicFile(
          _ritelInformasiLainnya!.visitPath![0]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnya!.visitPath![1]['path'] != null) {
        _fotoKunjunganDua = await _getPublicFile(
          _ritelInformasiLainnya!.visitPath![1]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnya!.visitPath![2]['path'] != null) {
        _fotoKunjunganTiga = await _getPublicFile(
          _ritelInformasiLainnya!.visitPath![2]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnya!.visitPath![3]['path'] != null) {
        _fotoKunjunganEmpat = await _getPublicFile(
          _ritelInformasiLainnya!.visitPath![3]['path']!,
        );
        notifyListeners();
      }

      if (_ritelInformasiLainnya!.visitPath![4]['path'] != null) {
        _fotoKunjunganLima = await _getPublicFile(
          _ritelInformasiLainnya!.visitPath![4]['path']!,
        );
        notifyListeners();
      }
    }
  }

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

  void navigateToPipelineView() => _navigationService.clearStackAndShow(
        Routes.mainView,
        arguments: const MainViewArguments(index: 1),
      );

  void navigateToHasilScreeningView() => _navigationService.navigateTo(
        Routes.hasilPrescreeningViewRitel,
        arguments: HasilPrescreeningViewRitelArguments(
          pipelineflagId: _ritelInformasiDataDiri!.pipeline_flagId!,
          name: _ritelInformasiDataDiri!.fullName,
          ktpNum: _ritelInformasiDataDiri!.ktpNum,
          fromPrakarsaDetails: false,
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
      final resRunPrescreening = await runBusyFuture(_ritelScreeningAPI
          .runPrescreening(_ritelInformasiDataDiri!.pipeline_flagId!));

      resRunPrescreening.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (success) => _navigationService.navigateTo(
          Routes.pipelineSuccessViewPari,
          arguments: PipelineSuccessViewPariArguments(
            pipelineId: pipelineId,
            debiturName: _ritelInformasiDataDiri!.fullName!,
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

  String setStringResponse(String res) {
    return res.isEmpty ? '-' : res;
  }
}

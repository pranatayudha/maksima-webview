// ignore_for_file: unused_element, long-method

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../application/app/app.locator.dart';
import '../../../../../application/app/app.router.dart';
import '../../../../../application/app/constants/custom_color.dart';
import '../../../../../application/enums/bottom_sheet_type.dart';
import '../../../../../application/enums/dialog_type.dart';
import '../../../../../application/services/local_db_service.dart';
import '../../../../../infrastructure/apis/ritel_pipeline_perorangan_api.dart';
import '../../../../../infrastructure/apis/ritel_screening_api.dart';

class TDPPeroranganViewModelPari extends FutureViewModel {
  String? pipelineId;
  bool? fromPipelineDetailsView;
  bool? fromTDPViewRitel;
  int? statusPipeline;

  TDPPeroranganViewModelPari({
    this.pipelineId,
    this.fromPipelineDetailsView = false,
    this.fromTDPViewRitel = false,
    this.statusPipeline,
  });

  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final RitelPipelinePeroranganAPI _ritelPipelinePeroranganAPI =
      locator<RitelPipelinePeroranganAPI>();
  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final RitelScreeningAPI _ritelScreeningAPI = locator<RitelScreeningAPI>();

  int _informasiDataDiriCompleted = 0;
  int _informasiUsahaCompleted = 0;
  int _informasiLainnyaCompleted = 0;

  int get informasiDataDiriCompleted => _informasiDataDiriCompleted;

  int get informasiUsahaCompleted => _informasiUsahaCompleted;

  int get informasiLainnyaCompleted => _informasiLainnyaCompleted;

  bool get allFormsCompleted =>
      _informasiDataDiriCompleted == 2 &&
      _informasiUsahaCompleted == 2 &&
      _informasiLainnyaCompleted == 2;

  bool get checkDataDiriCompleted => _informasiDataDiriCompleted == 2;

  bool get checkUsahaCompleted => _informasiUsahaCompleted == 2;

  bool get checkLainnyaCompleted => _informasiLainnyaCompleted == 2;

  bool get hasPipelineId => pipelineId != null;

  @override
  Future futureToRun() => getFlag();

  void navigateToPipelineView() {
    _navigationService.clearStackAndShow(
      Routes.mainView,
      arguments: const MainViewArguments(index: 1),
    );
  }

  void navigateToPipelineDetailsView() {
    _savePipelineMethod().then((value) {
      _navigationService.navigateTo(
        Routes.pipelineDetailsViewPari,
        arguments: PipelineDetailsViewPariArguments(
          id: pipelineId!,
          debiturType: 'Perorangan',
          statusPipeline: allFormsCompleted ? 2 : 1,
        ),
      );
    });
  }

  Future getFlag() async {
    if (fromPipelineDetailsView == true) {
      final getPipelineFlag = _localDBService.getPeroranganFlag();

      _informasiDataDiriCompleted = getPipelineFlag!['informasi_data_diri']!;
      _informasiUsahaCompleted = getPipelineFlag['informasi_usaha']!;
      _informasiLainnyaCompleted = getPipelineFlag['informasi_lainnya']!;
      notifyListeners();
    }

    if (fromTDPViewRitel != true) {
      final getPipelineFlag = _localDBService.getPeroranganFlag();
      _informasiDataDiriCompleted = getPipelineFlag!['informasi_data_diri']!;
      _informasiUsahaCompleted = getPipelineFlag['informasi_usaha']!;
      _informasiLainnyaCompleted = getPipelineFlag['informasi_lainnya']!;
      notifyListeners();
    } else {
      _localDBService.removePeroranganFlag();
    }
  }

  Future checkCompletedForm() async {
    if (fromPipelineDetailsView != true) {
      if (_informasiDataDiriCompleted == 2 ||
          _informasiUsahaCompleted == 2 ||
          _informasiLainnyaCompleted == 2) {
        final response = await _dialogService.showCustomDialog(
          variant: DialogType.base,
          title: 'Batal?',
          description:
              'Apakah Anda yakin akan membatalkan proses tambah debitur potensial ini?',
          data: {'color': CustomColor.primaryRed80},
          mainButtonTitle: 'Batal',
        );

        if (response!.confirmed) {
          if (_localDBService.peroranganFlagBoxIsNotEmpty()) {
            final getPipelineFlag = _localDBService.getPeroranganFlag();

            _localDBService.replacePeroranganFlag({
              'dataDiriAddress': {
                'tagLocation':
                    getPipelineFlag!['dataDiriAddress']!['tagLocation']!,
                'detail': getPipelineFlag['dataDiriAddress']!['detail']!,
                'postalCode':
                    getPipelineFlag['dataDiriAddress']!['postalCode']!,
                'province': getPipelineFlag['dataDiriAddress']!['province']!,
                'city': getPipelineFlag['dataDiriAddress']!['city']!,
                'district': getPipelineFlag['dataDiriAddress']!['district']!,
                'village': getPipelineFlag['dataDiriAddress']!['village']!,
                'rt': getPipelineFlag['dataDiriAddress']!['rt']!,
                'rw': getPipelineFlag['dataDiriAddress']!['rw']!,
              },
              'debiturName': getPipelineFlag['debiturName']!,
            });
          }

          if (fromPipelineDetailsView != true) {
            _navigationService.navigateTo(Routes.tDPViewRitel);
          } else {
            navigateToPipelineDetailsView();
          }
        }
      } else {
        if (fromPipelineDetailsView != true) {
          _navigationService.navigateTo(Routes.tDPViewRitel);
        } else {
          navigateToPipelineDetailsView();
        }
      }
    } else {
      navigateToPipelineDetailsView();
    }
  }

  Future navigateToInformasiDataDiri() async {
    if (_informasiDataDiriCompleted == 0) {
      _navigationService.navigateTo(
        Routes.informasiDataDiriViewPari,
        arguments: InformasiDataDiriViewPariArguments(
          pipelineId: pipelineId,
          fromTdpPeroranganView: true,
          statusPipeline: statusPipeline,
        ),
      );
    } else {
      final response = await runBusyFuture(
        _ritelPipelinePeroranganAPI.getInformasiDataDiri(pipelineId!, 4),
      );

      response.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (ritelInformasiDataDiri) => _navigationService.navigateTo(
          Routes.informasiDataDiriViewPari,
          arguments: InformasiDataDiriViewPariArguments(
            pipelineId: pipelineId,
            fromTdpPeroranganView: true,
            ritelInformasiDataDiri: ritelInformasiDataDiri,
            fromPipelineDetailsView: fromPipelineDetailsView,
            statusPipeline: statusPipeline,
          ),
        ),
      );
    }
  }

  Future navigateToInformasiUsahaPari() async {
    if (_informasiUsahaCompleted == 0) {
      _navigationService.navigateTo(
        Routes.informasiUsahaDebiturPariView,
        arguments: InformasiUsahaDebiturPariViewArguments(
          pipelineId: pipelineId,
          fromTdpPeroranganView: true,
          statusPipeline: statusPipeline,
        ),
      );
    } else {
      final response = await runBusyFuture(
        _ritelPipelinePeroranganAPI.getInformasiUsaha(pipelineId!, 4),
      );

      response.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (ritelInformasiUsaha) => _navigationService.navigateTo(
          Routes.informasiUsahaDebiturPariView,
          arguments: InformasiUsahaDebiturPariViewArguments(
            pipelineId: pipelineId,
            fromTdpPeroranganView: true,
            ritelInformasiUsaha: ritelInformasiUsaha,
            fromPipelineDetailsView: fromPipelineDetailsView,
            statusPipeline: statusPipeline,
          ),
        ),
      );
    }
  }

  Future navigateToInformasiLainnyaPari() async {
    if (_informasiLainnyaCompleted == 0) {
      _navigationService.navigateTo(
        Routes.informasiLainnyaPariView,
        arguments: InformasiLainnyaPariViewArguments(
          pipelineId: pipelineId,
          fromTdpPeroranganView: true,
          statusPipeline: statusPipeline,
        ),
      );
    } else {
      final response = await runBusyFuture(
        _ritelPipelinePeroranganAPI.getInformasiLainnya(pipelineId!, 4),
      );

      response.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (ritelInformasiLainnya) => _navigationService.navigateTo(
          Routes.informasiLainnyaPariView,
          arguments: InformasiLainnyaPariViewArguments(
            pipelineId: pipelineId,
            fromTdpPeroranganView: true,
            ritelInformasiLainnya: ritelInformasiLainnya,
            fromPipelineDetailsView: fromPipelineDetailsView,
            statusPipeline: statusPipeline,
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
      await _savePipelineMethod();
    }
  }

  Future _savePipelineMethod() async {
    if (allFormsCompleted) {
      if (fromPipelineDetailsView == true) {
        if (statusPipeline == 1) {
          final res = await runBusyFuture(
            _ritelPipelinePeroranganAPI.savePipelinePari(pipelineId!),
          );

          res.fold(
            (errorMessage) {
              _showErrorDialog(errorMessage);
              notifyListeners();
            },
            (successMap) {
              final getPipelineFlag = _localDBService.getPeroranganFlag();

              _localDBService.replacePeroranganFlag({
                'informasi_data_diri': 2,
                'informasi_usaha': 2,
                'informasi_lainnya': 2,
                'dataDiriAddress': {
                  'tagLocation':
                      getPipelineFlag!['dataDiriAddress']!['tagLocation']!,
                  'detail': getPipelineFlag['dataDiriAddress']!['detail']!,
                  'postalCode':
                      getPipelineFlag['dataDiriAddress']!['postalCode']!,
                  'province': getPipelineFlag['dataDiriAddress']!['province']!,
                  'city': getPipelineFlag['dataDiriAddress']!['city']!,
                  'district': getPipelineFlag['dataDiriAddress']!['district']!,
                  'village': getPipelineFlag['dataDiriAddress']!['village']!,
                  'rt': getPipelineFlag['dataDiriAddress']!['rt']!,
                  'rw': getPipelineFlag['dataDiriAddress']!['rw']!,
                },
                'debiturName': getPipelineFlag['debiturName']!,
              });

              _showSuccessDialog(
                successMessage:
                    'Berhasil menambahkan data pipeline perorangan!',
                isContinue: true,
              );
              notifyListeners();
            },
          );
        } else {
          final getPipelineFlag = _localDBService.getPeroranganFlag();

          _localDBService.replacePeroranganFlag({
            'informasi_data_diri': 2,
            'informasi_usaha': 2,
            'informasi_lainnya': 2,
            'dataDiriAddress': {
              'tagLocation':
                  getPipelineFlag!['dataDiriAddress']!['tagLocation']!,
              'detail': getPipelineFlag['dataDiriAddress']!['detail']!,
              'postalCode': getPipelineFlag['dataDiriAddress']!['postalCode']!,
              'province': getPipelineFlag['dataDiriAddress']!['province']!,
              'city': getPipelineFlag['dataDiriAddress']!['city']!,
              'district': getPipelineFlag['dataDiriAddress']!['district']!,
              'village': getPipelineFlag['dataDiriAddress']!['village']!,
              'rt': getPipelineFlag['dataDiriAddress']!['rt']!,
              'rw': getPipelineFlag['dataDiriAddress']!['rw']!,
            },
            'debiturName': getPipelineFlag['debiturName']!,
          });

          _showSuccessDialog(
            successMessage: 'Berhasil menambahkan data pipeline perorangan!',
            isContinue: true,
          );
          notifyListeners();
        }
      } else {
        final res = await runBusyFuture(
          _ritelPipelinePeroranganAPI.savePipelinePari(pipelineId!),
        );

        res.fold(
          (errorMessage) {
            _showErrorDialog(errorMessage);
            notifyListeners();
          },
          (successMap) {
            final getPipelineFlag = _localDBService.getPeroranganFlag();

            _localDBService.replacePeroranganFlag({
              'informasi_data_diri': 2,
              'informasi_usaha': 2,
              'informasi_lainnya': 2,
              'dataDiriAddress': {
                'tagLocation':
                    getPipelineFlag!['dataDiriAddress']!['tagLocation']!,
                'detail': getPipelineFlag['dataDiriAddress']!['detail']!,
                'postalCode':
                    getPipelineFlag['dataDiriAddress']!['postalCode']!,
                'province': getPipelineFlag['dataDiriAddress']!['province']!,
                'city': getPipelineFlag['dataDiriAddress']!['city']!,
                'district': getPipelineFlag['dataDiriAddress']!['district']!,
                'village': getPipelineFlag['dataDiriAddress']!['village']!,
                'rt': getPipelineFlag['dataDiriAddress']!['rt']!,
                'rw': getPipelineFlag['dataDiriAddress']!['rw']!,
              },
              'debiturName': getPipelineFlag['debiturName']!,
            });

            _showSuccessDialog(
              successMessage: 'Berhasil menambahkan data pipeline perorangan!',
              isContinue: true,
            );
            notifyListeners();
          },
        );
      }
    } else {
      if (_informasiDataDiriCompleted == 2 ||
          _informasiUsahaCompleted == 2 ||
          _informasiLainnyaCompleted == 2) {
        final getPipelineFlag = _localDBService.getPeroranganFlag();

        _localDBService.replacePeroranganFlag({
          'informasi_data_diri': _informasiDataDiriCompleted == 2 ? 2 : 0,
          'informasi_usaha': _informasiUsahaCompleted == 2 ? 2 : 0,
          'informasi_lainnya': _informasiLainnyaCompleted == 2 ? 2 : 0,
          'dataDiriAddress': {
            'tagLocation': getPipelineFlag!['dataDiriAddress']!['tagLocation']!,
            'detail': getPipelineFlag['dataDiriAddress']!['detail']!,
            'postalCode': getPipelineFlag['dataDiriAddress']!['postalCode']!,
            'province': getPipelineFlag['dataDiriAddress']!['province']!,
            'city': getPipelineFlag['dataDiriAddress']!['city']!,
            'district': getPipelineFlag['dataDiriAddress']!['district']!,
            'village': getPipelineFlag['dataDiriAddress']!['village']!,
            'rt': getPipelineFlag['dataDiriAddress']!['rt']!,
            'rw': getPipelineFlag['dataDiriAddress']!['rw']!,
          },
          'debiturName': getPipelineFlag['debiturName']!,
        });

        _showSuccessDialog(
          successMessage: 'Berhasil menambahkan data pipeline perorangan!',
          isContinue: true,
        );
        notifyListeners();
      }
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
        Routes.pipelineDetailsViewPari,
        arguments: PipelineDetailsViewPariArguments(
          id: pipelineId!,
          debiturType: 'Perorangan',
          statusPipeline: allFormsCompleted ? 2 : 1,
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
    String? flagId;
    final getPipelineFlag = _localDBService.getPeroranganFlag();
    final responseDataDiri = await runBusyFuture(
      _ritelPipelinePeroranganAPI.getInformasiDataDiri(pipelineId!, 4),
    );
    responseDataDiri.fold((l) => null, (r) {
      flagId = r.pipeline_flagId;
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
      if (statusPipeline != 2) {
        final res = await runBusyFuture(
          _ritelPipelinePeroranganAPI.savePipelinePari(pipelineId!),
        );

        res.fold(
          (errorMessage) {
            _showErrorDialog(errorMessage);
            notifyListeners();
          },
          (successMap) async {
            final resRunPrescreening = await runBusyFuture(
              _ritelScreeningAPI.runPrescreening(flagId!),
            );

            resRunPrescreening.fold(
              (errorMessage) => _showErrorDialog(errorMessage),
              (success) => _navigationService.navigateTo(
                Routes.pipelineSuccessViewRitel,
                arguments: PipelineSuccessViewRitelArguments(
                  pipelineId: pipelineId,
                  debiturName: getPipelineFlag!['debiturName'],
                ),
              ),
            );
          },
        );
      } else {
        final resRunPrescreening = await runBusyFuture(
          _ritelScreeningAPI.runPrescreening(flagId!),
        );

        resRunPrescreening.fold(
          (errorMessage) => _showErrorDialog(errorMessage),
          (success) => _navigationService.navigateTo(
            Routes.pipelineSuccessViewRitel,
            arguments: PipelineSuccessViewRitelArguments(
              pipelineId: pipelineId,
              debiturName: getPipelineFlag!['debiturName'],
            ),
          ),
        );
      }
    }
  }
}

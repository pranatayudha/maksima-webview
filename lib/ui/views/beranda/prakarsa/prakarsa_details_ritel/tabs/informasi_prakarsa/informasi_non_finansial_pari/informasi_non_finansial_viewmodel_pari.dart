// ignore_for_file: unused_local_variable

import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../../application/services/local_db_service.dart';
import '../../../../../../../../infrastructure/apis/ritel_prakarsa_api.dart';

class InformasiNonFinansialViewModelPari extends BaseViewModel {
  String? prakarsaId;
  String? name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  InformasiNonFinansialViewModelPari({
    this.prakarsaId,
    this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  });

  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final RitelPrakarsaAPI _ritelPrakarsaAPI = locator<RitelPrakarsaAPI>();

  bool _isAfterSubmit = false;

  bool get isAfterSubmit => _isAfterSubmit;

  final ritelInformasiNonFinansial =
      Hive.box<Map<String, int>>('ritelInformasiNonFinansial');

  Future initialize() async {
    setBusy(true);
    setBusy(false);
  }

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Peringatan',
      description: errorMessage,
      mainButtonTitle: 'KEMBALI',
    );
  }

  Future _showSuccessDialogPut(String successMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );
  }

  // void updateAfterSubmit(bool value) {
  //   _isAfterSubmit = value;
  //   notifyListeners();
  // }

  // Ketika klik button back page pertama. Hive db akan dihapus.
  Future backToPrakarsa() async {
    _localDBService.removeNonFinansial();
    _localDBService.ritelRemovePrakarsaId();
  }

  void navigateToInfoPrakarsa() {
    _navigationService.navigateTo(
      Routes.prakarsaDetailsViewRitel,
      arguments: PrakarsaDetailsViewRitelArguments(
        index: 1,
        prakarsaId: prakarsaId!,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        codeTable: 4,
      ),
    );
  }

  Future insertAnswer(int page, int valueAnswer) async {
    if (valueAnswer != 0) {
      final getAnswer = _localDBService.nonFinansialIsNotEmpty();
      if (getAnswer) {
        final getByIndex = _localDBService.getNonFinansial(page);

        _localDBService.replaceNonFinansial(
          page,
          {
            'page': page,
            'answer': valueAnswer,
          },
        );
      }

      if (prakarsaId != null && name != null) {
        _localDBService.ritelStorePrakarsaId('id', prakarsaId!);
        _localDBService.ritelStorePrakarsaId('name', name!);
      }

      _localDBService.replaceNonFinansial(page, {
        'page': page,
        'answer': valueAnswer,
      });

      final getData = ritelInformasiNonFinansial.values;
    } else {
      _showErrorDialog(
        'Pilih terlebih dahulu jawaban dari daftar yang tersedia!',
      );
    }
  }

  Future postNonFinansialData() async {
    final summaryData = await _generateDataNonFinansial();

    final res = await runBusyFuture(
      _ritelPrakarsaAPI.postPrakarsaNonFinansialPari(summaryData),
    );

    res.fold(
      (errorMessage) {
        if (errorMessage == 'data already exist') {
          _isAfterSubmit = false;
          _showErrorDialog(errorMessage);
        }
      },
      (success) {
        _showSuccessDialogPut('Success insert data');
        _isAfterSubmit = true;
        notifyListeners();
      },
    );
  }

  Future<Map<String, dynamic>> _generateDataNonFinansial() async {
    final id = _localDBService.ritelGetPrakarsaId('id');
    final data = _localDBService.getAllValuesNonFinansial();
    // ignore: newline-before-return
    return {
      'prakarsaId': id,
      'score': 600,
      'karakter': {
        'tingkatKepercayaan': data[0]['answer'],
        'pengelolaanRekeningBank': data[1]['answer'],
        'reputasiBisnis': data[2]['answer'],
        'perilakuPribadiDebitur': data[3]['answer'],
      },
      'posisiDasar': {
        'kualitasProdukJasa': data[4]['answer'],
        'strategiDanKetergantungan': data[5]['answer'],
        'lokasiUsaha': data[6]['answer'],
      },
      'situasiPersaingan': {
        'situasiPersaingan': data[7]['answer'],
      },
      'manajemen': {
        'kualifikasiKomersial': data[8]['answer'],
        'kualifikasiTeknis': data[9]['answer'],
        'struktrurInternalPerusahaan': data[10]['answer'],
      },
      'prospekIndustri': {
        'prospekIndustri': data[11]['answer'],
      },
      'jaminan': {
        'coverageAgunan': data[12]['answer'],
        'hubunganKepemilikanAgunan': data[13]['answer'],
        'marketabilitasAgunan': data[14]['answer'],
      },
    };
  }
}

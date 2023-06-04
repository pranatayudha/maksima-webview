import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../application/app/app.locator.dart';
import '../../../../../application/app/app.router.dart';
import '../../../../../application/app/constants/custom_color.dart';
import '../../../../../application/enums/bottom_sheet_type.dart';
import '../../../../../application/enums/dialog_type.dart';
import '../../../../../application/services/media_service.dart';
import '../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../infrastructure/apis/ritel_penurunan_api.dart';
import '../../../../../infrastructure/apis/ritel_upload_file_api.dart';

class PenurunanPinjamanViewModel extends BaseViewModel {
  final Map<String, dynamic> disburseData;

  PenurunanPinjamanViewModel({
    required this.disburseData,
  });

  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _ritelMasterAPI = locator<RitelMasterAPI>();
  final _ritelUploadFileAPI = locator<RitelUploadFileAPI>();
  final _ritelPenurunanAPI = locator<RitelPenurunanAPI>();
  final _mediaService = locator<MaksimaMediaService>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  final formatter = NumberFormat('#,###', 'id_ID');

  Future initialize() async {
    setBusy(true);
    await _prepopulateTextfields();
    setBusy(false);
  }

  Future _prepopulateTextfields() async {
    noDokumenUnderlyingController.text = disburseData['noDokumenUnderlying'];
    nominalUnderlyingController.text =
        formatter.format(int.parse(disburseData['nominalUnderlying']));
    sumberRekeningPenurunanController.text =
        disburseData['sumberRekeningPenurunan'];
    sumberRekeningPinjamanController.text =
        disburseData['sumberRekeningPinjaman'];
    nominalOutstandingController.text =
        formatter.format(int.parse(disburseData['nominalOutstanding']));
  }

  final noDokumenUnderlyingController = TextEditingController();
  final nominalUnderlyingController = TextEditingController();
  final sumberRekeningPenurunanController = TextEditingController();
  final sumberRekeningPinjamanController = TextEditingController();
  final nominalPembayaranEscrowController = TextEditingController();
  bool nominalPembayaranBiggerThanOutstanding = false;
  void updateNominalPembayaranEscrow(String val) {
    nominalPembayaranEscrowController.text = val;
    notifyListeners();
  }

  void setDescription(String val) {
    int nominalPembayaranEscrow = int.parse(val.split('.').join());
    int nominalOutstanding = int.parse(disburseData['nominalOutstanding']);
    if (nominalPembayaranEscrow > 0) {
      if (nominalPembayaranEscrow > nominalOutstanding) {
        nominalPembayaranBiggerThanOutstanding = true;
      }
    }
    int nominalPembayaranOperasional =
        nominalPembayaranEscrow - nominalOutstanding;
    nominalPembayaranOperasionalController.text =
        formatter.format(nominalPembayaranOperasional);
    notifyListeners();
  }

  final nominalOutstandingController = TextEditingController();
  final nominalPembayaranOperasionalController = TextEditingController();

  bool _isLoadingLampiranPermohonan = false;
  bool get isLoadingLampiranPermohonan => _isLoadingLampiranPermohonan;
  PlatformFile? lampiranPermohonan;
  String? lampiranPermohonanErrorText;
  String? lampiranPermohonanUrl;
  String? lampiranPermohonanPublicUrl;

  Future captureLampiranPermohonan() async {
    /*final res = await _dialogService.showCustomDialog(
      variant: DialogType.takePhotoFile,
      barrierDismissible: true,
    );*/

    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingLampiranPermohonan = true;
      notifyListeners();
      if (_isLoadingLampiranPermohonan) {
        lampiranPermohonan = res;
        lampiranPermohonanErrorText = null;
        uploadFileLampiranPermohonan(
          lampiranPermohonan!,
        );
        notifyListeners();
      }
    }
  }

  Future uploadFileLampiranPermohonan(PlatformFile file) async {
      final res = await runBusyFuture(
        _ritelUploadFileAPI.uploadFiles(
          file: file,
        ),
      );

      res.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (url) async {
          _isLoadingLampiranPermohonan = false;
          lampiranPermohonanUrl = url;
          lampiranPermohonanPublicUrl = await _getPublicFile(url);
          notifyListeners();
        },
      );
  }

  Future<String> _getPublicFile(String url) async {
    String temp = '';
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(url),
    );

    res.fold(
      (err) => temp = '',
      (success) => temp = success,
    );

    return temp;
  }

  Future clearLampiranPermohonan() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus',
      description:
          'Anda yakin akan menghapus  lampiran permohonan penurunan ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      lampiranPermohonan = null;
      lampiranPermohonanPublicUrl = null;
      lampiranPermohonanUrl = null;
      notifyListeners();
    }
  }

  Future validateInputs() async {
    if (formKey.currentState!.validate() && _validateUploadFiles()) {
      // formKey.currentState!.save();

      final response = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.confirmation,
        data: {'title': 'Konfirmasi'},
      );

      if (response != null && response.confirmed) {
        _postData();
      }
    } else {
      autoValidateMode = AutovalidateMode.always;
      _setUploadFilesErrorTextIfAny();
      _showValidationErrorDialog();
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> _generatePenurunanMap() async {
    return {
      'disburseId': disburseData['id'],
      'nominal': nominalPembayaranEscrowController.text.split('.').join(),
      'lampiranPermohonan': lampiranPermohonanUrl!,
    };
  }

  Future _postData() async {
    final penurunanMap = await _generatePenurunanMap();

    final res = await runBusyFuture(
      _ritelPenurunanAPI.addPenurunan(penurunanMap),
    );

    res.fold(
      (errorMessage) {
        _showErrorDialog(errorMessage);
        notifyListeners();
      },
      (successMap) {
        _showSuccessDialog(
          'Berhasil melakukan penurunan pinjaman',
        );
        notifyListeners();
      },
    );
  }

  void _setUploadFilesErrorTextIfAny() {
    if (lampiranPermohonanUrl == null) {
      lampiranPermohonanErrorText =
          'Lampiran Permohonan Penurunan harus diupload';
    }
  }

  Future _showValidationErrorDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Invalid',
      description:
          'Satu atau beberapa isian ada yang kosong atau tidak sesuai validasi. Silahkan periksa kembali isian Anda.',
      mainButtonTitle: 'OK',
    );
  }

  bool _validateUploadFiles() {
    return lampiranPermohonanUrl != null;
  }

  Future _showSuccessDialog(
    String successMessage,
  ) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    await _navigationService.navigateToPenurunanPinjamanSuccessView(
      disburseData: disburseData,
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

  bool anyFieldCompleted() {
    return nominalPembayaranEscrowController.text.isNotEmpty &&
        lampiranPermohonanUrl != null;
  }

  Future navigateBack() async {
    await _navigationService.navigateTo(
      Routes.pinjamanDetailView,
      arguments: PinjamanDetailViewArguments(
        counter: disburseData['counter'],
        disburseId: disburseData['id'],
        status: disburseData['status'],
        loanType: disburseData['loanType'],
        idKelolaan: disburseData['idKelolaan'],
      ),
    );
  }
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../application/enums/bottom_sheet_type.dart';
import '../../../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../../../application/enums/legalitas_usaha_api_method.dart';
import '../../../../../../../../../application/services/media_service.dart';
import '../../../../../../../../../infrastructure/apis/ritel_legalitas_usaha_api.dart';
import '../../../../../../../../../infrastructure/apis/ritel_upload_file_api.dart';

class TambahDokumenPerusahaanCvViewModel extends BaseViewModel {
  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final DialogService _dialogService = locator<DialogService>();
  final MaksimaMediaService _mediaService = locator<MaksimaMediaService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  final RitelLegalitasUsahaAPI _ritelLegalitasUsahaAPI =
      locator<RitelLegalitasUsahaAPI>();
  final RitelUploadFileAPI _ritelUploadFileAPI = locator<RitelUploadFileAPI>();

  String prakarsaId;
  // int uploadDocFrom;
  String pipelineId;
  int loanTypesId;
  final int codeTable;
  TambahDokumenPerusahaanCvViewModel({
    required this.prakarsaId,
    // required this.uploadDocFrom,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  });

  Future initialize() async {
    setBusy(true);
    setBusy(false);
  }

  final jenisDokumenController = TextEditingController();
  void updateJenisDokumen(String val) {
    jenisDokumenController.text = val;
    notifyListeners();
  }

  final namaDokumenController = TextEditingController();
  void updateNamaDokumen(String val) {
    namaDokumenController.text = val;
    notifyListeners();
  }

  final noDokumenController = TextEditingController();
  void updateNoDokumen(String val) => noDokumenController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final tanggalDokumenController = TextEditingController();
  void updateTanggalDokumen(String val) =>
      tanggalDokumenController.text = val.trim();

  Future selectTanggalDokumen(BuildContext context) async {
    DateTime? pickedDate = await _showingDatePicker(context);
    //ignore: unnecessary_null_comparison
    if (pickedDate != null) {
      updateTanggalDokumen(
        DateFormat('dd/MM/yyyy').format(pickedDate).toString(),
      );
    }
  }

  final namaDokumenLainnyaController = TextEditingController();
  void updateNamaDokumenLainnya(String val) =>
      namaDokumenLainnyaController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  PlatformFile? fileLegalitas;
  String? fileLegalitasUrl;

  Future pickFile() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      fileLegalitas = res;
      uploadFile(file: fileLegalitas!);
      notifyListeners();
    }
  }

  /*Future pickFromGallery() async {
    final res = await _mediaService.getImage(fromGallery: true);

    if (res != null) {
      fileLegalitas = res;
      uploadFile(type: 'image', subType: 'png', file: fileLegalitas!);
      notifyListeners();
    }
  }

  Future pickFromCamera() async {
    final res = await _mediaService.getImage(fromGallery: false);

    if (res != null) {
      fileLegalitas = res;
      uploadFile(type: 'image', subType: 'png', file: fileLegalitas!);
      notifyListeners();
    }
  }*/

  Future uploadFile({
    required PlatformFile file,
  }) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) {
        fileLegalitasUrl = success;
      },
    );
  }

  Future clearFile() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fileLegalitas = null;
      fileLegalitasUrl = '';
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> _generateDocumentMap() async {
    return {
      'prakarsaId': prakarsaId,
      'documentType': jenisDokumenController.text == 'Dokumen Utama' ? 1 : 2,
      'mainDocument': {
        'docName': jenisDokumenController.text == 'Dokumen Utama'
            ? namaDokumenController.text.trim()
            : '',
        'number': jenisDokumenController.text == 'Dokumen Utama'
            ? noDokumenController.text.trim()
            : '',
        'path': jenisDokumenController.text == 'Dokumen Utama'
            ? fileLegalitasUrl
            : '',
        'dateOfDocument': jenisDokumenController.text == 'Dokumen Utama'
            ? tanggalDokumenController.text.trim()
            : null,
      },
      'additionalDocument': {
        'docName': jenisDokumenController.text == 'Dokumen Lainnya'
            ? namaDokumenLainnyaController.text.trim()
            : '',
        'path': jenisDokumenController.text == 'Dokumen Lainnya'
            ? fileLegalitasUrl
            : '',
      },
    };
  }

  Future _postData(
    LegalitasUsahaAPIMethod legalitasUsahaAPIMethod,
  ) async {
    final addMainDocumentMap = await _generateDocumentMap();
    switch (legalitasUsahaAPIMethod) {
      case LegalitasUsahaAPIMethod.addDocument:
        final res = await runBusyFuture(
          _ritelLegalitasUsahaAPI.addDocumentCv(
            addMainDocumentMap,
          ),
        );

        res.fold(
          (errorMessage) => _showErrorDialog(errorMessage),
          (successMap) {
            if (jenisDokumenController.text == 'Dokumen Utama') {
              _showSuccessDialog('Berhasil menambah dokumen utama!');
            } else {
              _showSuccessDialog('Berhasil menambah dokumen lainnya!');
            }
          },
        );
        break;
      case LegalitasUsahaAPIMethod.updateDocument:
        // final res = await runBusyFuture(
        //     _ritelLegalitasUsahaAPI.updateInformasiLainnya(infoLainnyaMap));

        // res.fold(
        //   (errorMessage) {
        //     _showErrorDialog(errorMessage);
        //     notifyListeners();
        //   },
        //   (successMap) {
        //     _showSuccessDialog('Berhasil mengubah informasi lainnya!');
        //     notifyListeners();
        //   },
        // );
        break;
    }
  }

  Future validateInputs(LegalitasUsahaAPIMethod legalitasUsahaAPIMethod) async {
    if (formKey.currentState!.validate() && fileLegalitas != null) {
      final response = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.confirmation,
        data: {'title': 'Konfirmasi'},
      );

      if (response != null && response.confirmed) {
        _postData(legalitasUsahaAPIMethod);
      }
    } else {
      autoValidateMode = AutovalidateMode.always;
      _showValidationErrorDialog();
      notifyListeners();
    }
  }

  Future _showValidationErrorDialog() async {
    if (fileLegalitas != null) {
      await _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: 'Invalid',
        description:
            'Satu atau beberapa isian ada yang kosong atau tidak sesuai validasi. Silahkan periksa kembali isian Anda.',
        mainButtonTitle: 'OK',
      );
    } else {
      await _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: 'Invalid',
        description:
            'Dokumen harus diupload. Silahkan periksa kembali apakah Anda sudah mengupload dokumen.',
        mainButtonTitle: 'OK',
      );
    }
  }

  Future _showSuccessDialog(String successMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    navigateToLegalitasUsaha();
  }

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Gagal',
      description: errorMessage,
      mainButtonTitle: 'COBA LAGI',
    );
  }

  void navigateToLegalitasUsaha() {
    _navigationService.navigateTo(
      Routes.legalitasUsahaPerusahaanCvView,
      arguments: LegalitasUsahaPerusahaanCvViewArguments(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: 1,
        codeTable: codeTable,
      ),
    );
  }

  DateTime selectedDate = DateTime.now();

  Future<DateTime> _showingDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    return picked!;
  }
}

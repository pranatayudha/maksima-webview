// ignore_for_file: no_leading_underscores_for_local_identifiers
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
import '../../../../../../../../../application/models/ritel_legalitas_usaha_lainnya.dart';
import '../../../../../../../../../application/models/ritel_legalitas_usaha_utama.dart';
import '../../../../../../../../../application/services/media_service.dart';
import '../../../../../../../../../infrastructure/apis/ritel_legalitas_usaha_api.dart';
import '../../../../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../../../../infrastructure/apis/ritel_upload_file_api.dart';

class UpdateDokumenPerusahaanCvViewModel extends BaseViewModel {
  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final DialogService _dialogService = locator<DialogService>();
  final MaksimaMediaService _mediaService = locator<MaksimaMediaService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();
  final RitelLegalitasUsahaAPI _ritelLegalitasUsahaAPI =
      locator<RitelLegalitasUsahaAPI>();
  final RitelUploadFileAPI _ritelUploadFileAPI = locator<RitelUploadFileAPI>();

  String prakarsaId;
  int uploadDocFrom;
  RitelLegalitasUsahaUtama? ritelLegalitasUsahaUtama;
  RitelLegalitasUsahaLainnya? ritelLegalitasUsahaLainnya;
  String pipelineId;
  int loanTypesId;
  int status;
  final int codeTable;

  UpdateDokumenPerusahaanCvViewModel({
    required this.prakarsaId,
    required this.uploadDocFrom,
    this.ritelLegalitasUsahaUtama,
    this.ritelLegalitasUsahaLainnya,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  Future initialize() async {
    setBusy(true);
    if (ritelLegalitasUsahaUtama != null) {
      await _prepopulateTextFieldLegalitasUtama();
    } else {
      await _prepopulateTextFieldLegalitasLainnya();
    }
    setBusy(false);
  }

  Future _prepopulateTextFieldLegalitasUtama() async {
    jenisDokumenController
      ..text = 'Dokumen Utama'
      ..selection =
          TextSelection.collapsed(offset: jenisDokumenController.text.length);

    String? _namaDokumen;
    // ignore: prefer-conditional-expressions
    if (ritelLegalitasUsahaUtama!.type! == 'nib' ||
        ritelLegalitasUsahaUtama!.type! == 'siup' ||
        ritelLegalitasUsahaUtama!.type! == 'situ' ||
        ritelLegalitasUsahaUtama!.type! == 'skdp' ||
        ritelLegalitasUsahaUtama!.type! == 'tdp') {
      _namaDokumen = ritelLegalitasUsahaUtama!.type!.toUpperCase();
    } else {
      _namaDokumen = 'Akta Lain';
    }

    namaDokumenController
      ..text = _namaDokumen
      ..selection =
          TextSelection.collapsed(offset: namaDokumenController.text.length);

    noDokumenController
      ..text = ritelLegalitasUsahaUtama!.number!
      ..selection =
          TextSelection.collapsed(offset: noDokumenController.text.length);

    tanggalDokumenController
      ..text = ritelLegalitasUsahaUtama!.dateOfDocument!
      ..selection =
          TextSelection.collapsed(offset: tanggalDokumenController.text.length);

    fileLegalitasUrlPublic =
        await _getPublicFile(ritelLegalitasUsahaUtama!.path!);
    // fileLegalitas = await urlToFile(fileLegalitasUrlPublic!);
    if (ritelLegalitasUsahaUtama!.type! != 'others akta') {
      fileLegalitasUrl = ritelLegalitasUsahaUtama!.path!;
    } else {
      fileLegalitasUrl = ritelLegalitasUsahaUtama!.path!;
      fileLegalitasUrlOld = ritelLegalitasUsahaUtama!.path!;
    }
    notifyListeners();
  }

  Future _prepopulateTextFieldLegalitasLainnya() async {
    jenisDokumenController
      ..text = 'Dokumen Lainnya'
      ..selection =
          TextSelection.collapsed(offset: jenisDokumenController.text.length);

    namaDokumenLainnyaController
      ..text = ritelLegalitasUsahaLainnya!.docName!
      ..selection = TextSelection.collapsed(
        offset: namaDokumenLainnyaController.text.length,
      );

    fileLegalitasUrlPublic =
        await _getPublicFile(ritelLegalitasUsahaLainnya!.path!);
    // fileLegalitas = await urlToFile(fileLegalitasUrlPublic!);
    fileLegalitasUrl = ritelLegalitasUsahaLainnya!.path!;
    fileLegalitasUrlOld = ritelLegalitasUsahaLainnya!.path!;
    notifyListeners();
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

  String? fileLegalitasUrl;
  String? fileLegalitasUrlOld;
  String? fileLegalitasUrlPublic;
  bool isUploading = false;

  Future pickFile() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      // fileLegalitas = res;
      uploadFile(file: res);
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
    isUploading = true;
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) async {
        fileLegalitasUrl = success;
        fileLegalitasUrlPublic = await _getPublicFile(success);
        isUploading = false;
        notifyListeners();
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
      // fileLegalitas = null;
      fileLegalitasUrl = null;
      fileLegalitasUrlPublic = null;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> _generateDocumentMap() async {
    if (ritelLegalitasUsahaUtama != null) {
      // ignore: prefer-conditional-expressions
      if (ritelLegalitasUsahaUtama!.type! != 'others akta') {
        return {
          'prakarsaId': prakarsaId,
          'documentType': 1,
          'mainDocument': {
            'docName': namaDokumenController.text.trim(),
            'number': noDokumenController.text.trim(),
            'path': fileLegalitasUrl,
            'dateOfDocument': tanggalDokumenController.text.trim(),
          },
          'additionalDocument': {
            'docName': '',
            'path': '',
          },
        };
      } else {
        return {
          'prakarsaId': prakarsaId,
          'oldPath': fileLegalitasUrlOld,
          'documentType': 1,
          'mainDocument': {
            'docName': namaDokumenController.text.trim(),
            'number': noDokumenController.text.trim(),
            'path': fileLegalitasUrl,
            'dateOfDocument': tanggalDokumenController.text.trim(),
          },
          'additionalDocument': {
            'docName': '',
            'path': '',
          },
        };
      }
    } else {
      return {
        'prakarsaId': prakarsaId,
        'oldPath': fileLegalitasUrlOld,
        'documentType': 2,
        'mainDocument': {
          'docName': '',
          'number': '',
          'path': '',
          'dateOfDocument': null,
        },
        'additionalDocument': {
          'docName': namaDokumenLainnyaController.text.trim(),
          'path': fileLegalitasUrl,
        },
      };
    }
  }

  Future _postData(
    LegalitasUsahaAPIMethod legalitasUsahaAPIMethod,
  ) async {
    final addMainDocumentMap = await _generateDocumentMap();
    switch (legalitasUsahaAPIMethod) {
      case LegalitasUsahaAPIMethod.addDocument:
        break;
      case LegalitasUsahaAPIMethod.updateDocument:
        final res = await runBusyFuture(
          _ritelLegalitasUsahaAPI.updateDocument(
            addMainDocumentMap,
          ),
        );

        res.fold(
          (errorMessage) => _showErrorDialog(errorMessage),
          (successMap) {
            if (jenisDokumenController.text == 'Dokumen Utama') {
              _showSuccessDialog('Berhasil mengubah dokumen utama!');
            } else {
              _showSuccessDialog('Berhasil mengubah dokumen lainnya!');
            }
          },
        );
        break;
    }
  }

  Future validateInputs(LegalitasUsahaAPIMethod legalitasUsahaAPIMethod) async {
    if (formKey.currentState!.validate()) {
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
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Invalid',
      description:
          'Satu atau beberapa isian ada yang kosong atau tidak sesuai validasi. Silahkan periksa kembali isian Anda.',
      mainButtonTitle: 'OK',
    );
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
        status: status,
        codeTable: codeTable,
      ),
    );
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

import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pinang_maksima_web/application/services/media_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../application/app/constants/common.dart';
import '../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../application/enums/bottom_sheet_type.dart';
import '../../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../../../../application/helpers/job_code_formatter.dart';
import '../../../../../../../../application/helpers/thousands_separator.dart';
import '../../../../../../../../application/models/ritel_informasi_pengurus_cv.dart';
import '../../../../../../../../application/models/ritel_informasi_pengurus_pt.dart';
import '../../../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../../../infrastructure/apis/ritel_prakarsa_api.dart';
import '../../../../../../../../infrastructure/apis/ritel_upload_file_api.dart';
import 'widgets/form_view.dart';

class InformasiPengurusViewModel extends BaseViewModel {
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final RitelPrakarsaAPI _ritelPrakarsaAPI = locator<RitelPrakarsaAPI>();
  final RitelUploadFileAPI _ritelUploadFileAPI = locator<RitelUploadFileAPI>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();
  final MaksimaMediaService _mediaService = locator<MaksimaMediaService>();
  final formatter = NumberFormat('#,###', 'id_ID');

  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  int informasiPengurusDataNavigatorIndex = 0;

  List<RitelInformasiPengurusPT>? _ritelInformasiPengurusPT;

  List<RitelInformasiPengurusPT> get ritelInformasiPengurusPT =>
      _ritelInformasiPengurusPT!;

  final List<RitelInformasiPengurusPT>? ritelInformasiPengurusPTForm;

  List<RitelInformasiPengurusCV>? _ritelInformasiPengurusCV;

  List<RitelInformasiPengurusCV> get ritelInformasiPengurusCV =>
      _ritelInformasiPengurusCV!;

  final List<RitelInformasiPengurusCV>? ritelInformasiPengurusCVForm;

  final String prakarsaId;
  final String pipelineId;
  final int status;
  final int codeTable;

  InformasiPengurusViewModel({
    required this.prakarsaId,
    required this.pipelineId,
    required this.status,
    required this.codeTable,
    this.ritelInformasiPengurusPTForm,
    this.ritelInformasiPengurusCVForm,
  });

  Future initialize() async {
    // setBusy(true);
    if (codeTable == Common.CodeTable.PT) {
      await fetchPrakarsaByIdInformasiPengurusPT();
    }

    if (codeTable == Common.CodeTable.CV) {
      await fetchPrakarsaByIdInformasiPengurusCV();
    }

    if (ritelInformasiPengurusPTForm != null) {
      _prepopulateTextFieldsPT();
      _prepopulateImagesPT();
    }

    if (ritelInformasiPengurusCVForm != null) {
      _prepopulateTextFieldsCV();
      _prepopulateImagesCV();
    }
    // setBusy(false);
  }

  void changeInformasiPengurusDataNavigatorIndex(int index) {
    informasiPengurusDataNavigatorIndex = index;
    notifyListeners();
  }

  void changeinformasiPengurusDataNavigatorIndex(int index) {
    informasiPengurusDataNavigatorIndex = index;

    if (codeTable == Common.CodeTable.PT) {
      _prepopulateTextFieldsPT();
      _prepopulateImagesPT();
    }

    if (codeTable == Common.CodeTable.CV) {
      _prepopulateTextFieldsCV();
      _prepopulateImagesCV();
    }
    notifyListeners();
  }

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Gagal',
      description: errorMessage,
      mainButtonTitle: 'COBA LAGI',
    );
  }

  Future _showSuccessDialog({
    required String successMessage,
  }) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    await _navigationService.navigateTo(
      Routes.informasiPengurusView,
      arguments: InformasiPengurusViewArguments(
        codeTable: codeTable,
        pipelineId: pipelineId,
        status: status,
        prakarsaId: prakarsaId,
      ),
    );
  }

  Future<String> getPublicFile(String url) async {
    String temp = '';
    final res = await _ritelMasterAPI.getPublicFile(url);

    res.fold(
      (err) => temp = '',
      (success) => temp = success,
    );

    return temp;
  }

  Future navigateBack() async {
    _navigationService.back();
  }

  Future navigateToUpdateScreen(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InformasiPengurusFormView(
          prakarsaId: prakarsaId,
          status: status,
          codeTable: codeTable,
          pipelineId: pipelineId,
          PTFormData: codeTable == Common.CodeTable.PT
              ? ritelInformasiPengurusPT
              : null,
          CVFormData: codeTable == Common.CodeTable.CV
              ? ritelInformasiPengurusCV
              : null,
        ),
      ),
    );
  }

  Future navigateToAddressSelectionViewPengurusPt() async {
    _navigationService
        .navigateTo(Routes.addressSelectionView)!
        .then((chosenPlace) {
      if (chosenPlace != null) {
        tagAlamatPengurusPtController.text = chosenPlace['address'] as String;
        tagAlamatLatLng['lat'] = chosenPlace['lat'] as double;
        tagAlamatLatLng['lng'] = chosenPlace['lng'] as double;
      }
    });
  }

  Future validateInputs() async {
    if (formKey.currentState!.validate() && _validateUploadFiles()) {
      final response = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.confirmation,
        data: {'title': 'Konfirmasi'},
      );

      if (response != null && response.confirmed) {
        _postData();
      }
    } else {
      autoValidateMode = AutovalidateMode.always;
      _showValidationErrorDialog();
      notifyListeners();
    }
  }

  bool _validateUploadFiles() {
    if (codeTable == Common.CodeTable.PT) {
      if (fotoNpwpPengurusUrl == null) {
        fotoKtpPengurusPtErrorText = 'NPWP Pengurus harus diupload';
      }

      return fotoNpwpPengurusUrl != null;
    }

    final informasiPengurusCV =
        ritelInformasiPengurusCVForm![informasiPengurusDataNavigatorIndex];

    bool evaluation = true;

    if (fotoNpwpPengurusCVUrl == null) {
      fotoNpwpPengurusCVErrorText = 'NPWP Pengurus harus diupload';
      evaluation = false;
    }

    if (fotoKartuKeluargaUrl == null) {
      fotoKartuKeluargaErrorText = 'Kartu Keluarga harus diupload';
      evaluation = false;
    }

    if (informasiPengurusCV.maritalStatus == Common.kawin) {
      if (fotoKartuKeluargaUrl == null) {
        fotoKartuKeluargaErrorText = 'Kartu Keluarga harus diupload';
        evaluation = false;
      }
      if (fotoAktaNikahUrl == null) {
        fotoAktaNikahErrorText = 'Akta Nikah harus diupload';
        evaluation = false;
      }
    }

    if (informasiPengurusCV.maritalStatus == Common.ceraiMati) {
      if (fotoKartuKeluargaUrl == null) {
        fotoKartuKeluargaErrorText = 'Kartu Keluarga harus diupload';
        evaluation = false;
      }
      if (suratKematianUrl == null) {
        suratKematianErrorText = 'Sertifikat Kematian harus diupload';
        evaluation = false;
      }
    }

    if (informasiPengurusCV.maritalStatus == Common.ceraiHidup) {
      if (fotoKartuKeluargaUrl == null) {
        fotoKartuKeluargaErrorText = 'Kartu Keluarga harus diupload';
        evaluation = false;
      }
      if (fotoAktaCeraiUrl == null) {
        fotoAktaCeraiErrorText = 'Akta Cerai harus diupload';
        evaluation = false;
      }
    }

    return evaluation;
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

  /// =================== PRAKARSA PT =================== ///

  Future fetchPrakarsaByIdInformasiPengurusPT() async {
    final res =
        await runBusyFuture(_ritelPrakarsaAPI.fetchByIdInformasiPengurusPT(
      prakarsaId: prakarsaId,
      pipelineId: pipelineId,
      codeTable: codeTable,
    ));

    res.fold(
      (l) => _showErrorDialog('Gagal memuat data'),
      (ritelPrakarsa) {
        _ritelInformasiPengurusPT = ritelPrakarsa;
        notifyListeners();
      },
    );
  }

  final namaPengurusPtController = TextEditingController();
  final posisiPengurusPtController = TextEditingController();
  final nomorKtpPengurusPtController = TextEditingController();
  final nomorNpwpPengurusPtController = TextEditingController();
  final jenisKelaminPengurusPtController = TextEditingController();
  final tempatLahirPengurusPtController = TextEditingController();
  final tglLahirPengurusPtController = TextEditingController();
  final noTelpPengurusPtController = TextEditingController();
  final emailPengurusPtController = TextEditingController();
  final Map<String, dynamic> tagAlamatLatLng = {};
  final tagAlamatPengurusPtController = TextEditingController();
  final alamatKtpPengurusPtController = TextEditingController();
  final postalCodePengurusPtController = TextEditingController();
  final provincePengurusPtController = TextEditingController();
  final cityPengurusPtController = TextEditingController();
  final districtPengurusPtController = TextEditingController();
  final villagePengurusPtController = TextEditingController();
  final rtPengurusPtController = TextEditingController();
  final rwPengurusPtController = TextEditingController();
  final persentaseSahamPtController = TextEditingController();
  final lembarSahamPtController = TextEditingController();
  final nominalSahamPtController = TextEditingController();

  PlatformFile? fotoKtpPengurusPt;
  String? fotoKtpPengurusPtErrorText;
  String? fotoKtpPengurusPtUrl;
  String? fotoKtpPengurusPtPublicUrl;

  bool _isLoadingNpwp = false;
  bool get isLoadingNpwp => _isLoadingNpwp;

  PlatformFile? fotoNpwpPengurus;
  String? fotoNpwpPengurusErrorText;
  String? fotoNpwpPengurusUrl;
  String? fotoNpwpPengurusPublicUrl;

  Future captureNpwpPengurusPt() async {
    final res = await _mediaService.getMultiFileType();
    if (res != null) {
      _isLoadingNpwp = true;
      notifyListeners();
      if (_isLoadingNpwp) {
        if (_isImageOrPdf(res.extension!)) {
          fotoNpwpPengurus = res;
          fotoAktaCeraiErrorText = null;
          uploadFileNpwp(fotoNpwpPengurus!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png atau pdf!');
        }
      }
    }
  }

  Future clearNpwpPengurusPt() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file NPWP ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoNpwpPengurus = null;
      fotoNpwpPengurusUrl = null;
      fotoNpwpPengurusPublicUrl = null;
      notifyListeners();
    }
  }

  Future uploadFileNpwp(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingNpwp = false;
        fotoNpwpPengurusUrl = url;
        fotoNpwpPengurusPublicUrl = await getPublicFile(url);
        notifyListeners();
      },
    );
  }

  // ignore: long-method
  Future _prepopulateTextFieldsPT() async {
    namaPengurusPtController
      ..text =
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                  .fullName ??
              ''
      ..selection =
          TextSelection.collapsed(offset: namaPengurusPtController.text.length);

    if (ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
            .jobCode !=
        null) {
      posisiPengurusPtController
        ..text = JobCodeFormatter.forOutput(
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
              .jobCode!,
        )
        ..selection = TextSelection.collapsed(
          offset: posisiPengurusPtController.text.length,
        );
    } else {
      posisiPengurusPtController
        ..text = JobCodeFormatter.forOutput(ritelInformasiPengurusPTForm![
                        informasiPengurusDataNavigatorIndex]
                    .jobCode !=
                null
            ? ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                .jobCode!
            : null)
        ..selection = TextSelection.collapsed(
          offset: posisiPengurusPtController.text.length,
        );
    }

    nomorKtpPengurusPtController
      ..text =
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                  .ktpNum ??
              ''
      ..selection = TextSelection.collapsed(
        offset: nomorKtpPengurusPtController.text.length,
      );

    nomorNpwpPengurusPtController
      ..text =
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                  .npwpNum ??
              ''
      ..selection = TextSelection.collapsed(
        offset: nomorNpwpPengurusPtController.text.length,
      );

    jenisKelaminPengurusPtController
      ..text =
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                  .gender ??
              ''
      ..selection = TextSelection.collapsed(
        offset: jenisKelaminPengurusPtController.text.length,
      );

    tempatLahirPengurusPtController
      ..text =
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                  .placeOfBirth ??
              ''
      ..selection = TextSelection.collapsed(
        offset: tempatLahirPengurusPtController.text.length,
      );

    tglLahirPengurusPtController.text = ritelInformasiPengurusPTForm![
                    informasiPengurusDataNavigatorIndex]
                .dateOfBirth !=
            null
        ? DateStringFormatter.forInput(
            ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                .dateOfBirth!,
          )
        : '';

    final splitWithout62 =
        ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
            .phoneNum
            ?.split('+62');
    noTelpPengurusPtController
      ..text = splitWithout62?[1] ?? ''
      ..selection = TextSelection.collapsed(
        offset: noTelpPengurusPtController.text.length,
      );

    emailPengurusPtController
      ..text =
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                  .email ??
              ''
      ..selection = TextSelection.collapsed(
        offset: emailPengurusPtController.text.length,
      );

    tagAlamatPengurusPtController
      ..text =
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                  .tagLocation
                  ?.name ??
              ''
      ..selection = TextSelection.collapsed(
        offset: tagAlamatPengurusPtController.text.length,
      );

    tagAlamatLatLng['lat'] =
        ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
            .tagLocation!
            .latLng!
            .split(', ')[0];

    tagAlamatLatLng['lng'] =
        ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
            .tagLocation!
            .latLng!
            .split(', ')[1];

    alamatKtpPengurusPtController
      ..text =
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                  .detail ??
              ''
      ..selection = TextSelection.collapsed(
        offset: alamatKtpPengurusPtController.text.length,
      );

    postalCodePengurusPtController
      ..text =
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                  .postalCode ??
              ''
      ..selection = TextSelection.collapsed(
        offset: postalCodePengurusPtController.text.length,
      );

    provincePengurusPtController
      ..text =
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                  .province ??
              ''
      ..selection = TextSelection.collapsed(
        offset: provincePengurusPtController.text.length,
      );

    cityPengurusPtController
      ..text =
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                  .city ??
              ''
      ..selection =
          TextSelection.collapsed(offset: cityPengurusPtController.text.length);

    districtPengurusPtController
      ..text =
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                  .district ??
              ''
      ..selection = TextSelection.collapsed(
        offset: districtPengurusPtController.text.length,
      );

    villagePengurusPtController
      ..text =
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                  .village ??
              ''
      ..selection = TextSelection.collapsed(
        offset: villagePengurusPtController.text.length,
      );

    rtPengurusPtController
      ..text =
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                  .rt ??
              ''
      ..selection =
          TextSelection.collapsed(offset: rtPengurusPtController.text.length);

    rwPengurusPtController
      ..text =
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                  .rw ??
              ''
      ..selection =
          TextSelection.collapsed(offset: rwPengurusPtController.text.length);

    // shareNominalController
    //   ..text = formatter
    //       .format(double.parse(ritelInformasiPengurusPTForm!.shareNomial))
    //       .toString()
    //   ..selection =
    //       TextSelection.collapsed(offset: shareNominalController.text.length);
    persentaseSahamPtController
      ..text = ritelInformasiPengurusPTForm![
                      informasiPengurusDataNavigatorIndex]
                  .sharePercentage !=
              null
          ? ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
              .sharePercentage
              .toString()
          : ''
      ..selection = TextSelection.collapsed(
        offset: persentaseSahamPtController.text.length,
      );

    lembarSahamPtController
      ..text = ritelInformasiPengurusPTForm![
                      informasiPengurusDataNavigatorIndex]
                  .shares !=
              null
          ? ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
              .shares
              .toString()
          : ''
      ..selection =
          TextSelection.collapsed(offset: lembarSahamPtController.text.length);

    nominalSahamPtController
      ..text =
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                      .shareNominal !=
                  null
              ? (formatter
                  .format(double.parse(ritelInformasiPengurusPTForm![
                          informasiPengurusDataNavigatorIndex]
                      .shareNominal!))
                  .toString())
              : ''
      ..selection =
          TextSelection.collapsed(offset: nominalSahamPtController.text.length);
  }

  Future _prepopulateImagesPT() async {
    if (ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                .ktpPath !=
            null &&
        (ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                    .ktpPath ??
                '')
            .isNotEmpty) {
      fotoKtpPengurusPtUrl =
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
              .ktpPath!;
      fotoKtpPengurusPtPublicUrl = await getPublicFile(
        ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                .ktpPath ??
            '',
      );
      notifyListeners();
    } else {
      fotoKtpPengurusPt = null;
    }

    if (ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                .npwpPath !=
            null &&
        (ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                    .npwpPath ??
                '')
            .isNotEmpty) {
      fotoNpwpPengurusUrl =
          ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
              .npwpPath!;
      fotoNpwpPengurusPublicUrl = await getPublicFile(
        ritelInformasiPengurusPTForm![informasiPengurusDataNavigatorIndex]
                .npwpPath ??
            '',
      );
      notifyListeners();
    } else {
      fotoNpwpPengurus = null;
    }
  }

  Map<String, dynamic> _generateInformasiPengurusPtMap() {
    return {
      'prakarsaId': prakarsaId,
      'pt_mgmtId':
          ritelInformasiPengurusPTForm?[informasiPengurusDataNavigatorIndex].id,
      'npwpNum': nomorNpwpPengurusPtController.text.trim(),
      'phoneNum': '+62${noTelpPengurusPtController.text.trim()}',
      'email': emailPengurusPtController.text.trim(),
      'sharePercentage': int.parse(persentaseSahamPtController.text.trim()),
      'shares': int.parse(lembarSahamPtController.text.trim()),
      'shareNominal':
          (ThousandsSeparator.remove(nominalSahamPtController.text.trim()))
              .toDouble(),
      'npwpPath': fotoNpwpPengurusUrl,
      'tagLocation': ritelInformasiPengurusPTForm != null
          ? tagAlamatPengurusPtController.text.trim() ==
                  ritelInformasiPengurusPTForm![
                          informasiPengurusDataNavigatorIndex]
                      .tagLocation!
                      .name!
              ? ritelInformasiPengurusPTForm![
                      informasiPengurusDataNavigatorIndex]
                  .tagLocation!
              : {
                  'latLng':
                      "${tagAlamatLatLng['lat']}, ${tagAlamatLatLng['lng']}",
                  'name': tagAlamatPengurusPtController.text.trim(),
                }
          : {
              'latLng': "${tagAlamatLatLng['lat']}, ${tagAlamatLatLng['lng']}",
              'name': tagAlamatPengurusPtController.text.trim(),
            },
    };
  }

  Future _postData() async {
    final payload = codeTable == Common.CodeTable.PT
        ? _generateInformasiPengurusPtMap()
        : _generateInformasiPengurusCvMap();

    final res = await runBusyFuture(_ritelPrakarsaAPI
        .updateByIdInformasiPengurus(payload: payload, codeTable: codeTable));

    res.fold(
      (errorMessage) {
        _showErrorDialog(errorMessage);
        notifyListeners();
      },
      (successMap) {
        _showSuccessDialog(
          successMessage:
              'Berhasil mengupdate Informasi Pengurus ${codeTable == Common.CodeTable.PT ? 'PT' : 'CV'}!',
        );
        notifyListeners();
      },
    );
  }

  /// ================= END OF PT FORM ================ ///

  /// =================== PRAKARSA CV ================== ///

  Future fetchPrakarsaByIdInformasiPengurusCV() async {
    final res =
        await runBusyFuture(_ritelPrakarsaAPI.fetchByIdInformasiPengurusCV(
      prakarsaId: prakarsaId,
      pipelineId: pipelineId,
      codeTable: codeTable,
    ));

    res.fold(
      (l) => _showErrorDialog('Gagal memuat data'),
      (ritelPrakarsa) async {
        _ritelInformasiPengurusCV = ritelPrakarsa;
        notifyListeners();
      },
    );
  }

  final namaPengurusCvController = TextEditingController();
  final posisiPengurusCvController = TextEditingController();
  final nomorKtpPengurusCvController = TextEditingController();
  final nomorNpwpPengurusCvController = TextEditingController();
  final jenisKelaminPengurusCvController = TextEditingController();
  final tempatLahirPengurusCvController = TextEditingController();
  final tglLahirPengurusCvController = TextEditingController();
  final statusPerkawinanController = TextEditingController();
  final alamatPengurusCvController = TextEditingController();
  final detailAlamatPengurusCvController = TextEditingController();
  final postalCodeAlamatPengurusController = TextEditingController();
  final provinceAlamatPengurusCvController = TextEditingController();
  final cityAlamatPengurusCvController = TextEditingController();
  final districtAlamatPengurusCvController = TextEditingController();
  final villageAlamatPengurusCvController = TextEditingController();
  final rtAlamatPengurusCvController = TextEditingController();
  final rwAlamatPengurusCvController = TextEditingController();
  final noHpPengurusCvController = TextEditingController();
  final emailPengurusCvController = TextEditingController();
  final nomorKtpPasanganController = TextEditingController();
  final namaLengkapPasanganController = TextEditingController();
  final tempatLahirPasanganController = TextEditingController();
  final tglLahirPasanganController = TextEditingController();
  final nomorKKController = TextEditingController();

  String? fotoKtpPengurusCvErrorText;
  String? fotoKtpPengurusCvUrl;
  String? fotoKtpPengurusCvPublicUrl;

  String? fotoKtpSelfieErrorText;
  String? fotoKtpSelfieUrl;
  String? fotoKtpSelfiePublicUrl;

  PlatformFile? fotoNpwpPengurusCV;
  String? fotoNpwpPengurusCVErrorText;
  String? fotoNpwpPengurusCVUrl;
  String? fotoNpwpPengurusCVPublicUrl;

  Future captureNpwpPengurusCv() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingNpwp = true;
      notifyListeners();
      if (_isLoadingNpwp) {
        if (_isImageOrPdf(res.extension!)) {
          fotoNpwpPengurusCV = res;
          uploadFileNpwpCV(fotoNpwpPengurusCV!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png atau pdf!');
        }
      }
    }
  }

  Future clearNpwpPengurusCv() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file NPWP debitur ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoNpwpPengurusCV = null;
      fotoNpwpPengurusCVUrl = null;
      fotoNpwpPengurusCVPublicUrl = null;
      notifyListeners();
    }
  }

  PlatformFile? suratKematian;
  String? suratKematianErrorText;
  String? suratKematianUrl;
  String? suratKematianPublicUrl;
  bool _isLoadingSuratKematian = false;
  bool get isLoadingSuratKematian => _isLoadingSuratKematian;

  Future captureSuratKematian() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingSuratKematian = true;
      notifyListeners();
      if (_isLoadingSuratKematian) {
        if (_isImageOrPdf(res.extension!)) {
          suratKematian = res;
          suratKematianErrorText = null;
          uploadFileSertiKematian(suratKematian!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png atau pdf!');
        }
      }
    }
  }

  // Future captureSuratKematian() async {
  //   if (suratKematianUrl != null) {
  //     clearSuratKematian();

  //     return;
  //   }

  //   final res = await _dialogService.showCustomDialog(
  //     variant: DialogType.takePhotoFile,
  //     barrierDismissible: true,
  //   );

  //   if (res != null && res.confirmed) {
  //     notifyListeners();
  //     suratKematian = res.data[0] as File;
  //     suratKematianErrorText = null;
  //     uploadFileSertiKematian(suratKematian!, res.data[1]);
  //     notifyListeners();
  //   }
  // }

  Future clearSuratKematian() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file sertifikat kematian ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      suratKematian = null;
      suratKematianUrl = null;
      suratKematianPublicUrl = null;
      notifyListeners();
    }
  }

  PlatformFile? fotoAktaNikah;
  String? fotoAktaNikahErrorText;
  String? fotoAktaNikahUrl;
  String? fotoAktaNikahPublicUrl;
  bool _isLoadingAktaNikah = false;
  bool get isLoadingAktaNikah => _isLoadingAktaNikah;
  Future captureAktaNikah() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingAktaNikah = true;
      notifyListeners();
      if (_isLoadingAktaNikah) {
        if (_isImageOrPdf(res.extension!)) {
          fotoAktaNikah = res;
          fotoAktaNikahErrorText = null;
          uploadFileAktaNikah(fotoAktaNikah!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png atau pdf!');
        }
      }
    }
  }

  // Future captureAktaNikah() async {
  //   if (fotoAktaNikahUrl != null) {
  //     clearAktaNikah();

  //     return;
  //   }

  //   final res = await _dialogService.showCustomDialog(
  //     variant: DialogType.takePhotoFile,
  //     barrierDismissible: true,
  //   );

  //   if (res != null && res.confirmed) {
  //     notifyListeners();
  //     fotoAktaNikah = res.data[0] as File;
  //     fotoAktaNikahErrorText = null;
  //     uploadFileAktaNikah(
  //       fotoAktaNikah!,
  //       res.data[1].toString(),
  //     );
  //     notifyListeners();
  //   }
  // }

  Future clearAktaNikah() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file akta nikah ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoAktaNikah = null;
      fotoAktaNikahUrl = null;
      fotoAktaNikahPublicUrl = null;

      notifyListeners();
    }
  }

  PlatformFile? fotoKtpPasangan;
  String? fotoKtpPasanganErrorText;
  String? fotoKtpPasanganUrl;
  String? fotoKtpPasanganPublicUrl;
  bool _isLoadingfotoKtpPasangan = false;
  bool get isLoadingfotoKtpPasangan => _isLoadingfotoKtpPasangan;

  Future captureKtpPasangan() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingfotoKtpPasangan = true;
      notifyListeners();
      if (_isLoadingfotoKtpPasangan) {
        if (_isImageOrPdf(res.extension!)) {
          fotoKtpPasangan = res;
          fotoKtpPasanganErrorText = null;
          uploadFileKtpPasangan(fotoKtpPasangan!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png atau pdf!');
        }
      }
    }
  }

  // Future captureKtpPasangan() async {
  //   if (fotoKtpPasanganUrl != null) {
  //     clearKtpPasangan();

  //     return;
  //   }

  //   final res = await _dialogService.showCustomDialog(
  //     variant: DialogType.takePhotoFile,
  //     barrierDismissible: true,
  //   );

  //   if (res != null && res.confirmed) {
  //     notifyListeners();
  //     fotoKtpPasangan = res.data[0] as File;
  //     fotoKtpPasanganErrorText = null;
  //     uploadFileKtpPasangan(
  //       fotoKtpPasangan!,
  //       res.data[1].toString(),
  //     );
  //     notifyListeners();
  //   }
  // }

  Future clearKtpPasangan() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file E-KTP pasangan ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoKtpPasangan = null;
      fotoKtpPasanganUrl = null;
      fotoKtpPasanganPublicUrl = null;

      notifyListeners();
    }
  }

  PlatformFile? fotoKartuKeluarga;
  String? fotoKartuKeluargaErrorText;
  String? fotoKartuKeluargaUrl;
  String? fotoKartuKeluargaPublicUrl;
  bool _isLoadingKartuKeluarga = false;
  bool get isLoadingKartuKeluarga => _isLoadingKartuKeluarga;

  Future captureKartuKeluargaDebitur() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingKartuKeluarga = true;
      notifyListeners();
      if (_isLoadingKartuKeluarga) {
        if (_isImageOrPdf(res.extension!)) {
          fotoKartuKeluarga = res;
          fotoKartuKeluargaErrorText = null;
          uploadFileKK(fotoKartuKeluarga!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png atau pdf!');
        }
      }
    }
  }

  // Future captureKartuKeluargaDebitur() async {
  //   if (fotoKartuKeluargaUrl != null) {
  //     clearKartuKeluarga();

  //     return;
  //   }

  //   final res = await _dialogService.showCustomDialog(
  //     variant: DialogType.takePhotoFile,
  //     barrierDismissible: true,
  //   );

  //   if (res != null && res.confirmed) {
  //     notifyListeners();
  //     fotoKartuKeluarga = res.data[0] as File;
  //     fotoKartuKeluargaErrorText = null;
  //     uploadFileKK(
  //       fotoKartuKeluarga!,
  //       res.data[1].toString(),
  //     );
  //     notifyListeners();
  //   }
  // }

  Future clearKartuKeluarga() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file kartu keluarga ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoKartuKeluarga = null;
      fotoKartuKeluargaUrl = null;
      fotoKartuKeluargaPublicUrl = null;

      notifyListeners();
    }
  }

  PlatformFile? fotoAktaCerai;
  String? fotoAktaCeraiErrorText;
  String? fotoAktaCeraiUrl;
  String? fotoAktaCeraiPublicUrl;
  bool _isLoadingAktaCerai = false;
  bool get isLoadingAktaCerai => _isLoadingAktaCerai;
  Future captureAktaCerai() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingAktaCerai = true;
      notifyListeners();
      if (_isLoadingAktaCerai) {
        if (_isImageOrPdf(res.extension!)) {
          fotoAktaCerai = res;
          suratKematianErrorText = null;
          uploadFileAktaCerai(fotoAktaCerai!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png atau pdf!');
        }
      }
    }
  }

  // Future captureAktaCerai() async {
  //   if (fotoAktaCeraiUrl != null) {
  //     clearAktaCerai();

  //     return;
  //   }

  //   final res = await _dialogService.showCustomDialog(
  //     variant: DialogType.takePhotoFile,
  //     barrierDismissible: true,
  //   );

  //   if (res != null && res.confirmed) {
  //     notifyListeners();
  //     fotoAktaCerai = res.data[0] as File;
  //     fotoAktaCeraiErrorText = null;
  //     uploadFileAktaCerai(fotoAktaCerai!, res.data[1]);
  //     notifyListeners();
  //   }
  // }

  Future clearAktaCerai() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file akta cerai ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoAktaCerai = null;
      fotoAktaCeraiUrl = null;
      fotoAktaCeraiPublicUrl = null;

      notifyListeners();
    }
  }

  Map<String, dynamic> _generateInformasiPengurusCvMap() {
    final informasiPengurus =
        ritelInformasiPengurusCVForm![informasiPengurusDataNavigatorIndex];

    final map = {
      'prakarsaId': prakarsaId,
      'cv_mgmtId': informasiPengurus.id,
      'email': emailPengurusCvController.text.trim(),
      'npwpPath': fotoNpwpPengurusCVUrl,
      'kkPath': fotoKartuKeluargaUrl,
      'npwpNum': nomorNpwpPengurusCvController.text.trim(),
    };

    if (informasiPengurus.maritalStatus == Common.kawin) {
      map['marriagePath'] = fotoAktaNikahUrl;
    }

    if (informasiPengurus.maritalStatus != Common.kawin) {
      map['npwpPath'] = fotoNpwpPengurusCVUrl;
    }

    if (informasiPengurus.maritalStatus == Common.ceraiMati) {
      map['deathCertificatePath'] = suratKematianUrl;
    }

    if (informasiPengurus.maritalStatus == Common.ceraiHidup) {
      map['divorcePath'] = fotoAktaCeraiUrl;
    }

    return map;
  }

  Future uploadFileKtpPengurusCv(File file, String type) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type == 'image' ? 'image' : 'application',
      subType: type == 'image' ? 'png' : 'pdf',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        fotoKtpPengurusCvUrl = url;
        fotoKtpPengurusCvPublicUrl = await getPublicFile(url);

        notifyListeners();
      },
    );
  }

  Future uploadFileSelfieKtp(File file, String type) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type == 'image' ? 'image' : 'application',
      subType: type == 'image' ? 'png' : 'pdf',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        fotoKtpSelfieUrl = url;
        fotoKtpSelfiePublicUrl = await getPublicFile(url);

        notifyListeners();
      },
    );
  }

  Future uploadFileNpwpCV(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingNpwp = false;
        fotoNpwpPengurusCVUrl = url;
        fotoNpwpPengurusCVPublicUrl = await getPublicFile(url);
        notifyListeners();
      },
    );
  }

  // Future uploadFileNpwpCV(File file, String type) async {
  //   final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
  //     type: type == 'image' ? 'image' : 'application',
  //     subType: type == 'image' ? 'png' : 'pdf',
  //     file: file,
  //   ));

  //   res.fold(
  //     (errorMessage) => _showErrorDialog(errorMessage),
  //     (url) async {
  //       _isLoadingNpwp = false;
  //       fotoNpwpPengurusCVUrl = url;
  //       fotoNpwpPengurusCVPublicUrl = await getPublicFile(url);

  //       notifyListeners();
  //     },
  //   );
  // }

  Future uploadFileKK(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingKartuKeluarga = false;
        fotoKartuKeluargaUrl = url;
        fotoKartuKeluargaPublicUrl = await getPublicFile(url);

        notifyListeners();
      },
    );
  }

  Future uploadFileKtpPasangan(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingfotoKtpPasangan = false;
        fotoKtpPasanganUrl = url;
        fotoKtpPasanganPublicUrl = await getPublicFile(url);
        notifyListeners();
      },
    );
  }

  // Future uploadFileKtpPasangan(File file, String type) async {
  //   final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
  //     type: type == 'image' ? 'image' : 'application',
  //     subType: type == 'image' ? 'png' : 'pdf',
  //     file: file,
  //   ));

  //   res.fold(
  //     (errorMessage) => _showErrorDialog(errorMessage),
  //     (url) async {
  //       fotoKtpPasanganUrl = url;
  //       fotoKtpPasanganPublicUrl = await getPublicFile(url);

  //       notifyListeners();
  //     },
  //   );
  // }

  Future uploadFileAktaNikah(
    PlatformFile file,
  ) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingAktaNikah = false;
        fotoAktaNikahUrl = url;
        fotoAktaNikahPublicUrl = await getPublicFile(url);

        notifyListeners();
      },
    );
  }

  Future uploadFileAktaCerai(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));
    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingNpwp = false;
        fotoAktaCeraiUrl = url;
        fotoAktaCeraiPublicUrl = await getPublicFile(url);
        notifyListeners();
      },
    );
    // if (type == 'image') {
    //   final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
    //     file: file,
    //     type: 'image',
    //     subType: 'png',
    //   ));

    //   res.fold(
    //     (errorMessage) => _showErrorDialog(errorMessage),
    //     (success) async {
    //       fotoAktaCeraiUrl = success;
    //       fotoAktaCeraiPublicUrl = await getPublicFile(success);
    //       notifyListeners();
    //     },
    //   );
    // } else {
    //   final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
    //     file: file,
    //     type: 'application',
    //     subType: 'pdf',
    //   ));

    //   res.fold(
    //     (errorMessage) => _showErrorDialog(errorMessage),
    //     (success) async {
    //       fotoAktaCeraiUrl = success;
    //       fotoAktaCeraiPublicUrl = await getPublicFile(success);
    //       notifyListeners();
    //     },
    //   );
    // }
  }

  Future uploadFileSertiKematian(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingSuratKematian = false;
        suratKematianUrl = url;
        suratKematianPublicUrl = await getPublicFile(url);
        notifyListeners();
      },
    );
  }

  // ignore: long-method
  Future _prepopulateTextFieldsCV() async {
    namaPengurusCvController
      ..text =
          ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                  .fullName ??
              ''
      ..selection =
          TextSelection.collapsed(offset: namaPengurusCvController.text.length);

    if (ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
            .jobCode !=
        null) {
      posisiPengurusCvController
        ..text = JobCodeFormatter.forOutput(
          ritelInformasiPengurusCVForm![informasiPengurusDataNavigatorIndex]
              .jobCode!,
        )
        ..selection = TextSelection.collapsed(
          offset: posisiPengurusCvController.text.length,
        );
    } else {
      posisiPengurusCvController
        ..text = JobCodeFormatter.forOutput(ritelInformasiPengurusCVForm?[
                        informasiPengurusDataNavigatorIndex]
                    .jobCode !=
                null
            ? ritelInformasiPengurusCVForm![informasiPengurusDataNavigatorIndex]
                .jobCode!
            : null)
        ..selection = TextSelection.collapsed(
          offset: posisiPengurusCvController.text.length,
        );
    }

    nomorKtpPengurusCvController
      ..text =
          ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                  .ktpNum ??
              ''
      ..selection = TextSelection.collapsed(
        offset: nomorKtpPengurusCvController.text.length,
      );

    nomorNpwpPengurusCvController
      ..text =
          ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                  .npwpNum ??
              ''
      ..selection = TextSelection.collapsed(
        offset: nomorNpwpPengurusCvController.text.length,
      );

    jenisKelaminPengurusCvController
      ..text =
          ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                  .gender ??
              ''
      ..selection = TextSelection.collapsed(
        offset: jenisKelaminPengurusCvController.text.length,
      );
    tempatLahirPengurusCvController
      ..text =
          ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                  .placeOfBirth ??
              ''
      ..selection = TextSelection.collapsed(
        offset: tempatLahirPengurusCvController.text.length,
      );
    tglLahirPengurusCvController.text = ritelInformasiPengurusCVForm?[
                    informasiPengurusDataNavigatorIndex]
                .dateOfBirth !=
            null
        ? DateStringFormatter.forInput(
            ritelInformasiPengurusCVForm![informasiPengurusDataNavigatorIndex]
                .dateOfBirth!,
          )
        : '';

    statusPerkawinanController
      ..text =
          ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                  .maritalStatus ??
              ''
      ..selection = TextSelection.collapsed(
        offset: statusPerkawinanController.text.length,
      );

    alamatPengurusCvController
      ..text =
          ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                  .tagLocation
                  ?.name ??
              ''
      ..selection = TextSelection.collapsed(
        offset: alamatPengurusCvController.text.length,
      );

    detailAlamatPengurusCvController
      ..text =
          ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                  .detail ??
              ''
      ..selection = TextSelection.collapsed(
        offset: detailAlamatPengurusCvController.text.length,
      );

    postalCodeAlamatPengurusController
      ..text =
          ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                  .postalCode ??
              ''
      ..selection = TextSelection.collapsed(
        offset: postalCodeAlamatPengurusController.text.length,
      );

    provinceAlamatPengurusCvController
      ..text =
          ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                  .province ??
              ''
      ..selection = TextSelection.collapsed(
        offset: provinceAlamatPengurusCvController.text.length,
      );

    cityAlamatPengurusCvController
      ..text =
          ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                  .city ??
              ''
      ..selection = TextSelection.collapsed(
        offset: cityAlamatPengurusCvController.text.length,
      );

    districtAlamatPengurusCvController
      ..text =
          ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                  .district ??
              ''
      ..selection = TextSelection.collapsed(
        offset: districtAlamatPengurusCvController.text.length,
      );

    villageAlamatPengurusCvController
      ..text =
          ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                  .village ??
              ''
      ..selection = TextSelection.collapsed(
        offset: villageAlamatPengurusCvController.text.length,
      );

    rtAlamatPengurusCvController
      ..text =
          ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                  .rt ??
              ''
      ..selection = TextSelection.collapsed(
        offset: rtAlamatPengurusCvController.text.length,
      );

    rwAlamatPengurusCvController
      ..text =
          ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                  .rw ??
              ''
      ..selection = TextSelection.collapsed(
        offset: rwAlamatPengurusCvController.text.length,
      );

    final splitWithout62 =
        ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
            .phoneNum
            ?.split('+62');
    noHpPengurusCvController
      ..text = splitWithout62?[1] ?? ''
      // ..text = ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex].phoneNum ?? ''
      ..selection =
          TextSelection.collapsed(offset: noHpPengurusCvController.text.length);

    emailPengurusCvController
      ..text =
          ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                  .email ??
              ''
      ..selection = TextSelection.collapsed(
        offset: emailPengurusCvController.text.length,
      );

    if (ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
            .maritalStatus ==
        Common.kawin) {
      nomorKtpPasanganController
        ..text =
            ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                    .spouseKtpNum ??
                ''
        ..selection = TextSelection.collapsed(
          offset: nomorKtpPasanganController.text.length,
        );

      namaLengkapPasanganController
        ..text =
            ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                    .spouseFullname ??
                ''
        ..selection = TextSelection.collapsed(
          offset: namaLengkapPasanganController.text.length,
        );

      tempatLahirPasanganController
        ..text =
            ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                    .spousePlaceOfBirth ??
                ''
        ..selection = TextSelection.collapsed(
          offset: tempatLahirPasanganController.text.length,
        );

      tglLahirPasanganController.text = DateStringFormatter.forInput(
        ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                .spouseDateOfBirth ??
            '',
      );
    }

    nomorKKController
      ..text =
          ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex]
                  .ktpNum ??
              ''
      ..selection =
          TextSelection.collapsed(offset: nomorKKController.text.length);
  }

  Future _prepopulateImagesCV() async {
    log(
      informasiPengurusDataNavigatorIndex.toString(),
      name: 'INDEX PENGURUS:',
    );
    log(ritelInformasiPengurusCVForm![informasiPengurusDataNavigatorIndex]
        .npwpPath!
        .toString());
    final informasiPengurusForm =
        ritelInformasiPengurusCVForm?[informasiPengurusDataNavigatorIndex];

    if (informasiPengurusForm?.ktpPath != null &&
        (informasiPengurusForm?.ktpPath ?? '').isNotEmpty) {
      fotoKtpPengurusCvUrl = informasiPengurusForm!.ktpPath!;
      fotoKtpPengurusCvPublicUrl =
          await getPublicFile(informasiPengurusForm.ktpPath!);
      notifyListeners();
    } else {
      fotoKtpPengurusCvPublicUrl = null;
    }
    if (informasiPengurusForm?.ktpSelfiePath != null &&
        (informasiPengurusForm?.ktpSelfiePath ?? '').isNotEmpty) {
      fotoKtpSelfieUrl = informasiPengurusForm!.ktpSelfiePath!;
      fotoKtpSelfiePublicUrl =
          await getPublicFile(informasiPengurusForm.ktpSelfiePath!);
      notifyListeners();
    } else {
      fotoKtpSelfiePublicUrl = null;
    }
    if (informasiPengurusForm?.npwpPath != null &&
        (informasiPengurusForm?.npwpPath ?? '').isNotEmpty) {
      fotoNpwpPengurusCVUrl = informasiPengurusForm!.npwpPath!;
      fotoNpwpPengurusCVPublicUrl =
          await getPublicFile(informasiPengurusForm.npwpPath!);
      notifyListeners();
    } else {
      fotoNpwpPengurusCVPublicUrl = null;
      fotoNpwpPengurusCVUrl = null;
    }
    if (informasiPengurusForm?.kkPath != null &&
        (informasiPengurusForm?.kkPath ?? '').isNotEmpty) {
      fotoKartuKeluargaUrl = informasiPengurusForm!.kkPath!;
      fotoKartuKeluargaPublicUrl =
          await getPublicFile(informasiPengurusForm.kkPath!);
      notifyListeners();
    } else {
      fotoKartuKeluargaUrl = null;
      fotoKartuKeluargaPublicUrl = null;
    }
    if (informasiPengurusForm?.maritalStatus == Common.kawin &&
        informasiPengurusForm?.spouseKtpPath != null &&
        (informasiPengurusForm?.spouseKtpPath ?? '').isNotEmpty) {
      fotoKtpPasanganUrl = informasiPengurusForm!.spouseKtpPath!;
      fotoKtpPasanganPublicUrl =
          await getPublicFile(informasiPengurusForm.spouseKtpPath!);
      notifyListeners();
    } else {
      fotoKtpPasanganPublicUrl = null;
    }

    if (informasiPengurusForm?.maritalStatus == Common.kawin &&
        informasiPengurusForm?.marriagePath != null &&
        (informasiPengurusForm?.marriagePath ?? '').isNotEmpty) {
      fotoAktaNikahUrl = informasiPengurusForm!.marriagePath!;
      fotoAktaNikahPublicUrl =
          await getPublicFile(informasiPengurusForm.marriagePath!);
      notifyListeners();
    } else {
      fotoAktaNikahUrl = null;
      fotoAktaNikahPublicUrl = null;
    }
    if (informasiPengurusForm?.maritalStatus == Common.ceraiHidup &&
        informasiPengurusForm?.divorcePath != null &&
        (informasiPengurusForm?.divorcePath ?? '').isNotEmpty) {
      fotoAktaCeraiUrl = informasiPengurusForm!.divorcePath!;
      fotoAktaCeraiPublicUrl =
          await getPublicFile(informasiPengurusForm.divorcePath!);
      notifyListeners();
    } else {
      fotoAktaCeraiPublicUrl = null;
    }
    if (informasiPengurusForm?.maritalStatus == Common.ceraiMati &&
        informasiPengurusForm?.deathCertificatePath != null &&
        (informasiPengurusForm?.deathCertificatePath ?? '').isNotEmpty) {
      suratKematianUrl = informasiPengurusForm!.deathCertificatePath!;
      suratKematianPublicUrl =
          await getPublicFile(informasiPengurusForm.deathCertificatePath!);
      notifyListeners();
    } else {
      suratKematianPublicUrl = null;
    }
  }

  Future navigateToInformasiPrakarsa() async {
    await _navigationService.navigateTo(
      Routes.prakarsaDetailsViewRitel,
      arguments: PrakarsaDetailsViewRitelArguments(
        index: 1,
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: 1,
        codeTable: codeTable,
      ),
    );
  }

  Future navigateToInformasiPengurusView() async {
    await _navigationService.navigateToInformasiPengurusView(
      prakarsaId: prakarsaId,
      pipelineId: pipelineId,
      status: status,
      codeTable: codeTable,
    );
  }

  bool _isImageOrPdf(String type) {
    return (type == 'pdf' || type == 'jpg' || type == 'png' || type == 'jpeg');
  }
}

/// =================== END OF CV FORM =================== ///}

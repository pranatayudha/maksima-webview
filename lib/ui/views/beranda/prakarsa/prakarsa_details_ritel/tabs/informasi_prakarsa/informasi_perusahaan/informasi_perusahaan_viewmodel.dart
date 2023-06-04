import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/constants/common.dart';
import '../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../application/enums/bottom_sheet_type.dart';
import '../../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../../../../application/models/ritel_informasi_perusahaan_pt.dart';
import '../../../../../../../../application/services/media_service.dart';
import '../../../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../../../infrastructure/apis/ritel_prakarsa_api.dart';
import '../../../../../../../../infrastructure/apis/ritel_upload_file_api.dart';
import 'informasi_perusahaan_form_layout.dart';

class InformasiPerusahaanViewModelRitel extends FutureViewModel {
  final RitelPrakarsaAPI _ritelPrakarsaAPI = locator<RitelPrakarsaAPI>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final RitelUploadFileAPI _ritelUploadFileAPI = locator<RitelUploadFileAPI>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final MaksimaMediaService _mediaService = locator<MaksimaMediaService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;

  final String prakarsaId;
  final String pipelineId;
  final int status;
  final int codeTable;

  InformasiPerusahaanViewModelRitel({
    required this.prakarsaId,
    required this.pipelineId,
    required this.status,
    required this.codeTable,
    this.ritelInformasiPerusahaanPt,
  });

  @override
  Future futureToRun() async {
    setBusy(true);

    await fetchPrakarsaByIdInformasiPerusahaan();
    if (ritelInformasiPerusahaanPt != null) {
      await _prepopulateTextFields();
      await _prepopulateImages();
    }
    setBusy(false);
  }

  Future _showSuccessDialogPut(String successMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    notifyListeners();

    _navigationService.back();
  }

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Gagal',
      description: errorMessage,
      mainButtonTitle: 'COBA LAGI',
    );
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

  /// =================== Prakarsa Informasi Perusahaan ==================== ///

  Future fetchPrakarsaByIdInformasiPerusahaan() async {
    final res =
        await runBusyFuture(_ritelPrakarsaAPI.fetchByIdInformasiPerusahaan(
      prakarsaId: prakarsaId,
      pipelineId: pipelineId,
      codeTable: codeTable,
    ));

    res.fold(
      (l) => _showErrorDialog('Gagal memuat data'),
      (ritelPrakarsa) {
        ritelInformasiPerusahaanPt = ritelPrakarsa;
      },
    );
  }

  void navigateToUpdateScreen(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InformasiPerusahaanLayout(
          prakarsaId: prakarsaId,
          status: status,
          codeTable: codeTable,
          pipelineId: pipelineId,
          ritelInformasiPerusahaanPt: ritelInformasiPerusahaanPt!,
        ),
      ),
    );
    futureToRun();
  }

  /// =================== Prakarsa Informasi Perusahaan Form ==================== ///

  RitelInformasiPerusahaanPt? ritelInformasiPerusahaanPt;

  final jenisDebiturController = TextEditingController();
  final namaPerusahaanController = TextEditingController();
  final nomorNpwpPerusahaanController = TextEditingController();
  final sektorController = TextEditingController();
  final subSektorController = TextEditingController();
  final alamatPerushaanController = TextEditingController();
  final detailTempatAktaPendirianController = TextEditingController();
  final detailTempatAktaPerubahaanController = TextEditingController();
  final detailAlamatPerusahaanController = TextEditingController();
  final postalCodeAlamatPerusahaanController = TextEditingController();
  final districtAlamatPerusahaanController = TextEditingController();
  final villageAlamatPerusahaanController = TextEditingController();
  final rtAlamatPerusahaanController = TextEditingController();
  final rwAlamatPerusahaanController = TextEditingController();
  final tglAktaPendirianController = TextEditingController();
  final nomorAktaPendirianController = TextEditingController();
  final nomorSKkumhamPendirianController = TextEditingController();
  final nomorSKkumhamPerubahanTerakhirController = TextEditingController();
  final nomorAktaPerubahanTerakhirController = TextEditingController();
  final tglAktaPerubahanTerakhirController = TextEditingController();
  final tglSKkumhamPendirianController = TextEditingController();
  final tglSKkumhamPerubahanTerakhirController = TextEditingController();
  final namaLengkapPicController = TextEditingController();
  final tempatLahirDebiturController = TextEditingController();
  final detailTempatAktaPerubahanTerakhirController = TextEditingController();
  final provinceAlamatPerusahaanController = TextEditingController();
  final cityAlamatPerusahaanController = TextEditingController();
  final noHpPicController = TextEditingController();
  final emailPicController = TextEditingController();

  /*bool _valueLocation = true;

  bool get valueLocation => _valueLocation;

  void updateFunction(bool value) {
    _valueLocation = value;
    notifyListeners();
  }*/
  // bool _anyFieldEditedDataPerusahaan() {
  //   return tglSKkumhamPendirianController.text.isEmpty ||
  //       nomorSKkumhamPendirianController.text.isEmpty ||
  //       tglSKkumhamPerubahanTerakhirController.text.isEmpty ||
  //       nomorSKkumhamPerubahanTerakhirController.text.isEmpty;
  // }

  // Future navigateBack() async {
  //   // ignore: unnecessary_null_comparison
  //   if (formKey.currentState!.validate() && _anyFieldEditedDataPerusahaan()) {
  //     formKey.currentState!.save();
  //     _navigationService.back();
  //   } else {
  //     final response = await _dialogService.showCustomDialog(
  //       variant: DialogType.base,
  //       title: 'Edited',
  //       description: 'Apakah Anda yakin akan membatalkan edit form ini?',
  //       data: {'color': CustomColor.primaryRed80},
  //       mainButtonTitle: 'Batal Edit Form',
  //     );
  //     //   _navigationService.back();

  //     if (response!.confirmed) _navigationService.back();
  //   }
  //   // else {
  //   //   _navigationService.back();
  //   // }
  // }

  /// ============= NPWP Perusahaan ============== ///

  bool _isLoadingNpwpPerusahaan = false;

  bool get isLoadingNpwpPerusahaan => _isLoadingNpwpPerusahaan;
  PlatformFile? fotoNpwpPerusahaan;
  String? fotoNpwpPerusahaanErrorText;
  String? fotoNpwpPerusahaanUrl;

  Future captureFotoNpwpPerusahaan() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingNpwpPerusahaan = true;
      notifyListeners();
      if (_isLoadingNpwpPerusahaan) {
        if (_isImageOrPdf(res.extension!)) {
          fotoNpwpPerusahaan = res;
          fotoNpwpPerusahaanErrorText = null;
          uploadFotoNpwpPerusahaan(fotoNpwpPerusahaan!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png atau pdf!');
        }
      }
    }
  }

  // Future captureFotoNpwpPerusahaan() async {
  //   if (fotoNpwpPerusahaan != null) {
  //     clearNpwpPerusahaan();
  //   } else {
  //     final res = await _dialogService.showCustomDialog(
  //       variant: DialogType.takePhotoFile,
  //       barrierDismissible: true,
  //     );

  //     if (res != null) {
  //       fotoNpwpPerusahaan = res.data[0] as File;
  //       fotoNpwpPerusahaanErrorText = null;
  //       uploadFotoNpwpPerusahaan(
  //         fotoNpwpPerusahaan!,
  //         res.data[1].toString(),
  //       );
  //       notifyListeners();
  //     }
  //   }
  // }

  Future uploadFotoNpwpPerusahaan(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingNpwpPerusahaan = false;
        // _fotoNpwpPerusahaanUrl = url;
        fotoNpwpPerusahaanUrl = await _getPublicFile(url);
        notifyListeners();
      },
    );
  }

  Future clearNpwpPerusahaan() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file NPWP Perusahaan ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoNpwpPerusahaan = null;
      // _fotoNpwpPerusahaanUrl = null;
      fotoNpwpPerusahaanUrl = null;
      notifyListeners();
    }
  }

  /// ============= Akta Pendirian ============== ///

  bool _isLoadingAktaPendirian = false;

  bool get isLoadingAktaPendirian => _isLoadingAktaPendirian;
  File? fotoAktaPendirian;
  String? fotoAktaPendirianErrorText;
  String? _fotoAktaPendirianUrl;
  String? fotoAktaPendirianUrl;

  Future captureFotoAktaPendirian() async {
    if (fotoAktaPendirian != null) {
      clearAktaPendirian();
    } else {
      final res = await _dialogService.showCustomDialog(
        variant: DialogType.takePhotoFile,
        barrierDismissible: true,
      );

      if (res != null && res.confirmed) {
        fotoAktaPendirian = res.data[0] as File;
        fotoAktaPendirianErrorText = null;
        uploadFotoAktaPendirian(
          fotoAktaPendirian!,
          res.data[1].toString(),
        );
        notifyListeners();
      }
    }
  }

  Future uploadFotoAktaPendirian(File file, String type) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type == 'image' ? 'image' : 'application',
      subType: type == 'image' ? 'png' : 'pdf',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingAktaPendirian = false;
        _fotoAktaPendirianUrl = url;
        fotoAktaPendirianUrl = await _getPublicFile(url);
        notifyListeners();
      },
    );
  }

  Future clearAktaPendirian() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file Akta Pendirian ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoAktaPendirian = null;
      _fotoAktaPendirianUrl = null;
      fotoAktaPendirianUrl = null;
      notifyListeners();
    }
  }

  /// ============= Akta Perubahan ============== ///

  bool _isLoadingAktaPerubahanTerakhir = false;

  bool get isLoadingAktaPerubahanTerakhir => _isLoadingAktaPerubahanTerakhir;
  File? fotoAktaPerubahanTerakhir;
  String? fotoAktaPerubahanTerakhirErrorText;
  String? fotoAktaPerubahanTerakhirUrl;

  Future captureFotoAktaPerubahanTerakhir() async {
    if (fotoAktaPerubahanTerakhir != null) {
      clearAktaPerubahanTerakhir();
    } else {
      final res = await _dialogService.showCustomDialog(
        variant: DialogType.takePhotoFile,
        barrierDismissible: true,
      );

      if (res != null && res.confirmed) {
        fotoAktaPerubahanTerakhir = res.data[0] as File;
        fotoAktaPerubahanTerakhirErrorText = null;
        uploadFotoAktaPerubahanTerakhir(
          fotoAktaPerubahanTerakhir!,
          res.data[1].toString(),
        );
        notifyListeners();
      }
    }
  }

  Future uploadFotoAktaPerubahanTerakhir(File file, String type) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type == 'image' ? 'image' : 'application',
      subType: type == 'image' ? 'png' : 'pdf',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingAktaPerubahanTerakhir = false;
        fotoAktaPerubahanTerakhirUrl = await _getPublicFile(url);
        notifyListeners();
      },
    );
  }

  Future clearAktaPerubahanTerakhir() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description:
          'Anda yakin akan menghapus file Akta Perubahan Terakhir ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoAktaPerubahanTerakhir = null;
      fotoAktaPerubahanTerakhirUrl = null;
      notifyListeners();
    }
  }

  /// ============= SK Kumham Pendirian ============== ///

  bool _isLoadingSkKumhamPendirianTerakhir = false;

  bool get isLoadingSkKumhamPendirianTerakhir =>
      _isLoadingSkKumhamPendirianTerakhir;
  PlatformFile? fotoSkKumhamPendirianTerakhir;
  String? fotoSkKumhamPendirianTerakhirErrorText;
  String? _fotoSkKumhamPendirianTerakhirUrl;
  String? fotoSkKumhamPendirianTerakhirUrl;

  Future captureFotoSkKumhamPendirianTerakhir() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingSkKumhamPendirianTerakhir = true;
      notifyListeners();
      if (_isLoadingSkKumhamPendirianTerakhir) {
        if (_isImageOrPdf(res.extension!)) {
          fotoSkKumhamPendirianTerakhir = res;
          fotoSkKumhamPendirianTerakhirErrorText = null;
          uploadFotoSkKumhamPendirianTerakhir(fotoSkKumhamPendirianTerakhir!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png atau pdf!');
        }
      }
    }
  }

  // Future captureFotoSkKumhamPendirianTerakhir() async {
  //   if (fotoSkKumhamPendirianTerakhirUrl != null) {
  //     clearSkKumhamPendirianTerakhir();
  //   } else {
  //     final res = await _dialogService.showCustomDialog(
  //       variant: DialogType.takePhotoFile,
  //       barrierDismissible: true,
  //     );

  //     if (res != null && res.confirmed) {
  //       fotoSkKumhamPendirianTerakhir = res.data[0] as File;
  //       fotoSkKumhamPendirianTerakhirErrorText = null;
  //       uploadFotoSkKumhamPendirianTerakhir(
  //         fotoSkKumhamPendirianTerakhir!,
  //         res.data[1].toString(),
  //       );
  //       notifyListeners();
  //     }
  //   }
  // }

  Future uploadFotoSkKumhamPendirianTerakhir(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingSkKumhamPendirianTerakhir = false;
        _fotoSkKumhamPendirianTerakhirUrl = url;
        fotoSkKumhamPendirianTerakhirUrl = await _getPublicFile(url);
        notifyListeners();
      },
    );
  }

  Future clearSkKumhamPendirianTerakhir() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file SK Kumham Pendirian ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoSkKumhamPendirianTerakhir = null;
      _fotoSkKumhamPendirianTerakhirUrl = null;
      fotoSkKumhamPendirianTerakhirUrl = null;
      notifyListeners();
    }
  }

  /// ============= SK Kumham Perubahan Terakhir ============== ///

  bool _isLoadingSkKumhamPerubahanTerakhir = false;

  bool get isLoadingSkKumhamPerubahanTerakhir =>
      _isLoadingSkKumhamPerubahanTerakhir;
  PlatformFile? fotoSkKumhamPerubahanTerakhir;
  String? fotoSkKumhamPerubahanTerakhirErrorText;
  String? _fotoSkKumhamPerubahanTerakhirUrl;
  String? fotoSkKumhamPerubahanTerakhirUrl;

  Future captureFotoSkKumhamPerubahanTerakhir() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingSkKumhamPerubahanTerakhir = true;
      notifyListeners();
      if (_isLoadingSkKumhamPerubahanTerakhir) {
        if (_isImageOrPdf(res.extension!)) {
          fotoSkKumhamPerubahanTerakhir = res;
          fotoSkKumhamPerubahanTerakhirErrorText = null;
          uploadFotoSkKumhamPerubahanTerakhir(fotoSkKumhamPerubahanTerakhir!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png atau pdf!');
        }
      }
    }
  }

  // Future captureFotoSkKumhamPerubahanTerakhir() async {
  //   if (fotoSkKumhamPerubahanTerakhirUrl != null) {
  //     clearSkKumhamPerubahanTerakhir();
  //   } else {
  //     final res = await _dialogService.showCustomDialog(
  //       variant: DialogType.takePhotoFile,
  //       barrierDismissible: true,
  //     );

  //     if (res != null && res.confirmed) {
  //       fotoSkKumhamPerubahanTerakhir = res.data[0] as File;
  //       fotoSkKumhamPerubahanTerakhirErrorText = null;
  //       uploadFotoSkKumhamPerubahanTerakhir(
  //         fotoSkKumhamPerubahanTerakhir!,
  //         res.data[1].toString(),
  //       );
  //       notifyListeners();
  //     }
  //   }
  // }

  Future uploadFotoSkKumhamPerubahanTerakhir(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingSkKumhamPerubahanTerakhir = false;
        _fotoSkKumhamPerubahanTerakhirUrl = url;
        fotoSkKumhamPerubahanTerakhirUrl = await _getPublicFile(url);
        notifyListeners();
      },
    );
  }

  Future clearSkKumhamPerubahanTerakhir() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description:
          'Anda yakin akan menghapus file SK Kumham Perubahan Terakhir ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoSkKumhamPerubahanTerakhir = null;
      _fotoSkKumhamPerubahanTerakhirUrl = null;
      fotoSkKumhamPerubahanTerakhirUrl = null;
      notifyListeners();
    }
  }

  // ignore: long-method
  Future _prepopulateTextFields() async {
    namaPerusahaanController
      ..text = ritelInformasiPerusahaanPt!.companyName!
      ..selection =
          TextSelection.collapsed(offset: namaPerusahaanController.text.length);

    nomorNpwpPerusahaanController
      ..text = ritelInformasiPerusahaanPt!.companyNpwpNum!
      ..selection = TextSelection.collapsed(
        offset: nomorNpwpPerusahaanController.text.length,
      );

    sektorController
      ..text = ritelInformasiPerusahaanPt!.economySectorsName!
      ..selection =
          TextSelection.collapsed(offset: sektorController.text.length);

    subSektorController
      ..text = ritelInformasiPerusahaanPt!.economySubSectorsName!
      ..selection =
          TextSelection.collapsed(offset: subSektorController.text.length);

    alamatPerushaanController
      ..text = ritelInformasiPerusahaanPt!.tagLocation!.latLng!
      ..selection = TextSelection.collapsed(
        offset: alamatPerushaanController.text.length,
      );

    detailAlamatPerusahaanController
      ..text = ritelInformasiPerusahaanPt!.detail!
      ..selection = TextSelection.collapsed(
        offset: detailAlamatPerusahaanController.text.length,
      );

    detailTempatAktaPendirianController
      ..text = ritelInformasiPerusahaanPt!.placeOfDeedEst!
      ..selection = TextSelection.collapsed(
        offset: detailTempatAktaPendirianController.text.length,
      );
    detailTempatAktaPerubahaanController
      ..text = ritelInformasiPerusahaanPt!.latestPlaceOfDeed!
      ..selection = TextSelection.collapsed(
        offset: detailTempatAktaPerubahaanController.text.length,
      );

    postalCodeAlamatPerusahaanController
      ..text = ritelInformasiPerusahaanPt!.postalCode!
      ..selection = TextSelection.collapsed(
        offset: postalCodeAlamatPerusahaanController.text.length,
      );

    districtAlamatPerusahaanController
      ..text = ritelInformasiPerusahaanPt!.district!
      ..selection = TextSelection.collapsed(
        offset: districtAlamatPerusahaanController.text.length,
      );

    villageAlamatPerusahaanController
      ..text = ritelInformasiPerusahaanPt!.village!
      ..selection = TextSelection.collapsed(
        offset: villageAlamatPerusahaanController.text.length,
      );

    rtAlamatPerusahaanController
      ..text = ritelInformasiPerusahaanPt!.rt!
      ..selection = TextSelection.collapsed(
        offset: rtAlamatPerusahaanController.text.length,
      );

    rwAlamatPerusahaanController
      ..text = ritelInformasiPerusahaanPt!.rw!
      ..selection = TextSelection.collapsed(
        offset: rwAlamatPerusahaanController.text.length,
      );

    tglAktaPendirianController.text = DateStringFormatter.forInput(
      ritelInformasiPerusahaanPt!.dateOfDeedEst!.date!,
    );

    nomorAktaPendirianController
      ..text = ritelInformasiPerusahaanPt!.deedEstNum!
      ..selection = TextSelection.collapsed(
        offset: nomorAktaPendirianController.text.length,
      );

    tglSKkumhamPendirianController.text =
        ritelInformasiPerusahaanPt!.dateOfSkKumham == null
            ? ''
            : DateStringFormatter.forInput(
                ritelInformasiPerusahaanPt!.dateOfSkKumham!.date!,
              );

    nomorSKkumhamPendirianController
      ..text = ritelInformasiPerusahaanPt!.skKumhamNum!
      ..selection = TextSelection.collapsed(
        offset: nomorSKkumhamPendirianController.text.length,
      );

    tglAktaPerubahanTerakhirController.text = DateStringFormatter.forInput(
      ritelInformasiPerusahaanPt!.latestDateOfDeed!.date!,
    );

    nomorAktaPerubahanTerakhirController
      ..text = ritelInformasiPerusahaanPt!.latestDeedNum!
      ..selection = TextSelection.collapsed(
        offset: nomorAktaPerubahanTerakhirController.text.length,
      );

    detailTempatAktaPerubahanTerakhirController
      ..text = ritelInformasiPerusahaanPt!.detail!
      ..selection = TextSelection.collapsed(
        offset: detailTempatAktaPerubahanTerakhirController.text.length,
      );

    tglSKkumhamPerubahanTerakhirController.text =
        ritelInformasiPerusahaanPt!.latestDateOfSkKumham == null
            ? ''
            : DateStringFormatter.forInput(
                ritelInformasiPerusahaanPt!.latestDateOfSkKumham!.date!,
              );

    nomorSKkumhamPerubahanTerakhirController
      ..text = ritelInformasiPerusahaanPt!.latestSkKumhamNum!
      ..selection = TextSelection.collapsed(
        offset: nomorSKkumhamPerubahanTerakhirController.text.length,
      );

    namaLengkapPicController
      ..text = ritelInformasiPerusahaanPt!.fullnamePIC!
      ..selection =
          TextSelection.collapsed(offset: namaLengkapPicController.text.length);

    final stringWithout62 =
        ritelInformasiPerusahaanPt!.phoneNumPIC!.replaceAll('+62', '');
    noHpPicController
      ..text = stringWithout62
      ..selection =
          TextSelection.collapsed(offset: noHpPicController.text.length);
    emailPicController
      ..text = ritelInformasiPerusahaanPt!.emailPIC!
      ..selection =
          TextSelection.collapsed(offset: emailPicController.text.length);

    provinceAlamatPerusahaanController
      ..text = ritelInformasiPerusahaanPt!.province!
      ..selection = TextSelection.collapsed(
        offset: provinceAlamatPerusahaanController.text.length,
      );

    cityAlamatPerusahaanController
      ..text = ritelInformasiPerusahaanPt!.city!
      ..selection = TextSelection.collapsed(
        offset: cityAlamatPerusahaanController.text.length,
      );
  }

  Future _prepopulateImages() async {
    if (ritelInformasiPerusahaanPt!.companyNpwpPath != null &&
        ritelInformasiPerusahaanPt!.companyNpwpPath!.isNotEmpty) {
      fotoNpwpPerusahaanUrl =
          await _getPublicFile(ritelInformasiPerusahaanPt!.companyNpwpPath!);
      notifyListeners();
    }

    if (ritelInformasiPerusahaanPt!.deedEstPath != null &&
        ritelInformasiPerusahaanPt!.deedEstPath!.isNotEmpty) {
      _fotoAktaPendirianUrl = ritelInformasiPerusahaanPt!.deedEstPath!;
      fotoAktaPendirianUrl = await _getPublicFile(_fotoAktaPendirianUrl!);
      notifyListeners();
    }

    if (ritelInformasiPerusahaanPt!.latestDeedPath != null &&
        ritelInformasiPerusahaanPt!.latestDeedPath!.isNotEmpty) {
      fotoAktaPerubahanTerakhirUrl =
          await _getPublicFile(ritelInformasiPerusahaanPt!.latestDeedPath!);

      notifyListeners();
    }

    if (ritelInformasiPerusahaanPt!.skKumhamPath != null &&
        ritelInformasiPerusahaanPt!.skKumhamPath!.isNotEmpty) {
      _fotoSkKumhamPendirianTerakhirUrl =
          ritelInformasiPerusahaanPt!.skKumhamPath!;
      fotoSkKumhamPendirianTerakhirUrl =
          await _getPublicFile(_fotoSkKumhamPendirianTerakhirUrl!);
      notifyListeners();
    }
    if (ritelInformasiPerusahaanPt!.latestSkKumhamPath != null &&
        ritelInformasiPerusahaanPt!.latestSkKumhamPath!.isNotEmpty) {
      _fotoSkKumhamPerubahanTerakhirUrl =
          ritelInformasiPerusahaanPt!.latestSkKumhamPath!;
      fotoSkKumhamPerubahanTerakhirUrl =
          await _getPublicFile(_fotoSkKumhamPerubahanTerakhirUrl!);
      notifyListeners();
    }
  }

  Map<String, dynamic> _generateInformasiPerusahaanUpdateMap() {
    // final aktaPendirianCV = {
    //   "deedEstPath": _fotoAktaPendirianUrl,
    //   "latestDeedPath": _fotoAktaPerubahanTerakhirUrl,
    // // };
    final patnerShip = {
      'partnershipsId': 0,
      'emailPIC': emailPicController.text.trim(),
    };

    return {
      'prakarsaId': prakarsaId,
      if (codeTable != 2) ...patnerShip,
      // "partnershipsId": 0,
      'dateOfSkKumham': tglSKkumhamPendirianController.text.trim(),
      'skKumhamNum': nomorSKkumhamPendirianController.text.trim(),
      'latestDateOfSkKumham':
          tglSKkumhamPerubahanTerakhirController.text.trim(),
      'latestSkKumhamNum': nomorSKkumhamPerubahanTerakhirController.text.trim(),

      // if (codeTable == 2) ...aktaPendirianCV,
      // "deedEstPath": _fotoAktaPendirianUrl,
      // "latestDeedPath": _fotoAktaPerubahanTerakhirUrl,
      'skKumhamPath': _fotoSkKumhamPendirianTerakhirUrl,
      'latestSkKumhamPath': _fotoSkKumhamPerubahanTerakhirUrl,
    };
  }

  bool _validateUploadFiles() {
    return fotoAktaPendirianUrl != null &&
        fotoAktaPerubahanTerakhirUrl != null &&
        fotoSkKumhamPendirianTerakhirUrl != null &&
        fotoSkKumhamPerubahanTerakhirUrl != null;
  }

  void _setUploadFilesErrorTextIfAny() {
    // if (fotoAktaPendirianUrl != null) {
    //   fotoAktaPendirianErrorText = 'Foto Akta Pendirian harus diupload';
    // }
    // if (fotoAktaPerubahanTerakhirUrl != null) {
    //   fotoAktaPerubahanTerakhirErrorText =
    //       'Foto Akta Perubahan Terakhir harus diupload';
    // }
    if (fotoSkKumhamPendirianTerakhirUrl != null) {
      fotoSkKumhamPendirianTerakhirErrorText =
          'Foto SK Kumham Pendirian harus diupload';
    }
    if (fotoSkKumhamPerubahanTerakhirUrl != null) {
      fotoSkKumhamPerubahanTerakhirErrorText =
          'Foto SK Kumham Perubahan Terakhir harus diupload';
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

  Future _postData() async {
    final infoPerusahaanPtMap = _generateInformasiPerusahaanUpdateMap();

    final res = await runBusyFuture(
      _ritelPrakarsaAPI.updateByIdInformasiPerusahaan(
        codeTable: codeTable,
        payload: infoPerusahaanPtMap,
      ),
    );

    res.fold(
      (errorMessage) {
        _showErrorDialog(errorMessage);
        notifyListeners();
      },
      (successMessage) {
        _showSuccessDialogPut(
          codeTable == Common.CodeTable.PT
              ? 'Berhasil mengubah Informasi Perusahaan PT'
              : 'Berhasil mengubah Informasi Perusahaan CV',
        );
        notifyListeners();
      },
    );
  }

  Future validateInputs() async {
    if (formKey.currentState!.validate() && _validateUploadFiles()) {
      formKey.currentState!.save();

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

  bool _isImageOrPdf(String type) {
    return (type == 'pdf' || type == 'jpg' || type == 'png' || type == 'jpeg');
  }
}

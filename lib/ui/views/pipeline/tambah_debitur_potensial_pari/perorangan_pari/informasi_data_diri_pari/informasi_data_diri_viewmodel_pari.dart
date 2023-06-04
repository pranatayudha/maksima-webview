// ignore_for_file: prefer_single_quotes, no_leading_underscores_for_local_identifiers, unnecessary_null_comparison, prefer_if_null_operators

import 'dart:developer' as dev;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../application/app/app.locator.dart';
import '../../../../../../application/app/app.router.dart';
import '../../../../../../application/app/constants/common.dart';
import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../application/enums/bottom_sheet_type.dart';
import '../../../../../../application/enums/dialog_type.dart';
import '../../../../../../application/enums/pipeline_perorangan_api_method.dart';
import '../../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../../application/helpers/education_string_formatter.dart';
import '../../../../../../application/helpers/religion_string_formatter.dart';
import '../../../../../../application/models/ritel_informasi_data_diri.dart';
import '../../../../../../application/models/ritel_postal_code.dart';
import '../../../../../../application/services/local_db_service.dart';
import '../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../infrastructure/apis/ritel_pipeline_perorangan_api.dart';
import '../../../../../../infrastructure/apis/ritel_upload_file_api.dart';

class InformasiDataDiriViewModelPari extends BaseViewModel {
  String? pipelineId;
  RitelInformasiDataDiri? ritelInformasiDataDiri;
  bool fromTdpPeroranganView;
  bool? fromPipelineDetailsView;
  int? statusPipeline;

  final NavigationService _navigationService = locator<NavigationService>();

  final DialogService _dialogService = locator<DialogService>();
  final RitelUploadFileAPI _ritelUploadFileAPI = locator<RitelUploadFileAPI>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();
  final RitelPipelinePeroranganAPI _ritelPipelinePeroranganAPI =
      locator<RitelPipelinePeroranganAPI>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  List<RitelPostalCode> _ritelPostalCode = [];
  List<RitelPostalCode> _ritelPostalCodeSecond = [];

  double? _lat;

  double? _lng;

  final jenisDebiturController = TextEditingController();

  final idAccountPariController = TextEditingController();

  final nomorKtpDebiturController = TextEditingController();
  final tglKtpTerbitController = TextEditingController();
  final nomorNpwpDebiturController = TextEditingController();

  final nomorKkDebiturController = TextEditingController();
  final jumlahTanggunganController = TextEditingController();

  final namaLengkapDebiturController = TextEditingController();

  final agamaController = TextEditingController();

  final pendidikanTerakhirController = TextEditingController();

  final tempatLahirDebiturController = TextEditingController();
  final tglLahirDebiturController = TextEditingController();

  final jenisKelaminController = TextEditingController();
  final namaGadisIbuKandungDebiturController = TextEditingController();
  final statusPerkawinanController = TextEditingController();

  final alamatTinggalController = TextEditingController();
  final detailAlamatTinggalController = TextEditingController();

  final postalCodeAlamatTinggalController = TextEditingController();
  final provinceAlamatTinggalController = TextEditingController();

  final cityAlamatTinggalController = TextEditingController();
  final districtAlamatTinggalController = TextEditingController();

  final villageAlamatTinggalController = TextEditingController();
  final rtAlamatTinggalController = TextEditingController();

  final rwAlamatTinggalController = TextEditingController();
  final noHpDebiturController = TextEditingController();

  final emailDebiturController = TextEditingController();
  final nomorKtpPasanganController = TextEditingController();

  final namaLengkapPasanganController = TextEditingController();
  final tempatLahirPasanganController = TextEditingController();

  final tglLahirPasanganController = TextEditingController();
  bool _isLoadingKtpDebitur = false;

  bool _isLoadingSelfieKtp = false;
  bool _isLoadingNpwp = false;

  bool _isLoadingKk = false;
  bool _isLoadingKtpPasangan = false;

  bool _isLoadingAktaNikah = false;
  bool _isLoadingAktaCerai = false;

  bool _isLoadingSertiKematian = false;

  File? fotoKtpDebitur;
  String? fotoKtpDebiturErrorText;
  String? fotoKtpDebiturUrl;
  String? fotoKtpDebiturPublicUrl;

  File? suratKematian;
  String? suratKematianErrorText;
  String? suratKematianUrl;
  String? suratKematianPublicUrl;

  File? fotoAktaNikah;
  String? fotoAktaNikahErrorText;
  String? fotoAktaNikahUrl;
  String? fotoAktaNikahPublicUrl;

  File? fotoKtpPasangan;
  String? fotoKtpPasanganErrorText;
  String? fotoKtpPasanganUrl;
  String? fotoKtpPasanganPublicUrl;

  File? fotoNpwpDebitur;
  String? fotoNpwpDebiturErrorText;
  String? fotoNpwpDebiturUrl;
  String? fotoNpwpDebiturPublicUrl;

  File? fotoKartuKeluargaDebitur;
  String? fotoKartuKeluargaDebiturErrorText;
  String? fotoKartuKeluargaUrl;
  String? fotoKartuKeluargaPublicUrl;

  File? fotoKtpSelfie;
  String? fotoKtpSelfieErrorText;
  String? fotoKtpSelfieUrl;
  String? fotoKtpSelfiePublicUrl;

  File? fotoAktaCerai;
  String? fotoAktaCeraiErrorText;
  String? fotoAktaCeraiUrl;
  String? fotoAktaCeraiPublicUrl;

  InformasiDataDiriViewModelPari({
    this.pipelineId,
    this.ritelInformasiDataDiri,
    required this.fromTdpPeroranganView,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  });

  bool get isLoadingAktaCerai => _isLoadingAktaCerai;

  bool get isLoadingAktaNikah => _isLoadingAktaNikah;

  bool get isLoadingKk => _isLoadingKk;

  bool get isLoadingKtpDebitur => _isLoadingKtpDebitur;

  bool get isLoadingKtpPasangan => _isLoadingKtpPasangan;

  bool get isLoadingNpwp => _isLoadingNpwp;

  bool get isLoadingSelfieKtp => _isLoadingSelfieKtp;

  bool get isLoadingSertiKematian => _isLoadingSertiKematian;

  List<RitelPostalCode> get ritelPostalCode => _ritelPostalCode;

  Future captureAktaCerai() async {
    final res = await _dialogService.showCustomDialog(
      variant: DialogType.takePhotoFile,
      barrierDismissible: true,
    );

    if (res != null && res.confirmed) {
      _isLoadingAktaCerai = true;
      notifyListeners();
      if (_isLoadingAktaCerai) {
        fotoAktaCerai = res.data[0] as File;
        fotoAktaCeraiErrorText = null;
        uploadFileAktaCerai(fotoAktaCerai!, res.data[1].toString());
        notifyListeners();
      }
    }
  }

  Future captureAktaNikah() async {
    final res = await _dialogService.showCustomDialog(
      variant: DialogType.takePhotoFile,
      barrierDismissible: true,
    );

    if (res != null && res.confirmed) {
      _isLoadingAktaNikah = true;
      notifyListeners();
      if (_isLoadingAktaNikah) {
        fotoAktaNikah = res.data[0] as File;
        fotoAktaNikahErrorText = null;
        uploadFileAktaNikah(fotoAktaNikah!, res.data[1].toString());
        notifyListeners();
      }
    }
  }

  Future captureKartuKeluargaDebitur() async {
    final res = await _dialogService.showCustomDialog(
      variant: DialogType.takePhotoFile,
      barrierDismissible: true,
    );

    if (res != null && res.confirmed) {
      _isLoadingKk = true;
      notifyListeners();
      if (_isLoadingKk) {
        fotoKartuKeluargaDebitur = res.data[0] as File;
        fotoKartuKeluargaDebiturErrorText = null;
        uploadFileKK(fotoKartuKeluargaDebitur!, res.data[1].toString());
        notifyListeners();
      }
    }
  }

  Future captureKtpDebitur() async {
    final res = await _dialogService.showCustomDialog(
      variant: DialogType.takePhotoFile,
      barrierDismissible: true,
    );

    if (res != null && res.confirmed) {
      _isLoadingKtpDebitur = true;
      notifyListeners();
      if (_isLoadingKtpDebitur) {
        fotoKtpDebitur = res.data[0] as File;
        fotoKtpDebiturErrorText = null;
        uploadFileKtpDebitur(fotoKtpDebitur!, res.data[1].toString());
        notifyListeners();
      }
    }
  }

  Future captureKtpPasangan() async {
    final res = await _dialogService.showCustomDialog(
      variant: DialogType.takePhotoFile,
      barrierDismissible: true,
    );

    if (res != null && res.confirmed) {
      _isLoadingKtpPasangan = true;
      notifyListeners();
      if (_isLoadingKtpPasangan) {
        fotoKtpPasangan = res.data[0] as File;
        fotoKtpPasanganErrorText = null;
        uploadFileKtpPasangan(fotoKtpPasangan!, res.data[1].toString());
        notifyListeners();
      }
    }
  }

  Future captureKtpSelfie() async {
    final res = await _dialogService.showCustomDialog(
      variant: DialogType.takePhotoFile,
      barrierDismissible: true,
    );

    if (res != null && res.confirmed) {
      _isLoadingSelfieKtp = true;
      notifyListeners();
      if (_isLoadingSelfieKtp) {
        fotoKtpSelfie = res.data[0] as File;
        fotoKtpSelfieErrorText = null;
        uploadFileSelfieKtp(fotoKtpSelfie!, res.data[1].toString());
        notifyListeners();
      }
    }
  }

  Future captureNpwpDebitur() async {
    final res = await _dialogService.showCustomDialog(
      variant: DialogType.takePhotoFile,
      barrierDismissible: true,
    );

    if (res != null && res.confirmed) {
      _isLoadingNpwp = true;
      notifyListeners();
      if (_isLoadingNpwp) {
        fotoNpwpDebitur = res.data[0] as File;
        fotoNpwpDebiturErrorText = null;
        uploadFileNpwp(fotoNpwpDebitur!, res.data[1].toString());
        notifyListeners();
      }
    }
  }

  Future captureSuratKematian() async {
    final res = await _dialogService.showCustomDialog(
      variant: DialogType.takePhotoFile,
      barrierDismissible: true,
    );

    if (res != null && res.confirmed) {
      _isLoadingSertiKematian = true;
      notifyListeners();
      if (_isLoadingSertiKematian) {
        suratKematian = res.data[0] as File;
        suratKematianErrorText = null;
        uploadFileSertiKematian(suratKematian!, res.data[1].toString());
        notifyListeners();
      }
    }
  }

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

  Future clearKK() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file kartu keluarga ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoKartuKeluargaDebitur = null;
      fotoKartuKeluargaUrl = null;
      fotoKartuKeluargaPublicUrl = null;

      notifyListeners();
    }
  }

  Future clearKtpDebitur() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file E-KTP debitur ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoKtpDebitur = null;
      fotoKtpDebiturUrl = null;
      fotoKtpDebiturPublicUrl = null;

      notifyListeners();
    }
  }

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
      fotoKtpPasanganPublicUrl = null;
      fotoKtpPasanganUrl = null;
      notifyListeners();
    }
  }

  Future clearKtpSelfie() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description:
          'Anda yakin akan menghapus file foto debitur bersama E-KTP ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoKtpSelfie = null;
      fotoKtpSelfiePublicUrl = null;
      fotoKtpSelfieUrl = null;
      notifyListeners();
    }
  }

  Future clearNpwp() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file NPWP debitur ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoNpwpDebitur = null;
      fotoNpwpDebiturUrl = null;
      fotoNpwpDebiturPublicUrl = null;
      notifyListeners();
    }
  }

  void clearPostalCode() {
    postalCodeAlamatTinggalController.clear();
    provinceAlamatTinggalController.clear();
    cityAlamatTinggalController.clear();
    districtAlamatTinggalController.clear();
    villageAlamatTinggalController.clear();
    notifyListeners();
  }

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
      suratKematianPublicUrl = null;
      suratKematianUrl = null;
      notifyListeners();
    }
  }

  void clearVillage() {
    villageAlamatTinggalController.clear();
    notifyListeners();
  }

  List<RitelPostalCode> filterVillage(String query) {
    List<RitelPostalCode> temp = [];

    for (var i = 0; i < _ritelPostalCodeSecond.length; i++) {
      if (districtAlamatTinggalController.text
          .trim()
          .contains(_ritelPostalCodeSecond[i].district!)) {
        temp.add(_ritelPostalCodeSecond[i]);
      } else {
        temp;
      }
    }

    return temp.toList();

    // return _ritelPostalCodeSecond
    //     .where((element) => element.village!.toLowerCase().contains(query))
    //     .toList();
  }

  void clearDistrict() {
    districtAlamatTinggalController.clear();
    notifyListeners();
  }

  List<RitelPostalCode> filterDistrict(String query) {
    List<RitelPostalCode> res = [];
    RitelPostalCode temp = RitelPostalCode();
    for (var i = 0; i < _ritelPostalCode.length; i++) {
      if (i == 0) {
        temp = _ritelPostalCode[i];
      } else if (temp.district != _ritelPostalCode[i].district!) {
        res.add(temp);
        temp = _ritelPostalCode[i];
      }
    }

    res.add(temp);

    return res.toList();
  }

  bool isValidPostalCode = false;
  Future getPostalCode(
    String postalCode,
  ) async {
    final res =
        await runBusyFuture(_ritelMasterAPI.getDetailByPostalCode(postalCode));

    res.fold(
      (error) => isValidPostalCode = false,
      (result) {
        final postalCode = List<RitelPostalCode>.from(
          result.map(
            (i) => RitelPostalCode.fromJson(i as Map<String, dynamic>),
          ),
        );
        _ritelPostalCode = postalCode;
        provinceAlamatTinggalController.text =
            _ritelPostalCode[0].province.toString();
        cityAlamatTinggalController.text = _ritelPostalCode[0].city.toString();
        isValidPostalCode = true;
      },
    );
  }

  Future getVillage(
    String postalCode,
  ) async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getDetailByPostalCode(postalCode),
    );

    res.fold(
      (error) => dev.log(error),
      (result) {
        final postalCode = List<RitelPostalCode>.from(
          result.map(
            (i) => RitelPostalCode.fromJson(i as Map<String, dynamic>),
          ),
        );
        _ritelPostalCodeSecond = postalCode;
      },
    );
  }

  // =============== Group Place of Birth =============== //

  void updatePlaceOfBirthPari(String val) =>
      tempatLahirDebiturController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updatePlaceOfBirthSuppouse(String val) =>
      tempatLahirPasanganController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  Future initialize() async {
    setBusy(true);
    if (ritelInformasiDataDiri != null) {
      await _prepopulateTextFields();
      await _prepopulateImages();
      if (ritelInformasiDataDiri!.postalCode!.isNotEmpty) {
        getPostalCode(ritelInformasiDataDiri!.postalCode!);
      }
    }
    setBusy(false);
  }

  Future navigateBack() async {
    if (pipelineId != null) {
      final response = await _dialogService.showCustomDialog(
        variant: DialogType.base,
        title: 'Edited',
        description:
            'Anda belum menyelesaikan pengisian form ini. Data-data yang sudah Anda masukkan akan hilang. Apakah Anda yakin akan membatalkan pengisian form ini?',
        data: {'color': CustomColor.primaryRed80},
        mainButtonTitle: 'Batal Isi Form',
      );

      if (response!.confirmed) _navigationService.back();
    } else if (_anyFieldEditedDataDiri()) {
      final response = await _dialogService.showCustomDialog(
        variant: DialogType.base,
        title: 'Edited',
        description:
            'Anda belum menyelesaikan pengisian form ini. Data-data yang sudah Anda masukkan akan hilang. Apakah Anda yakin akan membatalkan pengisian form ini?',
        data: {'color': CustomColor.primaryRed80},
        mainButtonTitle: 'Batal Isi Form',
      );

      if (response!.confirmed) _navigationService.back();
    } else {
      _navigationService.back();
    }
  }

  Future navigateToAddressSelectionViewDataDiri() async {
    _navigationService
        .navigateTo(Routes.addressSelectionView)!
        .then((chosenPlace) {
      if (chosenPlace != null) {
        alamatTinggalController.text = chosenPlace['address'] as String;
        _lat = chosenPlace['lat'] as double;
        _lng = chosenPlace['lng'] as double;
      }
    });
  }

  void updateAgama(String val) {
    agamaController.text = val;
    notifyListeners();
  }

  void updateAlamatTinggal(String val) =>
      alamatTinggalController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateCityAlamatTinggal(String val) =>
      cityAlamatTinggalController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateDetailAlamatTinggal(String val) =>
      detailAlamatTinggalController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateDistrictAlamatTinggal(String val) =>
      districtAlamatTinggalController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateEmailDebitur(String val) => emailDebiturController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateIdAccountPari(String val) =>
      idAccountPariController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateJenisKelamin(String val) {
    jenisKelaminController.text = val;
    notifyListeners();
  }

  void updateJumlahTanggungan(String val) =>
      jumlahTanggunganController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateMaritalStatus(String val) {
    statusPerkawinanController.text = val;
    notifyListeners();
  }

  void updateNamaGadisIbuKandungDebitur(String val) =>
      namaGadisIbuKandungDebiturController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateNamaLengkapDebitur(String val) =>
      namaLengkapDebiturController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateNamaLengkapPasangan(String val) =>
      namaLengkapPasanganController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateNoHpDebitur(String val) => noHpDebiturController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateNomorKk(String val) => nomorKkDebiturController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateNomorKTP(String val) => nomorKtpDebiturController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateNomorKtpPasangan(String val) =>
      nomorKtpPasanganController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateNomorNpwp(String val) => nomorNpwpDebiturController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updatePendidikanTerakhir(String val) {
    pendidikanTerakhirController.text = val;
    notifyListeners();
  }

  Future updatePostalCode(RitelPostalCode ritelPostalCode) async {
    provinceAlamatTinggalController.text = ritelPostalCode.province!;
    cityAlamatTinggalController.text = ritelPostalCode.city!;
    districtAlamatTinggalController.text = ritelPostalCode.district!;
    notifyListeners();
  }

  void updatePostalCodeAlamatTinggal(String val) async {
    postalCodeAlamatTinggalController.value.copyWith(
      text: val,
      selection: TextSelection(
        baseOffset: val.length,
        extentOffset: val.length,
      ),
    );
    provinceAlamatTinggalController.clear();
    cityAlamatTinggalController.clear();
    
    await getPostalCode(postalCodeAlamatTinggalController.text);
    if (!isValidPostalCode) {
      districtAlamatTinggalController.clear();
      villageAlamatTinggalController.clear();
    }
  }

  void updateProvinceAlamatTinggal(String val) =>
      provinceAlamatTinggalController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateRtAlamatTinggal(String val) =>
      rtAlamatTinggalController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateRwAlamatTinggal(String val) =>
      rwAlamatTinggalController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateTempatLahirDebitur(String val) =>
      tempatLahirDebiturController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateTempatLahirPasangan(String val) =>
      tempatLahirPasanganController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateTglKtpTerbit(String val) =>
      tglKtpTerbitController.text = val.trim();

  void updateTglLahirDebitur(String val) =>
      tglLahirDebiturController.text = val.trim();

  void updateTglLahirPasangan(String val) =>
      tglLahirPasanganController.text = val.trim();

  Future updateVillage(RitelPostalCode ritelPostalCode) async {
    villageAlamatTinggalController.text = ritelPostalCode.village!.trim();
    notifyListeners();
  }

  Future updateDistrict(RitelPostalCode ritelPostalCode) async {
    districtAlamatTinggalController.text = ritelPostalCode.district!.trim();
    notifyListeners();

    await getVillage(
      ritelPostalCode.postalCode!,
    );
  }

  void updateVillageAlamatTinggal(String val) =>
      villageAlamatTinggalController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  Future uploadFileAktaCerai(File file, String type) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type == 'image' ? 'image' : 'application',
      subType: type == 'image' ? 'png' : 'pdf',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingAktaCerai = false;
        fotoAktaCeraiUrl = url;
        fotoAktaCeraiPublicUrl = await _getPublicFile(url);

        notifyListeners();
      },
    );
  }

  Future uploadFileAktaNikah(File file, String type) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type == 'image' ? 'image' : 'application',
      subType: type == 'image' ? 'png' : 'pdf',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingAktaNikah = false;
        fotoAktaNikahUrl = url;
        fotoAktaNikahPublicUrl = await _getPublicFile(url);

        notifyListeners();
      },
    );
  }

  Future uploadFileKK(File file, String type) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type == 'image' ? 'image' : 'application',
      subType: type == 'image' ? 'png' : 'pdf',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingKk = false;
        fotoKartuKeluargaUrl = url;
        fotoKartuKeluargaPublicUrl = await _getPublicFile(url);

        notifyListeners();
      },
    );
  }

  Future uploadFileKtpDebitur(File file, String type) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type == 'image' ? 'image' : 'application',
      subType: type == 'image' ? 'png' : 'pdf',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingKtpDebitur = false;
        fotoKtpDebiturUrl = url;
        fotoKtpDebiturPublicUrl = await _getPublicFile(url);

        notifyListeners();
      },
    );
  }

  Future uploadFileKtpPasangan(File file, String type) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type == 'image' ? 'image' : 'application',
      subType: type == 'image' ? 'png' : 'pdf',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingKtpPasangan = false;
        fotoKtpPasanganUrl = url;
        fotoKtpPasanganPublicUrl = await _getPublicFile(url);

        notifyListeners();
      },
    );
  }

  Future uploadFileNpwp(File file, String type) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type == 'image' ? 'image' : 'application',
      subType: type == 'image' ? 'png' : 'pdf',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingNpwp = false;
        fotoNpwpDebiturUrl = url;
        fotoNpwpDebiturPublicUrl = await _getPublicFile(url);

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
        _isLoadingSelfieKtp = false;
        fotoKtpSelfieUrl = url;
        fotoKtpSelfiePublicUrl = await _getPublicFile(url);

        notifyListeners();
      },
    );
  }

  Future uploadFileSertiKematian(File file, String type) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type == 'image' ? 'image' : 'application',
      subType: type == 'image' ? 'png' : 'pdf',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingSertiKematian = false;
        suratKematianUrl = url;
        suratKematianPublicUrl = await _getPublicFile(url);

        notifyListeners();
      },
    );
  }

  Future validateInputs(
    PipelinePeroranganAPIMethod pipelinePeroranganAPIMethod, {
    bool isContinue = false,
  }) async {
    if (formKey.currentState!.validate() && _validateUploadFiles()) {
      // formKey.currentState!.save();

      final response = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.confirmation,
        data: {'title': 'Konfirmasi'},
      );

      if (response != null && response.confirmed) {
        _postData(pipelinePeroranganAPIMethod, isContinue);
      }
    } else {
      autoValidateMode = AutovalidateMode.always;
      _setUploadFilesErrorTextIfAny();
      _showValidationErrorDialog();
      notifyListeners();
    }
  }

  bool _anyFieldEditedDataDiri() {
    return nomorKtpDebiturController.text.isNotEmpty ||
        nomorNpwpDebiturController.text.isNotEmpty ||
        namaLengkapDebiturController.text.isNotEmpty ||
        jenisKelaminController.text.isNotEmpty ||
        tglLahirDebiturController.text.isNotEmpty ||
        tempatLahirDebiturController.text.isNotEmpty ||
        namaGadisIbuKandungDebiturController.text.isNotEmpty ||
        statusPerkawinanController.text.isNotEmpty ||
        noHpDebiturController.text.isNotEmpty ||
        // emailDebiturController.text.isNotEmpty ||
        (statusPerkawinanController.text == Common.kawin &&
            nomorKtpPasanganController.text.isNotEmpty) ||
        (statusPerkawinanController.text == Common.kawin &&
            namaLengkapPasanganController.text.isNotEmpty) ||
        (statusPerkawinanController.text == Common.kawin &&
            tglLahirPasanganController.text.isNotEmpty) ||
        (statusPerkawinanController.text == Common.kawin &&
            tempatLahirPasanganController.text.isNotEmpty) ||
        detailAlamatTinggalController.text.isNotEmpty ||
        postalCodeAlamatTinggalController.text.isNotEmpty ||
        provinceAlamatTinggalController.text.isNotEmpty ||
        cityAlamatTinggalController.text.isNotEmpty ||
        districtAlamatTinggalController.text.isNotEmpty ||
        villageAlamatTinggalController.text.isNotEmpty ||
        rtAlamatTinggalController.text.isNotEmpty ||
        rwAlamatTinggalController.text.isNotEmpty;
  }

  Future<Map<String, dynamic>> _generateDataDiriAddressMap() async {
    return {
      'tagLocation': {
        'latLng': '${_lat.toString()}, ${_lng.toString()}',
        'name': alamatTinggalController.text.trim(),
      },
      'detail': detailAlamatTinggalController.text.trim(),
      'postalCode': postalCodeAlamatTinggalController.text.trim(),
      'province': provinceAlamatTinggalController.text.trim(),
      'city': cityAlamatTinggalController.text.trim(),
      'district': districtAlamatTinggalController.text.trim(),
      'village': villageAlamatTinggalController.text.trim(),
      'rt': rtAlamatTinggalController.text.isNotEmpty
          ? rtAlamatTinggalController.text.trim()
          : '',
      'rw': rwAlamatTinggalController.text.isNotEmpty
          ? rwAlamatTinggalController.text.trim()
          : '',
    };
  }

  // ignore: long-method
  Future<Map<String, dynamic>> _generateInfoDataDiriMap(String action) async {
    var latLng = '${_lat.toString()}, ${_lng.toString()}';

    // ignore: prefer-conditional-expressions
    if (action == 'add') {
      return {
        'idAccountPari': idAccountPariController.text.trim(),
        'ktpNum': nomorKtpDebiturController.text.trim(),
        'kkNum': nomorKkDebiturController.text.trim(),
        'npwpNum': nomorNpwpDebiturController.text.isNotEmpty
            ? nomorNpwpDebiturController.text.trim()
            : '',
        'dateOfIssuedKTP': tglKtpTerbitController.text.trim(),
        "dateOfExpiredKTP": "12/12/2049",
        "religion":
            ReligionStringFormatter.forInput(agamaController.text.trim()),
        "lastEducation": EducationStringFormatter.forInput(
          pendidikanTerakhirController.text.trim(),
        ),
        'numberOfDependents': jumlahTanggunganController.text.isNotEmpty
            ? int.parse(jumlahTanggunganController.text.trim())
            : 0,
        'fullName': namaLengkapDebiturController.text.trim(),
        'gender': jenisKelaminController.text.trim(),
        'dateOfBirth': tglLahirDebiturController.text.trim(),
        'placeOfBirth': tempatLahirDebiturController.text.trim(),
        'motherMaiden': namaGadisIbuKandungDebiturController.text.isNotEmpty
            ? namaGadisIbuKandungDebiturController.text.trim()
            : '',
        'maritalStatus': statusPerkawinanController.text.trim(),
        'phoneNum': '+62${noHpDebiturController.text.trim()}',
        'email': emailDebiturController.text.isNotEmpty
            ? emailDebiturController.text.trim()
            : '',
        'spouseKtpNum': statusPerkawinanController.text != Common.belumKawin &&
                nomorKtpPasanganController.text != ''
            ? nomorKtpPasanganController.text.trim()
            : '',
        'spouseFullname':
            statusPerkawinanController.text != Common.belumKawin &&
                    namaLengkapPasanganController.text != ''
                ? namaLengkapPasanganController.text.trim()
                : '',
        'spouseDateOfBirth':
            statusPerkawinanController.text != Common.belumKawin &&
                    tglLahirPasanganController.text != ''
                ? tglLahirPasanganController.text.trim()
                : null,
        'spousePlaceOfBirth':
            statusPerkawinanController.text != Common.belumKawin &&
                    tempatLahirPasanganController.text != ''
                ? tempatLahirPasanganController.text.trim()
                : '',
        'ktpPath': fotoKtpDebiturUrl,
        'npwpPath': fotoNpwpDebitur != null ? fotoNpwpDebiturUrl : '',
        'ktpSelfiePath': fotoKtpSelfie != null ? fotoKtpSelfieUrl : '',
        'spouseKtpPath': statusPerkawinanController.text == Common.kawin
            ? fotoKtpPasanganUrl
            : '',
        'kkPath': fotoKartuKeluargaDebitur != null ? fotoKartuKeluargaUrl : '',
        'marriagePath': statusPerkawinanController.text == Common.kawin
            ? fotoAktaNikahPublicUrl != null
                ? fotoAktaNikahUrl
                : ''
            : '',
        'divorcePath': statusPerkawinanController.text == Common.ceraiHidup
            ? fotoAktaCeraiPublicUrl != null
                ? fotoAktaCeraiUrl
                : ''
            : '',
        'deathCertificatePath':
            statusPerkawinanController.text == Common.ceraiMati
                ? suratKematianPublicUrl != null
                    ? suratKematianUrl
                    : ''
                : '',
        'tagLocation': {
          'latLng': latLng,
          'name': alamatTinggalController.text.trim(),
        },
        'detail': detailAlamatTinggalController.text.trim(),
        'postalCode': postalCodeAlamatTinggalController.text.trim(),
        'province': provinceAlamatTinggalController.text.trim(),
        'city': cityAlamatTinggalController.text.trim(),
        'district': districtAlamatTinggalController.text.trim(),
        'village': villageAlamatTinggalController.text.trim(),
        'rt': rtAlamatTinggalController.text.isNotEmpty
            ? rtAlamatTinggalController.text.trim()
            : '',
        'rw': rwAlamatTinggalController.text.isNotEmpty
            ? rwAlamatTinggalController.text.trim()
            : '',
      };
    } else {
      return {
        'ktpNum': nomorKtpDebiturController.text.trim(),
        'npwpNum': nomorNpwpDebiturController.text.isNotEmpty
            ? nomorNpwpDebiturController.text.trim()
            : '',
        'kkNum': nomorKkDebiturController.text.trim(),
        'dateOfIssuedKTP': tglKtpTerbitController.text.trim(),
        "dateOfExpiredKTP": "12/12/2049",
        "religion":
            ReligionStringFormatter.forInput(agamaController.text.trim()),
        "lastEducation": EducationStringFormatter.forInput(
          pendidikanTerakhirController.text.trim(),
        ),
        'numberOfDependents': jumlahTanggunganController.text.isNotEmpty
            ? int.parse(jumlahTanggunganController.text.trim())
            : 0,
        'fullName': namaLengkapDebiturController.text.trim(),
        'gender': jenisKelaminController.text.trim(),
        'dateOfBirth': tglLahirDebiturController.text.trim(),
        'placeOfBirth': tempatLahirDebiturController.text.trim(),
        'motherMaiden': namaGadisIbuKandungDebiturController.text.isNotEmpty
            ? namaGadisIbuKandungDebiturController.text.trim()
            : '',
        'maritalStatus': statusPerkawinanController.text.trim(),
        'phoneNum': '+62${noHpDebiturController.text.trim()}',
        'email': emailDebiturController.text.isNotEmpty
            ? emailDebiturController.text.trim()
            : '',
        'spouseKtpNum': statusPerkawinanController.text == Common.kawin &&
                nomorKtpPasanganController.text != ''
            ? nomorKtpPasanganController.text.trim()
            : '',
        'spouseFullname': statusPerkawinanController.text == Common.kawin &&
                namaLengkapPasanganController.text != ''
            ? namaLengkapPasanganController.text.trim()
            : '',
        'spouseDateOfBirth': statusPerkawinanController.text == Common.kawin &&
                tglLahirPasanganController.text != ''
            ? tglLahirPasanganController.text.trim()
            : null,
        'spousePlaceOfBirth': statusPerkawinanController.text == Common.kawin &&
                tempatLahirPasanganController.text != ''
            ? tempatLahirPasanganController.text.trim()
            : '',
        'ktpPath': fotoKtpDebiturUrl ?? ritelInformasiDataDiri!.ktpPath!,
        'npwpPath': fotoNpwpDebiturPublicUrl != null ? fotoNpwpDebiturUrl : '',
        'ktpSelfiePath': fotoKtpSelfiePublicUrl != null ? fotoKtpSelfieUrl : '',
        'spouseKtpPath': statusPerkawinanController.text == Common.kawin
            ? fotoKtpPasanganPublicUrl != null
                ? fotoKtpPasanganUrl
                : ''
            : '',
        'kkPath':
            fotoKartuKeluargaPublicUrl != null ? fotoKartuKeluargaUrl : '',
        'marriagePath': statusPerkawinanController.text == Common.kawin
            ? fotoAktaNikahPublicUrl != null
                ? fotoAktaNikahUrl!
                : ''
            : '',
        'divorcePath': statusPerkawinanController.text == Common.ceraiHidup
            ? fotoAktaCeraiPublicUrl != null
                ? fotoAktaCeraiUrl!
                : ''
            : '',
        'deathCertificatePath':
            statusPerkawinanController.text == Common.ceraiMati
                ? suratKematianPublicUrl != null
                    ? suratKematianUrl!
                    : ''
                : '',
        'tagLocation': {
          'latLng': ritelInformasiDataDiri!.tagLocation != null &&
                  alamatTinggalController.text.trim() ==
                      ritelInformasiDataDiri!.tagLocation!.name!
              ? ritelInformasiDataDiri!.tagLocation!.latLng!
              : latLng,
          'name': alamatTinggalController.text.trim(),
        },
        'detail': detailAlamatTinggalController.text.trim(),
        'postalCode': postalCodeAlamatTinggalController.text.trim(),
        'province': provinceAlamatTinggalController.text.trim(),
        'city': cityAlamatTinggalController.text.trim(),
        'district': districtAlamatTinggalController.text.trim(),
        'village': villageAlamatTinggalController.text.trim(),
        'rt': rtAlamatTinggalController.text.isNotEmpty
            ? rtAlamatTinggalController.text.trim()
            : '',
        'rw': rwAlamatTinggalController.text.isNotEmpty
            ? rwAlamatTinggalController.text.trim()
            : '',
      };
    }
  }

  // ignore: long-method
  Future _postData(
    PipelinePeroranganAPIMethod pipelinePeroranganAPIMethod,
    bool isContinue,
  ) async {
    final dataDiriAddressMap = await _generateDataDiriAddressMap();

    switch (pipelinePeroranganAPIMethod) {
      case PipelinePeroranganAPIMethod.addDataDiri:
        final infoDataDiriMap = await _generateInfoDataDiriMap('add');

        final res = await runBusyFuture(_ritelPipelinePeroranganAPI
            .addInformasiDataDiriPari(infoDataDiriMap));

        res.fold(
          (errorMessage) {
            _showErrorDialog(errorMessage);
            notifyListeners();
          },
          (successMap) {
            pipelineId = successMap['id'] as String;

            if (!_localDBService.peroranganFlagBoxIsNotEmpty()) {
              _localDBService.storePeroranganFlag(
                {
                  'informasi_data_diri': 2,
                  'dataDiriAddress': dataDiriAddressMap,
                  'debiturName': namaLengkapDebiturController.text.trim(),
                },
              );
            } else {
              _localDBService.replacePeroranganFlag(
                {
                  'informasi_data_diri': 2,
                  'dataDiriAddress': dataDiriAddressMap,
                  'debiturName': namaLengkapDebiturController.text.trim(),
                },
              );
            }
            _showSuccessDialog(
              successMessage: 'Berhasil menambahkan informasi data diri!',
              isContinue: true,
            );
            notifyListeners();
          },
        );
        break;

      case PipelinePeroranganAPIMethod.updateDataDiri:
        final infoDataDiriMap = await _generateInfoDataDiriMap('update');

        final res = await runBusyFuture(
          _ritelPipelinePeroranganAPI.updateInformasiDataDiriPari(
            payload: infoDataDiriMap,
            id: pipelineId!,
          ),
        );

        res.fold(
          (errorMessage) {
            _showErrorDialog(errorMessage);
            notifyListeners();
          },
          (successMap) {
            if (!_localDBService.peroranganFlagBoxIsNotEmpty()) {
              _localDBService.storePeroranganFlag(
                {
                  'informasi_data_diri': 2,
                  'informasi_usaha': 1,
                  'informasi_lainnya': 1,
                  'dataDiriAddress': dataDiriAddressMap,
                  'debiturName': namaLengkapDebiturController.text.trim(),
                },
              );
            } else {
              final getPipelineFlag = _localDBService.getPeroranganFlag();
              if (getPipelineFlag!['informasi_usaha'] == 2 &&
                  getPipelineFlag['informasi_lainnya'] == 2) {
                _localDBService.replacePeroranganFlag(
                  {
                    'informasi_data_diri': 2,
                    'informasi_usaha': 2,
                    'informasi_lainnya': 2,
                    'dataDiriAddress': dataDiriAddressMap,
                    'debiturName': namaLengkapDebiturController.text.trim(),
                  },
                );
              } else if (getPipelineFlag['informasi_usaha'] == 2) {
                _localDBService.replacePeroranganFlag(
                  {
                    'informasi_data_diri': 2,
                    'informasi_usaha': 2,
                    'dataDiriAddress': dataDiriAddressMap,
                    'debiturName': namaLengkapDebiturController.text.trim(),
                  },
                );
              } else if (getPipelineFlag['informasi_lainnya'] == 2) {
                _localDBService.storePeroranganFlag(
                  {
                    'informasi_data_diri': 2,
                    'informasi_usaha': 2,
                    'informasi_lainnya': 2,
                    'dataDiriAddress': dataDiriAddressMap,
                    'debiturName': namaLengkapDebiturController.text.trim(),
                  },
                );
              } else {
                _localDBService.replacePeroranganFlag(
                  {
                    'informasi_data_diri': 2,
                    'informasi_usaha': 1,
                    'informasi_lainnya': 1,
                    'dataDiriAddress': dataDiriAddressMap,
                    'debiturName': namaLengkapDebiturController.text.trim(),
                  },
                );
              }
            }
            _showSuccessDialog(
              successMessage: 'Berhasil mengubah informasi data diri!',
              isContinue: true,
            );
            notifyListeners();
          },
        );
        break;
      case PipelinePeroranganAPIMethod.addUsaha:
        break;
      case PipelinePeroranganAPIMethod.updateUsaha:
        break;
      case PipelinePeroranganAPIMethod.addLainnya:
        break;
      case PipelinePeroranganAPIMethod.updateLainnya:
        break;
    }
  }

  Future _prepopulateImages() async {
    if (ritelInformasiDataDiri!.ktpPath != null &&
        ritelInformasiDataDiri!.ktpPath!.isNotEmpty) {
      fotoKtpDebiturPublicUrl =
          await _getPublicFile(ritelInformasiDataDiri!.ktpPath!);
      fotoKtpDebiturUrl = ritelInformasiDataDiri!.ktpPath!;
      notifyListeners();
    }

    if (ritelInformasiDataDiri!.ktpSelfiePath != null &&
        ritelInformasiDataDiri!.ktpSelfiePath!.isNotEmpty) {
      fotoKtpSelfieUrl = ritelInformasiDataDiri!.ktpSelfiePath!;
      fotoKtpSelfiePublicUrl =
          await _getPublicFile(ritelInformasiDataDiri!.ktpSelfiePath!);
      notifyListeners();
    }

    if (ritelInformasiDataDiri!.npwpPath != null &&
        ritelInformasiDataDiri!.npwpPath!.isNotEmpty) {
      fotoNpwpDebiturPublicUrl =
          await _getPublicFile(ritelInformasiDataDiri!.npwpPath!);
      fotoNpwpDebiturUrl = ritelInformasiDataDiri!.npwpPath!;
      notifyListeners();
    }

    if (ritelInformasiDataDiri!.kkPath != null &&
        ritelInformasiDataDiri!.kkPath!.isNotEmpty) {
      fotoKartuKeluargaPublicUrl =
          await _getPublicFile(ritelInformasiDataDiri!.kkPath!);
      fotoKartuKeluargaUrl = ritelInformasiDataDiri!.kkPath!;
      notifyListeners();
    }

    if (ritelInformasiDataDiri!.maritalStatus == Common.kawin &&
        ritelInformasiDataDiri!.spouseKtpPath != null &&
        ritelInformasiDataDiri!.spouseKtpPath!.isNotEmpty) {
      fotoKtpPasanganPublicUrl =
          await _getPublicFile(ritelInformasiDataDiri!.spouseKtpPath!);
      fotoKtpPasanganUrl = ritelInformasiDataDiri!.spouseKtpPath!;
      notifyListeners();
    }

    if (ritelInformasiDataDiri!.maritalStatus == Common.kawin &&
        ritelInformasiDataDiri!.marriagePath != null &&
        ritelInformasiDataDiri!.marriagePath!.isNotEmpty) {
      fotoAktaNikahPublicUrl =
          await _getPublicFile(ritelInformasiDataDiri!.marriagePath!);
      fotoAktaNikahUrl = ritelInformasiDataDiri!.marriagePath!;
      notifyListeners();
    }

    if (ritelInformasiDataDiri!.maritalStatus == Common.ceraiHidup &&
        ritelInformasiDataDiri!.divorcePath != null &&
        ritelInformasiDataDiri!.divorcePath!.isNotEmpty) {
      fotoAktaCeraiPublicUrl =
          await _getPublicFile(ritelInformasiDataDiri!.divorcePath!);
      fotoAktaCeraiUrl = ritelInformasiDataDiri!.divorcePath!;
      notifyListeners();
    }

    if (ritelInformasiDataDiri!.maritalStatus == Common.ceraiMati &&
        ritelInformasiDataDiri!.deathCertificatePath != null &&
        ritelInformasiDataDiri!.deathCertificatePath!.isNotEmpty) {
      suratKematianPublicUrl =
          await _getPublicFile(ritelInformasiDataDiri!.deathCertificatePath!);
      suratKematianUrl = ritelInformasiDataDiri!.deathCertificatePath!;
      notifyListeners();
    }
  }

  // ignore: long-method
  Future _prepopulateTextFields() async {
    nomorKtpDebiturController
      ..text = ritelInformasiDataDiri!.ktpNum!
      ..selection = TextSelection.collapsed(
        offset: nomorKtpDebiturController.text.length,
      );

    if (ritelInformasiDataDiri!.dateOfIssuedKTP != null) {
      tglKtpTerbitController.text = DateStringFormatter.forInput(
        ritelInformasiDataDiri!.dateOfIssuedKTP!,
      );
    }
    idAccountPariController
      ..text = ritelInformasiDataDiri!.idAccountPari!
      ..selection =
          TextSelection.collapsed(offset: idAccountPariController.text.length);

    nomorNpwpDebiturController
      ..text = ritelInformasiDataDiri?.npwpNum ?? ''
      ..selection = TextSelection.collapsed(
        offset: nomorNpwpDebiturController.text.length,
      );

    namaLengkapDebiturController
      ..text = ritelInformasiDataDiri!.fullName!
      ..selection = TextSelection.collapsed(
        offset: namaLengkapDebiturController.text.length,
      );

    agamaController
      ..text = ritelInformasiDataDiri?.religion != null
          ? ReligionStringFormatter.forOutput(
              ritelInformasiDataDiri?.religion ?? '',
            )
          : ''
      ..selection =
          TextSelection.collapsed(offset: agamaController.text.length);

    pendidikanTerakhirController
      ..text = ritelInformasiDataDiri?.lastEducation != null
          ? EducationStringFormatter.forOutput(
              ritelInformasiDataDiri?.lastEducation ?? '',
            )
          : ''
      ..selection = TextSelection.collapsed(
        offset: pendidikanTerakhirController.text.length,
      );

    jumlahTanggunganController
      ..text = (ritelInformasiDataDiri?.numberOfDependents ?? '').toString()
      ..selection = TextSelection.collapsed(
        offset: jumlahTanggunganController.text.length,
      );

    tempatLahirDebiturController
      ..text = ritelInformasiDataDiri?.placeOfBirth ?? ''
      ..selection = TextSelection.collapsed(
        offset: tempatLahirDebiturController.text.length,
      );

    tglLahirDebiturController.text =
        ritelInformasiDataDiri?.dateOfBirth?.date != null
            ? DateStringFormatter.forInput(
                ritelInformasiDataDiri!.dateOfBirth!.date!,
              )
            : '';

    jenisKelaminController
      ..text = ritelInformasiDataDiri?.gender ?? ''
      ..selection =
          TextSelection.collapsed(offset: jenisKelaminController.text.length);

    namaGadisIbuKandungDebiturController
      ..text = ritelInformasiDataDiri?.motherMaiden ?? ''
      ..selection = TextSelection.collapsed(
        offset: namaGadisIbuKandungDebiturController.text.length,
      );

    statusPerkawinanController
      ..text = ritelInformasiDataDiri?.maritalStatus ?? ''
      ..selection = TextSelection.collapsed(
        offset: statusPerkawinanController.text.length,
      );

    nomorKkDebiturController
      ..text = ritelInformasiDataDiri?.kkNum != null
          ? ritelInformasiDataDiri!.kkNum!
          : ''
      ..selection = TextSelection.collapsed(
        offset: nomorKkDebiturController.text.length,
      );

    if (ritelInformasiDataDiri!.tagLocation != null) {
      alamatTinggalController
        ..text = ritelInformasiDataDiri!.tagLocation!.name!
        ..selection = TextSelection.collapsed(
          offset: alamatTinggalController.text.length,
        );
    }

    detailAlamatTinggalController
      ..text = ritelInformasiDataDiri?.detail ?? ''
      ..selection = TextSelection.collapsed(
        offset: detailAlamatTinggalController.text.length,
      );

    postalCodeAlamatTinggalController
      ..text = ritelInformasiDataDiri?.postalCode ?? ''
      ..selection = TextSelection.collapsed(
        offset: postalCodeAlamatTinggalController.text.length,
      );

    provinceAlamatTinggalController
      ..text = ritelInformasiDataDiri?.province ?? ''
      ..selection = TextSelection.collapsed(
        offset: provinceAlamatTinggalController.text.length,
      );

    cityAlamatTinggalController
      ..text = ritelInformasiDataDiri?.city ?? ''
      ..selection = TextSelection.collapsed(
        offset: cityAlamatTinggalController.text.length,
      );

    districtAlamatTinggalController
      ..text = ritelInformasiDataDiri?.district ?? ''
      ..selection = TextSelection.collapsed(
        offset: districtAlamatTinggalController.text.length,
      );

    villageAlamatTinggalController
      ..text = ritelInformasiDataDiri?.village ?? ''
      ..selection = TextSelection.collapsed(
        offset: villageAlamatTinggalController.text.length,
      );

    rtAlamatTinggalController
      ..text = ritelInformasiDataDiri?.rt ?? ''
      ..selection = TextSelection.collapsed(
        offset: rtAlamatTinggalController.text.length,
      );

    rwAlamatTinggalController
      ..text = ritelInformasiDataDiri?.rw ?? ''
      ..selection = TextSelection.collapsed(
        offset: rwAlamatTinggalController.text.length,
      );

    final _splitWithout62 =
        (ritelInformasiDataDiri?.phoneNum ?? '').split('+62');
    noHpDebiturController
      ..text = _splitWithout62.length > 1 ? _splitWithout62[1] : ''
      ..selection =
          TextSelection.collapsed(offset: noHpDebiturController.text.length);

    emailDebiturController
      ..text = ritelInformasiDataDiri?.email ?? ''
      ..selection =
          TextSelection.collapsed(offset: emailDebiturController.text.length);

    if (ritelInformasiDataDiri!.maritalStatus! == Common.kawin) {
      nomorKtpPasanganController
        ..text = ritelInformasiDataDiri?.spouseKtpNum ?? ''
        ..selection = TextSelection.collapsed(
          offset: nomorKtpPasanganController.text.length,
        );

      namaLengkapPasanganController
        ..text = ritelInformasiDataDiri?.spouseFullname ?? ''
        ..selection = TextSelection.collapsed(
          offset: namaLengkapPasanganController.text.length,
        );

      tempatLahirPasanganController
        ..text = ritelInformasiDataDiri?.spousePlaceOfBirth ?? ''
        ..selection = TextSelection.collapsed(
          offset: tempatLahirPasanganController.text.length,
        );

      tglLahirPasanganController.text =
          ritelInformasiDataDiri?.spouseDateOfBirth?.date != null
              ? DateStringFormatter.forInput(
                  ritelInformasiDataDiri!.spouseDateOfBirth!.date!,
                )
              : '';
    }
  }

  void _setUploadFilesErrorTextIfAny() {
    if (fotoKtpDebiturUrl == null) {
      fotoKtpDebiturErrorText = 'Foto E-KTP harus diupload';
    }
    if (statusPerkawinanController.text == Common.kawin &&
        fotoKtpPasanganUrl == null) {
      fotoKtpPasanganErrorText = 'Foto E-KTP Pasangan harus diupload';
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
        Routes.tDPPeroranganViewPari,
        arguments: TDPPeroranganViewPariArguments(
          pipelineId: pipelineId,
          fromPipelineDetailsView: fromPipelineDetailsView,
          statusPipeline: statusPipeline,
        ),
      )!;
    } else {
      _navigationService.back(result: {
        'pipelineId': pipelineId,
      });
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

  bool _validateUploadFiles() {
    // ignore: prefer-conditional-expressions
    if (statusPerkawinanController.text == Common.kawin) {
      return fotoKtpDebiturUrl != null &&
          // fotoKtpSelfie != null &&
          fotoKtpPasanganUrl != null;
    } else {
      return fotoKtpDebiturUrl != null;
    }
  }
}

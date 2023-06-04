// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer' as dev;

import 'package:file_picker/file_picker.dart';
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
import '../../../../../../application/models/place_of_birth.dart';
import '../../../../../../application/models/ritel_informasi_data_diri.dart';
import '../../../../../../application/models/ritel_postal_code.dart';
import '../../../../../../application/services/local_db_service.dart';
import '../../../../../../application/services/media_service.dart';
import '../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../infrastructure/apis/ritel_pipeline_perorangan_api.dart';
import '../../../../../../infrastructure/apis/ritel_upload_file_api.dart';

class InformasiDataDiriViewModel extends BaseViewModel {
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
  final MaksimaMediaService _mediaService = locator<MaksimaMediaService>();

  double? _lat;

  double? _lng;

  final jenisDebiturController = TextEditingController();

  final nomorKtpDebiturController = TextEditingController();

  final tglKtpTerbitController = TextEditingController();
  final agamaController = TextEditingController();
  final pendidikanTerakhirController = TextEditingController();

  final nomorNpwpDebiturController = TextEditingController();

  final namaLengkapDebiturController = TextEditingController();

  final tempatLahirDebiturController = TextEditingController();

  final tglLahirDebiturController = TextEditingController();

  final jenisKelaminController = TextEditingController();

  final namaGadisIbuKandungDebiturController = TextEditingController();
  final statusPerkawinanController = TextEditingController();

  final nomorKKController = TextEditingController();
  final jumlahTanggunganController = TextEditingController();
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

  PlatformFile? fotoKtpDebitur;
  String? fotoKtpDebiturErrorText;
  String? fotoKtpDebiturPublicUrl;
  String? fotoKtpDebiturUrl;

  PlatformFile? suratKematian;
  String? suratKematianErrorText;
  String? suratKematianUrl;
  String? suratKematianPublicUrl;

  PlatformFile? fotoAktaNikah;
  String? fotoAktaNikahErrorText;
  String? fotoAktaNikahUrl;
  String? fotoAktaNikahPublicUrl;

  PlatformFile? fotoKtpPasangan;
  String? fotoKtpPasanganErrorText;
  String? fotoKtpPasanganUrl;
  String? fotoKtpPasanganPublicUrl;

  PlatformFile? fotoNpwpDebitur;
  String? fotoNpwpDebiturErrorText;
  String? fotoNpwpDebiturUrl;
  String? fotoNpwpDebiturPublicUrl;

  PlatformFile? fotoKartuKeluargaDebitur;
  String? fotoKartuKeluargaDebiturErrorText;
  String? fotoKartuKeluargaUrl;
  String? fotoKartuKeluargaPublicUrl;

  PlatformFile? fotoKtpSelfie;
  String? fotoKtpSelfieErrorText;
  String? fotoKtpSelfiePublicUrl;
  String? fotoKtpSelfieUrl;

  PlatformFile? fotoAktaCerai;
  String? fotoAktaCeraiErrorText;
  String? fotoAktaCeraiUrl;
  String? fotoAktaCeraiPublicUrl;

  InformasiDataDiriViewModel({
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
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingAktaCerai = true;
      notifyListeners();
      if (_isLoadingAktaCerai) {
        if (_isImageOrPdf(res.extension!)) {
          fotoAktaCerai = res;
          fotoAktaCeraiErrorText = null;
          uploadFileAktaCerai(fotoAktaCerai!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png atau pdf!');
        }
      }
    }
  }

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

  Future captureKartuKeluargaDebitur() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingKk = true;
      notifyListeners();
      if (_isLoadingKk) {
        if (_isImageOrPdf(res.extension!)) {
          fotoKartuKeluargaDebitur = res;
          fotoKartuKeluargaDebiturErrorText = null;
          uploadFileKK(fotoKartuKeluargaDebitur!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png atau pdf!');
        }
      }
    }
  }

  Future captureKtpDebitur() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingKtpDebitur = true;
      notifyListeners();
      if (_isLoadingKtpDebitur) {
        if (_isImageOrPdf(res.extension!)) {
          fotoKtpDebitur = res;
          fotoKtpDebiturErrorText = null;
          uploadFileKtpDebitur(fotoKtpDebitur!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png atau pdf!');
        }
      }
    }
  }

  Future captureKtpPasangan() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingKtpPasangan = true;
      notifyListeners();
      if (_isLoadingKtpPasangan) {
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

  Future captureKtpSelfie() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingSelfieKtp = true;
      notifyListeners();
      if (_isLoadingSelfieKtp) {
        if (_isImageOrPdf(res.extension!)) {
          fotoKtpSelfie = res;
          fotoKtpSelfieErrorText = null;
          uploadFileSelfieKtp(fotoKtpSelfie!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png atau pdf!');
        }
      }
    }
  }

  Future captureNpwpDebitur() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingNpwp = true;
      notifyListeners();
      if (_isLoadingNpwp) {
        if (_isImageOrPdf(res.extension!)) {
          fotoNpwpDebitur = res;
          fotoNpwpDebiturErrorText = null;
          uploadFileNpwp(fotoNpwpDebitur!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png atau pdf!');
        }
      }
    }
  }

  Future captureSuratKemation() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingSertiKematian = true;
      notifyListeners();
      if (_isLoadingSertiKematian) {
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
      fotoAktaCeraiPublicUrl = null;
      fotoAktaCeraiUrl = null;
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
      description: 'Anda yakin akan menghapus file E-KTP ini?',
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
      description: 'Anda yakin akan menghapus file NPWP ini?',
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

  Future getPostalCode(
    String postalCode,
  ) async {
    final res =
        await runBusyFuture(_ritelMasterAPI.getDetailByPostalCode(postalCode));

    res.fold(
      (error) => dev.log(error),
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
  List<PlaceOfBirth> _placeOfBirth = [];
  List<PlaceOfBirth> _placeOfBirthSuppouse = [];

  List<PlaceOfBirth> get placeOfbirth => _placeOfBirth;
  List<PlaceOfBirth> get placeOfbirthSuppouse => _placeOfBirthSuppouse;

  Future updatePlaceOfBirth(PlaceOfBirth placeOfBirth) async {
    tempatLahirDebiturController.text = placeOfBirth.city!.trim();
    notifyListeners();
  }

  Future getPlaceOfBirth() async {
    final res = await _ritelMasterAPI
        .getPlaceOfBirthAPI(tempatLahirDebiturController.text);

    res.fold(
      (error) {
        dev.log(error);
      },
      (result) {
        _placeOfBirth = result;
      },
    );
  }

  Future getPlaceOfBirthSuppouse() async {
    final res = await _ritelMasterAPI
        .getPlaceOfBirthAPI(tempatLahirPasanganController.text);

    res.fold(
      (error) {
        dev.log(error);
      },
      (result) {
        _placeOfBirthSuppouse = result;
      },
    );
  }

  List<PlaceOfBirth> filterPlaceOfBirth(String query) {
    return _placeOfBirth
        .where((element) => element.city!.toLowerCase().contains(query))
        .toList();
  }

  void clearPlaceOfBirth() {
    tempatLahirDebiturController.clear();
    getPlaceOfBirth();
    notifyListeners();
  }

  Future updatePlaceOfBirthSuppouse(PlaceOfBirth placeOfBirth) async {
    tempatLahirPasanganController.text = placeOfBirth.city!.trim();
    notifyListeners();
  }

  List<PlaceOfBirth> filterPlaceOfBirthSuppouse(String query) {
    return _placeOfBirthSuppouse
        .where((element) => element.city!.toLowerCase().contains(query))
        .toList();
  }

  void clearPlaceOfBirthSuppouse() {
    tempatLahirPasanganController.clear();
    getPlaceOfBirthSuppouse();
    notifyListeners();
  }

  Future initialize() async {
    setBusy(true);

    if (ritelInformasiDataDiri != null) {
      await _prepopulateTextFields();
      await _prepopulateImages();
      await getPostalCode(ritelInformasiDataDiri!.postalCode!);
    }
    await getPlaceOfBirth();
    await getPlaceOfBirthSuppouse();
    setBusy(false);
  }

  Future navigateBack() async {
    if (pipelineId != null) {
      _navigationService.back(result: {
        'pipelineId': pipelineId,
        'informasiDataDiriCompleted': 2,
      });
    } else if (_anyFieldEditedDataDiri()) {
      final response = await _dialogService.showCustomDialog(
        variant: DialogType.base,
        title: 'Edited',
        description:
            'Anda belum menyelesaikan pengisian form ini. Data-data yang sudah Anda masukkan akan hilang. Apakah Anda yakin akan membatalkan pengisian form?',
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

  void updateNomorKK(String val) => nomorKKController.value.copyWith(
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
    // districtAlamatTinggalController.clear();
    // villageAlamatTinggalController.clear();
    getPostalCode(postalCodeAlamatTinggalController.text);
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

  Future uploadFileAktaCerai(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
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

  Future uploadFileAktaNikah(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
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

  Future uploadFileKK(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
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

  Future uploadFileKtpDebitur(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
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

  Future uploadFileKtpPasangan(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
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

  Future uploadFileNpwp(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
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

  Future uploadFileSelfieKtp(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
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

  Future uploadFileSertiKematian(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
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
        'ktpNum': nomorKtpDebiturController.text.trim(),
        'dateOfIssuedKTP': tglKtpTerbitController.text.trim(),
        'dateOfExpiredKTP': '12/12/2049',
        'religion': ReligionStringFormatter.forInput(agamaController.text),
        'lastEducation': EducationStringFormatter.forInput(
          pendidikanTerakhirController.text,
        ),
        'numberOfDependents': jumlahTanggunganController.text.isNotEmpty
            ? int.parse(jumlahTanggunganController.text.trim())
            : 0,
        'npwpNum': nomorNpwpDebiturController.text.isNotEmpty
            ? nomorNpwpDebiturController.text.trim()
            : '',
        'fullName': namaLengkapDebiturController.text.trim(),
        'gender': jenisKelaminController.text.trim(),
        'dateOfBirth': tglLahirDebiturController.text.trim(),
        'placeOfBirth': tempatLahirDebiturController.text.trim(),
        'motherMaiden': namaGadisIbuKandungDebiturController.text.isNotEmpty
            ? namaGadisIbuKandungDebiturController.text.trim()
            : '',
        'maritalStatus': statusPerkawinanController.text.trim(),
        'kkNum': nomorKKController.text.isNotEmpty
            ? nomorKKController.text.trim()
            : '',
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
        'ktpPath': fotoKtpDebiturUrl ?? '',
        'npwpPath': fotoNpwpDebitur != null ? fotoNpwpDebiturUrl : '',
        'ktpSelfiePath': fotoKtpSelfieUrl != null ? fotoKtpSelfieUrl! : '',
        'spouseKtpPath': statusPerkawinanController.text == Common.kawin
            ? fotoKtpPasanganUrl
            : '',
        'kkPath': fotoKartuKeluargaDebitur != null ? fotoKartuKeluargaUrl : '',
        'marriagePath': statusPerkawinanController.text == Common.kawin
            ? fotoAktaNikah != null
                ? fotoAktaNikahUrl ?? ''
                : ''
            : '',
        'divorcePath': statusPerkawinanController.text == Common.ceraiHidup
            ? fotoAktaCeraiUrl ?? ''
            : '',
        'deathCertificatePath':
            statusPerkawinanController.text == Common.ceraiMati
                ? suratKematian != null
                    ? suratKematianUrl ?? ''
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
        'dateOfIssuedKTP': tglKtpTerbitController.text.trim(),
        'dateOfExpiredKTP': '12/12/2049',
        'religion': ReligionStringFormatter.forInput(agamaController.text),
        'lastEducation': EducationStringFormatter.forInput(
          pendidikanTerakhirController.text,
        ),
        'numberOfDependents': jumlahTanggunganController.text.isNotEmpty
            ? int.parse(jumlahTanggunganController.text.trim())
            : 0,
        'npwpNum': nomorNpwpDebiturController.text.isNotEmpty
            ? nomorNpwpDebiturController.text.trim()
            : '',
        'fullName': namaLengkapDebiturController.text.trim(),
        'gender': jenisKelaminController.text.trim(),
        'dateOfBirth': tglLahirDebiturController.text.trim(),
        'placeOfBirth': tempatLahirDebiturController.text.trim(),
        'motherMaiden': namaGadisIbuKandungDebiturController.text.isNotEmpty
            ? namaGadisIbuKandungDebiturController.text.trim()
            : '',
        'maritalStatus': statusPerkawinanController.text.trim(),
        'kkNum': nomorKKController.text.isNotEmpty
            ? nomorKKController.text.trim()
            : '',
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
        'ktpPath': fotoKtpDebiturUrl ?? '',
        'npwpPath': fotoNpwpDebiturUrl ?? '',
        'ktpSelfiePath': fotoKtpSelfieUrl ?? '',
        'spouseKtpPath': statusPerkawinanController.text == Common.kawin
            ? fotoKtpPasanganUrl ?? ''
            : '',
        'kkPath': fotoKartuKeluargaUrl ?? '',
        'marriagePath': statusPerkawinanController.text == Common.kawin
            ? fotoAktaNikahUrl != null
                ? fotoAktaNikahUrl ?? ''
                : ''
            : '',
        'divorcePath': statusPerkawinanController.text == Common.ceraiHidup
            ? fotoAktaCeraiUrl != null
                ? fotoAktaCeraiUrl ?? ''
                : ''
            : '',
        'deathCertificatePath':
            statusPerkawinanController.text == Common.ceraiMati
                ? suratKematianUrl != null
                    ? suratKematianUrl ?? ''
                    : ''
                : '',
        'tagLocation': {
          'latLng': alamatTinggalController.text.trim() ==
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

  Future _postData(
    PipelinePeroranganAPIMethod pipelinePeroranganAPIMethod,
    bool isContinue,
  ) async {
    final dataDiriAddressMap = await _generateDataDiriAddressMap();

    switch (pipelinePeroranganAPIMethod) {
      case PipelinePeroranganAPIMethod.addDataDiri:
        final infoDataDiriMap = await _generateInfoDataDiriMap('add');

        final res = await runBusyFuture(
          _ritelPipelinePeroranganAPI.addInformasiDataDiri(infoDataDiriMap),
        );

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
          _ritelPipelinePeroranganAPI.updateInformasiDataDiri(
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
    namaLengkapDebiturController
      ..text = ritelInformasiDataDiri!.fullName!
      ..selection = TextSelection.collapsed(
        offset: namaLengkapDebiturController.text.length,
      );

    nomorKtpDebiturController
      ..text = ritelInformasiDataDiri!.ktpNum!
      ..selection = TextSelection.collapsed(
        offset: nomorKtpDebiturController.text.length,
      );

    tglKtpTerbitController
      ..text = DateStringFormatter.forOutputRitelKTPTerbit(
        ritelInformasiDataDiri!.dateOfIssuedKTP!,
      )
      ..selection =
          TextSelection.collapsed(offset: tglKtpTerbitController.text.length);

    agamaController
      ..text =
          ReligionStringFormatter.forOutput(ritelInformasiDataDiri!.religion!)
      ..selection =
          TextSelection.collapsed(offset: agamaController.text.length);

    pendidikanTerakhirController
      ..text = EducationStringFormatter.forOutput(
        ritelInformasiDataDiri!.lastEducation!,
      )
      ..selection = TextSelection.collapsed(
        offset: pendidikanTerakhirController.text.length,
      );

    nomorNpwpDebiturController
      ..text = ritelInformasiDataDiri!.npwpNum!
      ..selection = TextSelection.collapsed(
        offset: nomorNpwpDebiturController.text.length,
      );

    tempatLahirDebiturController
      ..text = ritelInformasiDataDiri!.placeOfBirth!
      ..selection = TextSelection.collapsed(
        offset: tempatLahirDebiturController.text.length,
      );

    tglLahirDebiturController.text = DateStringFormatter.forInput(
      ritelInformasiDataDiri!.dateOfBirth!.date!,
    );

    jenisKelaminController
      ..text = ritelInformasiDataDiri!.gender!
      ..selection = TextSelection.collapsed(
        offset: jenisKelaminController.text.length,
      );

    namaGadisIbuKandungDebiturController
      ..text = ritelInformasiDataDiri!.motherMaiden!
      ..selection = TextSelection.collapsed(
        offset: namaGadisIbuKandungDebiturController.text.length,
      );

    statusPerkawinanController
      ..text = ritelInformasiDataDiri!.maritalStatus!
      ..selection = TextSelection.collapsed(
        offset: statusPerkawinanController.text.length,
      );

    nomorKKController
      ..text = ritelInformasiDataDiri!.kkNum!
      ..selection = TextSelection.collapsed(
        offset: nomorKKController.text.length,
      );

    jumlahTanggunganController
      ..text = ritelInformasiDataDiri!.numberOfDependents!.toString()
      ..selection = TextSelection.collapsed(
        offset: jumlahTanggunganController.text.length,
      );

    alamatTinggalController
      ..text = ritelInformasiDataDiri!.tagLocation!.name!
      ..selection = TextSelection.collapsed(
        offset: alamatTinggalController.text.length,
      );

    detailAlamatTinggalController
      ..text = ritelInformasiDataDiri!.detail!
      ..selection = TextSelection.collapsed(
        offset: detailAlamatTinggalController.text.length,
      );

    postalCodeAlamatTinggalController
      ..text = ritelInformasiDataDiri!.postalCode!
      ..selection = TextSelection.collapsed(
        offset: postalCodeAlamatTinggalController.text.length,
      );

    provinceAlamatTinggalController
      ..text = ritelInformasiDataDiri!.province!
      ..selection = TextSelection.collapsed(
        offset: provinceAlamatTinggalController.text.length,
      );

    cityAlamatTinggalController
      ..text = ritelInformasiDataDiri!.city!
      ..selection = TextSelection.collapsed(
        offset: cityAlamatTinggalController.text.length,
      );

    districtAlamatTinggalController
      ..text = ritelInformasiDataDiri!.district!
      ..selection = TextSelection.collapsed(
        offset: districtAlamatTinggalController.text.length,
      );

    villageAlamatTinggalController
      ..text = ritelInformasiDataDiri!.village!
      ..selection = TextSelection.collapsed(
        offset: villageAlamatTinggalController.text.length,
      );

    rtAlamatTinggalController
      ..text = ritelInformasiDataDiri!.rt!
      ..selection = TextSelection.collapsed(
        offset: rtAlamatTinggalController.text.length,
      );

    rwAlamatTinggalController
      ..text = ritelInformasiDataDiri!.rw!
      ..selection = TextSelection.collapsed(
        offset: rwAlamatTinggalController.text.length,
      );

    final _splitWithout62 = ritelInformasiDataDiri!.phoneNum!.split('+62');
    noHpDebiturController
      ..text = _splitWithout62[1]
      ..selection =
          TextSelection.collapsed(offset: noHpDebiturController.text.length);

    emailDebiturController
      ..text = ritelInformasiDataDiri!.email!
      ..selection =
          TextSelection.collapsed(offset: emailDebiturController.text.length);

    if (ritelInformasiDataDiri!.maritalStatus! == Common.kawin) {
      nomorKtpPasanganController
        ..text = ritelInformasiDataDiri!.spouseKtpNum!
        ..selection = TextSelection.collapsed(
          offset: nomorKtpPasanganController.text.length,
        );

      namaLengkapPasanganController
        ..text = ritelInformasiDataDiri!.spouseFullname!
        ..selection = TextSelection.collapsed(
          offset: namaLengkapPasanganController.text.length,
        );

      tempatLahirPasanganController
        ..text = ritelInformasiDataDiri!.spousePlaceOfBirth!
        ..selection = TextSelection.collapsed(
          offset: tempatLahirPasanganController.text.length,
        );

      tglLahirPasanganController.text = DateStringFormatter.forInput(
        ritelInformasiDataDiri!.spouseDateOfBirth!.date!,
      );
    }
  }

  void _setUploadFilesErrorTextIfAny() {
    if (fotoKtpDebiturPublicUrl == null) {
      fotoKtpDebiturErrorText = 'Foto E-KTP harus diupload';
    }
    if (statusPerkawinanController.text == Common.kawin &&
        fotoKtpPasanganPublicUrl == null) {
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
        Routes.tDPPeroranganViewRitel,
        arguments: TDPPeroranganViewRitelArguments(
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
    String _temp = '';
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(url),
    );

    res.fold(
      (err) => _temp = '',
      (success) => _temp = success,
    );

    return _temp;
  }

  bool _validateUploadFiles() {
    // ignore: prefer-conditional-expressions
    if (statusPerkawinanController.text == Common.kawin) {
      return fotoKtpDebiturPublicUrl != null &&
          fotoKtpPasanganPublicUrl != null;
    } else {
      return fotoKtpDebiturPublicUrl != null;
    }
  }

  bool _isImageOrPdf(String type) {
    return (type == 'pdf' || type == 'jpg' || type == 'png' || type == 'jpeg');
  }
}

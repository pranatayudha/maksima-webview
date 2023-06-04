// ignore_for_file: unused_element

import 'dart:developer' as dev;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../application/app/app.locator.dart';
import '../../../../../../application/app/app.router.dart';
import '../../../../../../application/app/constants/common.dart';
import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../application/enums/bottom_sheet_type.dart';
import '../../../../../../application/enums/dialog_type.dart';
import '../../../../../../application/enums/pipeline_perusahaan_pt_api_method.dart';
import '../../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../../application/helpers/job_code_formatter.dart';
import '../../../../../../application/models/place_of_birth.dart';
import '../../../../../../application/models/ritel_list_informasi_pengurus_pemilik_pt.dart';
import '../../../../../../application/models/ritel_postal_code.dart';
import '../../../../../../application/services/media_service.dart';
import '../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../infrastructure/apis/ritel_pipeline_perusahaan_pt_api.dart';
import '../../../../../../infrastructure/apis/ritel_upload_file_api.dart';

class InformasiPengurusPtViewModel extends BaseViewModel {
  String? pipelineId;
  RitelListPengurusPerusahaanPTModel? ritelListPengurus;
  bool fromTdpPerusahaanPtView;
  bool? fromTdpPipelineDetailsView;
  int? statusPipeline;
  int pengurusIndex = 0;

  InformasiPengurusPtViewModel({
    this.pipelineId,
    this.ritelListPengurus,
    required this.fromTdpPerusahaanPtView,
    this.fromTdpPipelineDetailsView,
    this.statusPipeline,
  });

  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final RitelUploadFileAPI _ritelUploadFileAPI = locator<RitelUploadFileAPI>();
  final RitelPipelinePerusahaanPtAPI _ritelPipelinePerusahaanPtAPI =
      locator<RitelPipelinePerusahaanPtAPI>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;

  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final formatter = NumberFormat('#,###', 'id_ID');
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();
  final MaksimaMediaService _mediaService = locator<MaksimaMediaService>();

  Future initialize() async {
    setBusy(true);
    await getListPengurusPemilikPipeline();
    if (statusPipeline == 1) {
      await _prepopulateTextFields();
      await _prepopulateImages();
      getKodePos(ritelListPengurus!.postalCode!);
    }
    await getPlaceOfBirth();
    setBusy(false);
  }

  List<RitelListPengurusPerusahaanPTModel> _ritelListPengurusPerusahaanModel =
      [];
  List<RitelListPengurusPerusahaanPTModel>
      get ritelListPengurusPerusahaanModel => _ritelListPengurusPerusahaanModel;

  Future getListPengurusPemilikPipeline() async {
    final res = await _ritelPipelinePerusahaanPtAPI
        .getListPengurusPemilikPipelineAPI(pipelineId!, 3);

    res.fold(
      (error) {
        dev.log(error);
      },
      (result) {
        final listPengurus = List<RitelListPengurusPerusahaanPTModel>.from(
          result.map(
            (i) => RitelListPengurusPerusahaanPTModel.fromJson(
              i as Map<String, dynamic>,
            ),
          ),
        );
        _ritelListPengurusPerusahaanModel = listPengurus;
      },
    );
  }

  Future updateVillage(RitelPostalCode ritelPostalCode) async {
    villageAlamatPengurusPtController.text = ritelPostalCode.village!.trim();
    notifyListeners();
  }

  List<RitelPostalCode> filterVillage(String query) {
    List<RitelPostalCode> temp = [];

    for (var i = 0; i < _ritelPostalCodeSecond.length; i++) {
      if (districtAlamatPengurusPtController.text
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

  void clearVillage() {
    villageAlamatPengurusPtController.clear();
    notifyListeners();
  }

  // =============== Group Place of Birth =============== //
  List<PlaceOfBirth> _placeOfBirth = [];

  List<PlaceOfBirth> get placeOfbirth => _placeOfBirth;

  Future updatePlaceOfBirth(PlaceOfBirth placeOfBirth) async {
    tempatLahirPengurusPtController.text = placeOfBirth.city!.trim();
    notifyListeners();
  }

  Future getPlaceOfBirth() async {
    final res = await _ritelMasterAPI.getPlaceOfBirthAPI('');

    res.fold(
      (error) {
        dev.log(error);
      },
      (result) {
        _placeOfBirth = result;
      },
    );
  }

  List<PlaceOfBirth> filterPlaceOfBirth(String query) {
    return _placeOfBirth
        .where((element) => element.city!.toLowerCase().contains(query))
        .toList();
  }

  void clearPlaceOfBirth() {
    tempatLahirPengurusPtController.clear();
    getPlaceOfBirth();
    notifyListeners();
  }

  List<RitelPostalCode> _ritelPostalCode = [];
  List<RitelPostalCode> _ritelPostalCodeSecond = [];

  List<RitelPostalCode> get ritelPostalCode => _ritelPostalCode;

  // Get api kode pos ketika field kode pos telah diisi dengan kode yang benar
  Future getKodePos(
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
        // Masuk ke controller berdasarkan jenis agunan tambahan
        _ritelPostalCode = postalCode;

        provinceAlamatPengurusPtController.text =
            _ritelPostalCode[0].province.toString();
        cityAlamatPengurusPtController.text =
            _ritelPostalCode[0].city.toString();
      },
    );
  }

  Future updatePostalCode(RitelPostalCode ritelPostalCode) async {
    provinceAlamatPengurusPtController.text = ritelPostalCode.province!;
    districtAlamatPengurusPtController.text = ritelPostalCode.district!;
    cityAlamatPengurusPtController.text = ritelPostalCode.city!;
    notifyListeners();
  }

  List<RitelPostalCode> filterPostalCode(String query) {
    return _ritelPostalCode
        .where((element) => element.postalCode!.contains(query))
        .toList();
  }

  void clearPostalCode() {
    postalCodeAlamatPengurusController.clear();
    provinceAlamatPengurusPtController.clear();
    cityAlamatPengurusPtController.clear();
    districtAlamatPengurusPtController.clear();
    villageAlamatPengurusPtController.clear();
    notifyListeners();
  }

  // ignore: long-method
  Future _prepopulateTextFields() async {
    namaPengurusPtController
      ..text = ritelListPengurus?.fullName ?? ''
      ..selection =
          TextSelection.collapsed(offset: namaPengurusPtController.text.length);

    if (ritelListPengurus?.jobCode != null) {
      posisiPengurusPtController
        ..text = JobCodeFormatter.forOutput(
          ritelListPengurus!.jobCode!,
        )
        ..selection = TextSelection.collapsed(
          offset: posisiPengurusPtController.text.length,
        );
    } else {
      posisiPengurusPtController
        ..text = JobCodeFormatter.forOutput(
          ritelListPengurus?.jobCode != null
              ? ritelListPengurus!.jobCode!
              : null,
        )
        ..selection = TextSelection.collapsed(
          offset: posisiPengurusPtController.text.length,
        );
    }

    nomorKtpPengurusPtController
      ..text = ritelListPengurus?.ktpNum ?? ''
      ..selection = TextSelection.collapsed(
        offset: nomorKtpPengurusPtController.text.length,
      );

    nomorNpwpPengurusPtController
      ..text = ritelListPengurus?.npwpNum ?? ''
      ..selection = TextSelection.collapsed(
        offset: nomorNpwpPengurusPtController.text.length,
      );

    jenisKelaminPengurusPtController
      ..text = ritelListPengurus?.gender ?? ''
      ..selection = TextSelection.collapsed(
        offset: jenisKelaminPengurusPtController.text.length,
      );

    tempatLahirPengurusPtController
      ..text = ritelListPengurus?.placeOfBirth ?? ''
      ..selection = TextSelection.collapsed(
        offset: tempatLahirPengurusPtController.text.length,
      );

    tglLahirPengurusPtController.text = ritelListPengurus?.dateOfBirth != null
        ? DateStringFormatter.forInput(
            ritelListPengurus!.dateOfBirth!,
          )
        : '';

    final splitWithout62 = ritelListPengurus?.phoneNum?.split('+62');
    noHpPengurusPtController
      ..text = splitWithout62?[1] ?? ''
      // ..text = ritelListPengurus?.phoneNum ?? ''
      ..selection =
          TextSelection.collapsed(offset: noHpPengurusPtController.text.length);

    emailPengurusPtController
      ..text = ritelListPengurus?.email ?? ''
      ..selection = TextSelection.collapsed(
        offset: emailPengurusPtController.text.length,
      );

    alamatPengurusPtController
      ..text = ritelListPengurus?.tagLocation?.name ?? ''
      ..selection = TextSelection.collapsed(
        offset: alamatPengurusPtController.text.length,
      );

    detailAlamatPengurusPtController
      ..text = ritelListPengurus?.detail ?? ''
      ..selection = TextSelection.collapsed(
        offset: detailAlamatPengurusPtController.text.length,
      );

    postalCodeAlamatPengurusController
      ..text = ritelListPengurus?.postalCode ?? ''
      ..selection = TextSelection.collapsed(
        offset: postalCodeAlamatPengurusController.text.length,
      );

    provinceAlamatPengurusPtController
      ..text = ritelListPengurus?.province ?? ''
      ..selection = TextSelection.collapsed(
        offset: provinceAlamatPengurusPtController.text.length,
      );

    cityAlamatPengurusPtController
      ..text = ritelListPengurus?.city ?? ''
      ..selection = TextSelection.collapsed(
        offset: cityAlamatPengurusPtController.text.length,
      );

    districtAlamatPengurusPtController
      ..text = ritelListPengurus?.district ?? ''
      ..selection = TextSelection.collapsed(
        offset: districtAlamatPengurusPtController.text.length,
      );

    villageAlamatPengurusPtController
      ..text = ritelListPengurus?.village ?? ''
      ..selection = TextSelection.collapsed(
        offset: villageAlamatPengurusPtController.text.length,
      );

    rtAlamatPengurusPtController
      ..text = ritelListPengurus?.rt ?? ''
      ..selection = TextSelection.collapsed(
        offset: rtAlamatPengurusPtController.text.length,
      );

    rwAlamatPengurusPtController
      ..text = ritelListPengurus?.rw ?? ''
      ..selection = TextSelection.collapsed(
        offset: rwAlamatPengurusPtController.text.length,
      );

    // shareNominalController
    //   ..text = formatter
    //       .format(double.parse(ritelListPengurus?.shareNomial?))
    //       .toString()
    //   ..selection =
    //       TextSelection.collapsed(offset: shareNominalController.text.length);
    sharePercentageController
      ..text = ritelListPengurus!.sharePercentage != null
          ? ritelListPengurus!.sharePercentage!.toString()
          : ''
      ..selection = TextSelection.collapsed(
        offset: sharePercentageController.text.length,
      );

    sharesController
      ..text = ritelListPengurus?.shares?.toString() ?? ''
      ..selection =
          TextSelection.collapsed(offset: sharesController.text.length);

    shareNominalController
      ..text = ritelListPengurus?.shareNominal != null
          ? (formatter
              .format(double.parse(
                ritelListPengurus!.shareNominal!,
              ))
              .toString())
          : ''
      ..selection =
          TextSelection.collapsed(offset: shareNominalController.text.length);
  }

  Future _prepopulateImages() async {
    if (ritelListPengurus!.ktpPath != null &&
        (ritelListPengurus!.ktpPath ?? '').isNotEmpty) {
      fotoKtpPengurusPtUrl = ritelListPengurus!.ktpPath!;
      // fotoKtpPengurusPt = await urlToFile(
      //     ritelListPengurus!.ktpPath ?? '');
      fotoKtpPengurusPtPublicUrl = await _getPublicFile(
        ritelListPengurus!.ktpPath!,
      );
      notifyListeners();
    } else {
      fotoKtpPengurusPt = null;
    }

    if (ritelListPengurus?.npwpPath != null &&
        (ritelListPengurus?.npwpPath ?? '').isNotEmpty) {
      fotoNpwpDebiturUrl = ritelListPengurus!.npwpPath!;
      // fotoNpwpDebitur = await urlToFile(
      //     ritelListPengurus!.npwpPath ?? '');
      fotoNpwpDebiturPublicUrl = await _getPublicFile(
        ritelListPengurus!.npwpPath!,
      );
      notifyListeners();
    } else {
      fotoNpwpDebitur = null;
    }
  }

  double? _lat;
  double? _lng;

  final namaPengurusPtController = TextEditingController();

  void updateNamaPengurusPt(String val) =>
      namaPengurusPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final posisiPengurusPtController = TextEditingController();

  void updatePosisiPengurusPt(String val) {
    posisiPengurusPtController.text = val;
    notifyListeners();
  }

  final nomorKtpPengurusPtController = TextEditingController();

  void updateNomorKTPpengurusPt(String val) =>
      nomorKtpPengurusPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final nomorNpwpPengurusPtController = TextEditingController();

  void updateNomorNpwpPengurusPt(String val) =>
      nomorNpwpPengurusPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final jenisKelaminPengurusPtController = TextEditingController();

  void updateJenisKelaminPengurusPt(String val) {
    jenisKelaminPengurusPtController.text = val;
    notifyListeners();
  }

  final tempatLahirPengurusPtController = TextEditingController();

  void updateTempatLahirPengurusPt(String val) =>
      tempatLahirPengurusPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final tglLahirPengurusPtController = TextEditingController();

  void updateTglLahirPengurusPt(String val) =>
      tglLahirPengurusPtController.text = val.trim();

  Future selecttglLahirPengurusPt(BuildContext context) async {
    DateTime? pickedDate = await _showingDatePicker(context);
    //ignore: unnecessary_null_comparison
    if (pickedDate != null) {
      updateTglLahirPengurusPt(
        DateFormat('dd/MM/yyyy').format(pickedDate).toString(),
      );
    }
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

  final statusPerkawinanController = TextEditingController();

  void updateMaritalStatus(String val) {
    statusPerkawinanController.text = val;
    notifyListeners();
  }

  final alamatPengurusPtController = TextEditingController();

  void updateAlamatPengurusPt(String val) =>
      alamatPengurusPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final detailAlamatPengurusPtController = TextEditingController();

  void updateDetailAlamatPengurusPt(String val) =>
      detailAlamatPengurusPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final postalCodeAlamatPengurusController = TextEditingController();

  void updatePostalCodeAlamatPengurus(String val) {
    postalCodeAlamatPengurusController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    provinceAlamatPengurusPtController.clear();
    cityAlamatPengurusPtController.clear();
    // districtAlamatPengurusPtController.clear();
    getKodePos(postalCodeAlamatPengurusController.text);
  }

  final provinceAlamatPengurusPtController = TextEditingController();

  void updateProvinceAlamatPengurusPt(String val) =>
      provinceAlamatPengurusPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final cityAlamatPengurusPtController = TextEditingController();

  void updateCityAlamatPengurusPt(String val) =>
      cityAlamatPengurusPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final districtAlamatPengurusPtController = TextEditingController();

  void clearDistrict() {
    districtAlamatPengurusPtController.clear();
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

  Future updateDistrict(RitelPostalCode ritelPostalCode) async {
    districtAlamatPengurusPtController.text = ritelPostalCode.district!.trim();
    notifyListeners();

    await getVillage(
      ritelPostalCode.postalCode!,
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

  final villageAlamatPengurusPtController = TextEditingController();

  void updateVillageAlamatPengurusPt(String val) =>
      villageAlamatPengurusPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final rtAlamatPengurusPtController = TextEditingController();

  void updateRtAlamatPengurusPt(String val) =>
      rtAlamatPengurusPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final rwAlamatPengurusPtController = TextEditingController();

  void updateRwAlamatPengurusPt(String val) =>
      rwAlamatPengurusPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final sharePercentageController = TextEditingController();

  void updateSharePercentage(String val) =>
      sharePercentageController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final sharesController = TextEditingController();

  void updateShares(String val) => sharesController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final noHpPengurusPtController = TextEditingController();

  void updateNoHpPengurusPt(String val) =>
      noHpPengurusPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final shareNominalController = TextEditingController();

  void updateShareNominal(String val) => shareNominalController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final emailPengurusPtController = TextEditingController();

  void updateEmailPengurusPt(String val) =>
      emailPengurusPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  bool _isLoadingKtpPengurusPt = false;

  bool get isLoadingKtpPengurusPt => _isLoadingKtpPengurusPt;
  bool _isLoadingNpwp = false;

  bool get isLoadingNpwp => _isLoadingNpwp;

  PlatformFile? fotoKtpPengurusPt;
  String? fotoKtpPengurusPtErrorText;
  String? fotoKtpPengurusPtUrl;
  String? fotoKtpPengurusPtPublicUrl;

  Future captureKtpPengurusPt() async {
    final res = await _mediaService.getMultiFileType();
    if (res != null) {
      _isLoadingKtpPengurusPt = true;
      notifyListeners();
      if (_isLoadingKtpPengurusPt) {
        if (_isImageOrPdf(res.extension!)) {
          fotoKtpPengurusPt = res;
          fotoKtpPengurusPtErrorText = null;
          uploadFileKtpPengurusPt(fotoKtpPengurusPt!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png, atau pdf!');
        }
      }
    }
  }

  Future clearKtpPengurusPt() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus Foto',
      description: 'Anda yakin akan menghapus foto E-KTP pengurus ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoKtpPengurusPt = null;
      fotoKtpPengurusPtUrl = null;
      fotoKtpPengurusPtPublicUrl = null;
      notifyListeners();
    }
  }

  PlatformFile? fotoNpwpDebitur;
  String? fotoNpwpDebiturErrorText;
  String? fotoNpwpDebiturUrl;
  String? fotoNpwpDebiturPublicUrl;

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
              'File yang diperbolehkan hanya jpg, jpeg, png, atau pdf!');
        }
      }
    }
  }

  Future clearNpwp() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus Foto',
      description: 'Anda yakin akan menghapus foto NPWP debitur ini?',
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

  Future navigateToAddressSelectionViewPengurusPt() async {
    _navigationService
        .navigateTo(Routes.addressSelectionView)!
        .then((chosenPlace) {
      if (chosenPlace != null) {
        alamatPengurusPtController.text = chosenPlace['address'] as String;
        _lat = chosenPlace['lat'] as double;
        _lng = chosenPlace['lng'] as double;
      }
    });
  }

  bool _anyFieldEditedDataDiri() {
    return (namaPengurusPtController.text.isNotEmpty ||
        posisiPengurusPtController.text.isNotEmpty ||
        nomorKtpPengurusPtController.text.isNotEmpty ||
        nomorNpwpPengurusPtController.text.isNotEmpty ||
        jenisKelaminPengurusPtController.text.isNotEmpty ||
        tglLahirPengurusPtController.text.isNotEmpty ||
        alamatPengurusPtController.text.isNotEmpty ||
        detailAlamatPengurusPtController.text.isNotEmpty ||
        postalCodeAlamatPengurusController.text.isNotEmpty ||
        provinceAlamatPengurusPtController.text.isNotEmpty ||
        cityAlamatPengurusPtController.text.isNotEmpty ||
        districtAlamatPengurusPtController.text.isNotEmpty ||
        villageAlamatPengurusPtController.text.isNotEmpty ||
        rtAlamatPengurusPtController.text.isNotEmpty ||
        rwAlamatPengurusPtController.text.isNotEmpty ||
        noHpPengurusPtController.text.isNotEmpty ||
        emailPengurusPtController.text.isNotEmpty);
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

  Future<Map<String, dynamic>> _generateInformasiPengurusPtMap() async {
    var latLng = '${_lat.toString()}, ${_lng.toString()}';

    return {
      // 'id': int.parse(ritelInformasiPengurusPt![pengurusIndex].id!),
      'pt_pipelinesId': int.parse(pipelineId!),
      'jobCode': JobCodeFormatter.forInput(posisiPengurusPtController.text),
      'gender': jenisKelaminPengurusPtController.text.trim(),
      'placeOfBirth': tempatLahirPengurusPtController.text.trim(),
      'fullName': namaPengurusPtController.text.trim(),
      'ktpNum': nomorKtpPengurusPtController.text.trim(),
      'npwpNum': nomorNpwpPengurusPtController.text.isNotEmpty
          ? nomorNpwpPengurusPtController.text.trim()
          : '',
      'dateOfBirth': tglLahirPengurusPtController.text.trim(),
      'tagLocation': ritelListPengurus != null
          ? alamatPengurusPtController.text.trim() ==
                  ritelListPengurus!.tagLocation!.name!
              ? ritelListPengurus!.tagLocation!
              : {
                  'latLng': latLng,
                  'name': alamatPengurusPtController.text.trim(),
                }
          : {
              'latLng': latLng,
              'name': alamatPengurusPtController.text.trim(),
            },
      'detail': detailAlamatPengurusPtController.text.trim(),
      'postalCode': postalCodeAlamatPengurusController.text.trim(),
      'province': provinceAlamatPengurusPtController.text.trim(),
      'city': cityAlamatPengurusPtController.text.trim(),
      'district': districtAlamatPengurusPtController.text.trim(),
      'village': villageAlamatPengurusPtController.text.trim(),
      'rt': rtAlamatPengurusPtController.text.isNotEmpty
          ? rtAlamatPengurusPtController.text.trim()
          : '',
      'rw': rwAlamatPengurusPtController.text.isNotEmpty
          ? rwAlamatPengurusPtController.text.trim()
          : '',
      'phoneNum': '+62${noHpPengurusPtController.text.trim()}',
      'email': emailPengurusPtController.text.isNotEmpty
          ? emailPengurusPtController.text.trim()
          : '',
      'sharePercentage': sharePercentageController.text.trim(),
      'shares': sharesController.text.trim(),
      'shareNominal': shareNominalController.text.isEmpty
          ? 0
          : _removeThousandsSeparator(shareNominalController.text),
      'ktpPath': fotoKtpPengurusPtUrl,
      'npwpPath': fotoNpwpDebiturUrl ?? '',
    };
  }

  int _removeThousandsSeparator(String text) {
    final removedThousandsSeparator = text.split('.').join();
    // ignore: newline-before-return
    return int.parse(removedThousandsSeparator);
  }

  Future savePengurusList() async {
    final response = await locator<BottomSheetService>().showCustomSheet(
      variant: BottomSheetType.confirmation,
      data: {
        'title': 'Konfirmasi',
        'firstLine':
            'Apakah Anda sudah memasukkan seluruh pengurus sesuai Dokumen Legalitas?',
        'negativeButtonText': 'BELUM',
      },
    );
    if (response!.confirmed) {
      final res = await runBusyFuture(
        _ritelPipelinePerusahaanPtAPI.savePengurusPipelinePT(pipelineId!),
      );

      res.fold(
        (errorMessage) {
          _showErrorDialog(errorMessage);
          notifyListeners();
        },
        (successMap) {
          _showSuccessDialog(
            successMessage: successMap,
            isContinue: true,
          );
          notifyListeners();
        },
      );
    }
  }

  Future _postData(
    PipelinePerusahaanPtAPIMethod pipelinePerusahaanPtAPIMethod,
    bool isContinue,
  ) async {
    final informasiPengurusPtMap = await _generateInformasiPengurusPtMap();
    switch (pipelinePerusahaanPtAPIMethod) {
      case PipelinePerusahaanPtAPIMethod.addInformasiPerusahaanPt:
        break;
      case PipelinePerusahaanPtAPIMethod.updateInformasiPerusahaanPt:
        break;
      case PipelinePerusahaanPtAPIMethod.addPengurusPt:
        final res = await runBusyFuture(_ritelPipelinePerusahaanPtAPI
            .addInformasiPengurusPt(informasiPengurusPtMap));

        res.fold(
          (errorMessage) {
            _showErrorDialog(errorMessage);
            notifyListeners();
          },
          (successMap) {
            _showSuccessDialog(
              successMessage: 'Berhasil menambahkan informasi pengurus PT!',
              isContinue: false,
            );

            notifyListeners();
          },
        );
        break;
      case PipelinePerusahaanPtAPIMethod.updatePengurusPt:
        final res = await runBusyFuture(
          _ritelPipelinePerusahaanPtAPI.updateInformasiPengurusPt(
            informasiPengurusPtMap,
            (ritelListPengurus!.id!),
          ),
        );

        res.fold(
          (errorMessage) {
            _showErrorDialog(errorMessage);
            notifyListeners();
          },
          (successMap) {
            _showSuccessDialog(
              successMessage: 'Berhasil mengubah informasi pengurus PT!',
              isContinue: false,
            );
            notifyListeners();
          },
        );
        break;
      case PipelinePerusahaanPtAPIMethod.addLainnya:
        break;
      case PipelinePerusahaanPtAPIMethod.updateLainnya:
        break;
    }
  }

  Future validateInputs(
    PipelinePerusahaanPtAPIMethod pipelinePerusahaanPtAPIMethod, {
    bool isContinue = false,
  }) async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.confirmation,
      data: {'title': 'Konfirmasi'},
    );

    if (response != null && response.confirmed) {
      _postData(pipelinePerusahaanPtAPIMethod, isContinue);
    }
  }

  void _setUploadFilesErrorTextIfAny() {
    if (fotoKtpPengurusPt == null) {
      fotoKtpPengurusPtErrorText = 'Foto E-KTP harus diupload';
    }
    if (statusPerkawinanController.text == Common.kawin &&
        fotoNpwpDebitur == null) {
      fotoNpwpDebiturErrorText = 'Foto E-KTP Pasangan harus diupload';
    }
  }

  Future uploadFileKtpPengurusPt(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingKtpPengurusPt = false;
        fotoKtpPengurusPtUrl = url;
        fotoKtpPengurusPtPublicUrl = await _getPublicFile(url);
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

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Gagal',
      description: errorMessage,
      mainButtonTitle: 'COBA LAGI',
    );
  }

  Future navigateBack() async {
    if (_anyFieldEditedDataDiri()) {
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
        Routes.tDPPerusahaanPtViewRitel,
        arguments: TDPPerusahaanPtViewRitelArguments(
          pipelineId: pipelineId,
          fromPipelineDetailsView: fromTdpPipelineDetailsView,
          statusPipeline: statusPipeline,
        ),
      )!;
    } else {
      _navigationService.navigateTo(
        Routes.informasiPengurusPemilikBoardView,
        arguments: InformasiPengurusPemilikBoardViewArguments(
          pipelineId: pipelineId,
        ),
      );
    }
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

  // Sprint 16
  Future buttonSaveOrBack() async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.confirmation,
      description:
          'Apakah Anda sudah memasukkan seluruh pengurus sesuai Dokumen Legalitas?',
      data: {
        'title': 'Konfirmasi',
      },
    );
  }

  Future navigateToFormPengurusPT() async {
    _navigationService.navigateTo(
      Routes.informasiPengurusPtView,
      arguments: InformasiPengurusPtViewArguments(
        pipelineId: pipelineId,
        fromTdpPerusahaanPtView: true,
      ),
    );
  }

  Future menuPerusahaanPT() async {
    _navigationService.navigateTo(
      Routes.tDPPerusahaanPtViewRitel,
      arguments: TDPPerusahaanPtViewRitelArguments(
        pipelineId: pipelineId,
        stepperPengurus: 1,
      ),
    );
  }

  Future menuPerusahaanPTNotUpdate() async {
    _navigationService.navigateTo(
      Routes.tDPPerusahaanPtViewRitel,
      arguments: TDPPerusahaanPtViewRitelArguments(
        pipelineId: pipelineId,
        stepperPengurus: 0,
      ),
    );
  }

  Future navigateToFormPengurusPTFromComponent() async {
    _navigationService.navigateTo(
      Routes.informasiPengurusPtView,
      arguments: InformasiPengurusPtViewArguments(
        pipelineId: pipelineId,
        fromTdpPerusahaanPtView: true,
        statusPipeline: 1,
      ),
    );
  }

  bool _isImageOrPdf(String type) {
    type = type.toLowerCase();
    return (type == 'pdf' || type == 'jpg' || type == 'png' || type == 'jpeg');
  }
}

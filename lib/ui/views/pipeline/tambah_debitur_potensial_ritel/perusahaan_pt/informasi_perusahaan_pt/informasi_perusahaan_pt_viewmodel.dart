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
import '../../../../../../application/models/economy_sector_ritel.dart';
import '../../../../../../application/models/economy_sub_sector_ritel.dart';
import '../../../../../../application/models/ritel_informasi_perusahaan_pt.dart';
import '../../../../../../application/models/ritel_postal_code.dart';
import '../../../../../../application/services/local_db_service.dart';
import '../../../../../../application/services/media_service.dart';
import '../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../infrastructure/apis/ritel_pipeline_perusahaan_pt_api.dart';
import '../../../../../../infrastructure/apis/ritel_upload_file_api.dart';

class InformasiPerusahaanPtViewModel extends BaseViewModel {
  String? pipelineId;
  RitelInformasiPerusahaanPt? ritelInformasiPerusahaanPt;
  bool fromTdpPeroranganView;
  bool? fromPipelineDetailsView;
  int? statusPipeline;

  InformasiPerusahaanPtViewModel({
    this.pipelineId,
    this.ritelInformasiPerusahaanPt,
    required this.fromTdpPeroranganView,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  });

  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final RitelUploadFileAPI _ritelUploadFileAPI = locator<RitelUploadFileAPI>();
  final RitelPipelinePerusahaanPtAPI _ritelPipelinePerusahaanPtAPI =
      locator<RitelPipelinePerusahaanPtAPI>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final MaksimaMediaService _mediaService = locator<MaksimaMediaService>();

  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();
  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();

  Future initialize() async {
    setBusy(true);
    await getEconomySector();
    if (ritelInformasiPerusahaanPt != null) {
      // print(
      //     '${ritelInformasiPerusahaanPt!.deedEstPath}, ${ritelInformasiPerusahaanPt!.latestDeedPath}');
      _valueAktaPerubahaan = ritelInformasiPerusahaanPt!.dateOfDeedEst ==
                  ritelInformasiPerusahaanPt!.latestDateOfDeed &&
              ritelInformasiPerusahaanPt!.deedEstNum ==
                  ritelInformasiPerusahaanPt!.latestDeedNum
          ? true
          : false;
      await _prepopulateTextFields();
      await _prepopulateImages();
      if (ritelInformasiPerusahaanPt!.postalCode!.isNotEmpty) {
        getDetailByPostalCode(ritelInformasiPerusahaanPt!.postalCode!);
      }
    }

    setBusy(false);
  }

  Future updateVillage(RitelPostalCode ritelPostalCode) async {
    villageAlamatPerusahaanPtController.text = ritelPostalCode.village!.trim();
    notifyListeners();
  }

  List<RitelPostalCode> filterVillage(String query) {
    List<RitelPostalCode> temp = [];

    for (var i = 0; i < _ritelPostalCodeSecond.length; i++) {
      if (districtAlamatPerusahaanPtController.text
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
    villageAlamatPerusahaanPtController.clear();
    notifyListeners();
  }

  List<RitelPostalCode> _ritelPostalCode = [];
  List<RitelPostalCode> _ritelPostalCodeSecond = [];

  List<RitelPostalCode> get ritelPostalCode => _ritelPostalCode;

  Future getDetailByPostalCode(
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
        provinceAlamatPerusahaanController.text =
            _ritelPostalCode[0].province.toString();
        cityAlamatPerusahaanController.text =
            _ritelPostalCode[0].city.toString();
      },
    );
  }

  Future updatePostalCode(RitelPostalCode ritelPostalCode) async {
    provinceAlamatPerusahaanController.text = ritelPostalCode.province!;
    cityAlamatPerusahaanController.text = ritelPostalCode.city!;
    districtAlamatPerusahaanPtController.text = ritelPostalCode.district!;
    notifyListeners();
  }

  List<RitelPostalCode> filterPostalCode(String query) {
    return _ritelPostalCode
        .where((element) => element.postalCode!.contains(query))
        .toList();
  }

  void clearPostalCode() {
    postalCodeAlamatPerusahaanPtController.clear();
    provinceAlamatPerusahaanController.clear();
    cityAlamatPerusahaanController.clear();
    districtAlamatPerusahaanPtController.clear();
    villageAlamatPerusahaanPtController.clear();
    notifyListeners();
  }

  // ignore: long-method
  Future _prepopulateTextFields() async {
    latlangNew = ritelInformasiPerusahaanPt!.tagLocation!.latLng;
    namaPerusahaanPtController
      ..text = ritelInformasiPerusahaanPt!.companyName!
      ..selection = TextSelection.collapsed(
        offset: namaPerusahaanPtController.text.length,
      );

    final splitWithoutPT =
        ritelInformasiPerusahaanPt!.companyName!.split('PT. ');
    namaPerusahaanPtController
      ..text = splitWithoutPT[1]
      ..selection =
          TextSelection.collapsed(offset: noHpPicController.text.length);

    nomorNpwpPerusahaanPtController
      ..text = ritelInformasiPerusahaanPt!.companyNpwpNum!
      ..selection = TextSelection.collapsed(
        offset: nomorNpwpPerusahaanPtController.text.length,
      );

    sektorController
      ..text = ritelInformasiPerusahaanPt!.economySectorsName!
      ..selection =
          TextSelection.collapsed(offset: sektorController.text.length);

    subSektorController
      ..text = ritelInformasiPerusahaanPt!.economySubSectorsName!
      ..selection =
          TextSelection.collapsed(offset: subSektorController.text.length);

    alamatPerushaanPtController
      ..text = ritelInformasiPerusahaanPt!.tagLocation!.name!
      ..selection = TextSelection.collapsed(
        offset: alamatPerushaanPtController.text.length,
      );

    detailAlamatPerusahaanController
      ..text = ritelInformasiPerusahaanPt!.detail!
      ..selection = TextSelection.collapsed(
        offset: detailAlamatPerusahaanController.text.length,
      );

    postalCodeAlamatPerusahaanPtController
      ..text = ritelInformasiPerusahaanPt!.postalCode!
      ..selection = TextSelection.collapsed(
        offset: postalCodeAlamatPerusahaanPtController.text.length,
      );

    districtAlamatPerusahaanPtController
      ..text = ritelInformasiPerusahaanPt!.district!
      ..selection = TextSelection.collapsed(
        offset: districtAlamatPerusahaanPtController.text.length,
      );

    villageAlamatPerusahaanPtController
      ..text = ritelInformasiPerusahaanPt!.village!
      ..selection = TextSelection.collapsed(
        offset: villageAlamatPerusahaanPtController.text.length,
      );

    rtAlamatPerusahaanPtController
      ..text = ritelInformasiPerusahaanPt!.rt!
      ..selection = TextSelection.collapsed(
        offset: rtAlamatPerusahaanPtController.text.length,
      );

    rwAlamatPerusahaanPtController
      ..text = ritelInformasiPerusahaanPt!.rw!
      ..selection = TextSelection.collapsed(
        offset: rwAlamatPerusahaanPtController.text.length,
      );

    tglAktaPendirianPtController.text = DateStringFormatter.forInput(
      ritelInformasiPerusahaanPt!.dateOfDeedEst!.date!,
    );

    nomorAktaPendirianController
      ..text = ritelInformasiPerusahaanPt!.deedEstNum!
      ..selection = TextSelection.collapsed(
        offset: nomorAktaPendirianController.text.length,
      );

    detailTempatAktaPendirianPerusahaanController
      ..text = ritelInformasiPerusahaanPt!.placeOfDeedEst!
      ..selection = TextSelection.collapsed(
        offset: detailTempatAktaPendirianPerusahaanController.text.length,
      );

    tglSKkumhamPendirianPtController.text =
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
      ..text = ritelInformasiPerusahaanPt!.latestPlaceOfDeed!
      ..selection = TextSelection.collapsed(
        offset: detailTempatAktaPerubahanTerakhirController.text.length,
      );

    tglSKkumhamPerubahanTerakhirController.text =
        ritelInformasiPerusahaanPt!.latestDateOfSkKumham != null
            ? DateStringFormatter.forInput(
                ritelInformasiPerusahaanPt!.latestDateOfSkKumham!.date!,
              )
            : '';

    nomorSKkumhamPerubahanTerakhirController
      ..text = ritelInformasiPerusahaanPt!.latestSkKumhamNum!
      ..selection = TextSelection.collapsed(
        offset: nomorSKkumhamPerubahanTerakhirController.text.length,
      );

    namaLengkapPicController
      ..text = ritelInformasiPerusahaanPt!.fullnamePIC!
      ..selection =
          TextSelection.collapsed(offset: namaLengkapPicController.text.length);

    final splitWithout62 =
        ritelInformasiPerusahaanPt!.phoneNumPIC!.split('+62');
    noHpPicController
      ..text = splitWithout62[1]
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
      fotoNpwpPerusahaanPtUrl = ritelInformasiPerusahaanPt!.companyNpwpPath!;
      fotoNpwpPerusahaanPtPublicUrl =
          await _getPublicFile(ritelInformasiPerusahaanPt!.companyNpwpPath!);
      notifyListeners();
    }

    if (ritelInformasiPerusahaanPt!.deedEstPath != null &&
        ritelInformasiPerusahaanPt!.deedEstPath!.isNotEmpty) {
      fotoAktaPendirianUrl = ritelInformasiPerusahaanPt!.deedEstPath!;
      fotoAktaPendirianPublicUrl =
          await _getPublicFile(ritelInformasiPerusahaanPt!.deedEstPath!);
      notifyListeners();
    }

    if (ritelInformasiPerusahaanPt!.latestDeedPath != null &&
        ritelInformasiPerusahaanPt!.latestDeedPath!.isNotEmpty) {
      fotoAktaPerubahaanTerakhirUrl =
          ritelInformasiPerusahaanPt!.latestDeedPath!;
      fotoAktaPerubahaanTerakhirPublicUrl =
          await _getPublicFile(ritelInformasiPerusahaanPt!.latestDeedPath!);

      notifyListeners();
    }

    if (ritelInformasiPerusahaanPt!.skKumhamPath != null &&
        ritelInformasiPerusahaanPt!.skKumhamPath!.isNotEmpty) {
      fotosKkumhamPendirianUrl = ritelInformasiPerusahaanPt!.skKumhamPath!;
      fotosKkumhamPendirianPublicUrl =
          await _getPublicFile(ritelInformasiPerusahaanPt!.skKumhamPath!);
      notifyListeners();
    }
    if (ritelInformasiPerusahaanPt!.latestSkKumhamPath != null &&
        ritelInformasiPerusahaanPt!.latestSkKumhamPath!.isNotEmpty) {
      fotosKkumhamPerubahaanTerakhirUrl =
          ritelInformasiPerusahaanPt!.latestSkKumhamPath!;
      fotosKkumhamPerubahaanTerakhirPublicUrl =
          await _getPublicFile(ritelInformasiPerusahaanPt!.latestSkKumhamPath!);
      notifyListeners();
    }
  }

  double? _lat;
  double? _lng;
  String? latlangNew;

  final jenisDebiturController = TextEditingController();

  final namaPerusahaanPtController = TextEditingController();

  void updateNamaPerusahaanPt(String val) =>
      namaPerusahaanPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final nomorNpwpPerusahaanPtController = TextEditingController();

  void updateNomorNpwpPerusahaanPt(String val) =>
      nomorNpwpPerusahaanPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final sektorController = TextEditingController();

  final subSektorController = TextEditingController();

  final alamatPerushaanPtController = TextEditingController();

  void updateAlamatPerusahaanPt(String val) =>
      alamatPerushaanPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final detailAlamatPerusahaanController = TextEditingController();

  void updateDetailAlamatPerusahaanPt(String val) =>
      detailAlamatPerusahaanController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final postalCodeAlamatPerusahaanPtController = TextEditingController();

  void updatePostalCodePerusahaanPtTinggal(String val) {
    postalCodeAlamatPerusahaanPtController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    provinceAlamatPerusahaanController.clear();
    cityAlamatPerusahaanController.clear();
    // districtAlamatPerusahaanPtController.clear();
    // villageAlamatPerusahaanPtController.clear();
    getDetailByPostalCode(postalCodeAlamatPerusahaanPtController.text);
  }

  final districtAlamatPerusahaanPtController = TextEditingController();

  void clearDistrict() {
    districtAlamatPerusahaanPtController.clear();
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

    // return _ritelPostalCode
    //     .where((element) => element.district!.toLowerCase().contains(query))
    //     .toList();
  }

  Future updateDistrict(RitelPostalCode ritelPostalCode) async {
    districtAlamatPerusahaanPtController.text =
        ritelPostalCode.district!.trim();
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

  final villageAlamatPerusahaanPtController = TextEditingController();

  void updateVillageAlamatPerusahaanPt(String val) =>
      villageAlamatPerusahaanPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final rtAlamatPerusahaanPtController = TextEditingController();

  void updateRtAlamatPerusahaanPt(String val) =>
      rtAlamatPerusahaanPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final rwAlamatPerusahaanPtController = TextEditingController();

  void updateRwAlamatPerusahaan(String val) =>
      rwAlamatPerusahaanPtController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final tglAktaPendirianPtController = TextEditingController();

  void updateTglAktaPendirianPt(String val) {
    tglAktaPendirianPtController.text = val.trim();
  }

  Future selecttglAktaPendirianPt(BuildContext context) async {
    DateTime? pickedDate = await _showingDatePicker(context);
    //ignore: unnecessary_null_comparison
    if (pickedDate != null) {
      updateTglAktaPendirianPt(
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

  final nomorAktaPendirianController = TextEditingController();

  void updateNomorAktaPendirian(String val) =>
      nomorAktaPendirianController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final detailTempatAktaPendirianPerusahaanController = TextEditingController();

  void updateDetailTempatAktaPendirianPerusahaan(String val) =>
      detailTempatAktaPendirianPerusahaanController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final nomorSKkumhamPendirianController = TextEditingController();

  void updateNomorSKkumhamPendirian(String val) =>
      nomorSKkumhamPendirianController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final nomorSKkumhamPerubahanTerakhirController = TextEditingController();

  void updateNomorSKkumhamPerubahanTerakhir(String val) =>
      nomorSKkumhamPerubahanTerakhirController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final nomorAktaPerubahanTerakhirController = TextEditingController();

  void updateNomorAktaPerubahanTerakhir(String val) =>
      nomorAktaPerubahanTerakhirController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final tglAktaPerubahanTerakhirController = TextEditingController();

  void updatetglAktaPerubahanTerakhir(String val) =>
      tglAktaPerubahanTerakhirController.text = val.trim();

  Future selecttglAktaPerubahanTerakhir(BuildContext context) async {
    DateTime? pickedDate = await _showingDatePicker(context);
    //ignore: unnecessary_null_comparison
    if (pickedDate != null) {
      updatetglAktaPerubahanTerakhir(
        DateFormat('dd/MM/yyyy').format(pickedDate).toString(),
      );
    }
  }

  final tglSKkumhamPendirianPtController = TextEditingController();

  void updateTglSKkumhamPendirianPt(String val) {
    tglSKkumhamPendirianPtController.text = val.trim();
  }

  Future selecttglSKKumhamPendirianPt(BuildContext context) async {
    DateTime? pickedDate = await _showingDatePicker(context);
    //ignore: unnecessary_null_comparison
    if (pickedDate != null) {
      updateTglSKkumhamPendirianPt(
        DateFormat('dd/MM/yyyy').format(pickedDate).toString(),
      );
    }
  }

  final tglSKkumhamPerubahanTerakhirController = TextEditingController();

  void updateTglSKkumhamPerubahanTerakhir(String val) =>
      tglSKkumhamPerubahanTerakhirController.text = val.trim();

  Future selecttglSKkumhamPerubahanTerakhir(BuildContext context) async {
    DateTime? pickedDate = await _showingDatePicker(context);
    // ignore: unnecessary_null_comparison
    if (pickedDate != null) {
      updateTglSKkumhamPerubahanTerakhir(
        DateFormat('dd/MM/yyyy').format(pickedDate).toString(),
      );
    }
  }

  final detailAddressController = TextEditingController();

  void updateDetailAddress(String val) =>
      detailAddressController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final addressController = TextEditingController();

  void updateAddress(String val) => addressController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final namaLengkapPicController = TextEditingController();

  void updateNamaLengkapPic(String val) =>
      namaLengkapPicController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final tempatLahirDebiturController = TextEditingController();

  void updateTempatLahirDebitur(String val) =>
      tempatLahirDebiturController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final detailTempatAktaPerubahanTerakhirController = TextEditingController();

  void updateDetailTempatAktaPerubahanTerakhir(String val) =>
      detailTempatAktaPerubahanTerakhirController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final provinceAlamatPerusahaanController = TextEditingController();

  void updateProvinceAlamatPerusahaan(String val) =>
      provinceAlamatPerusahaanController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final cityAlamatPerusahaanController = TextEditingController();

  void updateCityAlamatPerusahaan(String val) =>
      cityAlamatPerusahaanController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final noHpPicController = TextEditingController();

  void updateNoHpPic(String val) => noHpPicController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final emailPicController = TextEditingController();

  void updateEmailPic(String val) => emailPicController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  bool _valueAktaPerubahaan = false;
  bool get valueAktaPerubahaan => _valueAktaPerubahaan;

  void updateFunction(bool value) {
    _valueAktaPerubahaan = value;
    notifyListeners();

    if (_valueAktaPerubahaan) {
      tglAktaPerubahanTerakhirController
        ..text = tglAktaPendirianPtController.text
        ..selection = TextSelection.collapsed(
          offset: tglAktaPendirianPtController.text.length,
        );

      nomorAktaPerubahanTerakhirController
        ..text = nomorAktaPendirianController.text
        ..selection = TextSelection.collapsed(
          offset: nomorAktaPendirianController.text.length,
        );

      detailTempatAktaPerubahanTerakhirController
        ..text = detailTempatAktaPendirianPerusahaanController.text
        ..selection = TextSelection.collapsed(
          offset: detailTempatAktaPendirianPerusahaanController.text.length,
        );
    } else {
      tglAktaPerubahanTerakhirController.clear();
      nomorAktaPerubahanTerakhirController.clear();
      detailTempatAktaPerubahanTerakhirController.clear();
    }
  }

  bool _isLoadingSelfieKtp = false;

  bool get isLoadingSelfieKtp => _isLoadingSelfieKtp;

  bool _isLoadingNpwp = false;

  bool get isLoadingNpwp => _isLoadingNpwp;

  bool _isLoadingAktaPendirian = false;

  bool get isLoadingAktaPendirian => _isLoadingAktaPendirian;

  bool _isLoadingAktaPerubahaanTerakhir = false;

  bool get isLoadingAktaPerubahaanTerakhir => _isLoadingAktaPerubahaanTerakhir;

  bool _isLoadingsKkumhamPendirian = false;

  bool get isLoadingsKkumhamPendirian => _isLoadingsKkumhamPendirian;

  bool _isLoadingsKkumhamPerubahaanTerakhir = false;

  bool get isLoadingsKkumhamPerubahaanTerakhir =>
      _isLoadingsKkumhamPerubahaanTerakhir;

  bool _isLoadingKtpPasangan = false;

  bool get isLoadingKtpPasangan => _isLoadingKtpPasangan;
  bool _isLoadingAktaNikah = false;

  bool get isLoadingAktaNikah => _isLoadingAktaNikah;
  bool _isLoadingAktaCerai = false;

  bool get isLoadingAktaCerai => _isLoadingAktaCerai;

  PlatformFile? fotoAktaNikah;
  String? fotoAktaNikahErrorText;
  String? fotoAktaNikahUrl;
  String? fotoAktaNikahPublicUrl;

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
              'File yang diperbolehkan hanya jpg, jpeg, png, atau pdf!');
        }
      }
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
      notifyListeners();
    }
  }

  PlatformFile? fotoKtpPasangan;
  String? fotoKtpPasanganErrorText;
  String? fotoKtpPasanganUrl;
  String? fotoKtpPasanganPublicUrl;

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
              'File yang diperbolehkan hanya jpg, jpeg, png, atau pdf!');
        }
      }
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
      notifyListeners();
    }
  }

  /////////////////////////////////////////////////////////////////////////////

  PlatformFile? fotoNpwpPerusahaanPt;
  String? fotoNpwpPerusahaanPtErrorText;
  String? fotoNpwpPerusahaanPtUrl;
  String? fotoNpwpPerusahaanPtPublicUrl;

  Future captureNpwpPerusahaanPt() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingNpwp = true;
      notifyListeners();
      if (_isLoadingNpwp) {
        if (_isImageOrPdf(res.extension!)) {
          fotoNpwpPerusahaanPt = res;
          fotoNpwpPerusahaanPtErrorText = null;
          uploadFileNpwp(fotoNpwpPerusahaanPt!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png, atau pdf!');
        }
      }
    }
  }

  Future clearNpwpPerusahaanPt() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file NPWP Perusahaan ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoNpwpPerusahaanPt = null;
      fotoNpwpPerusahaanPtUrl = null;
      fotoNpwpPerusahaanPtPublicUrl = null;
      notifyListeners();
    }
  }

  PlatformFile? fotoAktaPendirian;
  String? fotoAktaPendirianErrorText;
  String? fotoAktaPendirianUrl;
  String? fotoAktaPendirianPublicUrl;

  Future captureAktaPendirian() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingAktaPendirian = true;
      notifyListeners();
      if (_isLoadingAktaPendirian) {
        if (_isImageOrPdf(res.extension!)) {
          fotoAktaPendirian = res;
          fotoAktaPendirianErrorText = null;
          uploadFileAktaPendirian(fotoAktaPendirian!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png, atau pdf!');
        }
      }
    }
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
      fotoAktaPendirianUrl = null;
      fotoAktaPendirianPublicUrl = null;
      notifyListeners();
    }
  }

  PlatformFile? fotoAktaPerubahaanTerakhir;
  String? fotoAktaPerubahaanTerakhirErrorText;
  String? fotoAktaPerubahaanTerakhirUrl;
  String? fotoAktaPerubahaanTerakhirPublicUrl;

  Future captureAktaPerubahaanTerakhir() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingAktaPerubahaanTerakhir = true;
      notifyListeners();
      if (_isLoadingAktaPerubahaanTerakhir) {
        if (_isImageOrPdf(res.extension!)) {
          fotoAktaPerubahaanTerakhir = res;
          fotoAktaPerubahaanTerakhirErrorText = null;
          uploadFileAktaPerubahaanTerakhir(fotoAktaPerubahaanTerakhir!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png, atau pdf!');
        }
      }
    }
  }

  Future clearAktaPerubahaanTerakhir() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description:
          'Anda yakin akan menghapus file Akta Perubahan Terakhir ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoAktaPerubahaanTerakhir = null;
      fotoAktaPerubahaanTerakhirUrl = null;
      fotoAktaPerubahaanTerakhirPublicUrl = null;
      notifyListeners();
    }
  }

  PlatformFile? fotosKkumhamPendirian;
  String? fotosKkumhamPendirianErrorText;
  String? fotosKkumhamPendirianUrl;
  String? fotosKkumhamPendirianPublicUrl;

  Future captureSKkumhamPendirian() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingsKkumhamPendirian = true;
      notifyListeners();
      if (_isLoadingsKkumhamPendirian) {
        if (_isImageOrPdf(res.extension!)) {
          fotosKkumhamPendirian = res;
          fotosKkumhamPendirianErrorText = null;
          uploadFilesKkumhamPendirian(fotosKkumhamPendirian!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png, atau pdf!');
        }
      }
    }
  }

  Future clearSkKumhamPendirian() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file SK Kumham Pendirian ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotosKkumhamPendirian = null;
      fotosKkumhamPendirianUrl = null;
      fotosKkumhamPendirianPublicUrl = null;
      notifyListeners();
    }
  }

  PlatformFile? fotosKkumhamPerubahaanTerakhir;
  String? fotosKkumhamPerubahaanTerakhirErrorText;
  String? fotosKkumhamPerubahaanTerakhirUrl;
  String? fotosKkumhamPerubahaanTerakhirPublicUrl;

  Future capturesKkumhamPerubahaanTerakhir() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingsKkumhamPerubahaanTerakhir = true;
      notifyListeners();
      if (_isLoadingsKkumhamPerubahaanTerakhir) {
        if (_isImageOrPdf(res.extension!)) {
          fotosKkumhamPerubahaanTerakhir = res;
          fotosKkumhamPerubahaanTerakhirErrorText = null;
          uploadFilesKkumhamPerubahaanTerakhir(fotosKkumhamPerubahaanTerakhir!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png, atau pdf!');
        }
      }
    }
  }

  Future clearsKkumhamPerubahaanTerakhir() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description:
          'Anda yakin akan menghapus file SK Kumham Perubahan Terakhir ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotosKkumhamPerubahaanTerakhir = null;
      fotosKkumhamPerubahaanTerakhirUrl = null;
      fotosKkumhamPerubahaanTerakhirPublicUrl = null;
      notifyListeners();
    }
  }

  Future clearKtpSelfie() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file selfie + E-KTP debitur ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoAktaPerubahaanTerakhir = null;
      notifyListeners();
    }
  }

  PlatformFile? fotoAktaCerai;
  String? fotoAktaCeraiErrorText;
  String? fotoAktaCeraiUrl;
  String? fotoAktaCeraiPublicUrl;

  Future captureAktaCerai() async {
    final res = await _mediaService.getMultiFileType();

    if (res != Null) {
      _isLoadingAktaCerai = true;
      notifyListeners();
      if (_isLoadingAktaCerai) {
        if (_isImageOrPdf(res!.extension!)) {
          fotoAktaCerai = res;
          fotoAktaCeraiErrorText = null;
          uploadFileAktaCerai(fotoAktaCerai!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png, atau pdf!');
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
      notifyListeners();
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

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Gagal',
      description: errorMessage,
      mainButtonTitle: 'COBA LAGI',
    );
  }

  Future navigateBack() async {
    if (pipelineId != null) {
      _navigationService.back(result: {
        'pipelineId': pipelineId,
        'informasiPerusahaanPtCompleted': 2,
      });
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

  Future navigateToAddressSelectionViewPerusahaanPt() async {
    _navigationService
        .navigateTo(Routes.addressSelectionView)!
        .then((chosenPlace) {
      if (chosenPlace != null) {
        alamatPerushaanPtController.text = chosenPlace['address'] as String;
        _lat = chosenPlace['lat'] as double;
        _lng = chosenPlace['lng'] as double;
      }
    });
  }

  bool _anyFieldEditedDataDiri() {
    return namaPerusahaanPtController.text.isNotEmpty ||
        nomorNpwpPerusahaanPtController.text.isNotEmpty ||
        /////////////////
        sektorController.text.isNotEmpty ||
        subSektorController.text.isNotEmpty ||
        alamatPerushaanPtController.text.isNotEmpty ||
        detailAlamatPerusahaanController.text.isNotEmpty ||
        detailTempatAktaPendirianPerusahaanController.text.isNotEmpty ||
        detailTempatAktaPerubahanTerakhirController.text.isNotEmpty ||
        postalCodeAlamatPerusahaanPtController.text.isNotEmpty ||
        provinceAlamatPerusahaanController.text.isNotEmpty ||
        cityAlamatPerusahaanController.text.isNotEmpty ||
        districtAlamatPerusahaanPtController.text.isNotEmpty ||
        villageAlamatPerusahaanPtController.text.isNotEmpty ||
        rtAlamatPerusahaanPtController.text.isNotEmpty ||
        rwAlamatPerusahaanPtController.text.isNotEmpty ||
        tglAktaPendirianPtController.text.isNotEmpty ||
        nomorAktaPendirianController.text.isNotEmpty ||
        detailTempatAktaPendirianPerusahaanController.text.isNotEmpty ||
        tglSKkumhamPendirianPtController.text.isNotEmpty ||
        tglSKkumhamPendirianPtController.text.isNotEmpty ||
        nomorSKkumhamPendirianController.text.isNotEmpty ||
        tglAktaPerubahanTerakhirController.text.isNotEmpty ||
        nomorAktaPerubahanTerakhirController.text.isNotEmpty ||
        detailTempatAktaPerubahanTerakhirController.text.isNotEmpty ||
        tglSKkumhamPerubahanTerakhirController.text.isNotEmpty ||
        nomorSKkumhamPerubahanTerakhirController.text.isNotEmpty ||
        namaLengkapPicController.text.isNotEmpty ||
        noHpPicController.text.isNotEmpty ||
        emailPicController.text.isNotEmpty;
    ///////////
    // nomorAktaPendirianController.text.isNotEmpty ||
    // nomorSKkumhamPendirianController.text.isNotEmpty ||
    // nomorSKkumhamPerubahaanTerakhirController.text.isNotEmpty ||
    // nomorAktaPerubahaanTerakhirController.text.isNotEmpty ||
  }

  List<EconomySectorRitel> _economySectors = [];

  List<EconomySectorRitel> get economySector => _economySectors;
  String? _economySectorId;

  Future updateEconomySector(EconomySectorRitel economySectorRitel) async {
    _economySubSectors.clear();
    subSektorController.clear();
    sektorController.text = economySectorRitel.name!.trim();
    _economySectorId = economySectorRitel.economy_sectorsId;
    await getEconomySubSector(_economySectorId!);
    notifyListeners();
  }

  List<EconomySectorRitel> filterEconomySector(String query) {
    return _economySectors
        .where((element) => element.name!.toLowerCase().contains(query))
        .toList();
  }

  void clearEconomySector() {
    sektorController.clear();
    subSektorController.clear();
    _economySubSectors.clear();
    _economySectorId = null;
    notifyListeners();
  }

  Future getEconomySector() async {
    final res = await runBusyFuture(_ritelMasterAPI.getEconomySectors());

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (economySectors) => _economySectors = economySectors,
    );
  }

  List<EconomySubSectorRitel> _economySubSectors = [];

  List<EconomySubSectorRitel> get economySubSectors => _economySubSectors;
  String? _economySubSectorId;

  void updateEconomySubSector(EconomySubSectorRitel economySubSectorRitel) {
    subSektorController.text =
        '${economySubSectorRitel.code!.trim()} - ${economySubSectorRitel.economySubSectorsName!.trim()}';
    _economySubSectorId = economySubSectorRitel.economy_sub_sectorsId;
    notifyListeners();
  }

  List<EconomySubSectorRitel> filterEconomySubSector(String query) {
    return _economySubSectors
        .where((element) =>
            element.economySubSectorsName!.toLowerCase().contains(query))
        .toList();
  }

  void clearEconomySubSector() {
    subSektorController.clear();
    notifyListeners();
  }

  Future getEconomySubSector(String id) async {
    final res = await runBusyFuture(_ritelMasterAPI.getEconomySubSectors(id));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (economySubSectors) => _economySubSectors = economySubSectors,
    );
  }

  bool _validateUploadFiles() {
    return 'sadas' == Common.kawin
        ? fotoAktaPendirianUrl != null && fotoKtpPasanganUrl != null
        : fotoNpwpPerusahaanPtUrl != null;
  }

  void _setUploadFilesErrorTextIfAny() {
    if (fotoNpwpPerusahaanPtUrl == null) {
      fotoNpwpPerusahaanPtErrorText = 'Foto Npwp harus diupload';
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

  Future validateInputs(
    PipelinePerusahaanPtAPIMethod pipelinePerusahaanPtAPIMethod, {
    bool isContinue = false,
  }) async {
    if (formKey.currentState!.validate() && _validateUploadFiles()) {
      formKey.currentState!.save();

      final response = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.confirmation,
        data: {'title': 'Konfirmasi'},
      );

      if (response != null && response.confirmed) {
        _postData(pipelinePerusahaanPtAPIMethod, isContinue);
      }
    } else {
      autoValidateMode = AutovalidateMode.always;
      _setUploadFilesErrorTextIfAny();
      _showValidationErrorDialog();
      notifyListeners();
    }
  }

  // ignore: long-method
  Future<Map<String, dynamic>> _generateInfoPerusahaanPtMap(
    String action,
  ) async {
    var latLng = '${_lat.toString()}, ${_lng.toString()}';
    var newLatlng = latlangNew.toString();

    return action == 'add'
        ? {
            'companyName': 'PT. ${namaPerusahaanPtController.text.trim()}',
            'companyNpwpNum': nomorNpwpPerusahaanPtController.text.isNotEmpty
                ? nomorNpwpPerusahaanPtController.text.trim()
                : '',
            'economy_sectorsId': _economySectorId ??
                ritelInformasiPerusahaanPt!.economy_sectorsId!,
            'economy_sub_sectorsId': _economySubSectorId ??
                ritelInformasiPerusahaanPt!.economy_sub_sectorsId!,
            'isDeedSame': _valueAktaPerubahaan,
            'partnershipsId': 0,
            'dateOfDeedEst': tglAktaPendirianPtController.text.trim(),
            'deedEstNum': nomorAktaPendirianController.text.trim(),
            'dateOfSkKumham': tglSKkumhamPendirianPtController.text.isEmpty
                ? ''
                : tglSKkumhamPendirianPtController.text,
            'placeOfDeedEst':
                detailTempatAktaPendirianPerusahaanController.text.trim(),
            'latestDateOfDeed': tglAktaPerubahanTerakhirController.text.isEmpty
                ? ''
                : tglAktaPerubahanTerakhirController.text.trim(),
            'latestPlaceOfDeed':
                detailTempatAktaPerubahanTerakhirController.text.isEmpty
                    ? ''
                    : detailTempatAktaPerubahanTerakhirController.text.trim(),
            'latestDateOfSkKumham':
                tglSKkumhamPerubahanTerakhirController.text.trim(),
            'skKumhamNum': nomorSKkumhamPendirianController.text.trim(),
            'latestSkKumhamNum':
                nomorSKkumhamPerubahanTerakhirController.text.trim(),
            'latestDeedNum': nomorAktaPerubahanTerakhirController.text.trim(),
            'fullnamePIC': namaLengkapPicController.text.trim(),
            'phoneNumPIC': '+62${noHpPicController.text.trim()}',
            'emailPIC': emailPicController.text.isNotEmpty
                ? emailPicController.text.trim()
                : '',
            'companyNpwpPath':
                fotoNpwpPerusahaanPt != null ? fotoNpwpPerusahaanPtUrl : '',
            'deedEstPath':
                fotoAktaPendirian != null ? fotoAktaPendirianUrl : '',
            'latestDeedPath': fotoAktaPerubahaanTerakhir != null
                ? fotoAktaPerubahaanTerakhirUrl
                : '',
            'skKumhamPath':
                fotosKkumhamPendirian != null ? fotosKkumhamPendirianUrl : '',
            'latestSkKumhamPath': fotosKkumhamPerubahaanTerakhir != null
                ? fotosKkumhamPerubahaanTerakhirUrl
                : '',
            'tagLocation': {
              'latLng': latLng != 'null, null' ? latLng : newLatlng,
              'name': alamatPerushaanPtController.text.trim(),
            },
            'detail': detailAlamatPerusahaanController.text.trim(),
            'postalCode': postalCodeAlamatPerusahaanPtController.text.trim(),
            'province': provinceAlamatPerusahaanController.text.trim(),
            'city': cityAlamatPerusahaanController.text.trim(),
            'district': districtAlamatPerusahaanPtController.text.trim(),
            'village': villageAlamatPerusahaanPtController.text.trim(),
            'rt': rtAlamatPerusahaanPtController.text.isNotEmpty
                ? rtAlamatPerusahaanPtController.text.trim()
                : '',
            'rw': rwAlamatPerusahaanPtController.text.isNotEmpty
                ? rwAlamatPerusahaanPtController.text.trim()
                : '',
          }
        : {
            'companyName': 'PT. ${namaPerusahaanPtController.text.trim()}',
            'companyNpwpNum': nomorNpwpPerusahaanPtController.text.isNotEmpty
                ? nomorNpwpPerusahaanPtController.text.trim()
                : '',
            'economy_sectorsId': _economySectorId ??
                ritelInformasiPerusahaanPt!.economy_sectorsId!,
            'economy_sub_sectorsId': _economySubSectorId ??
                ritelInformasiPerusahaanPt!.economy_sub_sectorsId!,
            'isDeedSame': _valueAktaPerubahaan,
            'partnershipsId': 0,
            'dateOfDeedEst': tglAktaPendirianPtController.text.trim(),
            'deedEstNum': nomorAktaPendirianController.text.trim(),
            'placeOfDeedEst':
                detailTempatAktaPendirianPerusahaanController.text.trim(),
            'latestDateOfDeed': tglAktaPerubahanTerakhirController.text.trim(),
            'latestDeedNum': nomorAktaPerubahanTerakhirController.text.trim(),
            'latestPlaceOfDeed':
                detailTempatAktaPerubahanTerakhirController.text.trim(),
            'fullnamePIC': namaLengkapPicController.text.trim(),
            'dateOfSkKumham': tglSKkumhamPendirianPtController.text.isEmpty
                ? ''
                : tglSKkumhamPendirianPtController.text,
            'latestDateOfSkKumham':
                tglSKkumhamPerubahanTerakhirController.text.trim(),
            'skKumhamNum': nomorSKkumhamPendirianController.text.trim(),
            'latestSkKumhamNum':
                nomorSKkumhamPerubahanTerakhirController.text.trim(),
            'phoneNumPIC': '+62${noHpPicController.text.trim()}',
            'emailPIC': emailPicController.text.isNotEmpty
                ? emailPicController.text.trim()
                : '',
            'companyNpwpPath': fotoNpwpPerusahaanPtUrl ?? '',
            'deedEstPath': fotoAktaPendirianUrl ?? '',
            'latestDeedPath': fotoAktaPerubahaanTerakhirUrl ?? '',
            'skKumhamPath': fotosKkumhamPendirianUrl ?? '',
            'latestSkKumhamPath': fotosKkumhamPerubahaanTerakhirUrl ?? '',
            'tagLocation': {
              'latLng': latLng != 'null, null' ? latLng : newLatlng,
              'name': alamatPerushaanPtController.text.trim(),
            },
            'detail': detailAlamatPerusahaanController.text.trim(),
            'postalCode': postalCodeAlamatPerusahaanPtController.text.trim(),
            'province': provinceAlamatPerusahaanController.text.trim(),
            'city': cityAlamatPerusahaanController.text.trim(),
            'district': districtAlamatPerusahaanPtController.text.trim(),
            'village': villageAlamatPerusahaanPtController.text.trim(),
            'rt': rtAlamatPerusahaanPtController.text.isNotEmpty
                ? rtAlamatPerusahaanPtController.text.trim()
                : '',
            'rw': rwAlamatPerusahaanPtController.text.isNotEmpty
                ? rwAlamatPerusahaanPtController.text.trim()
                : '',
          };
  }

  Future _postData(
    PipelinePerusahaanPtAPIMethod pipelinePerusahaanPtAPIMethod,
    bool isContinue,
  ) async {
    switch (pipelinePerusahaanPtAPIMethod) {
      case PipelinePerusahaanPtAPIMethod.addInformasiPerusahaanPt:
        final infoPeruhsaanPtMap = await _generateInfoPerusahaanPtMap('add');

        final res = await runBusyFuture(_ritelPipelinePerusahaanPtAPI
            .addInformasiPerusahaanPt(infoPeruhsaanPtMap));

        res.fold(
          (errorMessage) {
            _showErrorDialog(errorMessage);
            notifyListeners();
          },
          (successMap) {
            pipelineId = successMap['id'] as String;

            if (!_localDBService.perusahaanPtFlagBoxIsNotEmpty()) {
              _localDBService.storePerusahaanPtFlag(
                {
                  'debiturName': namaPerusahaanPtController.text.trim(),
                },
              );
            } else {
              _localDBService.replacePerusahaanPtFlag(
                {
                  'debiturName': namaPerusahaanPtController.text.trim(),
                },
              );
            }

            _showSuccessDialog(
              successMessage: 'Berhasil mengubah informasi perusahaan PT!',
              isContinue: true,
            );
            notifyListeners();
          },
        );
        break;

      case PipelinePerusahaanPtAPIMethod.updateInformasiPerusahaanPt:
        final infoPerusahaanPtMap =
            await _generateInfoPerusahaanPtMap('update');

        dev.log(infoPerusahaanPtMap.toString());

        final res = await runBusyFuture(
          _ritelPipelinePerusahaanPtAPI.updateInformasiPerusahaanPt(
            payload: infoPerusahaanPtMap,
            id: pipelineId!,
          ),
        );

        res.fold(
          (errorMessage) {
            _showErrorDialog(errorMessage);
            notifyListeners();
          },
          (successMap) {
            if (!_localDBService.perusahaanPtFlagBoxIsNotEmpty()) {
              _localDBService.storePerusahaanPtFlag(
                {
                  'debiturName': namaPerusahaanPtController.text.trim(),
                },
              );
            } else {
              _localDBService.replacePerusahaanPtFlag(
                {
                  'debiturName': namaPerusahaanPtController.text.trim(),
                },
              );
            }

            _showSuccessDialog(
              successMessage: 'Berhasil mengubah informasi perusahaan PT!',
              isContinue: true,
            );
            notifyListeners();
          },
        );
        break;
      case PipelinePerusahaanPtAPIMethod.addPengurusPt:
        break;
      case PipelinePerusahaanPtAPIMethod.updatePengurusPt:
        break;
      case PipelinePerusahaanPtAPIMethod.addLainnya:
        break;
      case PipelinePerusahaanPtAPIMethod.updateLainnya:
        break;
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
        fotoNpwpPerusahaanPtUrl = url;
        fotoNpwpPerusahaanPtPublicUrl = await _getPublicFile(url);
        notifyListeners();
      },
    );
  }

  Future uploadFileAktaPendirian(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingAktaPendirian = false;
        fotoAktaPendirianUrl = url;
        fotoAktaPendirianPublicUrl = await _getPublicFile(url);
        notifyListeners();
      },
    );
  }

  Future uploadFileAktaPerubahaanTerakhir(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingAktaPerubahaanTerakhir = false;
        fotoAktaPerubahaanTerakhirUrl = url;
        fotoAktaPerubahaanTerakhirPublicUrl = await _getPublicFile(url);
        notifyListeners();
      },
    );
  }

  Future uploadFilesKkumhamPendirian(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingsKkumhamPendirian = false;
        fotosKkumhamPendirianUrl = url;
        fotosKkumhamPendirianPublicUrl = await _getPublicFile(url);
        notifyListeners();
      },
    );
  }

  Future uploadFilesKkumhamPerubahaanTerakhir(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingsKkumhamPerubahaanTerakhir = false;
        fotosKkumhamPerubahaanTerakhirUrl = url;
        fotosKkumhamPerubahaanTerakhirPublicUrl = await _getPublicFile(url);
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
        fotoAktaPerubahaanTerakhirUrl = url;
        fotoAktaPerubahaanTerakhirPublicUrl = await _getPublicFile(url);
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

  bool _isImageOrPdf(String type) {
    type = type.toLowerCase();
    return (type == 'pdf' || type == 'jpg' || type == 'png' || type == 'jpeg');
  }
}

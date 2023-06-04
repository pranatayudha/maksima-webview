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
import '../../../../../../application/enums/pipeline_perusahaan_cv_api_method.dart';
import '../../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../../application/models/economy_sector_ritel.dart';
import '../../../../../../application/models/economy_sub_sector_ritel.dart';
import '../../../../../../application/models/ritel_informasi_perusahaan_cv.dart';
import '../../../../../../application/models/ritel_postal_code.dart';
import '../../../../../../application/services/local_db_service.dart';
import '../../../../../../application/services/media_service.dart';
import '../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../infrastructure/apis/ritel_pipeline_perusahaan_cv_api.dart';
import '../../../../../../infrastructure/apis/ritel_upload_file_api.dart';

class InformasiPerusahaanCvViewModel extends BaseViewModel {
  String? pipelineId;
  RitelInformasiPerusahaanCV? ritelInformasiPerusahaanCv;
  bool fromTdpPeroranganView;
  bool? fromPipelineDetailsView;
  int? statusPipeline;

  InformasiPerusahaanCvViewModel({
    this.pipelineId,
    this.ritelInformasiPerusahaanCv,
    required this.fromTdpPeroranganView,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  });

  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final RitelUploadFileAPI _ritelUploadFileAPI = locator<RitelUploadFileAPI>();
  final RitelPipelinePerusahaanCvAPI _ritelPipelinePerusahaanCvAPI =
      locator<RitelPipelinePerusahaanCvAPI>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final MaksimaMediaService _mediaService = locator<MaksimaMediaService>();

  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();

  Future initialize() async {
    setBusy(true);
    await getEconomySector();

    if (ritelInformasiPerusahaanCv != null) {
      await _prepopulateTextFields();
      await _prepopulateImages();
    }
    if (ritelInformasiPerusahaanCv!.deedEstNum ==
        ritelInformasiPerusahaanCv!.latestDeedNum) {
      _valueAktaPerubahaan = true;
    }
    setBusy(false);
  }
  // ignore: long-method

  // ignore: long-method
  Future _prepopulateTextFields() async {
    final splitWithoutPT =
        ritelInformasiPerusahaanCv!.companyName!.split('CV. ');
    namaPerusahaanCvController
      ..text = splitWithoutPT[1]
      ..selection = TextSelection.collapsed(
        offset: namaPerusahaanCvController.text.length,
      );

    nomorNpwpPerusahaanCvController
      ..text = ritelInformasiPerusahaanCv!.companyNpwpNum!
      ..selection = TextSelection.collapsed(
        offset: nomorNpwpPerusahaanCvController.text.length,
      );

    sektorController
      ..text = ritelInformasiPerusahaanCv!.economySectorsName!
      ..selection =
          TextSelection.collapsed(offset: sektorController.text.length);

    subSektorController
      ..text = ritelInformasiPerusahaanCv!.economySubSectorsName!
      ..selection =
          TextSelection.collapsed(offset: subSektorController.text.length);

    alamatPerushaanCvController
      ..text = ritelInformasiPerusahaanCv!.tagLocation!.name!
      ..selection = TextSelection.collapsed(
        offset: alamatPerushaanCvController.text.length,
      );

    detailAlamatPerusahaanController
      ..text = ritelInformasiPerusahaanCv!.detail!
      ..selection = TextSelection.collapsed(
        offset: detailAlamatPerusahaanController.text.length,
      );
    postalCodeAlamatPerusahaanCvController
      ..text = ritelInformasiPerusahaanCv!.postalCode!
      ..selection = TextSelection.collapsed(
        offset: postalCodeAlamatPerusahaanCvController.text.length,
      );

    districtAlamatPerusahaanCvController
      ..text = ritelInformasiPerusahaanCv!.district!
      ..selection = TextSelection.collapsed(
        offset: districtAlamatPerusahaanCvController.text.length,
      );

    villageAlamatPerusahaanCvController
      ..text = ritelInformasiPerusahaanCv!.village!
      ..selection = TextSelection.collapsed(
        offset: villageAlamatPerusahaanCvController.text.length,
      );

    rtAlamatPerusahaanCvController
      ..text = ritelInformasiPerusahaanCv!.rt!
      ..selection = TextSelection.collapsed(
        offset: rtAlamatPerusahaanCvController.text.length,
      );

    rwAlamatPerusahaanCvController
      ..text = ritelInformasiPerusahaanCv!.rw!
      ..selection = TextSelection.collapsed(
        offset: rwAlamatPerusahaanCvController.text.length,
      );
    tglAktaPendirianCvController.text = DateStringFormatter.forInput(
      ritelInformasiPerusahaanCv!.dateOfDeedEst!.date!,
    );
    // tglAktaPendirianCvController
    //   ..text = ritelInformasiPerusahaanCv!.dateOfDeedEst!.newDate!
    //   ..selection = TextSelection.collapsed(
    //       offset: tglAktaPendirianCvController.text.length);
    // ignore: no-boolean-literal-compare
    if (_valueAktaPerubahaan == true) {
      nomorAktaPendirianController
        ..text = ritelInformasiPerusahaanCv!.latestDeedNum!
        ..selection = TextSelection.collapsed(
          offset: nomorAktaPendirianController.text.length,
        );
    } else {
      nomorAktaPendirianController
        ..text = ritelInformasiPerusahaanCv!.deedEstNum!
        ..selection = TextSelection.collapsed(
          offset: nomorAktaPendirianController.text.length,
        );
    }
    // ignore: no-boolean-literal-compare
    if (_valueAktaPerubahaan == true) {
      detailTempatAktaPendirianPerusahaanController
        ..text = ritelInformasiPerusahaanCv!.latestPlaceOfDeed!
        ..selection = TextSelection.collapsed(
          offset: detailTempatAktaPendirianPerusahaanController.text.length,
        );
    } else {
      detailTempatAktaPendirianPerusahaanController
        ..text = ritelInformasiPerusahaanCv!.placeOfDeedEst!
        ..selection = TextSelection.collapsed(
          offset: detailTempatAktaPendirianPerusahaanController.text.length,
        );
    }

    // detailTempatAktaPendirianPerusahaanController
    //   ..text = ritelInformasiPerusahaanCv!.detail!
    //   ..selection = TextSelection.collapsed(
    //       offset: detailTempatAktaPendirianPerusahaanController.text.length);
    tglSKkumhamPendirianCvController.text =
        ritelInformasiPerusahaanCv!.dateOfSkKumham == null
            ? ''
            : DateStringFormatter.forInput(
                ritelInformasiPerusahaanCv!.dateOfSkKumham!.date!,
              );
    // tglSKkumhamPendirianCvController
    //   ..text = ritelInformasiPerusahaanCv!.dateOfSkKumham!.newDate!
    //   ..selection = TextSelection.collapsed(
    //       offset: tglSKkumhamPendirianCvController.text.length);

    nomorSKkumhamPendirianController
      ..text = ritelInformasiPerusahaanCv!.skKumhamNum!
      ..selection = TextSelection.collapsed(
        offset: nomorSKkumhamPendirianController.text.length,
      );
///////////// akta perubahan sama dengan akta pendirian
    tglAktaPerubahanTerakhirController.text = DateStringFormatter.forInput(
      ritelInformasiPerusahaanCv!.latestDateOfDeed!.date!,
    );
    // tglAktaPerubahanTerakhirController
    //   ..text = ritelInformasiPerusahaanCv!.dateOfDeedEst!.newDate!
    //   ..selection = TextSelection.collapsed(
    //       offset: tglAktaPerubahanTerakhirController.text.length);

    nomorAktaPerubahanTerakhirController
      ..text = ritelInformasiPerusahaanCv!.latestDeedNum!
      ..selection = TextSelection.collapsed(
        offset: nomorAktaPerubahanTerakhirController.text.length,
      );

    detailTempatAktaPerubahanTerakhirController
      ..text = ritelInformasiPerusahaanCv!.latestPlaceOfDeed!
      ..selection = TextSelection.collapsed(
        offset: detailTempatAktaPerubahanTerakhirController.text.length,
      );

    tglSKkumhamPerubahanTerakhirController.text =
        ritelInformasiPerusahaanCv!.latestDateOfSkKumham == null
            ? ''
            : DateStringFormatter.forInput(
                ritelInformasiPerusahaanCv!.latestDateOfSkKumham!.date!,
              );
    // tglSKkumhamPerubahanTerakhirController
    //   ..text = ritelInformasiPerusahaanCv!.dateOfSkKumham!.newDate!
    //   ..selection = TextSelection.collapsed(
    //       offset: tglSKkumhamPerubahanTerakhirController.text.length);

    nomorSKkumhamPerubahanTerakhirController
      ..text = ritelInformasiPerusahaanCv!.latestSkKumhamNum!
      ..selection = TextSelection.collapsed(
        offset: nomorSKkumhamPerubahanTerakhirController.text.length,
      );

    namaLengkapPicController
      ..text = ritelInformasiPerusahaanCv!.fullnamePIC!
      ..selection =
          TextSelection.collapsed(offset: namaLengkapPicController.text.length);

    postalCodeAlamatPerusahaanCvController
      ..text = ritelInformasiPerusahaanCv!.postalCode!
      ..selection = TextSelection.collapsed(
        offset: postalCodeAlamatPerusahaanCvController.text.length,
      );

    final splitWithout62 =
        ritelInformasiPerusahaanCv!.phoneNumPIC!.split('+62');
    noHpPicController
      ..text = splitWithout62[1]
      ..selection =
          TextSelection.collapsed(offset: noHpPicController.text.length);
    emailPicController
      ..text = ritelInformasiPerusahaanCv!.emailPIC!
      ..selection =
          TextSelection.collapsed(offset: emailPicController.text.length);

    provinceAlamatPerusahaanController
      ..text = ritelInformasiPerusahaanCv!.province!
      ..selection = TextSelection.collapsed(
        offset: provinceAlamatPerusahaanController.text.length,
      );

    cityAlamatPerusahaanController
      ..text = ritelInformasiPerusahaanCv!.city!
      ..selection = TextSelection.collapsed(
        offset: cityAlamatPerusahaanController.text.length,
      );
  }

  Future _prepopulateImages() async {
    if (ritelInformasiPerusahaanCv!.companyNpwpPath != null &&
        ritelInformasiPerusahaanCv!.companyNpwpPath!.isNotEmpty) {
      fotoNpwpPerusahaanCvPublicUrl =
          await _getPublicFile(ritelInformasiPerusahaanCv!.companyNpwpPath!);
      fotoNpwpPerusahaanCvUrl = ritelInformasiPerusahaanCv!.companyNpwpPath!;
      notifyListeners();
    }

    if (ritelInformasiPerusahaanCv!.deedEstPath != null &&
        ritelInformasiPerusahaanCv!.deedEstPath!.isNotEmpty) {
      fotoAktaPendirianPublicUrl =
          await _getPublicFile(ritelInformasiPerusahaanCv!.deedEstPath!);
      fotoAktaPendirianUrl = ritelInformasiPerusahaanCv!.deedEstPath!;

      notifyListeners();
    }

    if (ritelInformasiPerusahaanCv!.latestDeedPath != null &&
        ritelInformasiPerusahaanCv!.latestDeedPath!.isNotEmpty) {
      fotoAktaPerubahaanTerakhirPublicUrl =
          await _getPublicFile(ritelInformasiPerusahaanCv!.latestDeedPath!);
      fotoAktaPerubahaanTerakhirUrl =
          ritelInformasiPerusahaanCv!.latestDeedPath!;
      notifyListeners();
    }

    if (ritelInformasiPerusahaanCv!.skKumhamPath != null &&
        ritelInformasiPerusahaanCv!.skKumhamPath!.isNotEmpty) {
      fotosKkumhamPendirianPublicUrl =
          await _getPublicFile(ritelInformasiPerusahaanCv!.skKumhamPath!);
      fotosKkumhamPendirianUrl = ritelInformasiPerusahaanCv!.skKumhamPath!;
      notifyListeners();
    }
    if (ritelInformasiPerusahaanCv!.latestSkKumhamPath != null &&
        ritelInformasiPerusahaanCv!.latestSkKumhamPath!.isNotEmpty) {
      fotosKkumhamPerubahaanTerakhirPublicUrl =
          await _getPublicFile(ritelInformasiPerusahaanCv!.latestSkKumhamPath!);
      fotosKkumhamPerubahaanTerakhirUrl =
          ritelInformasiPerusahaanCv!.latestSkKumhamPath!;

      notifyListeners();
    }
  }

  Future updateKelurahan(RitelPostalCode ritelPostalCode) async {
    villageAlamatPerusahaanCvController.text = ritelPostalCode.village!.trim();

    notifyListeners();
  }

  List<RitelPostalCode> filterKelurahan(String query) {
    List<RitelPostalCode> temp = [];

    for (var i = 0; i < _ritelPostalCodeSecond.length; i++) {
      if (districtAlamatPerusahaanCvController.text
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

  void clearKelurahan() {
    villageAlamatPerusahaanCvController.clear();

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

        provinceAlamatPerusahaanController.text =
            _ritelPostalCode[0].province.toString();
        cityAlamatPerusahaanController.text =
            _ritelPostalCode[0].city.toString();
      },
    );
  }

  Future updateKodePos(RitelPostalCode ritelPostalCode) async {
    provinceAlamatPerusahaanController.text = ritelPostalCode.province!;
    cityAlamatPerusahaanController.text = ritelPostalCode.city!;
    districtAlamatPerusahaanCvController.text = ritelPostalCode.district!;

    notifyListeners();
  }

  void clearPostalCode() {
    postalCodeAlamatPerusahaanCvController.clear();
    provinceAlamatPerusahaanController.clear();
    cityAlamatPerusahaanController.clear();
    districtAlamatPerusahaanCvController.clear();
    villageAlamatPerusahaanCvController.clear();

    notifyListeners();
  }

  double? _lat;
  double? _lng;

  final jenisDebiturController = TextEditingController();

  final namaPerusahaanCvController = TextEditingController();

  void updateNamaPerusahaanCv(String val) =>
      namaPerusahaanCvController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final nomorNpwpPerusahaanCvController = TextEditingController();

  void updateNomorNpwpPerusahaanCv(String val) =>
      nomorNpwpPerusahaanCvController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final sektorController = TextEditingController();

  final subSektorController = TextEditingController();

  final alamatPerushaanCvController = TextEditingController();

  void updateAlamatPerusahaanCv(String val) =>
      alamatPerushaanCvController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final detailAlamatPerusahaanController = TextEditingController();

  void updateDetailAlamatPerusahaanCv(String val) =>
      detailAlamatPerusahaanController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final postalCodeAlamatPerusahaanCvController = TextEditingController();

  void updatePostalCodePerusahaanCvTinggal(String val) {
    postalCodeAlamatPerusahaanCvController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    provinceAlamatPerusahaanController.clear();
    cityAlamatPerusahaanController.clear();
    // districtAlamatPerusahaanCvController.clear();
    // villageAlamatPerusahaanCvController.clear();
    getKodePos(postalCodeAlamatPerusahaanCvController.text);
  }

  final districtAlamatPerusahaanCvController = TextEditingController();

  void clearKecamatan() {
    districtAlamatPerusahaanCvController.clear();
    notifyListeners();
  }

  List<RitelPostalCode> filterKecamatan(String query) {
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

  Future updateKecamatan(RitelPostalCode ritelPostalCode) async {
    districtAlamatPerusahaanCvController.text =
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

  final villageAlamatPerusahaanCvController = TextEditingController();

  void updateVillageAlamatPerusahaanCv(String val) =>
      villageAlamatPerusahaanCvController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final rtAlamatPerusahaanCvController = TextEditingController();

  void updateRtAlamatPerusahaanCv(String val) =>
      rtAlamatPerusahaanCvController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final rwAlamatPerusahaanCvController = TextEditingController();

  void updateRwAlamatPerusahaan(String val) =>
      rwAlamatPerusahaanCvController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final tglAktaPendirianCvController = TextEditingController();

  void updateTglAktaPendirianCv(String val) {
    tglAktaPendirianCvController.text = val.trim();
  }

  Future selecttglAktaPendirianCv(BuildContext context) async {
    DateTime? pickedDate = await _showingDatePicker(context);
    // ignore: unnecessary_null_comparison
    if (pickedDate != null) {
      updateTglAktaPendirianCv(
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

  // final tglAktaPendirianCvController = TextEditingController();

  // void updateTglAktaPendirianCv(String val) =>
  //     tglAktaPendirianCvController.text = val.trim();

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

  // void updateNomorAktaPerubahanTerakhir(String val) => valueAktaPerubahaan ==
  //         false
  //     ? nomorAktaPerubahanTerakhirController.value.copyWith(
  //         text: val,
  //         selection:
  //             TextSelection(baseOffset: val.length, extentOffset: val.length),)
  //     : nomorAktaPendirianController;

  final tglAktaPerubahanTerakhirController = TextEditingController();

  void updatetglAktaPerubahanTerakhir(String val) =>
      tglAktaPerubahanTerakhirController.text = val.trim();

  Future selecttglAktaPerubahanTerakhir(BuildContext context) async {
    DateTime? pickedDate = await _showingDatePicker(context);
    // ignore: unnecessary_null_comparison
    if (pickedDate != null) {
      updatetglAktaPerubahanTerakhir(
        DateFormat('dd/MM/yyyy').format(pickedDate).toString(),
      );
    }
  }

  // final tglAktaPerubahanTerakhirController = TextEditingController();
  // void updatetglAktaPerubahanTerakhir(String val) => valueAktaPerubahaan == false
  //     ? tglAktaPerubahanTerakhirController.text = val.trim()
  //     : tglAktaPendirianCvController;

  // final tglSKkumhamPendirianCvController = TextEditingController();

  // void updateTglSKkumhamPendirianCv(String val) =>
  //     tglSKkumhamPendirianCvController.text = val.trim();
  final tglSKkumhamPendirianCvController = TextEditingController();

  void updateTglSKkumhamPendirianCv(String val) {
    tglSKkumhamPendirianCvController.text = val.trim();
  }

  Future selecttglSKkumhamPendirianCv(BuildContext context) async {
    DateTime? pickedDate = await _showingDatePicker(context);
    // ignore: unnecessary_null_comparison
    if (pickedDate != null) {
      updateTglSKkumhamPendirianCv(
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

  // final detailTempatAktaPerubahanTerakhirController = TextEditingController();
  // void updateDetailTempatAktaPerubahanTerakhir(String val) =>
  //     valueAktaPerubahaan == false
  //         ? detailTempatAktaPerubahanTerakhirController.value.copyWith(
  //             text: val,
  //             selection: TextSelection(
  //                 baseOffset: val.length, extentOffset: val.length))
  //         : detailTempatAktaPendirianPerusahaanController;

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

    // ignore: no-boolean-literal-compare
    if (_valueAktaPerubahaan == true) {
      tglAktaPerubahanTerakhirController
        ..text = tglAktaPendirianCvController.text
        ..selection = TextSelection.collapsed(
          offset: tglAktaPerubahanTerakhirController.text.length,
        );

      nomorAktaPerubahanTerakhirController
        ..text = nomorAktaPendirianController.text
        ..selection = TextSelection.collapsed(
          offset: nomorAktaPerubahanTerakhirController.text.length,
        );

      detailTempatAktaPerubahanTerakhirController
        ..text = detailTempatAktaPendirianPerusahaanController.text
        ..selection = TextSelection.collapsed(
          offset: detailTempatAktaPerubahanTerakhirController.text.length,
        );

      // ignore: no-boolean-literal-compare
    } else if (_valueAktaPerubahaan == false) {
      tglAktaPerubahanTerakhirController.clear();
      nomorAktaPerubahanTerakhirController.clear();
      detailTempatAktaPerubahanTerakhirController.clear();
    }
  }

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

  PlatformFile? fotoNpwpPerusahaanCv;
  String? fotoNpwpPerusahaanCvErrorText;
  String? fotoNpwpPerusahaanCvUrl;
  String? fotoNpwpPerusahaanCvPublicUrl;

  Future captureNpwpPerusahaanCv() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingNpwp = true;
      notifyListeners();
      if (_isLoadingNpwp) {
        if (_isImageOrPdf(res.extension!)) {
          fotoNpwpPerusahaanCv = res;
          fotoNpwpPerusahaanCvErrorText = null;
          uploadFileNpwp(fotoNpwpPerusahaanCv!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png, atau pdf!');
        }
      }
    }
  }

  Future clearNpwpPerusahaanCv() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file NPWP Perusahaan ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoNpwpPerusahaanCv = null;
      fotoNpwpPerusahaanCvUrl = null;
      fotoNpwpPerusahaanCvPublicUrl = null;

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
          'Anda yakin akan menghapus file Akta Perubahan Terkahir ini?',
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

  Future captureSKkumhamPerubahaanTerakhir() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingsKkumhamPerubahaanTerakhir = true;
      notifyListeners();
      if (_isLoadingsKkumhamPerubahaanTerakhir) {
        if (_isImageOrPdf(res.extension!)) {
          fotosKkumhamPerubahaanTerakhir = res;
          fotosKkumhamPerubahaanTerakhirErrorText = null;
          uploadFilesKkumhamPerubahaanTerakhir(
            fotosKkumhamPerubahaanTerakhir!,
          );
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
        Routes.tDPPerusahaanCvViewRitel,
        arguments: TDPPerusahaanCvViewRitelArguments(
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
        'informasiPerusahaanCvCompleted': 2,
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

  Future navigateToAddressSelectionViewPerusahaanCv() async {
    _navigationService
        .navigateTo(Routes.addressSelectionView)!
        .then((chosenPlace) {
      if (chosenPlace != null) {
        alamatPerushaanCvController.text = chosenPlace['address'] as String;
        _lat = chosenPlace['lat'] as double;
        _lng = chosenPlace['lng'] as double;
      }
    });
  }

  bool _anyFieldEditedDataDiri() {
    return namaPerusahaanCvController.text.isNotEmpty ||
        nomorNpwpPerusahaanCvController.text.isNotEmpty ||
        /////////////////
        sektorController.text.isNotEmpty ||
        subSektorController.text.isNotEmpty ||
        alamatPerushaanCvController.text.isNotEmpty ||
        detailAlamatPerusahaanController.text.isNotEmpty ||
        detailTempatAktaPendirianPerusahaanController.text.isNotEmpty ||
        detailTempatAktaPerubahanTerakhirController.text.isNotEmpty ||
        postalCodeAlamatPerusahaanCvController.text.isNotEmpty ||
        provinceAlamatPerusahaanController.text.isNotEmpty ||
        cityAlamatPerusahaanController.text.isNotEmpty ||
        districtAlamatPerusahaanCvController.text.isNotEmpty ||
        villageAlamatPerusahaanCvController.text.isNotEmpty ||
        rtAlamatPerusahaanCvController.text.isNotEmpty ||
        rwAlamatPerusahaanCvController.text.isNotEmpty ||
        tglAktaPendirianCvController.text.isNotEmpty ||
        nomorAktaPendirianController.text.isNotEmpty ||
        detailTempatAktaPendirianPerusahaanController.text.isNotEmpty ||
        tglSKkumhamPendirianCvController.text.isNotEmpty ||
        tglSKkumhamPendirianCvController.text.isNotEmpty ||
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
    // ignore: prefer-conditional-expressions
    if ('sadas' == Common.kawin) {
      return fotoAktaPendirianUrl != null &&
          fotoKtpPasanganUrl != null &&
          fotoAktaPerubahaanTerakhirUrl != null;
    } else {
      return fotoNpwpPerusahaanCvUrl != null;
    }
  }

  void _setUploadFilesErrorTextIfAny() {
    if (fotoNpwpPerusahaanCvUrl == null) {
      fotoNpwpPerusahaanCvErrorText = 'Foto Npwp harus diupload';
    }
    // if (fotoAktaPendirian == null) {
    //   fotoAktaPendirianErrorText = 'Foto Akta Pendirian harus diupload';
    // }
    // if (fotoAktaPerubahaanTerakhir == null) {
    //   fotoAktaPerubahaanTerakhirErrorText =
    //       'Foto Akta Perubahan harus diupload';
    // }
    // if ('asdasd' == Common.kawin && fotoKtpPasangan == null) {
    //   fotoKtpPasanganErrorText = 'Foto E-KTP Pasangan harus diupload';
    // }
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
    PipelinePerusahaanCvAPIMethod pipelinePerusahaanCvAPIMethod, {
    bool isContinue = false,
  }) async {
    if (formKey.currentState!.validate() && _validateUploadFiles()) {
      formKey.currentState!.save();

      final response = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.confirmation,
        data: {'title': 'Konfirmasi'},
      );

      if (response != null && response.confirmed) {
        _postData(pipelinePerusahaanCvAPIMethod, isContinue);
      }
    } else {
      autoValidateMode = AutovalidateMode.always;
      _setUploadFilesErrorTextIfAny();
      _showValidationErrorDialog();
      notifyListeners();
    }
  }

  // ignore: long-method
  Future<Map<String, dynamic>> _generateInfoPerusahaanCvMap(
    String action,
  ) async {
    var latLng = '${_lat.toString()}, ${_lng.toString()}';

    return action == 'add'
        ? {
            'companyName': 'CV. ${namaPerusahaanCvController.text.trim()}',
            'companyNpwpNum': nomorNpwpPerusahaanCvController.text.isNotEmpty
                ? nomorNpwpPerusahaanCvController.text.trim()
                : '',
            'economy_sectorsId': _economySectorId ??
                ritelInformasiPerusahaanCv!.economy_sectorsId!,
            'economy_sub_sectorsId': _economySubSectorId ??
                ritelInformasiPerusahaanCv!.economy_sub_sectorsId!,
            'isDeedSame': _valueAktaPerubahaan,
            'partnershipsId': 0,
            'dateOfDeedEst': tglAktaPendirianCvController.text.trim(),
            'deedEstNum': nomorAktaPendirianController.text.trim(),
            'dateOfSkKumham': tglSKkumhamPendirianCvController.text.isEmpty
                ? ''
                : tglSKkumhamPendirianCvController.text.trim(),
            'placeOfDeedEst':
                detailTempatAktaPendirianPerusahaanController.text.trim(),
            // ignore: no-boolean-literal-compare
            'latestDateOfDeed': _valueAktaPerubahaan == true
                ? ''
                : tglAktaPerubahanTerakhirController.text.isEmpty
                    ? ''
                    : tglAktaPerubahanTerakhirController.text.trim(),
            // ignore: no-boolean-literal-compare
            'latestPlaceOfDeed': _valueAktaPerubahaan == true
                ? ''
                : detailTempatAktaPerubahanTerakhirController.text.trim(),
            'latestDateOfSkKumham':
                tglSKkumhamPerubahanTerakhirController.text.trim(),
            'skKumhamNum': nomorSKkumhamPendirianController.text.trim(),
            'latestSkKumhamNum':
                nomorSKkumhamPerubahanTerakhirController.text.trim(),
            // ignore: no-boolean-literal-compare
            'latestDeedNum': _valueAktaPerubahaan == true
                ? ''
                : nomorAktaPerubahanTerakhirController.text.trim(),
            'fullnamePIC': namaLengkapPicController.text.trim(),
            'phoneNumPIC': '+62${noHpPicController.text.trim()}',
            'emailPIC': emailPicController.text.isNotEmpty
                ? emailPicController.text.trim()
                : '',
            'companyNpwpPath':
                fotoNpwpPerusahaanCv != null ? fotoNpwpPerusahaanCvUrl : '',
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
              'latLng': latLng,
              'name': alamatPerushaanCvController.text.trim(),
            },
            'detail': detailAlamatPerusahaanController.text.trim(),
            'postalCode': postalCodeAlamatPerusahaanCvController.text.trim(),
            'province': provinceAlamatPerusahaanController.text.trim(),
            'city': cityAlamatPerusahaanController.text.trim(),
            'district': districtAlamatPerusahaanCvController.text.trim(),
            'village': villageAlamatPerusahaanCvController.text.trim(),
            'rt': rtAlamatPerusahaanCvController.text.isNotEmpty
                ? rtAlamatPerusahaanCvController.text.trim()
                : '',
            'rw': rwAlamatPerusahaanCvController.text.isNotEmpty
                ? rwAlamatPerusahaanCvController.text.trim()
                : '',
          }
        : {
            'companyName': 'CV. ${namaPerusahaanCvController.text.trim()}',
            'companyNpwpNum': nomorNpwpPerusahaanCvController.text.isNotEmpty
                ? nomorNpwpPerusahaanCvController.text.trim()
                : '',
            'economy_sectorsId': _economySectorId ??
                ritelInformasiPerusahaanCv!.economy_sectorsId!,
            'economy_sub_sectorsId': _economySubSectorId ??
                ritelInformasiPerusahaanCv!.economy_sub_sectorsId!,
            'isDeedSame': _valueAktaPerubahaan,
            'partnershipsId': 0,
            'dateOfDeedEst': tglAktaPendirianCvController.text.trim(),
            'deedEstNum': nomorAktaPendirianController.text.trim(),
            'dateOfSkKumham': tglSKkumhamPendirianCvController.text.isEmpty
                ? ''
                : tglSKkumhamPendirianCvController.text.trim(),
            'placeOfDeedEst':
                detailTempatAktaPendirianPerusahaanController.text.trim(),
            // ignore: no-boolean-literal-compare
            'latestDateOfDeed': _valueAktaPerubahaan == true
                ? ''
                : tglAktaPerubahanTerakhirController.text.isEmpty
                    ? ''
                    : tglAktaPerubahanTerakhirController.text.trim(),
            'latestPlaceOfDeed': _valueAktaPerubahaan
                ? ''
                : detailTempatAktaPerubahanTerakhirController.text.trim(),
            // ignore: no-boolean-literal-compare
            'latestDeedNum': _valueAktaPerubahaan == true
                ? ''
                : nomorAktaPerubahanTerakhirController.text.trim(),
            'latestDateOfSkKumham':
                tglSKkumhamPerubahanTerakhirController.text.trim(),
            'skKumhamNum': nomorSKkumhamPendirianController.text.trim(),
            'latestSkKumhamNum':
                nomorSKkumhamPerubahanTerakhirController.text.trim(),
            'fullnamePIC': namaLengkapPicController.text.trim(),
            'phoneNumPIC': '+62${noHpPicController.text.trim()}',
            'emailPIC': emailPicController.text.isNotEmpty
                ? emailPicController.text.trim()
                : '',
            'companyNpwpPath': fotoNpwpPerusahaanCvUrl ??
                ritelInformasiPerusahaanCv!.companyNpwpPath!,
            'deedEstPath':
                fotoAktaPendirianPublicUrl != null ? fotoAktaPendirianUrl : '',
            'latestDeedPath': fotoAktaPerubahaanTerakhirPublicUrl != null
                ? fotoAktaPerubahaanTerakhirUrl
                : '',
            'skKumhamPath': fotosKkumhamPendirianPublicUrl != null
                ? fotosKkumhamPendirianUrl
                : '',
            'latestSkKumhamPath':
                fotosKkumhamPerubahaanTerakhirPublicUrl != null
                    ? fotosKkumhamPerubahaanTerakhirUrl
                    : '',
            'tagLocation': {
              'latLng': latLng,
              'name': alamatPerushaanCvController.text.trim(),
            },
            'detail': detailAlamatPerusahaanController.text.trim(),
            'postalCode': postalCodeAlamatPerusahaanCvController.text.trim(),
            'province': provinceAlamatPerusahaanController.text.trim(),
            'city': cityAlamatPerusahaanController.text.trim(),
            'district': districtAlamatPerusahaanCvController.text.trim(),
            'village': villageAlamatPerusahaanCvController.text.trim(),
            'rt': rtAlamatPerusahaanCvController.text.isNotEmpty
                ? rtAlamatPerusahaanCvController.text.trim()
                : '',
            'rw': rwAlamatPerusahaanCvController.text.isNotEmpty
                ? rwAlamatPerusahaanCvController.text.trim()
                : '',
          };
  }

  Future _postData(
    PipelinePerusahaanCvAPIMethod pipelinePerusahaanCvAPIMethod,
    bool isContinue,
  ) async {
    switch (pipelinePerusahaanCvAPIMethod) {
      case PipelinePerusahaanCvAPIMethod.addInformasiPerusahaanCv:
        final infoPeruhsaanCvMap = await _generateInfoPerusahaanCvMap('add');

        final res = await runBusyFuture(_ritelPipelinePerusahaanCvAPI
            .addInformasiPerusahaanCv(infoPeruhsaanCvMap));

        res.fold(
          (errorMessage) {
            _showErrorDialog(errorMessage);
            notifyListeners();
          },
          (successMap) {
            pipelineId = successMap['id'] as String;

            if (!_localDBService.perusahaanCvFlagBoxIsNotEmpty()) {
              _localDBService.storePerusahaanCvFlag(
                {
                  'informasi_perusahaan_cv': 2,
                  'debiturName': namaPerusahaanCvController.text.trim(),
                },
              );
            } else {
              _localDBService.replacePerusahaanCvFlag(
                {
                  'informasi_perusahaan_cv': 2,
                  'debiturName': namaPerusahaanCvController.text.trim(),
                },
              );
            }
            _showSuccessDialog(
              successMessage: 'Berhasil menambahkan informasi perusahaan CV!',
              isContinue: true,
            );
            notifyListeners();
          },
        );
        break;

      case PipelinePerusahaanCvAPIMethod.updateInformasiPerusahaanCv:
        final infoPerusahaanCvMap =
            await _generateInfoPerusahaanCvMap('update');

        final res = await runBusyFuture(
          _ritelPipelinePerusahaanCvAPI.updateInformasiPerusahaanCv(
            payload: infoPerusahaanCvMap,
            id: pipelineId!,
          ),
        );

        res.fold(
          (errorMessage) {
            _showErrorDialog(errorMessage);
            notifyListeners();
          },
          (successMap) {
            if (!_localDBService.perusahaanCvFlagBoxIsNotEmpty()) {
              _localDBService.storePerusahaanCvFlag(
                {
                  'informasi_perusahaan_cv': 2,
                  'debiturName': namaPerusahaanCvController.text.trim(),
                },
              );
            } else {
              final getPipelineFlag = _localDBService.getPerusahaanCvFlag();
              if (getPipelineFlag!['informasi_pengurus'] == 2 &&
                  getPipelineFlag['informasi_lainnya'] == 2) {
                _localDBService.replacePerusahaanCvFlag(
                  {
                    'informasi_perusahaan_cv': 2,
                    'informasi_pengurus': 2,
                    'informasi_lainnya': 2,
                    'debiturName': namaPerusahaanCvController.text.trim(),
                  },
                );
              } else if (getPipelineFlag['informasi_pengurus'] == 2) {
                _localDBService.replacePerusahaanCvFlag(
                  {
                    'informasi_perusahaan_cv': 2,
                    'informasi_pengurus': 2,
                    'debiturName': namaPerusahaanCvController.text.trim(),
                  },
                );
              } else if (getPipelineFlag['informasi_lainnya'] == 2) {
                _localDBService.storePerusahaanCvFlag(
                  {
                    'informasi_perusahaan_cv': 2,
                    'informasi_pengurus': 2,
                    'informasi_lainnya': 2,
                    'debiturName': namaPerusahaanCvController.text.trim(),
                  },
                );
              } else {
                _localDBService.replacePerusahaanCvFlag(
                  {
                    'informasi_perusahaan_cv': 2,
                    'debiturName': namaPerusahaanCvController.text.trim(),
                  },
                );
              }
            }
            _showSuccessDialog(
              successMessage: 'Berhasil mengubah informasi perusahaan CV!',
              isContinue: true,
            );
            notifyListeners();
          },
        );
        break;
      case PipelinePerusahaanCvAPIMethod.addPengurusCv:
        break;
      case PipelinePerusahaanCvAPIMethod.updatePengurusCv:
        break;
      case PipelinePerusahaanCvAPIMethod.addLainnya:
        break;
      case PipelinePerusahaanCvAPIMethod.updateLainnya:
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
        fotoNpwpPerusahaanCvUrl = url;
        fotoNpwpPerusahaanCvPublicUrl = await _getPublicFile(url);

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

  Future uploadFileKtpPasangan(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) {
        _isLoadingKtpPasangan = false;
        fotoKtpPasanganUrl = url;
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
    return (type == 'pdf' || type == 'jpg' || type == 'png' || type == 'jpeg');
  }
}

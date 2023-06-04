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
import '../../../../../../application/helpers/job_code_formatter.dart';
import '../../../../../../application/models/place_of_birth.dart';
import '../../../../../../application/models/ritel_list_informasi_pengurus_pemilik_cv.dart';
import '../../../../../../application/models/ritel_postal_code.dart';
import '../../../../../../application/services/media_service.dart';
import '../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../infrastructure/apis/ritel_pipeline_perusahaan_cv_api.dart';
import '../../../../../../infrastructure/apis/ritel_upload_file_api.dart';

class InformasiPengurusCvViewModel extends BaseViewModel {
  String? pipelineId;
  RitelListInformasiPengurusPemilikCV? ritelInformasiPengurusCv;
  // bool fromTdpPerusahaanCvView;
  bool? fromPipelineDetailsView;
  int? statusPipeline;
  int pengurusCvIndex = 0;

  InformasiPengurusCvViewModel({
    this.pipelineId,
    this.ritelInformasiPengurusCv,
    // required this.fromTdpPerusahaanCvView,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  });

  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final RitelUploadFileAPI _ritelUploadFileAPI = locator<RitelUploadFileAPI>();
  final RitelPipelinePerusahaanCvAPI _ritelPipelinePerusahaanCvAPI =
      locator<RitelPipelinePerusahaanCvAPI>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();
  final MaksimaMediaService _mediaService = locator<MaksimaMediaService>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  Future initialize() async {
    setBusy(true);
    await getListPengurusPemilikPipeline();
    if (ritelInformasiPengurusCv != null) {
      await _prepopulateTextFields();
      await _prepopulateImages();
    }
    await getPlaceOfBirthPengurusCv();
    await getPlaceOfBirthPasanganCv();

    setBusy(false);
  }

  // PlatformPlatformFile? test;
  List<RitelListInformasiPengurusPemilikCV> _ritelListPengurusPerusahaanModel =
      [];
  List<RitelListInformasiPengurusPemilikCV>
      get ritelListPengurusPerusahaanModel => _ritelListPengurusPerusahaanModel;

  Future getListPengurusPemilikPipeline() async {
    final res = await _ritelPipelinePerusahaanCvAPI
        .getListPengurusPemilikCvPipelineAPI(pipelineId!, 2);

    res.fold(
      (error) {
        dev.log(error);
      },
      (result) {
        final listPengurus = List<RitelListInformasiPengurusPemilikCV>.from(
          result.map(
            (i) => RitelListInformasiPengurusPemilikCV.fromJson(
              i as Map<String, dynamic>,
            ),
          ),
        );
        _ritelListPengurusPerusahaanModel = listPengurus;
      },
    );
  }

  // =============== Group Place of Birth =============== //
  List<PlaceOfBirth> _placeOfBirthPengurusCv = [];

  List<PlaceOfBirth> get placeOfbirthPengurusCv => _placeOfBirthPengurusCv;

  Future updatePlaceOfBirth(PlaceOfBirth placeOfbirthPengurusCv) async {
    tempatLahirPengurusCvController.text = placeOfbirthPengurusCv.city!.trim();

    notifyListeners();
  }

  Future getPlaceOfBirthPengurusCv() async {
    final res = await _ritelMasterAPI
        .getPlaceOfBirthAPI(tempatLahirPengurusCvController.text);

    res.fold(
      (error) {
        dev.log(error);
      },
      (result) {
        _placeOfBirthPengurusCv = result;
      },
    );
  }

  List<PlaceOfBirth> filterPlaceOfBirthPengurusCv(String query) {
    return _placeOfBirthPengurusCv
        .where((element) => element.city!.toLowerCase().contains(query))
        .toList();
  }

  void clearPlaceOfBirthPengurusCv() {
    tempatLahirPengurusCvController.clear();
    getPlaceOfBirthPengurusCv();
    notifyListeners();
  }

  // =============== Group Place of Birth Pengurus Cv =============== //
  List<PlaceOfBirth> _placeOfBirthPasanganCv = [];

  List<PlaceOfBirth> get placeOfbirthPasanganCv => _placeOfBirthPasanganCv;

  Future updatePlaceOfBirthPasanganCv(
    PlaceOfBirth placeOfbirthPasanganCv,
  ) async {
    tempatLahirPasanganController.text = placeOfbirthPasanganCv.city!.trim();

    notifyListeners();
  }

  Future getPlaceOfBirthPasanganCv() async {
    final res = await _ritelMasterAPI
        .getPlaceOfBirthAPI(tempatLahirPasanganController.text);

    res.fold(
      (error) {
        dev.log(error);
      },
      (result) {
        _placeOfBirthPasanganCv = result;
      },
    );
  }

  List<PlaceOfBirth> filterPlaceOfBirthPasanganCv(String query) {
    return _placeOfBirthPasanganCv
        .where((element) => element.city!.toLowerCase().contains(query))
        .toList();
  }

  void clearPlaceOfBirthPasanganCv() {
    tempatLahirPasanganController.clear();
    getPlaceOfBirthPasanganCv();
    notifyListeners();
  }

  void changePengurusCvIndex(int index) {
    pengurusCvIndex = index;
    fotoKtpPengurusCvUrl = '';
    fotoKtpPengurusCv = null;
    fotoKtpSelfieUrl = '';
    fotoKtpSelfie = null;
    fotoNpwpDebiturUrl = '';
    fotoNpwpDebitur = null;
    fotoKartuKeluargaUrl = '';
    fotoKartuKeluarga = null;
    fotoKtpPasanganUrl = '';
    fotoKtpPasangan = null;
    fotoAktaNikahUrl = '';
    fotoAktaNikah = null;
    fotoAktaCeraiUrl = '';
    fotoAktaCerai = null;
    suratKematianUrl = '';
    suratKematian = null;
    notifyListeners();
    _prepopulateTextFields();
    _prepopulateImages();
  }

  // ignore: long-method
  Future _prepopulateTextFields() async {
    namaPengurusCvController
      ..text = ritelInformasiPengurusCv?.fullName ?? ''
      ..selection =
          TextSelection.collapsed(offset: namaPengurusCvController.text.length);

    if (ritelInformasiPengurusCv?.jobCode != null) {
      posisiPengurusCvController
        ..text = JobCodeFormatter.forOutput(
          ritelInformasiPengurusCv!.jobCode!,
        )
        ..selection = TextSelection.collapsed(
          offset: posisiPengurusCvController.text.length,
        );
    } else {
      posisiPengurusCvController
        ..text = JobCodeFormatter.forOutput(
          ritelInformasiPengurusCv?.jobCode != null
              ? ritelInformasiPengurusCv!.jobCode!
              : null,
        )
        ..selection = TextSelection.collapsed(
          offset: posisiPengurusCvController.text.length,
        );
    }

    nomorKtpPengurusCvController
      ..text = ritelInformasiPengurusCv?.ktpNum ?? ''
      ..selection = TextSelection.collapsed(
        offset: nomorKtpPengurusCvController.text.length,
      );

    nomorNpwpPengurusCvController
      ..text = ritelInformasiPengurusCv?.npwpNum ?? ''
      ..selection = TextSelection.collapsed(
        offset: nomorNpwpPengurusCvController.text.length,
      );

    jenisKelaminPengurusCvController
      ..text = ritelInformasiPengurusCv?.gender ?? ''
      ..selection = TextSelection.collapsed(
        offset: jenisKelaminPengurusCvController.text.length,
      );
    if (ritelInformasiPengurusCv?.placeOfBirth != null) {
      tempatLahirPengurusCvController
        ..text = ritelInformasiPengurusCv?.placeOfBirth ?? ''
        ..selection = TextSelection.collapsed(
          offset: tempatLahirPengurusCvController.text.length,
        );
    } else {
      tempatLahirPengurusCvController.clear();
      getPlaceOfBirthPengurusCv();
    }

    tglLahirPengurusCvController.text =
        ritelInformasiPengurusCv?.dateOfBirth != null
            ? DateStringFormatter.forInput(
                ritelInformasiPengurusCv!.dateOfBirth!,
              )
            : '';

    statusPerkawinanController
      ..text = ritelInformasiPengurusCv?.maritalStatus ?? ''
      ..selection = TextSelection.collapsed(
        offset: statusPerkawinanController.text.length,
      );

    alamatPengurusCvController
      ..text = ritelInformasiPengurusCv?.tagLocation?.name ?? ''
      ..selection = TextSelection.collapsed(
        offset: alamatPengurusCvController.text.length,
      );

    detailAlamatPengurusCvController
      ..text = ritelInformasiPengurusCv?.detail ?? ''
      ..selection = TextSelection.collapsed(
        offset: detailAlamatPengurusCvController.text.length,
      );

    postalCodeAlamatPengurusController
      ..text = ritelInformasiPengurusCv?.postalCode ?? ''
      ..selection = TextSelection.collapsed(
        offset: postalCodeAlamatPengurusController.text.length,
      );

    provinceAlamatPengurusCvController
      ..text = ritelInformasiPengurusCv?.province ?? ''
      ..selection = TextSelection.collapsed(
        offset: provinceAlamatPengurusCvController.text.length,
      );

    cityAlamatPengurusCvController
      ..text = ritelInformasiPengurusCv?.city ?? ''
      ..selection = TextSelection.collapsed(
        offset: cityAlamatPengurusCvController.text.length,
      );

    districtAlamatPengurusCvController
      ..text = ritelInformasiPengurusCv?.district ?? ''
      ..selection = TextSelection.collapsed(
        offset: districtAlamatPengurusCvController.text.length,
      );

    villageAlamatPengurusCvController
      ..text = ritelInformasiPengurusCv?.village ?? ''
      ..selection = TextSelection.collapsed(
        offset: villageAlamatPengurusCvController.text.length,
      );

    rtAlamatPengurusCvController
      ..text = ritelInformasiPengurusCv?.rt ?? ''
      ..selection = TextSelection.collapsed(
        offset: rtAlamatPengurusCvController.text.length,
      );

    rwAlamatPengurusCvController
      ..text = ritelInformasiPengurusCv?.rw ?? ''
      ..selection = TextSelection.collapsed(
        offset: rwAlamatPengurusCvController.text.length,
      );

    final splitWithout62 = ritelInformasiPengurusCv?.phoneNum?.split('+62');
    noHpPengurusCvController
      ..text = splitWithout62?[1] ?? ''
      // ..text = ritelInformasiPengurusCv?.phoneNum ?? ''
      ..selection =
          TextSelection.collapsed(offset: noHpPengurusCvController.text.length);

    emailPengurusCvController
      ..text = ritelInformasiPengurusCv?.email ?? ''
      ..selection = TextSelection.collapsed(
        offset: emailPengurusCvController.text.length,
      );

    if (ritelInformasiPengurusCv?.maritalStatus == Common.kawin &&
        (ritelInformasiPengurusCv?.spouseKtpNum ?? '').isNotEmpty) {
      nomorKtpPasanganController
        ..text = ritelInformasiPengurusCv?.spouseKtpNum ?? ''
        ..selection = TextSelection.collapsed(
          offset: nomorKtpPasanganController.text.length,
        );

      namaLengkapPasanganController
        ..text = ritelInformasiPengurusCv?.spouseFullname ?? ''
        ..selection = TextSelection.collapsed(
          offset: namaLengkapPasanganController.text.length,
        );

      tempatLahirPasanganController
        ..text = ritelInformasiPengurusCv?.spousePlaceOfBirth ?? ''
        ..selection = TextSelection.collapsed(
          offset: tempatLahirPasanganController.text.length,
        );

      tglLahirPasanganController.text = DateStringFormatter.forInput(
        ritelInformasiPengurusCv?.spouseDateOfBirth ?? '',
      );
    } else {
      nomorKtpPasanganController
        ..text = ''
        ..selection = TextSelection.collapsed(
          offset: nomorKtpPasanganController.text.length,
        );
      namaLengkapPasanganController
        ..text = ''
        ..selection = TextSelection.collapsed(
          offset: namaLengkapPasanganController.text.length,
        );
      tempatLahirPasanganController
        ..text = ''
        ..selection = TextSelection.collapsed(
          offset: tempatLahirPasanganController.text.length,
        );
      tglLahirPasanganController.text = '';
      getPlaceOfBirthPasanganCv();
    }

    nomorKKController
      ..text = ritelInformasiPengurusCv?.ktpNum ?? ''
      ..selection =
          TextSelection.collapsed(offset: nomorKKController.text.length);
  }

  Future _prepopulateImages() async {
    if (ritelInformasiPengurusCv?.ktpPath != null &&
        (ritelInformasiPengurusCv?.ktpPath ?? '').isNotEmpty) {
      fotoKtpPengurusCvUrl = ritelInformasiPengurusCv!.ktpPath!;
      fotoKtpPengurusCvPublicUrl = await _getPublicFile(
        ritelInformasiPengurusCv!.ktpPath!,
      );
      notifyListeners();
    } else {
      fotoKtpPengurusCvPublicUrl = null;
    }
    if (ritelInformasiPengurusCv?.ktpSelfiePath != null &&
        (ritelInformasiPengurusCv?.ktpSelfiePath ?? '').isNotEmpty) {
      fotoKtpSelfieUrl = ritelInformasiPengurusCv!.ktpSelfiePath!;
      fotoKtpSelfiePublicUrl = await _getPublicFile(
        ritelInformasiPengurusCv!.ktpSelfiePath!,
      );
      notifyListeners();
    } else {
      fotoKtpSelfiePublicUrl = null;
    }
    if (ritelInformasiPengurusCv?.npwpPath != null &&
        (ritelInformasiPengurusCv?.npwpPath ?? '').isNotEmpty) {
      fotoNpwpDebiturUrl = ritelInformasiPengurusCv!.npwpPath!;
      fotoNpwpDebiturPublicUrl = await _getPublicFile(
        ritelInformasiPengurusCv!.npwpPath!,
      );
      notifyListeners();
    } else {
      fotoNpwpDebiturPublicUrl = null;
    }
    if (ritelInformasiPengurusCv?.kkPath != null &&
        (ritelInformasiPengurusCv?.kkPath ?? '').isNotEmpty) {
      fotoKartuKeluargaUrl = ritelInformasiPengurusCv!.kkPath!;
      fotoKartuKeluargaPublicUrl = await _getPublicFile(
        ritelInformasiPengurusCv!.kkPath!,
      );
      notifyListeners();
    } else {
      fotoKartuKeluargaPublicUrl = null;
    }
    if (ritelInformasiPengurusCv?.maritalStatus == Common.kawin &&
        ritelInformasiPengurusCv?.spouseKtpPath != null &&
        (ritelInformasiPengurusCv?.spouseKtpPath ?? '').isNotEmpty) {
      fotoKtpPasanganUrl = ritelInformasiPengurusCv!.spouseKtpPath!;
      fotoKtpPasanganPublicUrl = await _getPublicFile(
        ritelInformasiPengurusCv!.spouseKtpPath!,
      );
      notifyListeners();
    } else {
      fotoKtpPasanganPublicUrl = null;
    }

    if (ritelInformasiPengurusCv?.maritalStatus == Common.kawin &&
        ritelInformasiPengurusCv?.marriagePath != null &&
        (ritelInformasiPengurusCv?.marriagePath ?? '').isNotEmpty) {
      fotoAktaNikahUrl = ritelInformasiPengurusCv!.marriagePath!;
      fotoAktaNikahPublicUrl = await _getPublicFile(
        ritelInformasiPengurusCv!.marriagePath!,
      );
      notifyListeners();
    } else {
      fotoAktaNikahPublicUrl = null;
    }
    if (ritelInformasiPengurusCv?.maritalStatus == Common.ceraiHidup &&
        ritelInformasiPengurusCv?.divorcePath != null &&
        (ritelInformasiPengurusCv?.divorcePath ?? '').isNotEmpty) {
      fotoAktaCeraiUrl = ritelInformasiPengurusCv!.divorcePath!;
      fotoAktaCeraiPublicUrl = await _getPublicFile(
        ritelInformasiPengurusCv!.divorcePath!,
      );
      notifyListeners();
    } else {
      fotoAktaCeraiPublicUrl = null;
    }
    if (ritelInformasiPengurusCv?.maritalStatus == Common.ceraiMati &&
        ritelInformasiPengurusCv?.deathCertificatePath != null &&
        (ritelInformasiPengurusCv?.deathCertificatePath ?? '').isNotEmpty) {
      suratKematianUrl = ritelInformasiPengurusCv!.deathCertificatePath!;
      suratKematianPublicUrl = await _getPublicFile(
        ritelInformasiPengurusCv!.deathCertificatePath!,
      );
      notifyListeners();
    } else {
      suratKematianPublicUrl = null;
    }
  }

  Future updateKelurahan(RitelPostalCode ritelPostalCode) async {
    villageAlamatPengurusCvController.text = ritelPostalCode.village!.trim();

    notifyListeners();
  }

  List<RitelPostalCode> filterKelurahan(String query) {
    List<RitelPostalCode> temp = [];

    for (var i = 0; i < _ritelPostalCodeSecond.length; i++) {
      if (districtAlamatPengurusCvController.text
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
    villageAlamatPengurusCvController.clear();

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

        _ritelPostalCode = postalCode;

        provinceAlamatPengurusCvController.text =
            _ritelPostalCode[0].province.toString();
        cityAlamatPengurusCvController.text =
            _ritelPostalCode[0].city.toString();
      },
    );
  }

  Future updateKodePos(RitelPostalCode ritelPostalCode) async {
    provinceAlamatPengurusCvController.text = ritelPostalCode.province!;
    cityAlamatPengurusCvController.text = ritelPostalCode.city!;
    districtAlamatPengurusCvController.text = ritelPostalCode.district!;

    notifyListeners();
  }

  void clearPostalCode() {
    postalCodeAlamatPengurusController.clear();
    provinceAlamatPengurusCvController.clear();
    cityAlamatPengurusCvController.clear();
    districtAlamatPengurusCvController.clear();
    villageAlamatPengurusCvController.clear();

    notifyListeners();
  }

  double? _lat;
  double? _lng;

  final namaPengurusCvController = TextEditingController();

  void updateNamaPengurusCv(String val) =>
      namaPengurusCvController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final posisiPengurusCvController = TextEditingController();

  void updatePosisiPengurusCv(String val) {
    posisiPengurusCvController.text = val;
    notifyListeners();
  }

  final nomorKtpPengurusCvController = TextEditingController();

  void updateNomorKTPpengurusCv(String val) =>
      nomorKtpPengurusCvController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final nomorNpwpPengurusCvController = TextEditingController();

  void updateNomorNpwpPengurusCv(String val) =>
      nomorNpwpPengurusCvController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final jenisKelaminPengurusCvController = TextEditingController();

  void updateJenisKelaminPengurusCv(String val) {
    jenisKelaminPengurusCvController.text = val;
    notifyListeners();
  }

  final tempatLahirPengurusCvController = TextEditingController();

  void updateTempatLahirPengurusCv(String val) =>
      tempatLahirPengurusCvController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final tglLahirPengurusCvController = TextEditingController();

  void updateTglLahirPengurusCv(String val) =>
      tglLahirPengurusCvController.text = val.trim();

  Future selecttglLahirPengurusCv(BuildContext context) async {
    DateTime? pickedDate = await _showingDatePicker(context);
    // ignore: unnecessary_null_comparison
    if (pickedDate != null) {
      updateTglLahirPengurusCv(
        DateFormat('dd/MM/yyyy').format(pickedDate).toString(),
      );
    }
  }

  Future selecttglLahirPasangan(BuildContext context) async {
    DateTime? pickedDate = await _showingDatePicker(context);
    // ignore: unnecessary_null_comparison
    if (pickedDate != null) {
      updateTglLahirPasangan(
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

  final alamatPengurusCvController = TextEditingController();

  void updateAlamatPengurusCv(String val) =>
      alamatPengurusCvController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final detailAlamatPengurusCvController = TextEditingController();

  void updateDetailAlamatPengurusCv(String val) =>
      detailAlamatPengurusCvController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final postalCodeAlamatPengurusController = TextEditingController();

  void updatePostalCodeAlamatPengurus(String val) {
    postalCodeAlamatPengurusController.value.copyWith(
      text: val,
      selection: TextSelection(
        baseOffset: val.length,
        extentOffset: val.length,
      ),
    );
    provinceAlamatPengurusCvController.clear();
    cityAlamatPengurusCvController.clear();
    // districtAlamatPengurusCvController.clear();
    getKodePos(postalCodeAlamatPengurusController.text);
  }

  final provinceAlamatPengurusCvController = TextEditingController();

  void updateProvinceAlamatPengurusCv(String val) =>
      provinceAlamatPengurusCvController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final cityAlamatPengurusCvController = TextEditingController();

  void updateCityAlamatPengurusCv(String val) =>
      cityAlamatPengurusCvController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final districtAlamatPengurusCvController = TextEditingController();

  void clearKecamatan() {
    districtAlamatPengurusCvController.clear();
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
    districtAlamatPengurusCvController.text = ritelPostalCode.district!.trim();
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

  final villageAlamatPengurusCvController = TextEditingController();

  void updateVillageAlamatPengurusCv(String val) =>
      villageAlamatPengurusCvController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final rtAlamatPengurusCvController = TextEditingController();

  void updateRtAlamatPengurusCv(String val) =>
      rtAlamatPengurusCvController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final rwAlamatPengurusCvController = TextEditingController();

  void updateRwAlamatPengurusCv(String val) =>
      rwAlamatPengurusCvController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final noHpPengurusCvController = TextEditingController();

  void updateNoHpPengurusCv(String val) =>
      noHpPengurusCvController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final emailPengurusCvController = TextEditingController();

  void updateEmailPengurusCv(String val) =>
      emailPengurusCvController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final nomorKtpPasanganController = TextEditingController();

  void updateNomorKtpPasangan(String val) =>
      nomorKtpPasanganController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final namaLengkapPasanganController = TextEditingController();

  void updateNamaLengkapPasangan(String val) =>
      namaLengkapPasanganController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final tempatLahirPasanganController = TextEditingController();

  void updateTempatLahirPasangan(String val) =>
      tempatLahirPasanganController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );
  final tglLahirPasanganController = TextEditingController();

  void updateTglLahirPasangan(String val) =>
      tglLahirPasanganController.text = val.trim();

  final nomorKKController = TextEditingController();

  void updateNomorKK(String val) => nomorKKController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  bool _isLoadingKtpPengurusCv = false;

  bool get isLoadingKtpPengurusCv => _isLoadingKtpPengurusCv;
  bool _isLoadingSelfieKtp = false;

  bool get isLoadingSelfieKtp => _isLoadingSelfieKtp;
  bool _isLoadingNpwp = false;

  bool get isLoadingNpwp => _isLoadingNpwp;
  bool _isLoadingKk = false;

  bool get isLoadingKk => _isLoadingKk;
  bool _isLoadingKtpPasangan = false;

  bool get isLoadingKtpPasangan => _isLoadingKtpPasangan;
  bool _isLoadingAktaNikah = false;

  bool get isLoadingAktaNikah => _isLoadingAktaNikah;
  bool _isLoadingAktaCerai = false;

  bool get isLoadingAktaCerai => _isLoadingAktaCerai;
  bool _isLoadingSertiKematian = false;

  bool get isLoadingSertiKematian => _isLoadingSertiKematian;

  PlatformFile? fotoKtpPengurusCv;
  String? fotoKtpPengurusCvErrorText;
  String? fotoKtpPengurusCvUrl;
  String? fotoKtpPengurusCvPublicUrl;

  Future captureKtpPengurusCv() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingKtpPengurusCv = true;
      notifyListeners();
      if (_isLoadingKtpPengurusCv) {
        if (_isImageOrPdf(res.extension!)) {
          fotoKtpPengurusCv = res;
          fotoKtpPengurusCvErrorText = null;
          uploadFileKtpPengurusCv(fotoKtpPengurusCv!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png, atau pdf!');
        }
      }
    }
  }

  Future clearKtpPengurusCv() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file E-KTP ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoKtpPengurusCv = null;
      fotoKtpPengurusCvUrl = null;
      fotoKtpPengurusCvPublicUrl = null;
      notifyListeners();
    }
  }

  PlatformFile? suratKematian;
  String? suratKematianErrorText;
  String? suratKematianUrl;
  String? suratKematianPublicUrl;

  Future captureSuratKematian() async {
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
              'File yang diperbolehkan hanya jpg, jpeg, png, atau pdf!');
          _isLoadingSertiKematian = false;
          notifyListeners();
        }
      }
    }
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
      suratKematianUrl = null;
      suratKematianPublicUrl = null;
      notifyListeners();
    }
  }

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

  Future captureKtpPasangan() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingKtpPasangan = true;
      notifyListeners();
      if (_isLoadingKtpPasangan) {
        fotoKtpPasangan = res;
        fotoKtpPasanganErrorText = null;
        uploadFileKtpPasangan(fotoKtpPasangan!);
        notifyListeners();
      } else {
        _showErrorDialog(
            'File yang diperbolehkan hanya jpg, jpeg, png, atau pdf!');
        _isLoadingSertiKematian = false;
        notifyListeners();
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
      fotoKtpPasanganUrl = null;
      fotoKtpPasanganPublicUrl = null;

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
          _isLoadingSertiKematian = false;
          notifyListeners();
        }
      }
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

  PlatformFile? fotoKartuKeluarga;
  String? fotoKartuKeluargaErrorText;
  String? fotoKartuKeluargaUrl;
  String? fotoKartuKeluargaPublicUrl;

  Future captureKartuKeluargaDebitur() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingKk = true;
      notifyListeners();
      if (_isLoadingKk) {
        if (_isImageOrPdf(res.extension!)) {
          fotoKartuKeluarga = res;
          fotoKartuKeluargaErrorText = null;
          uploadFileKK(fotoKartuKeluarga!);
          notifyListeners();
        } else {
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png, atau pdf!');
          _isLoadingSertiKematian = false;
          notifyListeners();
        }
      }
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
      fotoKartuKeluarga = null;
      fotoKartuKeluargaUrl = null;
      fotoKartuKeluargaPublicUrl = null;

      notifyListeners();
    }
  }

  PlatformFile? fotoKtpSelfie;
  String? fotoKtpSelfieErrorText;
  String? fotoKtpSelfieUrl;
  String? fotoKtpSelfiePublicUrl;

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
              'File yang diperbolehkan hanya jpg, jpeg, png, atau pdf!');
          _isLoadingSertiKematian = false;
          notifyListeners();
        }
      }
    }
  }

  Future clearKtpSelfie() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description:
          'Anda yakin akan menghapus file foto pengurus bersama E-KTP ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoKtpSelfie = null;
      fotoKtpSelfieUrl = null;
      fotoKtpSelfiePublicUrl = null;

      notifyListeners();
    }
  }

  PlatformFile? fotoAktaCerai;
  String? fotoAktaCeraiErrorText;
  String? fotoAktaCeraiUrl;
  String? fotoAktaCeraiPublicUrl;

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
              'File yang diperbolehkan hanya jpg, jpeg, png, atau pdf!');
          _isLoadingSertiKematian = false;
          notifyListeners();
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
      fotoAktaCeraiUrl = null;
      fotoAktaCeraiPublicUrl = null;

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
      _navigationService.navigateTo(
        Routes.informasiPengurusPemilikBoardCvView,
        arguments: InformasiPengurusPemilikBoardCvViewArguments(
          pipelineId: pipelineId,
        ),
      );
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

  Future navigateToAddressSelectionViewPengurusCv() async {
    _navigationService
        .navigateTo(Routes.addressSelectionView)!
        .then((chosenPlace) {
      if (chosenPlace != null) {
        alamatPengurusCvController.text = chosenPlace['address'] as String;
        _lat = chosenPlace['lat'] as double;
        _lng = chosenPlace['lng'] as double;
      }
    });
  }

  bool _anyFieldEditedDataDiri() {
    return namaPengurusCvController.text.isNotEmpty ||
        posisiPengurusCvController.text.isNotEmpty ||
        nomorKtpPengurusCvController.text.isNotEmpty ||
        nomorNpwpPengurusCvController.text.isNotEmpty ||
        jenisKelaminPengurusCvController.text.isNotEmpty ||
        tempatLahirPengurusCvController.text.isNotEmpty ||
        tglLahirPengurusCvController.text.isNotEmpty ||
        statusPerkawinanController.text.isNotEmpty ||
        alamatPengurusCvController.text.isNotEmpty ||
        detailAlamatPengurusCvController.text.isNotEmpty ||
        postalCodeAlamatPengurusController.text.isNotEmpty ||
        provinceAlamatPengurusCvController.text.isNotEmpty ||
        cityAlamatPengurusCvController.text.isNotEmpty ||
        districtAlamatPengurusCvController.text.isNotEmpty ||
        villageAlamatPengurusCvController.text.isNotEmpty ||
        rtAlamatPengurusCvController.text.isNotEmpty ||
        rwAlamatPengurusCvController.text.isNotEmpty ||
        noHpPengurusCvController.text.isNotEmpty ||
        emailPengurusCvController.text.isNotEmpty ||
        (statusPerkawinanController.text == Common.kawin &&
            nomorKtpPasanganController.text.isNotEmpty) ||
        (statusPerkawinanController.text == Common.kawin &&
            namaLengkapPasanganController.text.isNotEmpty) ||
        (statusPerkawinanController.text == Common.kawin &&
            tglLahirPasanganController.text.isNotEmpty) ||
        (statusPerkawinanController.text == Common.kawin &&
            tempatLahirPasanganController.text.isNotEmpty);
    // jenisKelaminController.text.isNotEmpty ||
    // tempatLahirPengurusCvController.text.isNotEmpty ||
    // namaGadisIbuKandungDebiturController.text.isNotEmpty ||
  }

  bool _validateUploadFiles() {
    // ignore: prefer-conditional-expressions
    if (statusPerkawinanController.text == Common.kawin) {
      return fotoKtpPengurusCvPublicUrl != null &&
          fotoKtpPasanganPublicUrl != null;
    } else {
      return fotoKtpPengurusCvPublicUrl != null;
    }
  }

  void _setUploadFilesErrorTextIfAny() {
    if (fotoKtpPengurusCvPublicUrl == null) {
      fotoKtpPengurusCvErrorText = 'Foto E-KTP harus diupload';
    }
    if (fotoKtpSelfiePublicUrl == null) {
      fotoKtpSelfieErrorText = 'Foto Selfie E-KTP harus diupload';
    }
    if (statusPerkawinanController.text == Common.kawin &&
        fotoKtpPasanganPublicUrl == null) {
      fotoKtpPasanganErrorText = 'Foto E-KTP Pasangan harus diupload';
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
    PipelinePerusahaanCvAPIMethod pipelinePerusahaanCvAPIMethod, {
    bool isContinue = false,
  }) async {
    if (formKey.currentState!.validate() && _validateUploadFiles()) {
      // formKey.currentState!.save();

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

  Future<Map<String, dynamic>> _generateInformasiPengurusCvMap() async {
    var latLng = '${_lat.toString()}, ${_lng.toString()}';

    return {
      'cv_pipelinesId': int.parse(pipelineId!),
      'fullName': namaPengurusCvController.text.trim(),
      'jobCode': JobCodeFormatter.forInput(posisiPengurusCvController.text),
      'ktpNum': nomorKtpPengurusCvController.text.trim(),
      'npwpNum': nomorNpwpPengurusCvController.text.isNotEmpty
          ? nomorNpwpPengurusCvController.text.trim()
          : '',
      'gender': jenisKelaminPengurusCvController.text.trim(),
      'placeOfBirth': tempatLahirPengurusCvController.text.trim(),
      'dateOfBirth': tglLahirPengurusCvController.text.trim(),
      'maritalStatus': statusPerkawinanController.text.trim(),
      'tagLocation': ritelInformasiPengurusCv != null
          ? alamatPengurusCvController.text.trim() ==
                  ritelInformasiPengurusCv!.tagLocation!.name!
              ? ritelInformasiPengurusCv!.tagLocation!
              : {
                  'latLng': latLng,
                  'name': alamatPengurusCvController.text.trim(),
                }
          : {
              'latLng': latLng,
              'name': alamatPengurusCvController.text.trim(),
            },
      'detail': detailAlamatPengurusCvController.text.trim(),
      'postalCode': postalCodeAlamatPengurusController.text.trim(),
      'province': provinceAlamatPengurusCvController.text.trim(),
      'city': cityAlamatPengurusCvController.text.trim(),
      'district': districtAlamatPengurusCvController.text.trim(),
      'village': villageAlamatPengurusCvController.text.trim(),
      'rt': rtAlamatPengurusCvController.text.isNotEmpty
          ? rtAlamatPengurusCvController.text.trim()
          : '',
      'rw': rwAlamatPengurusCvController.text.isNotEmpty
          ? rwAlamatPengurusCvController.text.trim()
          : '',
      'phoneNum': '+62${noHpPengurusCvController.text.trim()}',
      'email': emailPengurusCvController.text.isNotEmpty
          ? emailPengurusCvController.text.trim()
          : '',
      'spouseKtpNum': statusPerkawinanController.text == Common.kawin &&
              nomorKtpPasanganController.text != ''
          ? nomorKtpPasanganController.text.trim()
          : '',
      'spouseFullname': statusPerkawinanController.text == Common.kawin &&
              namaLengkapPasanganController.text != ''
          ? namaLengkapPasanganController.text.trim()
          : '',
      'spousePlaceOfBirth': statusPerkawinanController.text == Common.kawin &&
              tempatLahirPasanganController.text != ''
          ? tempatLahirPasanganController.text.trim()
          : '',
      'spouseDateOfBirth': statusPerkawinanController.text == Common.kawin &&
              tglLahirPasanganController.text != ''
          ? tglLahirPasanganController.text.trim()
          : null,
      'ktpPath': fotoKtpPengurusCvUrl,
      'ktpSelfiePath': fotoKtpSelfieUrl,
      'npwpPath': fotoNpwpDebiturPublicUrl != null ? fotoNpwpDebiturUrl : '',
      'kkPath': fotoKartuKeluargaPublicUrl != null ? fotoKartuKeluargaUrl : '',
      'spouseKtpPath': statusPerkawinanController.text == Common.kawin
          ? fotoKtpPasanganPublicUrl != null
              ? fotoKtpPasanganUrl!
              : ''
          : '',
      'marriagePath': statusPerkawinanController.text == Common.kawin
          ? fotoAktaNikahPublicUrl != null
              ? fotoAktaNikahUrl!
              : ''
          : '',
      'divorcePath': statusPerkawinanController.text == Common.ceraiHidup
          ? fotoAktaCerai != null
              ? fotoAktaCeraiUrl!
              : ''
          : '',
      'deathCertificatePath':
          statusPerkawinanController.text == Common.ceraiMati
              ? suratKematian != null
                  ? suratKematianUrl!
                  : ''
              : '',
    };
  }

  Future<Map<String, dynamic>> _generateInformasiPengurusUpdateCvMap() async {
    var latLng = '${_lat.toString()}, ${_lng.toString()}';

    return {
      'id': ritelInformasiPengurusCv!.id,
      'cv_pipelinesId': int.parse(pipelineId!),
      'fullName': namaPengurusCvController.text.trim(),
      'jobCode': JobCodeFormatter.forInput(posisiPengurusCvController.text),
      'ktpNum': nomorKtpPengurusCvController.text.trim(),
      'npwpNum': nomorNpwpPengurusCvController.text.isNotEmpty
          ? nomorNpwpPengurusCvController.text.trim()
          : '',
      'gender': jenisKelaminPengurusCvController.text.trim(),
      'placeOfBirth': tempatLahirPengurusCvController.text.trim(),
      'dateOfBirth': tglLahirPengurusCvController.text.trim(),
      'maritalStatus': statusPerkawinanController.text.trim(),
      'tagLocation': ritelInformasiPengurusCv != null
          ? alamatPengurusCvController.text.trim() ==
                  ritelInformasiPengurusCv!.tagLocation!.name!
              ? ritelInformasiPengurusCv!.tagLocation!
              : {
                  'latLng': latLng,
                  'name': alamatPengurusCvController.text.trim(),
                }
          : {
              'latLng': latLng,
              'name': alamatPengurusCvController.text.trim(),
            },
      'detail': detailAlamatPengurusCvController.text.trim(),
      'postalCode': postalCodeAlamatPengurusController.text.trim(),
      'province': provinceAlamatPengurusCvController.text.trim(),
      'city': cityAlamatPengurusCvController.text.trim(),
      'district': districtAlamatPengurusCvController.text.trim(),
      'village': villageAlamatPengurusCvController.text.trim(),
      'rt': rtAlamatPengurusCvController.text.isNotEmpty
          ? rtAlamatPengurusCvController.text.trim()
          : '',
      'rw': rwAlamatPengurusCvController.text.isNotEmpty
          ? rwAlamatPengurusCvController.text.trim()
          : '',
      'phoneNum': '+62${noHpPengurusCvController.text.trim()}',
      'email': emailPengurusCvController.text.isNotEmpty
          ? emailPengurusCvController.text.trim()
          : '',
      'spouseKtpNum': statusPerkawinanController.text == Common.kawin &&
              nomorKtpPasanganController.text != ''
          ? nomorKtpPasanganController.text.trim()
          : '',
      'spouseFullname': statusPerkawinanController.text == Common.kawin &&
              namaLengkapPasanganController.text != ''
          ? namaLengkapPasanganController.text.trim()
          : '',
      'spousePlaceOfBirth': statusPerkawinanController.text == Common.kawin &&
              tempatLahirPasanganController.text != ''
          ? tempatLahirPasanganController.text.trim()
          : '',
      'spouseDateOfBirth': statusPerkawinanController.text == Common.kawin &&
              tglLahirPasanganController.text != ''
          ? tglLahirPasanganController.text.trim()
          : null,
      'ktpPath': fotoKtpPengurusCvUrl,
      'ktpSelfiePath': fotoKtpSelfieUrl,
      'npwpPath': fotoNpwpDebiturPublicUrl != null ? fotoNpwpDebiturUrl : '',
      'kkPath': fotoKartuKeluargaPublicUrl != null ? fotoKartuKeluargaUrl : '',
      'spouseKtpPath': statusPerkawinanController.text == Common.kawin
          ? fotoKtpPasanganPublicUrl != null
              ? fotoKtpPasanganUrl!
              : ''
          : '',
      'marriagePath': statusPerkawinanController.text == Common.kawin
          ? fotoAktaNikahPublicUrl != null
              ? fotoAktaNikahUrl!
              : ''
          : '',
      'divorcePath': statusPerkawinanController.text == Common.ceraiHidup
          ? fotoAktaCerai != null
              ? fotoAktaCeraiUrl!
              : ''
          : '',
      'deathCertificatePath':
          statusPerkawinanController.text == Common.ceraiMati
              ? suratKematian != null
                  ? suratKematianUrl!
                  : ''
              : '',
    };
  }

  Future _postData(
    PipelinePerusahaanCvAPIMethod pipelinePerusahaanCvAPIMethod,
    bool isContinue,
  ) async {
    switch (pipelinePerusahaanCvAPIMethod) {
      case PipelinePerusahaanCvAPIMethod.addInformasiPerusahaanCv:
        break;
      case PipelinePerusahaanCvAPIMethod.updateInformasiPerusahaanCv:
        break;
      case PipelinePerusahaanCvAPIMethod.addPengurusCv:
        final informasiPengurusCvMap = await _generateInformasiPengurusCvMap();
        final res = await runBusyFuture(_ritelPipelinePerusahaanCvAPI
            .addPengurusCv(informasiPengurusCvMap));

        res.fold(
          (errorMessage) {
            _showErrorDialog(errorMessage);
            notifyListeners();
          },
          (successMap) {
            _showSuccessDialog(
              successMessage: 'Berhasil menambahkan informasi pengurus CV!',
              isContinue: false,
            );
            notifyListeners();
          },
        );
        break;
      case PipelinePerusahaanCvAPIMethod.updatePengurusCv:
        final informasiPengurusCvMap =
            await _generateInformasiPengurusUpdateCvMap();
        final res = await runBusyFuture(
          _ritelPipelinePerusahaanCvAPI.updateInformasiPengurusCv(
            informasiPengurusCvMap,
            int.parse(ritelInformasiPengurusCv!.id!),
          ),
        );

        res.fold(
          (errorMessage) {
            _showErrorDialog(errorMessage);
            notifyListeners();
          },
          (successMap) {
            _showSuccessDialog(
              successMessage: 'Berhasil mengubah informasi pengurus CV!',
              isContinue: false,
            );
            notifyListeners();
          },
        );
        break;
      case PipelinePerusahaanCvAPIMethod.addLainnya:
        break;
      case PipelinePerusahaanCvAPIMethod.updateLainnya:
        break;
    }
  }

  Future uploadFileKtpPengurusCv(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingKtpPengurusCv = false;
        fotoKtpPengurusCvUrl = url;
        fotoKtpPengurusCvPublicUrl = await _getPublicFile(url);

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

  Future menuPerusahaanCV() async {
    _navigationService.navigateTo(
      Routes.tDPPerusahaanCvViewRitel,
      arguments: TDPPerusahaanCvViewRitelArguments(
        pipelineId: pipelineId,
        // stepperPengurus: 1,
      ),
    );
  }

  Future menuPerusahaanCVNotUpdate() async {
    _navigationService.navigateTo(
      Routes.tDPPerusahaanCvViewRitel,
      arguments: TDPPerusahaanCvViewRitelArguments(
        pipelineId: pipelineId,
        stepperPengurus: 1,
      ),
    );
  }

  Future navigateToFormPengurusPT() async {
    _navigationService.navigateTo(
      Routes.informasiPengurusCvView,
      arguments: InformasiPengurusCvViewArguments(
        pipelineId: pipelineId,
      ),
    );
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
        _ritelPipelinePerusahaanCvAPI.savePengurusPipelineCV(pipelineId!),
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

  bool _isImageOrPdf(String type) {
    type = type.toLowerCase();
    return (type == 'pdf' || type == 'jpg' || type == 'png' || type == 'jpeg');
  }
}

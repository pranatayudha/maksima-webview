import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../application/app/constants/common.dart';
import '../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../../application/helpers/convert_url_to_file.dart';
import '../../../../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../../../../application/helpers/education_string_formatter.dart';
import '../../../../../../../../application/helpers/religion_string_formatter.dart';
import '../../../../../../../../application/models/ritel_postal_code.dart';
import '../../../../../../../../application/models/ritel_prakarsa_perorangan_data_diri_pari_two.dart';
import '../../../../../../../../application/models/ritel_prakarsa_perorangan_data_usaha_pari.dart';
import '../../../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../../../infrastructure/apis/ritel_prakarsa_api.dart';
import '../../../../../../../../infrastructure/apis/ritel_upload_file_api.dart';

class InformasiDebiturPariViewModelRitel extends FutureViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RitelPrakarsaAPI _ritelPrakarsaAPI = locator<RitelPrakarsaAPI>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final RitelUploadFileAPI _ritelUploadFileAPI = locator<RitelUploadFileAPI>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();

  String? prakarsaId;
  String? pipelineId;
  RitelPrakarsaPeroranganDataDiriPariTwo? dataDiri;
  RitelPrakarsaPeroranganDataUsahaPari? dataUsaha;
  int status;

  InformasiDebiturPariViewModelRitel({
    this.prakarsaId,
    this.pipelineId,
    this.dataDiri,
    this.dataUsaha,
    required this.status,
  });

  RitelPrakarsaPeroranganDataDiriPariTwo? _ritelPrakarsaPeroranganDataDiri;

  RitelPrakarsaPeroranganDataDiriPariTwo get ritelPrakarsaPeroranganDataDiri =>
      _ritelPrakarsaPeroranganDataDiri!;

  RitelPrakarsaPeroranganDataUsahaPari? _ritelPrakarsaPeroranganDataUsaha;

  RitelPrakarsaPeroranganDataUsahaPari get ritelPrakarsaPeroranganDataUsaha =>
      _ritelPrakarsaPeroranganDataUsaha!;

  @override
  Future futureToRun() async {
    await fetchPrakarsaByIdDataDiri();
    await fetchPrakarsaByIdDataUsaha();
    if (dataDiri != null) {
      await _populateTextFields();
    }
    await _preLoadImages();
    await _prepopulateImages();
  }

  void navigateBack() {
    _navigationService.navigateTo(
      Routes.prakarsaDetailsViewRitel,
      arguments: PrakarsaDetailsViewRitelArguments(
        index: 1,
        prakarsaId: prakarsaId!,
        pipelineId: pipelineId!,
        loanTypesId: 2,
        codeTable: 4,
      ),
    );
  }

  Future fetchPrakarsaByIdDataDiri() async {
    final res = await runBusyFuture(_ritelPrakarsaAPI.fetchByIdDataDiriPari(
      prakarsaId: prakarsaId,
      pipelineId: pipelineId,
    ));

    res.fold(
      (l) => _showErrorDialog('Gagal memuat dffddata'),
      (ritelPrakarsaPeroranganDataDiri) {
        developer.log(ritelPrakarsaPeroranganDataDiri.toString());
        _ritelPrakarsaPeroranganDataDiri =
            RitelPrakarsaPeroranganDataDiriPariTwo.fromJson(
          ritelPrakarsaPeroranganDataDiri,
        );
      },
    );
  }

  /// Controller field Editing
  ///
  /// Dbtr == debitur
  /// Str == sector
  /// Psg == pasangan
  /// sts == status
  /// eko == ekonomi
  /// loc == location
  ///

  final jenisDbtrController = TextEditingController();
  final idAccountPariController = TextEditingController();
  final namaDbtrController = TextEditingController();
  final nomorKtpDbtrController = TextEditingController();
  final tanggalIdTerbitController = TextEditingController();
  final agamaController = TextEditingController();
  final pendidikanTerakhirController = TextEditingController();
  final nomorNpwpDbtrController = TextEditingController();
  final tempatLahirDbtrController = TextEditingController();
  final tglLahirDbtrController = TextEditingController();
  final genderDbtrController = TextEditingController();
  final namaIbuKandungDbtrController = TextEditingController();
  final stsPerkawinanDbtrController = TextEditingController();
  final nomorKKController = TextEditingController();
  final jumlahTanggunganController = TextEditingController();
  final tagLocationLatLngDbtrController = TextEditingController();
  final tagLocationNameDbtrController = TextEditingController();
  final detailTmptTinggalDbtrController = TextEditingController();
  final kodePosDbtrController = TextEditingController();
  final provinsiDbtrController = TextEditingController();
  final cityDbtrController = TextEditingController();
  final kecamatanDbtrController = TextEditingController();
  final kelurahanDbtrController = TextEditingController();
  final rwDbtrController = TextEditingController();
  final rtDbtrController = TextEditingController();
  final noHpDbtrController = TextEditingController();
  final emailDbtrController = TextEditingController();
  final nomorKtpPsgController = TextEditingController();
  final namaPsgController = TextEditingController();
  final tmptLahirPsgController = TextEditingController();
  final tglLahirPsgController = TextEditingController();

  final namaUsahaDbtrController = TextEditingController();
  final strEkoDbtrController = TextEditingController();
  final subStrEkorDbtrController = TextEditingController();
  final tagLocUsahaDbtrController = TextEditingController();
  final alamatUsahaDbtrController = TextEditingController();
  final kodePostUsahaDbtrController = TextEditingController();
  final provinsiUsahaDbtrController = TextEditingController();
  final cityUsahaDbtrController = TextEditingController();
  final kecamatanUsahaDbtrController = TextEditingController();
  final kelurahanUsahaDbtrController = TextEditingController();
  final rwUsahaDbtrController = TextEditingController();
  final rtUsahaDbtrController = TextEditingController();
  final fotoKtpDebiturController = TextEditingController();
  final fotoSelfieKtpDebiturController = TextEditingController();
  final fotoKtpPsgController = TextEditingController();
  final fotoNpwpDbtrController = TextEditingController();
  final jenisKomoditasController = TextEditingController();

  double? _latUsaha;
  double? _lngUsaha;

  Future navigateToAddressSelectionView() async {
    _navigationService
        .navigateTo(Routes.addressSelectionView)!
        .then((chosenPlace) {
      if (chosenPlace != null) {
        tagLocUsahaDbtrController.text = chosenPlace['address'] as String;
        _latUsaha = chosenPlace['lat'] as double;
        _lngUsaha = chosenPlace['lng'] as double;
      }
    });
  }

  void updateTagLocUsaha(String val) =>
      tagLocUsahaDbtrController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  Future _populateTextFields() async {
    jenisDbtrController.text = 'Perorangan';
    idAccountPariController.text = dataDiri!.idAccountPari ?? '-';
    namaDbtrController.text = dataDiri!.fullName!;
    nomorKtpDbtrController.text = dataDiri!.ktpNum!;
    // tanggalIdTerbitController.text = dataDiri!.createdAt != null
    //     ? DateFormat('d MMM yyyy').format(dataDiri!.createdAt!)
    //     : '-';
    tanggalIdTerbitController.text =
        DateStringFormatter.forOutputRitelKTPTerbitInfoDebitur(
      dataDiri!.dateOfIssuedKTP!,
    );
    agamaController.text =
        ReligionStringFormatter.forOutput(dataDiri!.religion ?? '-');
    pendidikanTerakhirController.text =
        EducationStringFormatter.forOutput(dataDiri!.lastEducation ?? '-');
    nomorNpwpDbtrController.text = dataDiri!.npwpNum ?? '';
    tempatLahirDbtrController.text = dataDiri!.placeOfBirth ?? '-';
    nomorNpwpDbtrController.text = dataDiri!.npwpNum!;
    tglLahirDbtrController.text = dataDiri!.dateOfBirth!.newDate!;
    genderDbtrController.text = dataDiri!.gender!;
    namaIbuKandungDbtrController.text = dataDiri!.motherMaiden ?? '-';
    stsPerkawinanDbtrController.text = dataDiri!.maritalStatus!;
    nomorKKController.text = dataDiri!.kkNum ?? '';
    jumlahTanggunganController.text = dataDiri!.numberOfDependents.toString();
    tagLocationLatLngDbtrController.text = dataDiri!.tagLocation!.latLng!;
    tagLocationNameDbtrController.text = dataDiri!.tagLocation!.name!;
    detailTmptTinggalDbtrController.text = dataDiri!.detail!;
    kodePosDbtrController.text = dataDiri!.postalCode!;
    provinsiDbtrController.text = dataDiri!.province!;
    cityDbtrController.text = dataDiri!.city!;
    kecamatanDbtrController.text = dataDiri!.district!;
    kelurahanDbtrController.text = dataDiri!.village!;
    rwDbtrController.text = dataDiri!.rw!;
    rtDbtrController.text = dataDiri!.rt!;
    noHpDbtrController.text = dataDiri!.phoneNum!;
    emailDbtrController.text = dataDiri!.email!;
    fotoKtpDebiturController.text = dataDiri!.ktpPath!;
    fotoSelfieKtpDebiturController.text = dataDiri!.ktpSelfiePath!;
    fotoNpwpDbtrController.text = dataDiri!.npwpPath!;
    if (dataDiri!.maritalStatus! == Common.kawin) {
      fotoKtpPsgController.text = dataDiri!.spouseKtpPath!;
      nomorKtpPsgController.text = dataDiri!.spouseKtpNum!;
      namaPsgController.text = dataDiri!.spouseFullname!;
      tmptLahirPsgController.text = dataDiri!.spousePlaceOfBirth!;
      tglLahirPsgController.text =
          convertDate(dataDiri!.spouseDateOfBirth!.newDate!);
    }
    // viewModel
    namaUsahaDbtrController.text = dataUsaha!.businessName!;
    strEkoDbtrController.text = dataUsaha!.economySectorsName!;
    subStrEkorDbtrController.text = dataUsaha!.economySubSectorsName!;
    alamatUsahaDbtrController.text = dataUsaha!.detail!;
    kodePostUsahaDbtrController.text = dataUsaha!.postalCode!;
    provinsiUsahaDbtrController.text = dataUsaha!.province!;
    cityUsahaDbtrController.text = dataUsaha!.city!;
    kecamatanUsahaDbtrController.text = dataUsaha!.district!;
    kelurahanUsahaDbtrController.text = dataUsaha!.village!;
    rtUsahaDbtrController.text = dataUsaha!.rt!;
    rwUsahaDbtrController.text = dataUsaha!.rw!;
    tagLocUsahaDbtrController.text = dataUsaha!.tagLocation!.name!;
    jenisKomoditasController.text = dataUsaha?.jenisKomoditas ?? '-';
    checkAddressIsSame();
  }

  void checkAddressIsSame() {
    // ignore: unrelated_type_equality_checks
    if (dataDiri!.tagLocation! == dataUsaha!.tagLocation! &&
        dataDiri!.detail! == dataUsaha!.detail! &&
        dataDiri!.postalCode! == dataUsaha!.postalCode! &&
        dataDiri!.province! == dataUsaha!.province! &&
        dataDiri!.city! == dataUsaha!.city! &&
        dataDiri!.district! == dataUsaha!.district! &&
        dataDiri!.village! == dataUsaha!.village! &&
        dataDiri!.rt! == dataUsaha!.rt! &&
        dataDiri!.rw! == dataUsaha!.rw!) {
      _valueLocation = true;
      notifyListeners();
    } else {
      _valueLocation = false;
      notifyListeners();
    }
  }

  Future _prepopulateImages() async {
    if (dataDiri!.ktpPath!.length > 20) {
      if (dataDiri!.ktpPath!.isNotEmpty) {
        String tempUrl = await _getPublicFile(dataDiri!.ktpPath!);
        ktpFileDbtrControllerPublicUrl = tempUrl;
        ktpFileDbtrControllerUrl = ritelPrakarsaPeroranganDataDiri.ktpPath!;
        ktpFileDbtrController = await urlToFile(tempUrl);
        notifyListeners();
      }
    }

    if (dataDiri!.ktpSelfiePath!.length > 20) {
      if (dataDiri!.ktpSelfiePath!.isNotEmpty) {
        String tempUrl = await _getPublicFile(dataDiri!.ktpSelfiePath!);
        fotoSelfieFileControllerUrl =
            ritelPrakarsaPeroranganDataDiri.ktpSelfiePath!;
        fotoSelfieFileControllerPublicUrl = tempUrl;
        fotoSelfieFileDbtrController = await urlToFile(tempUrl);
        notifyListeners();
      }
    }

    if (dataDiri!.kkPath!.length > 20) {
      if (dataDiri!.kkPath!.isNotEmpty) {
        String tempUrl = await _getPublicFile(dataDiri!.kkPath!);
        kkDbtrControllerUrl = ritelPrakarsaPeroranganDataDiri.kkPath!;
        kkDbtrControllerPublicUrl = tempUrl;
        kkDbtrController = await urlToFile(tempUrl);
        notifyListeners();
      }
    }

    if (dataDiri!.deathCertificatePath!.length > 20) {
      if (dataDiri!.deathCertificatePath!.isNotEmpty) {
        String tempUrl = await _getPublicFile(dataDiri!.deathCertificatePath!);
        sertifikatKematianControllerUrl =
            ritelPrakarsaPeroranganDataDiri.deathCertificatePath!;
        sertifikatKematianControllerPublicUrl = tempUrl;
        sertifikatKematianController = await urlToFile(tempUrl);
        notifyListeners();
      }
    }

    if (dataDiri!.npwpPath!.length > 2) {
      if (dataDiri!.npwpPath!.isNotEmpty) {
        String tempUrl = await _getPublicFile(dataDiri!.npwpPath!);
        npwpDbtrControllerUrl = ritelPrakarsaPeroranganDataDiri.npwpPath!;
        npwpDbtrControllerPublicUrl = tempUrl;
        npwpDbtrController = await urlToFile(tempUrl);
        notifyListeners();
      }
    }

    if (dataDiri!.marriagePath!.length > 20) {
      if (dataDiri!.marriagePath!.isNotEmpty) {
        String tempUrl = await _getPublicFile(dataDiri!.marriagePath!);
        aktaNikahControllerUrl = ritelPrakarsaPeroranganDataDiri.marriagePath!;
        aktaNikahControllerPublicUrl = tempUrl;
        aktaNikahController = await urlToFile(tempUrl);
        notifyListeners();
      }
    }

    if (dataDiri!.spouseKtpPath!.length > 20) {
      if (dataDiri!.spouseKtpPath!.isNotEmpty) {
        String tempUrl = await _getPublicFile(dataDiri!.spouseKtpPath!);
        ktpPsgDbtrControllerUrl =
            ritelPrakarsaPeroranganDataDiri.spouseKtpPath!;
        ktpPsgDbtrControllerPublicUrl = tempUrl;
        ktpFilePsgDbtrController = await urlToFile(tempUrl);
        notifyListeners();
      }
    }

    if (dataDiri!.divorcePath!.length > 20) {
      if (dataDiri!.divorcePath!.isNotEmpty) {
        String tempUrl = await _getPublicFile(dataDiri!.divorcePath!);
        aktaCeraiControllerUrl = ritelPrakarsaPeroranganDataDiri.divorcePath!;
        aktaCeraiControllerPublicUrl = tempUrl;
        aktaCeraiController = await urlToFile(tempUrl);
        notifyListeners();
      }
    }
  }

  Future _preLoadImages() async {
    if (ritelPrakarsaPeroranganDataDiri.ktpPath!.length > 20) {
      if (ritelPrakarsaPeroranganDataDiri.ktpPath!.isNotEmpty) {
        String tempUrl =
            await _getPublicFile(ritelPrakarsaPeroranganDataDiri.ktpPath!);
        ktpFileDbtrControllerPublicUrl = tempUrl;
        ktpFileDbtrControllerUrl = ritelPrakarsaPeroranganDataDiri.ktpPath!;
        notifyListeners();
      }
    }

    if (ritelPrakarsaPeroranganDataDiri.ktpSelfiePath!.length > 20) {
      if (ritelPrakarsaPeroranganDataDiri.ktpSelfiePath!.isNotEmpty) {
        String tempUrl = await _getPublicFile(
          ritelPrakarsaPeroranganDataDiri.ktpSelfiePath!,
        );
        fotoSelfieFileControllerUrl =
            ritelPrakarsaPeroranganDataDiri.ktpSelfiePath!;
        fotoSelfieFileControllerPublicUrl = tempUrl;
        notifyListeners();
      }
    }

    if (ritelPrakarsaPeroranganDataDiri.kkPath!.length > 20) {
      if (ritelPrakarsaPeroranganDataDiri.kkPath!.isNotEmpty) {
        String tempUrl =
            await _getPublicFile(ritelPrakarsaPeroranganDataDiri.kkPath!);
        kkDbtrControllerUrl = ritelPrakarsaPeroranganDataDiri.kkPath!;
        kkDbtrControllerPublicUrl = tempUrl;
        notifyListeners();
      }
    }

    if (ritelPrakarsaPeroranganDataDiri.deathCertificatePath!.length > 20) {
      if (ritelPrakarsaPeroranganDataDiri.deathCertificatePath!.isNotEmpty) {
        String tempUrl = await _getPublicFile(
          ritelPrakarsaPeroranganDataDiri.deathCertificatePath!,
        );
        sertifikatKematianControllerUrl =
            ritelPrakarsaPeroranganDataDiri.deathCertificatePath!;
        sertifikatKematianControllerPublicUrl = tempUrl;
        notifyListeners();
      }
    }

    if (ritelPrakarsaPeroranganDataDiri.npwpPath!.length > 2) {
      if (ritelPrakarsaPeroranganDataDiri.npwpPath!.isNotEmpty) {
        String tempUrl =
            await _getPublicFile(ritelPrakarsaPeroranganDataDiri.npwpPath!);
        npwpDbtrControllerUrl = ritelPrakarsaPeroranganDataDiri.npwpPath!;
        npwpDbtrControllerPublicUrl = tempUrl;
        notifyListeners();
      }
    }

    if (ritelPrakarsaPeroranganDataDiri.marriagePath!.length > 20) {
      if (ritelPrakarsaPeroranganDataDiri.marriagePath!.isNotEmpty) {
        String tempUrl =
            await _getPublicFile(ritelPrakarsaPeroranganDataDiri.marriagePath!);
        aktaNikahControllerUrl = ritelPrakarsaPeroranganDataDiri.marriagePath!;
        aktaNikahControllerPublicUrl = tempUrl;
        notifyListeners();
      }
    }

    if (ritelPrakarsaPeroranganDataDiri.spouseKtpPath!.length > 20) {
      if (ritelPrakarsaPeroranganDataDiri.spouseKtpPath!.isNotEmpty) {
        String tempUrl = await _getPublicFile(
          ritelPrakarsaPeroranganDataDiri.spouseKtpPath!,
        );
        ktpPsgDbtrControllerUrl =
            ritelPrakarsaPeroranganDataDiri.spouseKtpPath!;
        ktpPsgDbtrControllerPublicUrl = tempUrl;
        notifyListeners();
      }
    }

    if (ritelPrakarsaPeroranganDataDiri.divorcePath!.length > 20) {
      if (ritelPrakarsaPeroranganDataDiri.divorcePath!.isNotEmpty) {
        String tempUrl =
            await _getPublicFile(ritelPrakarsaPeroranganDataDiri.divorcePath!);
        aktaCeraiControllerUrl = ritelPrakarsaPeroranganDataDiri.divorcePath!;
        aktaCeraiControllerPublicUrl = tempUrl;
        notifyListeners();
      }
    }
  }

  bool isDone() {
    if (_valueLocation) {
      // ignore: prefer-conditional-expressions
      if (dataDiri!.maritalStatus! == Common.kawin) {
        return namaIbuKandungDbtrController.text.isNotEmpty &&
            namaUsahaDbtrController.text.isNotEmpty &&
            nomorNpwpDbtrController.text.isNotEmpty &&
            nomorKtpPsgController.text.isNotEmpty &&
            namaPsgController.text.isNotEmpty &&
            tmptLahirPsgController.text.isNotEmpty &&
            tglLahirPsgController.text.isNotEmpty &&
            nomorKKController.text.isNotEmpty &&
            emailDbtrController.text.isNotEmpty &&
            jumlahTanggunganController.text.isNotEmpty &&
            npwpDbtrControllerUrl != null &&
            kkDbtrControllerUrl != null &&
            aktaNikahController != null;
      } else {
        return namaIbuKandungDbtrController.text.isNotEmpty &&
            namaUsahaDbtrController.text.isNotEmpty &&
            nomorNpwpDbtrController.text.isNotEmpty &&
            nomorKKController.text.isNotEmpty &&
            emailDbtrController.text.isNotEmpty &&
            jumlahTanggunganController.text.isNotEmpty &&
            npwpDbtrControllerUrl != null &&
            kkDbtrControllerUrl != null;
      }
    } else {
      return namaIbuKandungDbtrController.text.isNotEmpty &&
          namaUsahaDbtrController.text.isNotEmpty &&
          alamatUsahaDbtrController.text.isNotEmpty &&
          kodePostUsahaDbtrController.text.isNotEmpty &&
          kecamatanUsahaDbtrController.text.isNotEmpty &&
          kelurahanUsahaDbtrController.text.isNotEmpty &&
          nomorNpwpDbtrController.text.isNotEmpty &&
          nomorKKController.text.isNotEmpty &&
          emailDbtrController.text.isNotEmpty &&
          jumlahTanggunganController.text.isNotEmpty &&
          npwpDbtrControllerUrl != null &&
          kkDbtrControllerUrl != null;
    }
  }

  static String convertDate(String dateString) {
    final inputFormat = DateFormat('dd MMMM yyyy', 'id');
    final date = inputFormat.parse(dateString);
    final outputFormat = DateFormat('dd/MM/yyyy');
    // ignore: newline-before-return
    return outputFormat.format(date).toString();
  }

  bool _valueLocation = false;

  bool get valueLocation => _valueLocation;

  void updateFunction(bool value) {
    _valueLocation = value;
    notifyListeners();
  }

  void updateNomorNpwpDbtrController(String val) =>
      nomorNpwpDbtrController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateNomorKKDbtrController(String val) =>
      nomorKKController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateJumlahTanggunganController(String val) =>
      jumlahTanggunganController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateNamaIbuKandungDbtrController(String val) =>
      namaIbuKandungDbtrController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateEmailDbtrController(String val) =>
      emailDbtrController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateNamaUsahaController(String val) =>
      namaUsahaDbtrController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updatAlamatUsahaController(String val) =>
      alamatUsahaDbtrController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateKodePosUsahaController(String val) async {
    kodePostUsahaDbtrController.value.copyWith(
      text: val,
      selection: TextSelection(
        baseOffset: val.length,
        extentOffset: val.length,
      ),
    );
    provinsiUsahaDbtrController.clear();
    cityUsahaDbtrController.clear();
    await getPostalCode(kodePostUsahaDbtrController.text);
    if (!isValidPostalCode) {
      kecamatanUsahaDbtrController.clear();
      kelurahanUsahaDbtrController.clear();
    }
  }

  List<RitelPostalCode> _ritelPostalCode = [];

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
        provinsiUsahaDbtrController.text =
            _ritelPostalCode[0].province.toString();
        cityUsahaDbtrController.text = _ritelPostalCode[0].city.toString();
        isValidPostalCode = true;
      },
    );
  }

  void updateKecamatanUsahaController(String val) =>
      kecamatanUsahaDbtrController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateKelurahanUsahaController(String val) =>
      kelurahanUsahaDbtrController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateRwUsahaController(String val) =>
      rwUsahaDbtrController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateRtUsahaController(String val) =>
      rtUsahaDbtrController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  bool _isLoadingFotoSelfieDebitur = false;

  bool get isLoadingFotoSelfieDebitur => _isLoadingFotoSelfieDebitur;
  bool _isLoadingKkDebitur = false;

  bool get isLoadingKkDebitur => _isLoadingKkDebitur;
  bool _isLoadingAktaNikah = false;

  bool get isLoadingAktaNikah => _isLoadingAktaNikah;
  bool _isLoadingAktaCerai = false;

  bool get isLoadingAktaCerai => _isLoadingAktaCerai;
  bool _isLoadingSertifikatKematian = false;

  bool get isLoadingSertifikatKematiang => _isLoadingSertifikatKematian;

  File? ktpFileDbtrController;
  String? ktpDbtrControllerErrorText;
  String? ktpFileDbtrControllerUrl;
  String? ktpFileDbtrControllerPublicUrl;

  File? fotoSelfieFileDbtrController;
  String? fotoSelfieFileDbtrErrorText;
  String? fotoSelfieFileControllerUrl;
  String? fotoSelfieFileControllerPublicUrl;

  Future capturFotoSelfieFileDbtrController() async {
    if (fotoSelfieFileDbtrController != null) {
      clearKtpSelfieFileController();
    } else {
      final res = await _dialogService.showCustomDialog(
        variant: DialogType.takePhotoFile,
        barrierDismissible: true,
      );

      if (res != null && res.confirmed) {
        fotoSelfieFileDbtrController = res.data[0] as File;
        ktpFilePsgDbtrErrorText = null;
        uploadFileKtpSelfieDebitur(
          fotoSelfieFileDbtrController!,
          res.data[1].toString(),
        );
        notifyListeners();
      }
    }
  }

  File? ktpFilePsgDbtrController;
  String? ktpFilePsgDbtrErrorText;
  String? ktpPsgDbtrControllerUrl;
  String? ktpPsgDbtrControllerPublicUrl;

  Future capturKtpFilePsgDbtrController() async {
    if (ktpFilePsgDbtrController != null) {
      clearKtpPasanganFileController();
    } else {
      final res = await _dialogService.showCustomDialog(
        variant: DialogType.takePhotoFile,
        barrierDismissible: true,
      );

      if (res != null && res.confirmed) {
        ktpFilePsgDbtrController = res.data[0] as File;
        ktpFilePsgDbtrErrorText = null;
        uploadFileKtpPsgDebitur(
          ktpFilePsgDbtrController!,
          res.data[1].toString(),
        );
        notifyListeners();
      }
    }
  }

  Future uploadFileKtpPsgDebitur(File file, String type) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type == 'image' ? 'image' : 'application',
      subType: type == 'image' ? 'png' : 'pdf',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingFotoSelfieDebitur = false;
        ktpPsgDbtrControllerUrl = url;
        ktpPsgDbtrControllerPublicUrl = await _getPublicFile(url);
        notifyListeners();
      },
    );
  }

  Future uploadFileKtpSelfieDebitur(File file, String type) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type == 'image' ? 'image' : 'application',
      subType: type == 'image' ? 'png' : 'pdf',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingFotoSelfieDebitur = false;
        fotoSelfieFileControllerUrl = url;
        fotoSelfieFileControllerPublicUrl = await _getPublicFile(url);
        notifyListeners();
      },
    );
  }

  File? npwpDbtrController;
  String? npwpDbtrControllerErrorText;
  String? npwpDbtrControllerUrl;
  String? npwpDbtrControllerPublicUrl;

  Future capturNpwpDbtrController() async {
    if (npwpDbtrController != null) {
      clearNpwpFileController();
    } else {
      final res = await _dialogService.showCustomDialog(
        variant: DialogType.takePhotoFile,
        barrierDismissible: true,
      );

      if (res != null && res.confirmed) {
        npwpDbtrController = res.data[0] as File;
        npwpDbtrControllerErrorText = null;
        uploadFileNpwpDebitur(
          npwpDbtrController!,
          res.data[1].toString(),
        );
        notifyListeners();
      }
    }
  }

  Future uploadFileNpwpDebitur(File file, String type) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type == 'image' ? 'image' : 'application',
      subType: type == 'image' ? 'png' : 'pdf',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingKkDebitur = false;
        npwpDbtrControllerUrl = url;
        npwpDbtrControllerPublicUrl = await _getPublicFile(url);
        notifyListeners();
      },
    );
  }

  File? kkDbtrController;
  String? kkDbtrControllerErrorText;
  String? kkDbtrControllerUrl;
  String? kkDbtrControllerPublicUrl;

  Future capturKkDbtrController() async {
    if (kkDbtrController != null) {
      clearKkFileController();
    } else {
      final res = await _dialogService.showCustomDialog(
        variant: DialogType.takePhotoFile,
        barrierDismissible: true,
      );

      if (res != null && res.confirmed) {
        _isLoadingKkDebitur = true;
        if (_isLoadingKkDebitur) {
          kkDbtrController = res.data[0] as File;
          kkDbtrControllerErrorText = null;
          uploadFileKkDebitur(
            kkDbtrController!,
            res.data[1].toString(),
          );
          notifyListeners();
        }
      }
    }
  }

  Future uploadFileKkDebitur(File file, String type) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type == 'image' ? 'image' : 'application',
      subType: type == 'image' ? 'png' : 'pdf',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingKkDebitur = false;
        kkDbtrControllerUrl = url;
        kkDbtrControllerPublicUrl = await _getPublicFile(url);
        notifyListeners();
      },
    );
  }

  File? aktaNikahController;
  String? aktaNikahControllerErrorText;
  String? aktaNikahControllerUrl;
  String? aktaNikahControllerPublicUrl;

  Future capturAktaNikahController() async {
    if (aktaNikahController != null) {
      clearAktaNikahFileController();
    } else {
      final res = await _dialogService.showCustomDialog(
        variant: DialogType.takePhotoFile,
        barrierDismissible: true,
      );

      if (res != null && res.confirmed) {
        _isLoadingAktaNikah = true;
        if (_isLoadingAktaNikah) {
          aktaNikahController = res.data[0] as File;
          aktaNikahControllerErrorText = null;
          uploadFileAktaNikahDebitur(
            aktaNikahController!,
            res.data[1].toString(),
          );
          notifyListeners();
        }
      }
    }
  }

  Future uploadFileAktaNikahDebitur(File file, String type) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type == 'image' ? 'image' : 'application',
      subType: type == 'image' ? 'png' : 'pdf',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingAktaNikah = false;
        aktaNikahControllerUrl = url;
        aktaNikahControllerPublicUrl = await _getPublicFile(url);
        notifyListeners();
      },
    );
  }

  File? aktaCeraiController;
  String? aktaCeraiControllerErrorText;
  String? aktaCeraiControllerUrl;
  String? aktaCeraiControllerPublicUrl;

  Future capturAktaCeraiController() async {
    if (aktaCeraiController != null) {
      clearAktaCeraiFileController();
    } else {
      final res = await _dialogService.showCustomDialog(
        variant: DialogType.takePhotoFile,
        barrierDismissible: true,
      );

      if (res != null && res.confirmed) {
        _isLoadingAktaCerai = true;
        if (_isLoadingAktaCerai) {
          aktaCeraiController = res.data[0] as File;
          aktaCeraiControllerErrorText = null;
          uploadFileAktaCeraiDebitur(
            aktaCeraiController!,
            res.data[1].toString(),
          );
          notifyListeners();
        }
      }
    }
  }

  Future uploadFileAktaCeraiDebitur(File file, String type) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type == 'image' ? 'image' : 'application',
      subType: type == 'image' ? 'png' : 'pdf',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingAktaCerai = false;
        aktaCeraiControllerUrl = url;
        aktaCeraiControllerPublicUrl = await _getPublicFile(url);
        notifyListeners();
      },
    );
  }

  File? sertifikatKematianController;
  String? sertifikatKematianControllerErrorText;
  String? sertifikatKematianControllerUrl;
  String? sertifikatKematianControllerPublicUrl;

  Future capturSertifikatKematianController() async {
    if (sertifikatKematianController != null) {
      clearSertifikatKematianFileController();
    } else {
      final res = await _dialogService.showCustomDialog(
        variant: DialogType.takePhotoFile,
        barrierDismissible: true,
      );

      if (res != null && res.confirmed) {
        _isLoadingSertifikatKematian = true;
        if (_isLoadingSertifikatKematian) {
          sertifikatKematianController = res.data[0] as File;
          sertifikatKematianControllerErrorText = null;
          uploadFileSertifikatKematian(
            sertifikatKematianController!,
            res.data[1].toString(),
          );
          notifyListeners();
        }
      }
    }
  }

  Future uploadFileSertifikatKematian(File file, String type) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type == 'image' ? 'image' : 'application',
      subType: type == 'image' ? 'png' : 'pdf',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (url) async {
        _isLoadingSertifikatKematian = false;
        sertifikatKematianControllerUrl = url;
        sertifikatKematianControllerPublicUrl = await _getPublicFile(url);
        notifyListeners();
      },
    );
  }

  Future clearKkFileController() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file kartu keluarga?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      kkDbtrController = null;
      kkDbtrControllerUrl = null;
      kkDbtrControllerPublicUrl = null;
      notifyListeners();
    }
  }

  Future clearNpwpFileController() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file NPWP?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      npwpDbtrController = null;
      npwpDbtrControllerUrl = null;
      npwpDbtrControllerPublicUrl = null;
      notifyListeners();
    }
  }

  Future clearAktaNikahFileController() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file akta nikah?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      aktaNikahController = null;
      aktaNikahControllerUrl = null;
      aktaNikahControllerPublicUrl = null;
      notifyListeners();
    }
  }

  Future clearAktaCeraiFileController() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file akta cerai?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      aktaCeraiController = null;
      aktaCeraiControllerUrl = null;
      aktaCeraiControllerPublicUrl = null;
      notifyListeners();
    }
  }

  Future clearSertifikatKematianFileController() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file sertifikat kematian?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      sertifikatKematianController = null;
      sertifikatKematianControllerUrl = null;
      sertifikatKematianControllerPublicUrl = null;
      notifyListeners();
    }
  }

  Future clearKtpSelfieFileController() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file foto debitur bersama E-KTP?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoSelfieFileDbtrController = null;
      fotoSelfieFileControllerUrl = null;
      fotoSelfieFileControllerPublicUrl = null;
      notifyListeners();
    }
  }

  Future clearKtpPasanganFileController() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file E-KTP pasangan?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      ktpFilePsgDbtrController = null;
      ktpPsgDbtrControllerUrl = null;
      ktpPsgDbtrControllerPublicUrl = null;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> _generateDataDebitur() async {
    return {
      'npwpNum': nomorNpwpDbtrController.text.trim(),
      'numberOfDependents': int.parse(jumlahTanggunganController.text.trim()),
      'kkNum': nomorKKController.text.trim(),
      'motherMaiden': namaIbuKandungDbtrController.text.trim(),
      'email': emailDbtrController.text.trim(),
      'npwpPath': npwpDbtrControllerUrl ?? '',
      'ktpSelfiePath': fotoSelfieFileControllerUrl ?? '',
      'kkPath': kkDbtrControllerUrl ?? '',
      'marriagePath': aktaNikahControllerUrl ?? '',
      'divorcePath': aktaCeraiControllerUrl ?? '',
      'deathCertificatePath': sertifikatKematianControllerUrl ?? '',
      'addressIsSame': _valueLocation,
      'businessName': namaUsahaDbtrController.text.trim(),
      // 'partnershipsId': 0,
      'tagLocation': {
        'latLng':
            '${_latUsaha.toString().trim()}, ${_lngUsaha.toString().trim()}',
        'name': tagLocUsahaDbtrController.text.trim(),
      },
      'detail': alamatUsahaDbtrController.text.trim(),
      'postalCode': kodePostUsahaDbtrController.text.trim(),
      'province': provinsiUsahaDbtrController.text.trim(),
      'city': cityUsahaDbtrController.text.trim(),
      'district': kecamatanUsahaDbtrController.text.trim(),
      'village': kelurahanUsahaDbtrController.text.trim(),
      'rt': rtUsahaDbtrController.text.trim(),
      'rw': rwUsahaDbtrController.text.trim(),
    };
  }

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Gagal',
      description: errorMessage,
      mainButtonTitle: 'COBA LAGI',
    );
  }

  Future fetchPrakarsaByIdDataUsaha() async {
    final res = await runBusyFuture(_ritelPrakarsaAPI.fetchByIdDataUsahaPari(
      prakarsaId: prakarsaId,
      pipelineId: pipelineId,
    ));

    res.fold(
      (l) => _showErrorDialog('Gagal memuat data'),
      (ritelPrakarsaPeroranganDataUsaha) {
        _ritelPrakarsaPeroranganDataUsaha = ritelPrakarsaPeroranganDataUsaha;
      },
    );
  }

  Future updatePrakarsaById() async {
    final debiturData = await _generateDataDebitur();

    // print('_generateDataDebitur() $debiturData');

    final res = await runBusyFuture(
      _ritelPrakarsaAPI.updateInfoDebiturPari(prakarsaId!, debiturData),
    );
    res.fold(
      (errorMessage) {
        _showErrorDialog(errorMessage);
        notifyListeners();
      },
      (successMap) {
        _showSuccessDialogPut('Berhasil mengubah informasi data diri debitur!');
        notifyListeners();
      },
    );
  }

  Future _showSuccessDialogPut(String successMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    notifyListeners();

    _navigationService.clearStackAndShow(
      Routes.informasiDebiturPari,
      arguments: InformasiDebiturPariArguments(
        pipelinesId: pipelineId!,
        prakarsaId: prakarsaId!,
        backPipeline: true,
        status: status,
      ),
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

  void navigateToPipelineView() => _navigationService.clearStackAndShow(
        Routes.mainView,
        arguments: const MainViewArguments(index: 2),
      );

  void clearVillage() {
    kelurahanUsahaDbtrController.clear();
    notifyListeners();
  }

  List<RitelPostalCode> filterVillage(String query) {
    List<RitelPostalCode> temp = [];

    for (var i = 0; i < _ritelPostalCodeSecond.length; i++) {
      if (kecamatanUsahaDbtrController.text
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

  Future updateVillage(RitelPostalCode ritelPostalCode) async {
    kelurahanUsahaDbtrController.text = ritelPostalCode.village!.trim();
    notifyListeners();
  }

  void clearDistrict() {
    kecamatanUsahaDbtrController.clear();
    notifyListeners();
  }

  List<RitelPostalCode> filterDistrict(String query) {
    // List<RitelPostalCode> res = [];
    // RitelPostalCode temp = RitelPostalCode();
    // for (var i = 0; i < _ritelPostalCode.length; i++) {
    //   if (i == 0) {
    //     temp = _ritelPostalCode[0];
    //   } else if (temp.district != _ritelPostalCode[i].district!) {
    //     if (i != (_ritelPostalCode.length - 1)) {
    //       res.add(temp);
    //       temp = _ritelPostalCode[i];
    //     } else {
    //       res.addAll([temp, _ritelPostalCode[i]]);
    //     }
    //   } else {
    //     res.add(temp);
    //   }
    // }

    // return res.toList();

    return _ritelPostalCode
        .where((element) => element.district!.toLowerCase().contains(query))
        .toList();
  }

  Future updateDistrict(RitelPostalCode ritelPostalCode) async {
    kecamatanUsahaDbtrController.text = ritelPostalCode.district!.trim();
    notifyListeners();

    await getVillage(
      ritelPostalCode.postalCode!,
    );
  }

  List<RitelPostalCode> _ritelPostalCodeSecond = [];
  Future getVillage(
    String postalCode,
  ) async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getDetailByPostalCode(postalCode),
    );

    res.fold(
      (error) => developer.log(error),
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
}

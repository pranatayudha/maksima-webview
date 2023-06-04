// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../application/app/app.locator.dart';
import '../../../../../../application/app/app.router.dart';
import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../application/enums/bottom_sheet_type.dart';
import '../../../../../../application/enums/dialog_type.dart';
import '../../../../../../application/enums/pipeline_perorangan_api_method.dart';
import '../../../../../../application/helpers/convert_url_to_file.dart';
import '../../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../../application/models/ritel_informasi_lainnya.dart';
import '../../../../../../application/services/local_db_service.dart';
import '../../../../../../application/services/location_service.dart';
import '../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../infrastructure/apis/ritel_pipeline_perorangan_api.dart';
import '../../../../../../infrastructure/apis/ritel_upload_file_api.dart';

class InformasiLainnyaPariViewModel extends BaseViewModel {
  String? pipelineId;
  RitelInformasiLainnya? ritelInformasiLainnya;
  bool fromTdpPeroranganView;
  bool? fromPipelineDetailsView;
  int? statusPipeline;

  InformasiLainnyaPariViewModel({
    this.pipelineId,
    this.ritelInformasiLainnya,
    required this.fromTdpPeroranganView,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  });

  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  final DialogService _dialogService = locator<DialogService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final RitelPipelinePeroranganAPI _ritelPipelinePeroranganAPI =
      locator<RitelPipelinePeroranganAPI>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();
  final RitelUploadFileAPI _ritelUploadFileAPI = locator<RitelUploadFileAPI>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final formatter = NumberFormat('#,###', 'id_ID');

  Future initialize() async {
    setBusy(true);

    if (ritelInformasiLainnya != null) {
      await _prepopulateTextFields();
      if (ritelInformasiLainnya!.visitPath != []) {
        isLoadingImage = true;
        await _prepopulateImages();
        if ((listUrlFotoKunjungan.length) < 5) {
          listUrlFotoKunjungan.add(null);
          listFileFotoKunjungan.add(null);
          listUrlPublicFotoKunjungan.add(null);
          notifyListeners();
        }
        isLoadingImage = false;
      }
    } else {
      listFileFotoKunjungan = List.generate(3, (index) => null);
      listUrlFotoKunjungan = List.generate(3, (index) => null);
      listUrlPublicFotoKunjungan = List.generate(3, (index) => null);
    }
    setBusy(false);
  }

  Future _prepopulateTextFields() async {
    cbTerdekatController
      ..text = ritelInformasiLainnya!.cbName!
      ..selection =
          TextSelection.collapsed(offset: cbTerdekatController.text.length);

    if (ritelInformasiLainnya!.etaToCB != null) {
      waktuTempuhController
        ..text = ritelInformasiLainnya!.etaToCB!
        ..selection =
            TextSelection.collapsed(offset: waktuTempuhController.text.length);
    }

    ratingPariController
      ..text = ritelInformasiLainnya!.ratingPARI!
      ..selection =
          TextSelection.collapsed(offset: ratingPariController.text.length);

    frekuensiTransaksiController
      ..text = ritelInformasiLainnya!.transactionFrequency!
      ..selection = TextSelection.collapsed(
        offset: frekuensiTransaksiController.text.length,
      );

    jenisProdukPinjamanController
      ..text = ritelInformasiLainnya!.loan_typesId! == '1'
          ? 'Pinang Maksima - KMK PTR'
          : 'Pinang Maksima - KMK PRK Pinang PARI'
      ..selection = TextSelection.collapsed(
        offset: jenisProdukPinjamanController.text.length,
      );

    nominalPengajuanAwalController
      ..text = formatter
          .format(double.parse(ritelInformasiLainnya!.loanAmount!))
          .toString()
      ..selection = TextSelection.collapsed(
        offset: nominalPengajuanAwalController.text.length,
      );

    tujuanKunjunganDebiturController.text = 'Prakarsa Kredit';

    if (ritelInformasiLainnya!.tagLocation != null) {
      if (ritelInformasiLainnya!.tagLocation!.name != null) {
        tagLocationKunjunganController
          ..text = ritelInformasiLainnya!.tagLocation!.name!
          ..selection = TextSelection.collapsed(
            offset: tagLocationKunjunganController.text.length,
          );
      }
    }

    if (ritelInformasiLainnya!.dateOfVisit != null) {
      tglKunjunganDebiturController.text =
          DateStringFormatter.forInput(ritelInformasiLainnya!.dateOfVisit!);
    }

    hasilKunjunganDebiturController
      ..text = ritelInformasiLainnya!.visitResult ?? ''
      ..selection = TextSelection.collapsed(
        offset: hasilKunjunganDebiturController.text.length,
      );
  }

  List<File?> listFileFotoKunjungan = [];
  List<String?> listUrlFotoKunjungan = [];
  List<String?> listUrlPublicFotoKunjungan = [];
  List<String?> listErrorMessageUpload = [];
  bool isLoadingImage = false;

  Future _prepopulateImages() async {
    if ((ritelInformasiLainnya?.visitPath?.length ?? 0) > 0) {
      for (var i = 0;
          i < (ritelInformasiLainnya?.visitPath?.length ?? 0);
          i++) {
        if (ritelInformasiLainnya?.visitPath?[i]['path'] != null) {
          String temp = ritelInformasiLainnya?.visitPath?[i]['path'];
          listFileFotoKunjungan.add(await urlToFile(temp));
          listUrlFotoKunjungan.add(temp);
          listUrlPublicFotoKunjungan.add(await _getPublicFile(temp));
          notifyListeners();
        }
      }
    } else {
      listFileFotoKunjungan = List.generate(3, (index) => null);
      listUrlFotoKunjungan = List.generate(3, (index) => null);
      listUrlPublicFotoKunjungan = List.generate(3, (index) => null);
    }
  }

  double? _latKunjungan;
  double? _lngKunjungan;
  final cbTerdekatController = TextEditingController();

  final waktuTempuhController = TextEditingController();

  void updateWaktuTempuh(String val) => waktuTempuhController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final ratingPariController = TextEditingController();

  final frekuensiTransaksiController = TextEditingController();

  final jenisProdukPinjamanController = TextEditingController()
    ..text = 'Pinang Maksima - KMK PRK Pinang PARI';

  /*void updateJenisProdukPinjaman(String val) {
    jenisProdukPinjamanController.text = val;
    notifyListeners();
  }*/

  final nominalPengajuanAwalController = TextEditingController();

  void updateNominalPengajuanAwal(String val) =>
      nominalPengajuanAwalController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final tujuanKunjunganDebiturController = TextEditingController();

  void updatetujuanKunjunganDebiturController(String val) {
    tujuanKunjunganDebiturController.text = val;
    notifyListeners();
  }

  final tagLocationKunjunganController = TextEditingController();

  void updateTagLocation(String val) =>
      tagLocationKunjunganController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final tglKunjunganDebiturController = TextEditingController();

  void updateTglKunjunganDebitur(String val) =>
      tglKunjunganDebiturController.text = val.trim();

  final hasilKunjunganDebiturController = TextEditingController();

  void updateHasilKunjunganDebitur(String val) =>
      hasilKunjunganDebiturController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  Future navigateToAddressSelectionViewLainnya() async {
    final userLocation = await locator<MaksimaLocationService>().getLocation();
    _latKunjungan = userLocation!.latitude;
    _lngKunjungan = userLocation.longitude;
    final locationAddr = await locator<MaksimaLocationService>()
        .getAddressFromLatLng(_latKunjungan!, _lngKunjungan!);
    tagLocationKunjunganController.text = locationAddr;
    // _navigationService
    //     .navigateTo(Routes.addressSelectionView)!
    //     .then((chosenPlace) {
    //   if (chosenPlace != null) {
    //     tagLocationKunjunganController.text = chosenPlace['address'] as String;
    //     _latKunjungan = chosenPlace['lat'] as double;
    //     _lngKunjungan = chosenPlace['lng'] as double;
    //   }
    // });
  }

  String? fotoKunjunganDuaErrorText;

  bool _isLoadingFotoKunjungan = false;

  bool get isLoadingFotoKunjungan => _isLoadingFotoKunjungan;

  Future captureFotoKunjungan(int index) async {
    final res = await _dialogService.showCustomDialog(
      variant: DialogType.takePhoto,
      barrierDismissible: true,
    );

    if (res != null && res.confirmed) {
      _isLoadingFotoKunjungan = true;
      notifyListeners();
      if (_isLoadingFotoKunjungan) {
        listFileFotoKunjungan[index] = res.data as File;
        fotoKunjunganDuaErrorText = null;
        uploadFile(listFileFotoKunjungan[index]!, index);
        notifyListeners();
      }
    }
  }

  Future uploadFile(File file, int index) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: 'image',
      subType: 'png',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) async {
        _isLoadingFotoKunjungan = false;
        listUrlFotoKunjungan[index] = success;
        listUrlPublicFotoKunjungan[index] = await _getPublicFile(success);
        int temp = getListFotoKunjunganLength();
        if (temp >= 2 && temp < 5 && listUrlFotoKunjungan.length < 5) {
          listFileFotoKunjungan.add(null);
          listUrlFotoKunjungan.add(null);
          listUrlPublicFotoKunjungan.add(null);
        }
        notifyListeners();
      },
    );
  }

  Future clearFotoKunjungan(int index) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus Foto',
      description: 'Anda yakin akan menghapus foto kunjungan ${index + 1} ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoKunjunganDuaErrorText = null;
      listFileFotoKunjungan.removeWhere((element) => element == null);
      listUrlFotoKunjungan.removeWhere((element) => element == null);
      listUrlPublicFotoKunjungan.removeWhere((element) => element == null);
      listFileFotoKunjungan.removeAt(index);
      listUrlFotoKunjungan.removeAt(index);
      listUrlPublicFotoKunjungan.removeAt(index);
      notifyListeners();
      int temp = getListFotoKunjunganLength();
      if (temp >= 1 && temp < 5) {
        listFileFotoKunjungan.add(null);
        listUrlFotoKunjungan.add(null);
        listUrlPublicFotoKunjungan.add(null);
      } else if (listUrlFotoKunjungan.isEmpty) {
        listFileFotoKunjungan = List.generate(3, (index) => null);
        listUrlFotoKunjungan = List.generate(3, (index) => null);
        listUrlPublicFotoKunjungan = List.generate(3, (index) => null);
      }
      notifyListeners();
    }
  }

  Future _showSuccessDialog(String successMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    final getPipelineFlag = _localDBService.getPeroranganFlag();

    final flags = {
      'informasi_data_diri': getPipelineFlag!['informasi_data_diri']!,
      'informasi_usaha': getPipelineFlag['informasi_usaha']!,
      'informasi_lainnya': 2,
      'dataDiriAddress': {
        'tagLocation': getPipelineFlag['dataDiriAddress']!['tagLocation']!,
        'detail': getPipelineFlag['dataDiriAddress']!['detail']!,
        'postalCode': getPipelineFlag['dataDiriAddress']!['postalCode']!,
        'province': getPipelineFlag['dataDiriAddress']!['province']!,
        'city': getPipelineFlag['dataDiriAddress']!['city']!,
        'district': getPipelineFlag['dataDiriAddress']!['district']!,
        'village': getPipelineFlag['dataDiriAddress']!['village']!,
        'rt': getPipelineFlag['dataDiriAddress']!['rt']!,
        'rw': getPipelineFlag['dataDiriAddress']!['rw']!,
      },
      'debiturName': getPipelineFlag['debiturName']!,
    };

    if (fromTdpPeroranganView) {
      _localDBService.replacePeroranganFlag(flags);

      _navigationService.navigateTo(
        Routes.tDPPeroranganViewPari,
        arguments: TDPPeroranganViewPariArguments(
          pipelineId: pipelineId,
          fromPipelineDetailsView: fromPipelineDetailsView,
          statusPipeline: statusPipeline,
        ),
      )!;
    } else {
      _localDBService.replacePeroranganFlag(flags);

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
      final response = await _dialogService.showCustomDialog(
        variant: DialogType.base,
        title: 'Edited',
        description:
            'Anda belum menyelesaikan pengisian form ini. Data-data yang sudah Anda masukkan akan hilang. Apakah Anda yakin akan membatalkan pengisian form ini?',
        data: {'color': CustomColor.primaryRed80},
        mainButtonTitle: 'Batal Isi Form',
      );

      if (response!.confirmed) _navigationService.back();
    } else if (_anyFieldEditedLainnya()) {
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

  bool _anyFieldEditedLainnya() {
    return cbTerdekatController.text.isNotEmpty ||
        waktuTempuhController.text.isNotEmpty ||
        jenisProdukPinjamanController.text.isNotEmpty ||
        nominalPengajuanAwalController.text.isNotEmpty ||
        tagLocationKunjunganController.text.isNotEmpty ||
        hasilKunjunganDebiturController.text.isNotEmpty;
  }

  // ignore: long-method
  Future<Map<String, dynamic>> _generateInfoLainnyaMap() async {
    final userLocation = await locator<MaksimaLocationService>().getLocation();
    _latKunjungan = userLocation!.latitude;
    _lngKunjungan = userLocation.longitude;

    var latLng = '${_latKunjungan.toString()}, ${_lngKunjungan.toString()}';
    final locationAddr = await locator<MaksimaLocationService>()
        .getAddressFromLatLng(_latKunjungan!, _lngKunjungan!);
    listUrlFotoKunjungan.removeWhere((element) => element == null);

    final data = {
      'pipelinesId': int.parse(pipelineId!),
      'community_branchesId':
          int.parse(ritelInformasiLainnya!.community_branchesId!),
      'etaToCB': waktuTempuhController.text.isNotEmpty
          ? waktuTempuhController.text.trim()
          : '',
      'ratingPARI': ratingPariController.text.trim(),
      'transactionFrequency': frekuensiTransaksiController.text.trim(),
      'loanAmount': int.parse(
        nominalPengajuanAwalController.text.trim().split('.').join(),
      ),
      'tagLocation': {
        'latLng': ritelInformasiLainnya!.tagLocation != null
            ? ritelInformasiLainnya!.tagLocation!.latLng!
            : tagLocationKunjunganController.text.isNotEmpty
                ? latLng
                : '',
        'name': tagLocationKunjunganController.text.isNotEmpty
            ? tagLocationKunjunganController.text.trim()
            : '',
      },
      'visitResult': hasilKunjunganDebiturController.text.isNotEmpty
          ? hasilKunjunganDebiturController.text.trim()
          : '',
      'dateOfVisit': tglKunjunganDebiturController.text.isNotEmpty
          ? tglKunjunganDebiturController.text.trim()
          : ritelInformasiLainnya != null
              ? ritelInformasiLainnya!.dateOfVisit != null
                  ? DateStringFormatter.forInput(
                      ritelInformasiLainnya!.dateOfVisit!,
                    )
                  : null
              : null,
      'purposeVisit': tujuanKunjunganDebiturController.text.isNotEmpty
          ? tujuanKunjunganDebiturController.text.trim()
          : '',
    };

    return {
      ...data,
      'visitPath': List.generate(
        listUrlFotoKunjungan.length,
        (index) => {
          'path': listUrlFotoKunjungan[index],
          'meta': {
            'photoName': listUrlFotoKunjungan[index] != null
                ? DateFormat('dd MMMM yyyy', 'id')
                    .format(DateTime.now())
                    .toString()
                : '',
            'locationDetail': locationAddr,
          },
        },
      ),
    };
  }

  Future _postData(
    PipelinePeroranganAPIMethod pipelinePeroranganAPIMethod,
    bool isContinue,
  ) async {
    final infoLainnyaMap = await _generateInfoLainnyaMap();

    switch (pipelinePeroranganAPIMethod) {
      case PipelinePeroranganAPIMethod.addDataDiri:
        break;
      case PipelinePeroranganAPIMethod.updateDataDiri:
        break;
      case PipelinePeroranganAPIMethod.addUsaha:
        break;
      case PipelinePeroranganAPIMethod.updateUsaha:
        break;
      case PipelinePeroranganAPIMethod.addLainnya:
        final res = await runBusyFuture(_ritelPipelinePeroranganAPI
            .addInformasiLainnyaPari(infoLainnyaMap));

        res.fold(
          (errorMessage) {
            _showErrorDialog(errorMessage);
            notifyListeners();
          },
          (successMap) {
            _showSuccessDialog('Berhasil menambahkan informasi lainnya!');
            notifyListeners();
          },
        );
        break;
      case PipelinePeroranganAPIMethod.updateLainnya:
        final res = await runBusyFuture(_ritelPipelinePeroranganAPI
            .updateInformasiLainnyaPari(infoLainnyaMap));

        res.fold(
          (errorMessage) {
            _showErrorDialog(errorMessage);
            notifyListeners();
          },
          (successMap) {
            _showSuccessDialog('Berhasil mengubah informasi lainnya!');
            notifyListeners();
          },
        );
        break;
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

  bool _validateUploadFiles() {
    int temp = 0;
    listUrlFotoKunjungan.forEach((element) {
      if (element != null) {
        temp++;
      }
    });

    return (temp > 2 || temp == 0) ? true : false;
  }

  void _setUploadFilesErrorTextIfAny() {
    int temp = 0;
    listUrlFotoKunjungan.forEach((element) {
      if (element != null) {
        temp++;
      }
    });
    fotoKunjunganDuaErrorText = (temp > 2 || temp == 0)
        ? null
        : 'Foto kunjungan minimal 3 untuk diupload';
  }

  Future validateInputs(
    PipelinePeroranganAPIMethod pipelinePeroranganAPIMethod, {
    bool isContinue = false,
  }) async {
    if (formKey.currentState!.validate() && _validateUploadFiles()) {
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

  int getListFotoKunjunganLength() {
    int temp = 0;
    listUrlFotoKunjungan.forEach((element) {
      if (element != null) {
        temp++;
      }
    });

    return temp;
  }
}

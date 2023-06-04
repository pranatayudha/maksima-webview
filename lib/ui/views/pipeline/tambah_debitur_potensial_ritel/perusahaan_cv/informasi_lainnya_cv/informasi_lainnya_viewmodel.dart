import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../application/app/app.locator.dart';
import '../../../../../../application/app/app.router.dart';
import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../application/enums/bottom_sheet_type.dart';
import '../../../../../../application/enums/dialog_type.dart';
import '../../../../../../application/enums/pipeline_perusahaan_cv_api_method.dart';
import '../../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../../application/models/community_branch_ritel.dart';
import '../../../../../../application/models/ritel_informasi_lainnya_cv.dart';
import '../../../../../../application/services/local_db_service.dart';
import '../../../../../../application/services/location_service.dart';
import '../../../../../../application/services/media_service.dart';
import '../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../infrastructure/apis/ritel_pipeline_perusahaan_cv_api.dart';
import '../../../../../../infrastructure/apis/ritel_upload_file_api.dart';

class InformasiLainnyaCvViewModel extends BaseViewModel {
  String? pipelineId;
  RitelInformasiLainnyaCv? ritelInformasiLainnya;
  bool fromTdpPerusahaanView;
  bool? fromPipelineDetailsView;
  int? statusPipeline;

  InformasiLainnyaCvViewModel({
    this.pipelineId,
    this.ritelInformasiLainnya,
    required this.fromTdpPerusahaanView,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  });

  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  final DialogService _dialogService = locator<DialogService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final RitelPipelinePerusahaanCvAPI _ritelPipelinePerusahaanCvAPI =
      locator<RitelPipelinePerusahaanCvAPI>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();
  final RitelUploadFileAPI _ritelUploadFileAPI = locator<RitelUploadFileAPI>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final MaksimaMediaService _mediaService = locator<MaksimaMediaService>();
  final formatter = NumberFormat('#,###', 'id_ID');

  Future initialize() async {
    setBusy(true);
    jenisProdukPinjamanController.text = 'Pinang Maksima - KMK PTR';
    tujuanKunjunganDebiturController.text = 'Prakarsa Kredit';

    await getCommunityBranch();
    if (ritelInformasiLainnya != null) {
      await _prepopulateTextFields();
      if (ritelInformasiLainnya!.visitPath != []) {
        isLoadingImage = true;
        await _prepopulateImages();
        if (listUrlFotoKunjungan.length == 0) {
          listUrlFotoKunjungan = List.generate(3, (index) => null);
          listUrlPublicFotoKunjungan = List.generate(3, (index) => null);
          notifyListeners();
        } else if ((listUrlFotoKunjungan.length) < 5 &&
            listUrlFotoKunjungan.length > 0) {
          listUrlFotoKunjungan.add(null);
          listUrlPublicFotoKunjungan.add(null);
          notifyListeners();
        }
        isLoadingImage = false;
      }
    } else {
      listUrlFotoKunjungan = List.generate(3, (index) => null);
      listUrlPublicFotoKunjungan = List.generate(3, (index) => null);
    }
    setBusy(false);
    notifyListeners();
  }

  Future _prepopulateTextFields() async {
    cbTerdekatController
      ..text = ritelInformasiLainnya!.cbName!
      ..selection =
          TextSelection.collapsed(offset: cbTerdekatController.text.length);

    waktuTempuhController
      ..text = ritelInformasiLainnya!.etaToCB!.toString()
      ..selection =
          TextSelection.collapsed(offset: waktuTempuhController.text.length);

    estimasiNominalPinjamanController
      ..text = formatter
          .format(double.parse(ritelInformasiLainnya!.loanAmount!))
          .toString()
      ..selection = TextSelection.collapsed(
        offset: estimasiNominalPinjamanController.text.length,
      );

    tujuanKunjunganDebiturController
      ..text = ritelInformasiLainnya!.purposeVisit!
      ..selection = TextSelection.collapsed(
        offset: tujuanKunjunganDebiturController.text.length,
      );

    tagLocationKunjunganController
      ..text = ritelInformasiLainnya!.tagLocation!.name!
      ..selection = TextSelection.collapsed(
        offset: tagLocationKunjunganController.text.length,
      );

    if (ritelInformasiLainnya!.dateOfVisit != null) {
      tglKunjunganDebiturController.text =
          DateStringFormatter.forInput(ritelInformasiLainnya!.dateOfVisit!);
    }

    hasilKunjunganDebiturController
      ..text = ritelInformasiLainnya!.visitResult!
      ..selection = TextSelection.collapsed(
        offset: hasilKunjunganDebiturController.text.length,
      );
  }

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
          listUrlFotoKunjungan.add(temp);
          listUrlPublicFotoKunjungan.add(await _getPublicFile(temp));
          notifyListeners();
        }
      }
    } else {
      listUrlFotoKunjungan = List.generate(2, (index) => null);
      listUrlPublicFotoKunjungan = List.generate(2, (index) => null);
    }

    if (ritelInformasiLainnya!.suratPermohonanPath != null &&
        ritelInformasiLainnya!.suratPermohonanPath!.isNotEmpty) {
      fotoSKPIUrl = ritelInformasiLainnya!.suratPermohonanPath!;
      fotoSKPIPublicUrl =
          await _getPublicFile(ritelInformasiLainnya!.suratPermohonanPath!);
      notifyListeners();
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

  final jenisProdukPinjamanController = TextEditingController();

  final estimasiNominalPinjamanController = TextEditingController();
  void updateEstimasiNominalPinjaman(String val) =>
      estimasiNominalPinjamanController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final tagLocationKunjunganController = TextEditingController();
  void updateTagLocation(String val) =>
      tagLocationKunjunganController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final tglKunjunganDebiturController = TextEditingController();
  void updateTglKunjunganDebitur(String val) =>
      tglKunjunganDebiturController.text = val.trim();

  Future selecttglKunjunganDebitur(BuildContext context) async {
    DateTime? pickedDate = await _showingDatePicker(context);
    // ignore: unnecessary_null_comparison
    if (pickedDate != null) {
      updateTglKunjunganDebitur(
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

  final tujuanKunjunganDebiturController = TextEditingController();
  void updatetujuanKunjunganDebiturController(String val) {
    tujuanKunjunganDebiturController.text = val;
    notifyListeners();
  }

  final hasilKunjunganDebiturController = TextEditingController();
  void updateHasilKunjunganDebitur(String val) =>
      hasilKunjunganDebiturController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  bool isLoadingGetAddress = false;
  Future navigateToAddressSelectionViewLainnya() async {
    setLoadingForm(true);
    setLoadingPostData(true);
    final userLocation = await locator<MaksimaLocationService>().getLocation();
    _latKunjungan = userLocation!.latitude;
    _lngKunjungan = userLocation.longitude;
    final locationAddr = await locator<MaksimaLocationService>()
        .getAddressFromLatLng(_latKunjungan!, _lngKunjungan!);
    tagLocationKunjunganController.text = locationAddr;
    setLoadingForm(false);
    setLoadingPostData(false);
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

  File? fotoKunjungan;
  String? fotoKunjunganErrorText;
  String? fotoKunjunganUrl;
  String? fotoKunjunganPublicUrl;

  bool _isLoadingFotoKunjungan = false;
  bool get isLoadingFotoKunjungan => _isLoadingFotoKunjungan;
  Future captureFotoKunjungan(int index) async {
    final res = await _mediaService
        .getMultiFileType(allowedExtensions: ['png', 'jpg', 'jpeg', 'PNG']);

    if (res != null) {
      _isLoadingFotoKunjungan = true;
      notifyListeners();
      if (_isLoadingFotoKunjungan) {
        if (_isImage(res.extension!)) {
          // listFileFotoKunjungan[index] = res;
          fotoKunjunganDuaErrorText = null;
          uploadFile(res, index);
          notifyListeners();
        } else {
          _showErrorDialog('File yang diperbolehkan hanya jpg, jpeg, png');
          _isLoadingFotoKunjungan = false;
          notifyListeners();
        }
      }
    }
  }

  Future clearFotoKunjungan(int index) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus Foto',
      description: 'Anda yakin akan menghapus foto kunjungan ${index + 1} ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );
    print('object $index');
    if (response!.confirmed) {
      print('konfim $index');
      fotoKunjunganErrorText = null;
      listUrlFotoKunjungan.removeWhere((element) => element == null);
      listUrlPublicFotoKunjungan.removeWhere((element) => element == null);
      listUrlFotoKunjungan.removeAt(index);
      listUrlPublicFotoKunjungan.removeAt(index);
      notifyListeners();
      int temp = getListFotoKunjunganLength();
      if (temp >= 1 && temp < 5) {
        listUrlFotoKunjungan.add(null);
        listUrlPublicFotoKunjungan.add(null);
      } else if (listUrlFotoKunjungan.length == 0) {
        listUrlFotoKunjungan = List.generate(3, (index) => null);
        listUrlPublicFotoKunjungan = List.generate(3, (index) => null);
      }
      notifyListeners();
    }
  }

  Future uploadFile(PlatformFile file, int index) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) async {
        _isLoadingFotoKunjungan = false;
        listUrlFotoKunjungan[index] = success;
        listUrlPublicFotoKunjungan[index] = await _getPublicFile(success);
        int temp = getListFotoKunjunganLength();
        if (temp > 2 && temp < 5 && listUrlFotoKunjungan.length < 5) {
          listUrlFotoKunjungan.add(null);
          listUrlPublicFotoKunjungan.add(null);
        }
        notifyListeners();
      },
    );
  }

  bool _isLoadingFotoKunjunganDua = false;

  bool get isLoadingFotoKunjunganDua => _isLoadingFotoKunjunganDua;
  File? fotoKunjunganDua;
  String? fotoKunjunganDuaErrorText;
  String? fotoKunjunganDuaUrl;
  String? fotoKunjunganDuaPublicUrl;

  Future captureFotoKunjunganDua() async {
    final res = await _dialogService.showCustomDialog(
      variant: DialogType.takePhoto,
      barrierDismissible: true,
    );

    if (res != null && res.confirmed) {
      _isLoadingFotoKunjunganDua = true;
      notifyListeners();
      if (_isLoadingFotoKunjunganDua) {
        fotoKunjunganDua = res.data as File;
        fotoKunjunganDuaErrorText = null;
        uploadFileDua(fotoKunjunganDua!);
        notifyListeners();
      }
    }
  }

  Future uploadFileDua(File file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: 'image',
      subType: 'png',
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) async {
        _isLoadingFotoKunjunganDua = false;
        fotoKunjunganDuaUrl = success;
        fotoKunjunganDuaPublicUrl = await _getPublicFile(success);
        notifyListeners();
      },
    );
  }

  Future _showSuccessDialog(String successMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    final getPipelineFlag = _localDBService.getPerusahaanCvFlag();

    final flags = {
      'informasi_perusahaan_cv': 2,
      'informasi_pengurus': 2,
      'informasi_lainnya': 2,
      'debiturName': getPipelineFlag!['debiturName']!,
    };

    _localDBService.replacePerusahaanCvFlag(flags);

    _navigationService.navigateTo(
      Routes.tDPPerusahaanCvViewRitel,
      arguments: TDPPerusahaanCvViewRitelArguments(
        pipelineId: pipelineId,
        fromPipelineDetailsView: fromPipelineDetailsView,
        statusPipeline: statusPipeline,
      ),
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
    if (_anyFieldEditedLainnya()) {
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
        estimasiNominalPinjamanController.text.isNotEmpty ||
        tagLocationKunjunganController.text.isNotEmpty ||
        hasilKunjunganDebiturController.text.isNotEmpty;
  }

  List<CommunityBranchRitel> _communityBranches = [];
  List<CommunityBranchRitel> get communityBranches => _communityBranches;
  String? _communityBranchId;
  void updateCommunityBranch(CommunityBranchRitel communityBranch) {
    cbTerdekatController.text = communityBranch.name!.trim();
    _communityBranchId = communityBranch.id;
    notifyListeners();
  }

  List<CommunityBranchRitel> filterCommunityBranch(String query) {
    return _communityBranches
        .where((element) => element.name!.toLowerCase().contains(query))
        .toList();
  }

  void clearCommunityBranch() {
    cbTerdekatController.clear();
    notifyListeners();
  }

  Future getCommunityBranch() async {
    final res = await runBusyFuture(_ritelMasterAPI.getCommunityBranches());

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (communityBranches) => _communityBranches = communityBranches,
    );
  }

  Future<Map<String, dynamic>> _generateInfoLainnyaMap() async {
    listUrlFotoKunjungan.removeWhere((element) => element == null);
    final userLocation = await locator<MaksimaLocationService>().getLocation();
    _latKunjungan = userLocation!.latitude;
    _lngKunjungan = userLocation.longitude;

    var latLng = '${_latKunjungan.toString()}, ${_lngKunjungan.toString()}';
    final locationAddr = listUrlFotoKunjungan.isNotEmpty
        ? await locator<MaksimaLocationService>()
            .getAddressFromLatLng(_latKunjungan!, _lngKunjungan!)
        : '-';

    final data = {
      'pipelinesId': int.parse(pipelineId!),
      'community_branchesId': _communityBranchId != null
          ? int.parse(_communityBranchId.toString())
          : ritelInformasiLainnya != null
              ? int.parse(ritelInformasiLainnya!.community_branchesId!)
              : int.parse(_communityBranchId.toString()),
      'etaToCB': waktuTempuhController.text.isNotEmpty
          ? waktuTempuhController.text.trim()
          : '',
      'loanAmount': int.parse(
        estimasiNominalPinjamanController.text.trim().split('.').join(),
      ),
      'tagLocation': {
        'latLng': ritelInformasiLainnya != null
            ? ritelInformasiLainnya!.tagLocation!.latLng!
            : tagLocationKunjunganController.text.isNotEmpty
                ? latLng
                : '',
        'name': tagLocationKunjunganController.text.isNotEmpty
            ? tagLocationKunjunganController.text.trim()
            : '',
      },
      'purposeVisit': tujuanKunjunganDebiturController.text.isNotEmpty
          ? tujuanKunjunganDebiturController.text.trim()
          : '',
      'dateOfVisit': tglKunjunganDebiturController.text.isNotEmpty
          ? tglKunjunganDebiturController.text.trim()
          : null,
      'visitResult': hasilKunjunganDebiturController.text.isNotEmpty
          ? hasilKunjunganDebiturController.text.trim()
          : '',
      'suratPermohonanPath': fotoSKPIUrl,
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

  bool isLoadingPostData = false;
  Future _postData(
    PipelinePerusahaanCvAPIMethod pipelinePerusahaanCvAPIMethod,
    bool isContinue,
  ) async {
    setLoadingPostData(true);
    final infoLainnyaMap = await _generateInfoLainnyaMap();
    setLoadingPostData(false);
    switch (pipelinePerusahaanCvAPIMethod) {
      case PipelinePerusahaanCvAPIMethod.addInformasiPerusahaanCv:
        break;
      case PipelinePerusahaanCvAPIMethod.updateInformasiPerusahaanCv:
        break;
      case PipelinePerusahaanCvAPIMethod.addPengurusCv:
        break;
      case PipelinePerusahaanCvAPIMethod.updatePengurusCv:
        break;
      case PipelinePerusahaanCvAPIMethod.addLainnya:
        final res = await runBusyFuture(
          _ritelPipelinePerusahaanCvAPI.addInformasiLainnya(infoLainnyaMap),
        );

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
      case PipelinePerusahaanCvAPIMethod.updateLainnya:
        final res = await runBusyFuture(_ritelPipelinePerusahaanCvAPI
            .updateInformasiLainnya(infoLainnyaMap));

        res.fold(
          (errorMessage) {
            _showErrorDialog(errorMessage);
            listUrlFotoKunjungan = List.generate(3, (index) => null);
            listUrlPublicFotoKunjungan = List.generate(3, (index) => null);
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
    PipelinePerusahaanCvAPIMethod pipelinePerusahaanCvAPIMethod, {
    bool isContinue = false,
  }) async {
    if (formKey.currentState!.validate() && _validateUploadFiles()) {
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

  int getListFotoKunjunganLength() {
    int temp = 0;
    listUrlFotoKunjungan.forEach((element) {
      if (element != null) {
        temp++;
      }
    });

    return temp;
  }

  bool _isLoadingSKPI = false;

  bool get isLoadingSKPI => _isLoadingSKPI;

  PlatformFile? fotoSKPI;
  String? fotoSKPIErrorText;
  String? fotoSKPIUrl;
  String? fotoSKPIPublicUrl;

  Future captureSKPI() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      _isLoadingSKPI = true;
      notifyListeners();
      if (_isLoadingSKPI) {
        if (_isImageOrPdf(res.extension!)) {
          fotoSKPI = res;
          fotoSKPIErrorText = null;
          uploadFileSKPI(fotoSKPI!);
          notifyListeners();
        } else {
          _showErrorDialog('File yang diperbolehkan hanya jpg, jpeg, png');
        }
      }
    }
  }

  Future clearSKPI() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus Foto',
      description: 'Anda yakin akan menghapus file SKPI ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoSKPI = null;
      fotoSKPIUrl = null;
      fotoSKPIPublicUrl = null;
      notifyListeners();
    }
  }

  Future uploadFileSKPI(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) async {
        _isLoadingSKPI = false;
        fotoSKPIUrl = success;
        fotoSKPIPublicUrl = await _getPublicFile(success);
        notifyListeners();
      },
    );
  }

  bool _isImageOrPdf(String type) {
    type = type.toLowerCase();
    return (type == 'pdf' || type == 'jpg' || type == 'png' || type == 'jpeg');
  }

  bool _isImage(String type) {
    type = type.toLowerCase();
    return (type == 'jpg' || type == 'png' || type == 'jpeg');
  }

  void setLoadingForm(bool value) {
    isLoadingGetAddress = value;
    notifyListeners();
  }

  void setLoadingPostData(bool value) {
    isLoadingPostData = value;
    notifyListeners();
  }
}

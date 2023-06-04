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
import '../../../../../../application/enums/pipeline_perusahaan_pt_api_method.dart';
import '../../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../../application/models/community_branch_ritel.dart';
import '../../../../../../application/models/ritel_informasi_lainnya_pt.dart';
import '../../../../../../application/services/location_service.dart';
import '../../../../../../application/services/media_service.dart';
import '../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../infrastructure/apis/ritel_pipeline_perusahaan_pt_api.dart';
import '../../../../../../infrastructure/apis/ritel_upload_file_api.dart';

class InformasiLainnyaPtViewModel extends BaseViewModel {
  String? pipelineId;
  RitelInformasiLainnyaPt? ritelInformasiLainnyaPt;
  bool fromTdpPerusahaanView;
  bool? fromPipelineDetailsView;
  int? statusPipeline;

  InformasiLainnyaPtViewModel({
    this.pipelineId,
    this.ritelInformasiLainnyaPt,
    required this.fromTdpPerusahaanView,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  });

  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  final DialogService _dialogService = locator<DialogService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final MaksimaMediaService _mediaService = locator<MaksimaMediaService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final RitelPipelinePerusahaanPtAPI _ritelPipelinePerusahaanPtAPI =
      locator<RitelPipelinePerusahaanPtAPI>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();
  final RitelUploadFileAPI _ritelUploadFileAPI = locator<RitelUploadFileAPI>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final formatter = NumberFormat('#,###', 'id_ID');

  Future initialize() async {
    setBusy(true);
    jenisProdukPinjamanController.text = 'Pinang Maksima - KMK PTR';
    tujuanKunjunganDebiturController.text = 'Prakarsa Kredit';

    await getCommunityBranch();
    if (ritelInformasiLainnyaPt != null) {
      await _prepopulateTextFields();
      if (ritelInformasiLainnyaPt!.visitPath != []) {
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
  }

  Future _prepopulateTextFields() async {
    cbTerdekatController
      ..text = ritelInformasiLainnyaPt!.cbName!
      ..selection =
          TextSelection.collapsed(offset: cbTerdekatController.text.length);

    waktuTempuhController
      ..text = ritelInformasiLainnyaPt!.etaToCB!.toString()
      ..selection =
          TextSelection.collapsed(offset: waktuTempuhController.text.length);

    estimasiNominalPinjamanController
      ..text = formatter
          .format(double.parse(ritelInformasiLainnyaPt!.loanAmount!))
          .toString()
      ..selection = TextSelection.collapsed(
        offset: estimasiNominalPinjamanController.text.length,
      );

    tujuanKunjunganDebiturController
      ..text = ritelInformasiLainnyaPt!.purposeVisit!
      ..selection = TextSelection.collapsed(
        offset: tujuanKunjunganDebiturController.text.length,
      );

    tagLocationKunjunganController
      ..text = ritelInformasiLainnyaPt!.tagLocation!.name!
      ..selection = TextSelection.collapsed(
        offset: tagLocationKunjunganController.text.length,
      );

    if (ritelInformasiLainnyaPt!.dateOfVisit != null) {
      tglKunjunganDebiturController.text =
          DateStringFormatter.forInput(ritelInformasiLainnyaPt!.dateOfVisit!);
    }

    hasilKunjunganDebiturController
      ..text = ritelInformasiLainnyaPt!.visitResult!
      ..selection = TextSelection.collapsed(
        offset: hasilKunjunganDebiturController.text.length,
      );
  }

  List<String?> listUrlFotoKunjungan = [];
  List<String?> listUrlPublicFotoKunjungan = [];
  List<String?> listErrorMessageUpload = [];
  bool isLoadingImage = false;

  Future _prepopulateImages() async {
    if ((ritelInformasiLainnyaPt?.visitPath?.length ?? 0) > 0) {
      for (var i = 0;
          i < (ritelInformasiLainnyaPt?.visitPath?.length ?? 0);
          i++) {
        if (ritelInformasiLainnyaPt?.visitPath?[i]['path'] != null) {
          String _temp = ritelInformasiLainnyaPt?.visitPath?[i]['path'];
          listUrlFotoKunjungan.add(_temp);
          listUrlPublicFotoKunjungan.add(await _getPublicFile(_temp));
          notifyListeners();
        }
      }
    } else {
      listUrlFotoKunjungan = List.generate(2, (index) => null);
      listUrlPublicFotoKunjungan = List.generate(2, (index) => null);
    }

    if (ritelInformasiLainnyaPt!.suratPermohonanPath != null &&
        ritelInformasiLainnyaPt!.suratPermohonanPath!.isNotEmpty) {
      fotoSKPIUrl = ritelInformasiLainnyaPt!.suratPermohonanPath!;
      fotoSKPIPublicUrl =
          await _getPublicFile(ritelInformasiLainnyaPt!.suratPermohonanPath!);
      notifyListeners();
    }
  }

  PlatformFile? fotoSKPI;
  String? fotoSKPIErrorText;
  String? fotoSKPIUrl;
  String? fotoSKPIPublicUrl;

  Future capturefotoSKPI() async {
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
          _showErrorDialog(
              'File yang diperbolehkan hanya jpg, jpeg, png atau pdf!');
        }
      }
    }
  }

  Future clearFotoSKPI() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description:
          'Anda yakin akan menghapus file surat permohonan kredit debitur ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoSKPI = null;
      fotoSKPIPublicUrl = null;
      fotoSKPIPublicUrl = null;
      notifyListeners();
    }
  }

  Future uploadFileSKPI(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold((errorMessage) => _showErrorDialog(errorMessage), (url) async {
      _isLoadingSKPI = false;
      fotoSKPIUrl = url;
      fotoSKPIPublicUrl = await _getPublicFile(url);
      notifyListeners();
    });
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

  final tglKunjunganDebiturController = TextEditingController();

  void updateTglKunjunganDebitur(String val) =>
      tglKunjunganDebiturController.text = val.trim();

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
    notifyListeners();
    setLoadingForm(false);
    setLoadingPostData(false);
  }

  bool _isLoadingFotoKunjunganSatu = false;

  bool get isLoadingFotoKunjunganSatu => _isLoadingFotoKunjunganSatu;
  PlatformFile? fotoKunjunganSatu;
  String? fotoKunjunganSatuErrorText;
  String? fotoKunjunganSatuUrl;
  String? fotoKunjunganSatuPublicUrl;

  Future captureFotoKunjunganSatu() async {
    final res = await _mediaService
        .getMultiFileType(allowedExtensions: ['png', 'jpg', 'jpeg']);

    if (res != null) {
      _isLoadingFotoKunjunganSatu = true;
      notifyListeners();
      if (_isLoadingFotoKunjunganSatu) {
        if (_isImage(res.extension!)) {
          fotoKunjunganSatu = res;
          fotoKunjunganSatuErrorText = null;
          uploadFileSatu(fotoKunjunganSatu!);
          notifyListeners();
        } else {
          _showErrorDialog('File yang diperbolehkan hanya jpg, jpeg, png');
        }
      }
    }
  }

  Future uploadFileSatu(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) async {
        _isLoadingFotoKunjunganSatu = false;
        fotoKunjunganSatuUrl = success;
        fotoKunjunganSatuPublicUrl = await _getPublicFile(success);
        notifyListeners();
      },
    );
  }

  Future clearFotoKunjunganSatu() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus Foto',
      description: 'Anda yakin akan menghapus foto kunjungan satu ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoKunjunganSatu = null;
      fotoKunjunganDuaErrorText = null;
      fotoKunjunganSatuUrl = null;
      fotoKunjunganSatuPublicUrl = null;
      notifyListeners();
    }
  }

  bool _isLoadingFotoKunjunganDua = false;

  bool get isLoadingFotoKunjunganDua => _isLoadingFotoKunjunganDua;
  PlatformFile? fotoKunjunganDua;
  String? fotoKunjunganDuaErrorText;
  String? fotoKunjunganDuaUrl;
  String? fotoKunjunganDuaPublicUrl;

  Future captureFotoKunjunganDua() async {
    final res = await _mediaService
        .getMultiFileType(allowedExtensions: ['png', 'jpg', 'jpeg']);

    if (res != null) {
      _isLoadingFotoKunjunganDua = true;
      notifyListeners();
      if (_isLoadingFotoKunjunganDua) {
        if (_isImage(res.extension!)) {
          fotoKunjunganDua = res;
          fotoKunjunganDuaErrorText = null;
          uploadFileDua(fotoKunjunganDua!);
          notifyListeners();
        } else {
          _showErrorDialog('File yang diperbolehkan hanya jpg, jpeg, png');
        }
      }
    }
  }

  Future uploadFileDua(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
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

  Future clearFotoKunjunganDua() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus Foto',
      description: 'Anda yakin akan menghapus foto kunjungan dua ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoKunjunganDua = null;
      fotoKunjunganDuaUrl = null;
      fotoKunjunganDuaPublicUrl = null;
      notifyListeners();
    }
  }

  bool _isLoadingFotoKunjunganTiga = false;

  bool get isLoadingFotoKunjunganTiga => _isLoadingFotoKunjunganTiga;
  PlatformFile? fotoKunjunganTiga;
  String? fotoKunjunganTigaErrorText;
  String? fotoKunjunganTigaUrl;
  String? fotoKunjunganTigaPublicUrl;

  Future captureFotoKunjunganTiga() async {
    final res = await _mediaService
        .getMultiFileType(allowedExtensions: ['png', 'jpg', 'jpeg']);

    if (res != null) {
      _isLoadingFotoKunjunganTiga = true;
      notifyListeners();
      if (_isLoadingFotoKunjunganTiga) {
        if (_isImage(res.extension!)) {
          fotoKunjunganTiga = res;
          fotoKunjunganTigaErrorText = null;
          uploadFileTiga(fotoKunjunganTiga!);
          notifyListeners();
        } else {
          _showErrorDialog('File yang diperbolehkan hanya jpg, jpeg, png');
        }
      }
    }
  }

  Future uploadFileTiga(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) async {
        _isLoadingFotoKunjunganTiga = false;
        fotoKunjunganTigaUrl = success;
        fotoKunjunganTigaPublicUrl = await _getPublicFile(success);
        notifyListeners();
      },
    );
  }

  Future clearFotoKunjunganTiga() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus Foto',
      description: 'Anda yakin akan menghapus foto kunjungan tiga ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoKunjunganTiga = null;
      fotoKunjunganTigaUrl = null;
      fotoKunjunganDuaPublicUrl = null;
      notifyListeners();
    }
  }

  bool _isLoadingFotoKunjunganEmpat = false;

  bool get isLoadingFotoKunjunganEmpat => _isLoadingFotoKunjunganEmpat;
  PlatformFile? fotoKunjunganEmpat;
  String? fotoKunjunganEmpatErrorText;
  String? fotoKunjunganEmpatUrl;
  String? fotoKunjunganEmpatPublicUrl;

  Future captureFotoKunjunganEmpat() async {
    final res = await _mediaService
        .getMultiFileType(allowedExtensions: ['png', 'jpg', 'jpeg']);

    if (res != null) {
      _isLoadingFotoKunjunganEmpat = true;
      notifyListeners();
      if (_isLoadingFotoKunjunganEmpat) {
        if (_isImage(res.extension!)) {
          fotoKunjunganEmpat = res;
          fotoKunjunganEmpatErrorText = null;
          uploadFileEmpat(fotoKunjunganEmpat!);
          notifyListeners();
        } else {
          _showErrorDialog('File yang diperbolehkan hanya jpg, jpeg, png');
        }
      }
    }
  }

  Future uploadFileEmpat(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) async {
        _isLoadingFotoKunjunganEmpat = false;
        fotoKunjunganEmpatUrl = success;
        fotoKunjunganEmpatPublicUrl = await _getPublicFile(success);
        notifyListeners();
      },
    );
  }

  Future clearFotoKunjunganEmpat() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus Foto',
      description: 'Anda yakin akan menghapus foto kunjungan empat ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoKunjunganEmpat = null;
      fotoKunjunganEmpatUrl = null;
      fotoKunjunganDuaPublicUrl = null;
      notifyListeners();
    }
  }

  bool _isLoadingFotoKunjunganLima = false;

  bool get isLoadingFotoKunjunganLima => _isLoadingFotoKunjunganLima;
  PlatformFile? fotoKunjunganLima;
  String? fotoKunjunganLimaErrorText;
  String? fotoKunjunganLimaUrl;
  String? fotoKunjunganLimaPublicUrl;

  Future captureFotoKunjunganLima() async {
    final res = await _mediaService
        .getMultiFileType(allowedExtensions: ['png', 'jpg', 'jpeg']);

    if (res != null) {
      _isLoadingFotoKunjunganLima = true;
      notifyListeners();
      if (_isLoadingFotoKunjunganLima) {
        if (_isImage(res.extension!)) {
          fotoKunjunganLima = res;
          fotoKunjunganLimaErrorText = null;
          uploadFileLima(fotoKunjunganLima!);
          notifyListeners();
        } else {
          _showErrorDialog('File yang diperbolehkan hanya jpg, jpeg, png');
        }
      }
    }
  }

  Future uploadFileLima(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) async {
        _isLoadingFotoKunjunganLima = false;
        fotoKunjunganLimaUrl = success;
        fotoKunjunganLimaPublicUrl = await _getPublicFile(success);
        notifyListeners();
      },
    );
  }

  Future clearFotoKunjunganLima() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus Foto',
      description: 'Anda yakin akan menghapus foto kunjungan lima ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fotoKunjunganLima = null;
      fotoKunjunganLimaPublicUrl = null;
      fotoKunjunganLimaUrl = null;
      notifyListeners();
    }
  }

  bool _isLoadingFotoKunjungan = false;
  bool get isLoadingFotoKunjungan => _isLoadingFotoKunjungan;
  Future captureFotoKunjungan(int index) async {
    final res = await _mediaService
        .getMultiFileType(allowedExtensions: ['png', 'jpg', 'jpeg']);

    if (res != null) {
      _isLoadingFotoKunjungan = true;
      notifyListeners();
      if (_isLoadingFotoKunjungan) {
        if (_isImage(res.extension!)) {
          fotoKunjunganDuaErrorText = null;
          uploadFile(res, index);
          notifyListeners();
        } else {
          _showErrorDialog('File yang diperbolehkan hanya jpg, jpeg, png');
        }
      }
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
        int _temp = getListFotoKunjunganLength();
        if (_temp > 2 && _temp < 5 && listUrlFotoKunjungan.length < 5) {
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

      listUrlFotoKunjungan.removeWhere((element) => element == null);
      listUrlPublicFotoKunjungan.removeWhere((element) => element == null);

      listUrlFotoKunjungan.removeAt(index);
      listUrlPublicFotoKunjungan.removeAt(index);
      notifyListeners();
      int _temp = getListFotoKunjunganLength();
      if (_temp >= 1 && _temp < 5) {
        listUrlFotoKunjungan.add(null);
        listUrlPublicFotoKunjungan.add(null);
      } else if (listUrlFotoKunjungan.length == 0) {
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

    _navigationService.navigateTo(
      Routes.tDPPerusahaanPtViewRitel,
      arguments: TDPPerusahaanPtViewRitelArguments(
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
    if (pipelineId != null) {
      _navigationService.back(result: {'pipelineId': pipelineId});
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
          : ritelInformasiLainnyaPt != null
              ? int.parse(ritelInformasiLainnyaPt!.community_branchesId!)
              : int.parse(_communityBranchId.toString()),
      'etaToCB': waktuTempuhController.text.isNotEmpty
          ? waktuTempuhController.text.trim()
          : '',
      'loanAmount': int.parse(
        estimasiNominalPinjamanController.text.trim().split('.').join(),
      ),
      'suratPermohonanPath': fotoSKPIUrl ?? '',
      'tagLocation': {
        'latLng': ritelInformasiLainnyaPt != null
            ? ritelInformasiLainnyaPt!.tagLocation!.latLng!
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
    };

    return {
      ...data,
      'visitPath': listUrlFotoKunjungan.length == 0
          ? []
          : List.generate(
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
    PipelinePerusahaanPtAPIMethod pipelinePerusahaanPtAPIMethod,
    bool isContinue,
  ) async {
    setLoadingPostData(true);
    final infoLainnyaMap = await _generateInfoLainnyaMap();
    setLoadingPostData(false);
    switch (pipelinePerusahaanPtAPIMethod) {
      case PipelinePerusahaanPtAPIMethod.addInformasiPerusahaanPt:
        break;
      case PipelinePerusahaanPtAPIMethod.updateInformasiPerusahaanPt:
        break;
      case PipelinePerusahaanPtAPIMethod.addPengurusPt:
        break;
      case PipelinePerusahaanPtAPIMethod.updatePengurusPt:
        break;
      case PipelinePerusahaanPtAPIMethod.addLainnya:
        final res = await runBusyFuture(_ritelPipelinePerusahaanPtAPI
            .addInformasiLainnyaPt(infoLainnyaMap));

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
      case PipelinePerusahaanPtAPIMethod.updateLainnya:
        final res = await runBusyFuture(_ritelPipelinePerusahaanPtAPI
            .updateInformasiLainnyaPt(infoLainnyaMap));

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
    notifyListeners();
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
    PipelinePerusahaanPtAPIMethod pipelinePerusahaanPtAPIMethod, {
    bool isContinue = false,
  }) async {
    if (formKey.currentState!.validate() && _validateUploadFiles()) {
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
    int _temp = 0;
    listUrlFotoKunjungan.forEach((element) {
      if (element != null) {
        _temp++;
      }
    });
    // ignore: newline-before-return
    return _temp;
  }

  bool _isLoadingSKPI = false;

  bool get isLoadingSKPI => _isLoadingSKPI;

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

// ignore_for_file: unused_import, no_leading_underscores_for_local_identifiers

import 'dart:developer' as developer;
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../application/enums/bottom_sheet_type.dart';
import '../../../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../../../application/enums/informasi_agunan_lkn_api_method.dart';
import '../../../../../../../../../application/helpers/convert_url_to_file.dart';
import '../../../../../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../../../../../application/helpers/initial_code_table_formatter.dart';
import '../../../../../../../../../application/models/community_branch_ritel.dart';
import '../../../../../../../../../application/models/ritel_laporan_kunjungan_nasabah.dart';
import '../../../../../../../../../application/services/location_service.dart';
import '../../../../../../../../../application/services/media_service.dart';
import '../../../../../../../../../infrastructure/apis/ritel_laporan_kunjungan_nasabah_api.dart';
import '../../../../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../../../../infrastructure/apis/ritel_upload_file_api.dart';

class InformasiAgunanLknFormViewModel extends BaseViewModel {
  String prakarsaId;
  RitelLaporanKunjunganNasabah? ritelLaporanKunjunganNasabah;
  String pipelineId;
  int loanTypesId;
  int status;
  final int codeTable;

  InformasiAgunanLknFormViewModel({
    required this.prakarsaId,
    required this.pipelineId,
    this.ritelLaporanKunjunganNasabah,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final DialogService _dialogService = locator<DialogService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final _mediaService = locator<MaksimaMediaService>();
  final RitelLaporanKunjunganNasabahAPI _ritelLaporanKunjunganNasabahAPI =
      locator<RitelLaporanKunjunganNasabahAPI>();
  final RitelUploadFileAPI _ritelUploadFileAPI = locator<RitelUploadFileAPI>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();
  final formatter = NumberFormat('#,###', 'id_ID');
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String prakarsaType = '';

  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;

  Future initialize() async {
    prakarsaType = InitialCodeTableFormatter.getPrakarsaType(codeTable);
    setBusy(true);

    jenisProdukPinjamanController
      ..text = loanTypesId == 1
          ? 'Pinang Maksima - KMK PTR'
          : 'Pinang Maksima - KMK PRK Pinang PARI'
      ..selection = TextSelection.collapsed(
        offset: jenisProdukPinjamanController.text.length,
      );

    tujuanKunjunganNasabahController.text = 'Prakarsa Kredit';

    await getCommunityBranch();
    if (ritelLaporanKunjunganNasabah != null) {
      await _prepopulateTextFields();
      if (ritelLaporanKunjunganNasabah!.dataLkn!.visitPath != []) {
        await _prepopulateImages();
        if (listFotoKunjunganFilePublicUrl.isEmpty) {
          listFotoKunjunganFile = List.generate(1, (index) => null);
          listFotoKunjunganFileUrl = List.generate(1, (index) => null);
          listFotoKunjunganFilePublicUrl = List.generate(1, (index) => null);
          notifyListeners();
        } else if (listFotoKunjunganFilePublicUrl.length < 5 &&
            listFotoKunjunganFilePublicUrl.isNotEmpty) {
          listFotoKunjunganFile.add(null);
          listFotoKunjunganFileUrl.add(null);
          listFotoKunjunganFilePublicUrl.add(null);
          notifyListeners();
        }
      }
    }
    setBusy(false);
  }

  Future _prepopulateTextFields() async {
    cbTerdekatController
      ..text = ritelLaporanKunjunganNasabah!.dataLkn!.cbName!
      ..selection =
          TextSelection.collapsed(offset: cbTerdekatController.text.length);

    waktuTempuhLokasiController
      ..text = ritelLaporanKunjunganNasabah!.dataLkn!.etaToCB!.toString()
      ..selection = TextSelection.collapsed(
        offset: waktuTempuhLokasiController.text.length,
      );

    jenisProdukPinjamanController
      ..text = loanTypesId == 1
          ? 'Pinang Maksima - KMK PTR'
          : 'Pinang Maksima - KMK PRK Pinang PARI'
      ..selection = TextSelection.collapsed(
        offset: jenisProdukPinjamanController.text.length,
      );

    estiMasiNominalPinjamanController
      ..text = formatter
          .format(
            double.parse(ritelLaporanKunjunganNasabah!.dataLkn!.loanAmount!),
          )
          .toString()
      ..selection = TextSelection.collapsed(
        offset: estiMasiNominalPinjamanController.text.length,
      );

    tagLocationKunjunganController
      ..text = ritelLaporanKunjunganNasabah!.dataLkn!.tagLocation!.name!
      ..selection = TextSelection.collapsed(
        offset: tagLocationKunjunganController.text.length,
      );

    if (ritelLaporanKunjunganNasabah!.dataLkn!.dateOfVisit != null) {
      tanggalKunjunganNasabahController.text = DateStringFormatter.forInput(
        ritelLaporanKunjunganNasabah!.dataLkn!.dateOfVisit!,
      );
    }

    hasilKunjunganNasabahController
      ..text = ritelLaporanKunjunganNasabah!.dataLkn!.visitResult!
      ..selection = TextSelection.collapsed(
        offset: hasilKunjunganNasabahController.text.length,
      );

    tujuanKunjunganNasabahController
      ..text = ritelLaporanKunjunganNasabah!.dataLkn!.purposeVisit!
      ..selection = TextSelection.collapsed(
        offset: tujuanKunjunganNasabahController.text.length,
      );
  }

  Future _prepopulateImages() async {
    if ((ritelLaporanKunjunganNasabah?.dataLkn?.visitPath?.length ?? 0) > 0) {
      for (var i = 0;
          i < (ritelLaporanKunjunganNasabah?.dataLkn?.visitPath?.length ?? 0);
          i++) {
        if (ritelLaporanKunjunganNasabah?.dataLkn?.visitPath?[i].path != null) {
          String _temp =
              ritelLaporanKunjunganNasabah?.dataLkn?.visitPath?[i].path ?? '';
          // listFotoKunjunganFile.add(await urlToFile(_temp));
          listFotoKunjunganFileUrl.add(_temp);
          listFotoKunjunganFilePublicUrl.add(await _getPublicFile(_temp));
          notifyListeners();
        }
      }
    }
  }

  List<PlatformFile?> listFotoKunjunganFile = [];
  String? listFotoKunjunganErrorText;
  List<String?> listFotoKunjunganFileUrl = [];
  List<String?> listFotoKunjunganFilePublicUrl = [];

  Future captureFotoKunjungan(int index) async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      listFotoKunjunganFile[index] = res;
      uploadfotoKunjunganFile(listFotoKunjunganFile[index]!, index);
      listFotoKunjunganErrorText = null;
      notifyListeners();
    }
  }

  Future uploadfotoKunjunganFile(PlatformFile file, int index) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) async {
        listFotoKunjunganFileUrl[index] = success;
        listFotoKunjunganFilePublicUrl[index] = await _getPublicFile(success);

        int temp = getListFotoKunjunganLength();
        if (temp < 5 && listFotoKunjunganFileUrl.length < 5) {
          listFotoKunjunganFile.add(null);
          listFotoKunjunganFileUrl.add(null);
          listFotoKunjunganFilePublicUrl.add(null);
        }
        notifyListeners();
      },
    );
  }

  Future clearFotoKunjungan(int index) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus Foto',
      description: 'Anda yakin akan menghapus foto Kunjungan ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      listFotoKunjunganFile[index] = null;
      listFotoKunjunganFileUrl[index] = null;
      listFotoKunjunganFilePublicUrl[index] = null;
      listFotoKunjunganFile.removeWhere((element) => element == null);
      listFotoKunjunganFileUrl.removeWhere((element) => element == null);
      listFotoKunjunganFilePublicUrl.removeWhere((element) => element == null);
      listFotoKunjunganFile.add(null);
      listFotoKunjunganFileUrl.add(null);
      listFotoKunjunganFilePublicUrl.add(null);
      listFotoKunjunganErrorText = null;
      notifyListeners();
    }
  }

  final jenisAgunanLknController = TextEditingController();

  void updateJenisAgunanLknController(String val) {
    jenisAgunanLknController.text = val;
    notifyListeners();
  }

  final cbTerdekatController = TextEditingController();

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

  final alamatKunjunganController = TextEditingController();

  void updateAlamatKunjungan(String val) =>
      alamatKunjunganController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  double? _latKunjungan;
  double? _lngKunjungan;
  final NavigationService _navigationService = locator<NavigationService>();

  final tagLocationKunjunganController = TextEditingController();
  bool isLoadingGetAddress = false;
  bool isLoadingPostData = false;
  Future navigateToAddressSelectionViewKunjungan() async {
    setLoadingForm(true);
    setLoadingPostData(false);
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

  void setLoadingForm(bool value) {
    isLoadingGetAddress = value;
    notifyListeners();
  }

  void setLoadingPostData(bool value) {
    isLoadingPostData = value;
    notifyListeners();
  }

  final waktuTempuhLokasiController = TextEditingController();

  void updatewaktuTempuhLokasiController(String val) =>
      waktuTempuhLokasiController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final jenisProdukPinjamanController = TextEditingController();

  // void updateJenisProdukPinjaman(String val) {
  //   jenisProdukPinjamanController.text = val;
  //   notifyListeners();
  // }
  // var jenisProdukPinjamanController = ritelLaporanKunjunganNasabah!.dataLkn!.loanTypesId!;
  // void updatetjenisProdukPinjamanController(String val) {
  //   jenisProdukPinjamanController = val;
  //   notifyListeners();
  // }

  final estiMasiNominalPinjamanController = TextEditingController();

  void updateeestiMasiNominalPinjamanController(String val) =>
      estiMasiNominalPinjamanController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final tujuanKunjunganNasabahController = TextEditingController();

  void updatetujuanKunjunganNasabahController(String val) {
    tujuanKunjunganNasabahController.text = val;
    notifyListeners();
  }

  final tanggalKunjunganNasabahController = TextEditingController();

  void updatettanggalKunjunganNasabahController(String val) =>
      tanggalKunjunganNasabahController.text = val.trim();

  final hasilKunjunganNasabahController = TextEditingController();

  void updateHasilKunjunganDebitur(String val) =>
      hasilKunjunganNasabahController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  Future<Map<String, dynamic>> _generateLaporanKunjunganNasabahMap() async {
    final userLocation = await locator<MaksimaLocationService>().getLocation();
    _latKunjungan = userLocation!.latitude;
    _lngKunjungan = userLocation.longitude;
    var latLng = '${_latKunjungan.toString()}, ${_lngKunjungan.toString()}';
    final locationAddr = await locator<MaksimaLocationService>()
        .getAddressFromLatLng(_latKunjungan!, _lngKunjungan!);

    final data = {
      'pipelinesId': pipelineId,
      'codeTable': codeTable,
      'community_branchesId': _communityBranchId != null
          ? int.parse(_communityBranchId.toString())
          : ritelLaporanKunjunganNasabah != null
              ? int.parse(ritelLaporanKunjunganNasabah!
                  .dataLkn!.community_branchesId
                  .toString())
              : int.parse(_communityBranchId.toString()),
      'etaToCB': waktuTempuhLokasiController.text.isNotEmpty
          ? waktuTempuhLokasiController.text.trim()
          : '',
      // 'loan_typesId': 1,
      // 'loanAmount': int.parse(
      //     estiMasiNominalPinjamanController.text.trim().split('.').join()),
      'dateOfVisit': tanggalKunjunganNasabahController.text.isNotEmpty
          ? tanggalKunjunganNasabahController.text.trim()
          : ritelLaporanKunjunganNasabah != null
              ? ritelLaporanKunjunganNasabah!.dataLkn!.dateOfVisit != null
                  ? DateStringFormatter.forInput(
                      ritelLaporanKunjunganNasabah!.dataLkn!.dateOfVisit!,
                    )
                  : null
              : null,
      'tagLocation': {
        'latLng': ritelLaporanKunjunganNasabah != null
            ? ritelLaporanKunjunganNasabah!.dataLkn!.tagLocation!.latLng != null
                ? ritelLaporanKunjunganNasabah!.dataLkn!.tagLocation!.latLng ==
                        ''
                    ? latLng
                    : ritelLaporanKunjunganNasabah!
                        .dataLkn!.tagLocation!.latLng!
                : ritelLaporanKunjunganNasabah!.dataLkn!.tagLocation!.latLng!
            : latLng,
        'name': tagLocationKunjunganController.text.isNotEmpty
            ? tagLocationKunjunganController.text.trim()
            : '',
      },
      'visitResult': hasilKunjunganNasabahController.text.isNotEmpty
          ? hasilKunjunganNasabahController.text.trim()
          : '',
      'purposeVisit': tujuanKunjunganNasabahController.text.isNotEmpty
          ? tujuanKunjunganNasabahController.text.trim()
          : '',
    };

    listFotoKunjunganFile.removeWhere((element) => element == null);
    listFotoKunjunganFileUrl.removeWhere((element) => element == null);
    listFotoKunjunganFilePublicUrl.removeWhere((element) => element == null);

    return {
      ...data,
      'visitPath': List.generate(
        listFotoKunjunganFileUrl.length,
        (index) => {
          'path': listFotoKunjunganFileUrl[index],
          'meta': {
            'photoName': listFotoKunjunganFileUrl[index] != null
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

  Future<Map<String, dynamic>>
      _generateUpdateLaporanKunjunganNasabahMap() async {
    print('die');
    final userLocation = await locator<MaksimaLocationService>().getLocation();
    _latKunjungan = userLocation!.latitude;
    _lngKunjungan = userLocation.longitude;
    var latLng = '${_latKunjungan.toString()}, ${_lngKunjungan.toString()}';
    print('sie');
    final locationAddr = await locator<MaksimaLocationService>()
        .getAddressFromLatLng(_latKunjungan!, _lngKunjungan!);
    print('end');
    final dataPerorangan = {
      'codeTable': codeTable,
      'community_branchesId': _communityBranchId != null
          ? int.parse(_communityBranchId.toString())
          : ritelLaporanKunjunganNasabah != null
              ? int.parse(ritelLaporanKunjunganNasabah!
                  .dataLkn!.community_branchesId
                  .toString())
              : int.parse(_communityBranchId.toString()),
    };
    final data = {
      'id': int.parse(ritelLaporanKunjunganNasabah!.dataLkn!.id!),
      'pipelinesId': int.parse(pipelineId),
      'etaToCB': waktuTempuhLokasiController.text.isNotEmpty
          ? waktuTempuhLokasiController.text.trim()
          : '',
      if (codeTable == 1) ...dataPerorangan,
      'dateOfVisit': tanggalKunjunganNasabahController.text.isNotEmpty
          ? tanggalKunjunganNasabahController.text.trim()
          : ritelLaporanKunjunganNasabah != null
              ? ritelLaporanKunjunganNasabah!.dataLkn!.dateOfVisit != null
                  ? DateStringFormatter.forInput(
                      ritelLaporanKunjunganNasabah!.dataLkn!.dateOfVisit!,
                    )
                  : null
              : null,
      'tagLocation': {
        'latLng': ritelLaporanKunjunganNasabah != null
            ? ritelLaporanKunjunganNasabah!.dataLkn!.tagLocation!.latLng != null
                ? ritelLaporanKunjunganNasabah!.dataLkn!.tagLocation!.latLng ==
                        ''
                    ? latLng
                    : ritelLaporanKunjunganNasabah!
                        .dataLkn!.tagLocation!.latLng!
                : ritelLaporanKunjunganNasabah!.dataLkn!.tagLocation!.latLng!
            : latLng,
        'name': tagLocationKunjunganController.text.isNotEmpty
            ? tagLocationKunjunganController.text.trim()
            : '',
      },
      'visitResult': hasilKunjunganNasabahController.text.isNotEmpty
          ? hasilKunjunganNasabahController.text.trim()
          : '',
      'purposeVisit': tujuanKunjunganNasabahController.text.isNotEmpty
          ? tujuanKunjunganNasabahController.text.trim()
          : '',
    };

    listFotoKunjunganFile.removeWhere((element) => element == null);
    listFotoKunjunganFileUrl.removeWhere((element) => element == null);
    listFotoKunjunganFilePublicUrl.removeWhere((element) => element == null);

    return {
      ...data,
      'visitPath': List.generate(
        listFotoKunjunganFileUrl.length,
        (index) => {
          'path': listFotoKunjunganFileUrl[index],
          'meta': {
            'photoName': listFotoKunjunganFileUrl[index] != null
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
    InformasiAgunanLKNAPIMethod informasiAgunanLKNAPIMethod,
  ) async {
    switch (informasiAgunanLKNAPIMethod) {
      case InformasiAgunanLKNAPIMethod.add:
        final laporanKunjunganNasabahMap =
            await _generateLaporanKunjunganNasabahMap();
        print('PERTAMA');
        final res = await runBusyFuture(
          _ritelLaporanKunjunganNasabahAPI.addLaporanKunjunganNasabah(
            laporanKunjunganNasabahMap,
            prakarsaType,
          ),
        );

        res.fold(
          (errorMessage) => _showErrorDialog(errorMessage),
          (successMap) => _showSuccessDialog(
            'Berhasil menambahkan laporan kunjungan nasabah!',
          ),
        );
        break;
      case InformasiAgunanLKNAPIMethod.update:
        print('INDEX 0');
        final updateLaporanKunjunganNasabahMap =
            await _generateUpdateLaporanKunjunganNasabahMap();
        print('PERTAMA UPDATE');
        developer.log(updateLaporanKunjunganNasabahMap.toString());
        final res = await runBusyFuture(
          _ritelLaporanKunjunganNasabahAPI.updateLaporanKunjunganNasabah(
            updateLaporanKunjunganNasabahMap,
            prakarsaType,
          ),
        );

        res.fold(
          (errorMessage) => _showErrorDialog(errorMessage),
          (successMap) => _showSuccessDialog(
            'Berhasil mengubah laporan kunjungan nasabah!',
          ),
        );
        break;
    }
  }

  bool _validateUploadFiles() {
    return listFotoKunjunganFileUrl.isNotEmpty
        ? listFotoKunjunganFileUrl.length - 1 >= 3
            ? true
            : false
        : false;
  }

  Future validateInputs(
    InformasiAgunanLKNAPIMethod informasiAgunanLKNAPIMethod,
  ) async {
    if (formKey.currentState!.validate() && _validateUploadFiles()) {
      final response = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.confirmation,
        data: {'title': 'Konfirmasi'},
      );

      if (response != null && response.confirmed) {
        _postData(informasiAgunanLKNAPIMethod);
      }
    } else {
      print(listFotoKunjunganFile);
      developer.log(listFotoKunjunganFile.toString());
      autoValidateMode = AutovalidateMode.always;
      _setUploadFilesErrorTextIfAny();
      notifyListeners();
    }
  }

  void _setUploadFilesErrorTextIfAny() {
    if (listFotoKunjunganFile.isNotEmpty) {
      if (listFotoKunjunganFile.length - 1 < 3) {
        _showFilesValidationErrorDialog();
      } else {
        _showValidationErrorDialog();
      }
    }
  }

  Future _showFilesValidationErrorDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Invalid',
      description: 'Foto kunjungan minimal 3 untuk diupload.',
      mainButtonTitle: 'OK',
    );
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

  Future _showSuccessDialog(String successMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    _navigationService.navigateTo(
      Routes.informasiAgunanViewRitel,
      arguments: InformasiAgunanViewRitelArguments(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
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

  void navigateBack() => _navigationService.navigateTo(
        Routes.informasiAgunanViewRitel,
        arguments: InformasiAgunanViewRitelArguments(
          prakarsaId: prakarsaId,
          pipelineId: pipelineId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      );

  int getListFotoKunjunganLength() {
    int _temp = 0;
    listFotoKunjunganFileUrl.forEach((element) {
      if (element != null) {
        _temp++;
      }
    });
    // ignore: newline-before-return
    return _temp;
  }
}

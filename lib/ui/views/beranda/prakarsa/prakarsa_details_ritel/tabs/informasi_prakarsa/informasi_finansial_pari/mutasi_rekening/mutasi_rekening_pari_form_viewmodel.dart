// ignore_for_file: prefer-conditional-expressions, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'dart:developer' as dev;

import '../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../application/enums/bottom_sheet_type.dart';
import '../../../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../../../application/enums/mutasi_rekening_api_method.dart';
import '../../../../../../../../../application/helpers/convert_url_to_file.dart';
import '../../../../../../../../../application/models/ritel_mutasi_rekening.dart';
import '../../../../../../../../../application/services/media_service.dart';
import '../../../../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../../../../infrastructure/apis/ritel_mutasi_rekening_api.dart';
import '../../../../../../../../../infrastructure/apis/ritel_upload_file_api.dart';

final formatter = NumberFormat('#,###', 'id_ID');

class MutasiRekeningPariFormViewModel extends BaseViewModel {
  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final DialogService _dialogService = locator<DialogService>();
  final MaksimaMediaService _mediaService = locator<MaksimaMediaService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  final RitelMutasiRekeningAPI _ritelMutasiRekeningAPI =
      locator<RitelMutasiRekeningAPI>();
  final RitelUploadFileAPI _ritelUploadFileAPI = locator<RitelUploadFileAPI>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();

  RitelMutasiRekening? ritelMutasiRekening;
  String prakarsaId;
  String pipelineId;
  int loanTypesId;
  int status;
  final int codeTable;
  int? index;

  MutasiRekeningPariFormViewModel({
    this.ritelMutasiRekening,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
    this.index,
  });

  Future initialize() async {
    setBusy(true);
    if (ritelMutasiRekening != null) {
      await _prepopulateTextFields();
    }
    setBusy(false);
  }

  int? _count = 1;

  int get count => _count!;

  Future addWidget() async {
    if (ritelMutasiRekening == null) {
      _count = _count! + 1;
      notifyListeners();
    } else {
      final res = await runBusyFuture(
        _ritelMutasiRekeningAPI.addMutasiRekeningSection(
          {
            'mutasiRekeningId': int.parse(ritelMutasiRekening!.id!),
            'prakarsaId': prakarsaId,
          },
          codeTable,
        ),
      );

      res.fold(
        (err) => _showErrorDialog(err),
        (success) async {
          _count = _count! + 1;
          await fetchMutasiRekening();
        },
      );
    }
  }

  Future fetchMutasiRekening() async {
    final res = await runBusyFuture(
      _ritelMutasiRekeningAPI.fetchMutasiRekening(prakarsaId, codeTable),
    );

    res.fold(
      // ignore: no-empty-block
      (errorMessage) {},
      (successData) async {
        final mutasiMap = List<RitelMutasiRekening>.from(
          successData.map(
            (i) => RitelMutasiRekening.fromJson(i as Map<String, dynamic>),
          ),
        );
        ritelMutasiRekening = mutasiMap[index!];
      },
    );
  }

  final namaBankController = TextEditingController();

  void updateNamaBank(String val) {
    namaBankController.text = val;
    notifyListeners();
  }

  final noRekeningController = TextEditingController();

  void updateNoRekening(String val) => noRekeningController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final periodeAwalController = TextEditingController();

  void updatePeriodeAwal(String val) =>
      periodeAwalController.text = convertDateRevers(val.trim());

  final periodeAkhirController = TextEditingController();

  void updatePeriodeAkhir(String val) =>
      periodeAkhirController.text = convertDateRevers(val.trim());

  void updateTotalAkhirTiapBulan() {
    int saldoAwal =
        int.parse(saldoAwalController.text.split('.').join().trim());
    int totalMutasiDebet =
        int.parse(totalMutasiDebetController.text.split('.').join().trim());
    int totalMutasiKredit =
        int.parse(totalMutasiKreditController.text.split('.').join().trim());
    int totalAkhirTiapBulan =
        (saldoAwal - totalMutasiDebet) + totalMutasiKredit;

    totalAkhirTiapBulanController.text =
        formatter.format(totalAkhirTiapBulan).toString();
  }

  final totalMutasiDebetController = TextEditingController();

  void updateTotalMutasiDebet(String val) {
    totalMutasiDebetController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    updateTotalAkhirTiapBulan();
  }

  final totalMutasiKreditController = TextEditingController();

  void updateTotalMutasiKredit(String val) {
    totalMutasiKreditController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    updateTotalAkhirTiapBulan();
  }

  final totalAkhirTiapBulanController = TextEditingController();

  final saldoAwalController = TextEditingController();

  void updateSaldoAwal(String val) {
    saldoAwalController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    updateTotalAkhirTiapBulan();
  }

  int loadUploadMutasiOne = 0;
  PlatformFile? fileBuktiMutasi;
  String? filePath;
  String? fileBuktiMutasiUrl;
  String? fileBuktiMutasiErrorText;

  Future pickFile() async {
    final res = await _mediaService.getMultiFileType();
    loadUploadMutasiOne = 1;
    if (res != null) {
      fileBuktiMutasi = res;
      fileBuktiMutasiErrorText = null;
      // final splitFile = fileBuktiMutasi!.path.split('file_picker/');
      // filePath = splitFile[1].toString();
      uploadFile(type: 'application', subType: 'pdf', file: fileBuktiMutasi!);
      notifyListeners();
    }
  }

  String? fileBuktiMutasiUrlPublic;

  Future uploadFile({
    required String type,
    required String subType,
    required PlatformFile file,
  }) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) async {
        loadUploadMutasiOne = 2;
        fileBuktiMutasiUrl = success;
        fileBuktiMutasiUrlPublic = await _getPublicFile(success);
      },
    );
  }

  Future clearFile() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fileBuktiMutasi = null;
      fileBuktiMutasiUrl = '';
      notifyListeners();
    }
  }

  final periodeAwalTwoController = TextEditingController();

  void updatePeriodeAwalTwo(String val) =>
      periodeAwalTwoController.text = convertDateRevers(val.trim());

  final periodeAkhirTwoController = TextEditingController();

  void updatePeriodeAkhirTwo(String val) =>
      periodeAkhirTwoController.text = convertDateRevers(val.trim());

  void updateTotalAkhirTiapBulanTwo() {
    int saldoAwal =
        int.parse(saldoAwalTwoController.text.split('.').join().trim());
    int totalMutasiDebet =
        int.parse(totalMutasiDebetTwoController.text.split('.').join().trim());
    int totalMutasiKredit =
        int.parse(totalMutasiKreditTwoController.text.split('.').join().trim());
    int totalAkhirTiapBulan =
        (saldoAwal - totalMutasiDebet) + totalMutasiKredit;

    totalAkhirTiapBulanTwoController.text =
        formatter.format(totalAkhirTiapBulan).toString();
  }

  final totalMutasiDebetTwoController = TextEditingController();

  void updateTotalMutasiDebetTwo(String val) {
    totalMutasiDebetTwoController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    updateTotalAkhirTiapBulanTwo();
  }

  final totalMutasiKreditTwoController = TextEditingController();

  void updateTotalMutasiKreditTwo(String val) {
    totalMutasiKreditTwoController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    updateTotalAkhirTiapBulanTwo();
  }

  final totalAkhirTiapBulanTwoController = TextEditingController();

  final saldoAwalTwoController = TextEditingController();

  void updateSaldoAwalTwo(String val) {
    saldoAwalTwoController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    updateTotalAkhirTiapBulanTwo();
  }

  int loadUploadMutasiTwo = 0;
  PlatformFile? fileBuktiMutasiTwo;
  String? filePathTwo;
  String? fileBuktiMutasiTwoUrl;
  String? fileBuktiMutasiTwoErrorText;

  Future pickFileTwo() async {
    final res = await _mediaService.getMultiFileType();
    loadUploadMutasiTwo = 1;
    if (res != null) {
      fileBuktiMutasiTwo = res;
      fileBuktiMutasiTwoErrorText = null;
      // final splitFile = fileBuktiMutasiTwo!.path.split('file_picker/');
      // filePathTwo = splitFile[1].toString();
      uploadFileTwo(
        type: 'application',
        subType: 'pdf',
        file: fileBuktiMutasiTwo!,
      );
      notifyListeners();
    }
  }

  String? fileBuktiMutasiTwoUrlPublic;

  Future uploadFileTwo({
    required String type,
    required String subType,
    required PlatformFile file,
  }) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) {
        _showErrorDialog(errorMessage);
      },
      (success) async {
        loadUploadMutasiTwo = 2;
        fileBuktiMutasiTwoUrl = success;
        fileBuktiMutasiTwoUrlPublic = await _getPublicFile(success);
      },
    );
  }

  Future clearFileTwo() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fileBuktiMutasiTwo = null;
      fileBuktiMutasiTwoUrl = '';
      notifyListeners();
    }
  }

  final periodeAwalThreeController = TextEditingController();

  void updatePeriodeAwalThree(String val) =>
      periodeAwalThreeController.text = convertDateRevers(val.trim());

  final periodeAkhirThreeController = TextEditingController();

  void updatePeriodeAkhirThree(String val) =>
      periodeAkhirThreeController.text = convertDateRevers(val.trim());

  void updateTotalAkhirTiapBulanThree() {
    int saldoAwal =
        int.parse(saldoAwalThreeController.text.split('.').join().trim());
    int totalMutasiDebet = int.parse(
      totalMutasiDebetThreeController.text.split('.').join().trim(),
    );
    int totalMutasiKredit = int.parse(
      totalMutasiKreditThreeController.text.split('.').join().trim(),
    );
    int totalAkhirTiapBulan =
        (saldoAwal - totalMutasiDebet) + totalMutasiKredit;

    totalAkhirTiapBulanThreeController.text =
        formatter.format(totalAkhirTiapBulan).toString();
  }

  final totalMutasiDebetThreeController = TextEditingController();

  void updateTotalMutasiDebetThree(String val) {
    totalMutasiDebetThreeController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    updateTotalAkhirTiapBulanThree();
  }

  final totalMutasiKreditThreeController = TextEditingController();

  void updateTotalMutasiKreditThree(String val) {
    totalMutasiKreditThreeController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    updateTotalAkhirTiapBulanThree();
  }

  final totalAkhirTiapBulanThreeController = TextEditingController();

  final saldoAwalThreeController = TextEditingController();

  void updateSaldoAwalThree(String val) {
    saldoAwalThreeController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    updateTotalAkhirTiapBulanThree();
  }

  int loadUploadMutasiThree = 0;
  PlatformFile? fileBuktiMutasiThree;
  String? filePathThree;
  String? fileBuktiMutasiThreeUrl;
  String? fileBuktiMutasiThreeErrorText;

  Future pickFileThree() async {
    final res = await _mediaService.getMultiFileType();
    loadUploadMutasiThree = 1;
    if (res != null) {
      fileBuktiMutasiThree = res;
      fileBuktiMutasiThreeErrorText = null;
      // final splitFile = fileBuktiMutasiThree!.path.split('file_picker/');
      // filePathThree = splitFile[1].toString();
      uploadFileThree(
        type: 'application',
        subType: 'pdf',
        file: fileBuktiMutasiThree!,
      );
      notifyListeners();
    }
  }

  String? fileBuktiMutasiThreeUrlPublic;

  Future uploadFileThree({
    required String type,
    required String subType,
    required PlatformFile file,
  }) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) async {
        loadUploadMutasiThree = 2;
        fileBuktiMutasiThreeUrl = success;
        fileBuktiMutasiThreeUrlPublic = await _getPublicFile(success);
      },
    );
  }

  Future clearFileThree() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fileBuktiMutasiThree = null;
      fileBuktiMutasiThreeUrl = '';
      notifyListeners();
    }
  }

  final periodeAwalFourController = TextEditingController();

  void updatePeriodeAwalFour(String val) =>
      periodeAwalFourController.text = val.trim();

  final periodeAkhirFourController = TextEditingController();

  void updatePeriodeAkhirFour(String val) =>
      periodeAkhirFourController.text = val.trim();

  void updateTotalAkhirTiapBulanFour() {
    int saldoAwal =
        int.parse(saldoAwalFourController.text.split('.').join().trim());
    int totalMutasiDebet =
        int.parse(totalMutasiDebetFourController.text.split('.').join().trim());
    int totalMutasiKredit = int.parse(
      totalMutasiKreditFourController.text.split('.').join().trim(),
    );
    int totalAkhirTiapBulan =
        (saldoAwal - totalMutasiDebet) + totalMutasiKredit;

    totalAkhirTiapBulanFourController.text =
        formatter.format(totalAkhirTiapBulan).toString();
  }

  final totalMutasiDebetFourController = TextEditingController();

  void updateTotalMutasiDebetFour(String val) {
    totalMutasiDebetFourController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    updateTotalAkhirTiapBulanFour();
  }

  final totalMutasiKreditFourController = TextEditingController();

  void updateTotalMutasiKreditFour(String val) {
    totalMutasiKreditFourController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    updateTotalAkhirTiapBulanFour();
  }

  final totalAkhirTiapBulanFourController = TextEditingController();

  final saldoAwalFourController = TextEditingController();

  void updateSaldoAwalFour(String val) {
    saldoAwalFourController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    updateTotalAkhirTiapBulanFour();
  }

  int loadUploadMutasiFour = 0;
  File? fileBuktiMutasiFour;
  String? filePathFour;
  String? fileBuktiMutasiFourUrl;
  String? fileBuktiMutasiFourErrorText;

  Future pickFileFour() async {
    final res = await _mediaService.getFile();
    loadUploadMutasiFour = 1;
    if (res != null) {
      fileBuktiMutasiFour = res;
      final splitFile = fileBuktiMutasiFour!.path.split('file_picker/');
      filePathFour = splitFile[1].toString();
      uploadFileFour(
        type: 'application',
        subType: 'pdf',
        file: fileBuktiMutasiFour!,
      );
      notifyListeners();
    }
  }

  String? fileBuktiMutasiFourUrlPublic;

  Future uploadFileFour({
    required String type,
    required String subType,
    required File file,
  }) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type,
      subType: subType,
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) async {
        loadUploadMutasiFour = 2;
        fileBuktiMutasiFourUrl = success;
        fileBuktiMutasiFourUrlPublic = await _getPublicFile(success);
      },
    );
  }

  Future clearFileFour() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fileBuktiMutasiFour = null;
      fileBuktiMutasiFourUrl = '';
      notifyListeners();
    }
  }

  final periodeAwalFiveController = TextEditingController();

  void updatePeriodeAwalFive(String val) =>
      periodeAwalFiveController.text = val.trim();

  final periodeAkhirFiveController = TextEditingController();

  void updatePeriodeAkhirFive(String val) =>
      periodeAkhirFiveController.text = val.trim();

  void updateTotalAkhirTiapBulanFive() {
    int saldoAwal =
        int.parse(saldoAwalFiveController.text.split('.').join().trim());
    int totalMutasiDebet =
        int.parse(totalMutasiDebetFiveController.text.split('.').join().trim());
    int totalMutasiKredit = int.parse(
      totalMutasiKreditFiveController.text.split('.').join().trim(),
    );
    int totalAkhirTiapBulan =
        (saldoAwal - totalMutasiDebet) + totalMutasiKredit;

    totalAkhirTiapBulanFiveController.text =
        formatter.format(totalAkhirTiapBulan).toString();
  }

  final totalMutasiDebetFiveController = TextEditingController();

  void updateTotalMutasiDebetFive(String val) {
    totalMutasiDebetFiveController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    updateTotalAkhirTiapBulanFive();
  }

  final totalMutasiKreditFiveController = TextEditingController();

  void updateTotalMutasiKreditFive(String val) {
    totalMutasiKreditFiveController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    updateTotalAkhirTiapBulanFive();
  }

  final totalAkhirTiapBulanFiveController = TextEditingController();

  final saldoAwalFiveController = TextEditingController();

  void updateSaldoAwalFive(String val) {
    saldoAwalFiveController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    updateTotalAkhirTiapBulanFive();
  }

  int loadUploadMutasiFive = 0;
  File? fileBuktiMutasiFive;
  String? filePathFive;
  String? fileBuktiMutasiFiveUrl;
  String? fileBuktiMutasiFiveErrorText;

  Future pickFileFive() async {
    final res = await _mediaService.getFile();
    loadUploadMutasiFive = 1;
    if (res != null) {
      fileBuktiMutasiFive = res;
      final splitFile = fileBuktiMutasiFive!.path.split('file_picker/');
      filePathFive = splitFile[1].toString();
      uploadFileFive(
        type: 'application',
        subType: 'pdf',
        file: fileBuktiMutasiFive!,
      );
      notifyListeners();
    }
  }

  String? fileBuktiMutasiFiveUrlPublic;

  Future uploadFileFive({
    required String type,
    required String subType,
    required File file,
  }) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type,
      subType: subType,
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) async {
        loadUploadMutasiFive = 2;
        fileBuktiMutasiFiveUrl = success;
        fileBuktiMutasiFiveUrlPublic = await _getPublicFile(success);
      },
    );
  }

  Future clearFileFive() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fileBuktiMutasiFive = null;
      fileBuktiMutasiFiveUrl = '';
      notifyListeners();
    }
  }

  final periodeAwalSixController = TextEditingController();

  void updatePeriodeAwalSix(String val) =>
      periodeAwalSixController.text = val.trim();

  final periodeAkhirSixController = TextEditingController();

  void updatePeriodeAkhirSix(String val) =>
      periodeAkhirSixController.text = val.trim();

  void updateTotalAkhirTiapBulanSix() {
    int saldoAwal =
        int.parse(saldoAwalSixController.text.split('.').join().trim());
    int totalMutasiDebet =
        int.parse(totalMutasiDebetSixController.text.split('.').join().trim());
    int totalMutasiKredit =
        int.parse(totalMutasiKreditSixController.text.split('.').join().trim());
    int totalAkhirTiapBulan =
        (saldoAwal - totalMutasiDebet) + totalMutasiKredit;

    totalAkhirTiapBulanSixController.text =
        formatter.format(totalAkhirTiapBulan).toString();
  }

  final totalMutasiDebetSixController = TextEditingController();

  void updateTotalMutasiDebetSix(String val) {
    totalMutasiDebetSixController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    updateTotalAkhirTiapBulanSix();
  }

  final totalMutasiKreditSixController = TextEditingController();

  void updateTotalMutasiKreditSix(String val) {
    totalMutasiKreditSixController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    updateTotalAkhirTiapBulanSix();
  }

  final totalAkhirTiapBulanSixController = TextEditingController();

  final saldoAwalSixController = TextEditingController();

  void updateSaldoAwalSix(String val) {
    saldoAwalSixController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    updateTotalAkhirTiapBulanSix();
  }

  File? fileBuktiMutasiSix;
  String? filePathSix;
  String? fileBuktiMutasiSixUrl;
  String? fileBuktiMutasiSixErrorText;

  Future pickFileSix() async {
    final res = await _mediaService.getFile();

    if (res != null) {
      fileBuktiMutasiSix = res;
      final splitFile = fileBuktiMutasiSix!.path.split('file_picker/');
      filePathSix = splitFile[1].toString();
      uploadFileSix(
        type: 'application',
        subType: 'pdf',
        file: fileBuktiMutasiSix!,
      );
      notifyListeners();
    }
  }

  String? fileBuktiMutasiSixUrlPublic;

  Future uploadFileSix({
    required String type,
    required String subType,
    required File file,
  }) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
      type: type,
      subType: subType,
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) async {
        fileBuktiMutasiSixUrl = success;
        fileBuktiMutasiSixUrlPublic = await _getPublicFile(success);
      },
    );
  }

  Future clearFileSix() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File',
      description: 'Anda yakin akan menghapus file ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fileBuktiMutasiSix = null;
      fileBuktiMutasiSixUrl = '';
      notifyListeners();
    }
  }

  // ignore: long-method
  Future<Map<String, dynamic>> _generateMutasiRekeningMap() async {
    return {
      'prakarsaId': prakarsaId,
      'namaBank': namaBankController.text.trim(),
      'numRekening': noRekeningController.text.trim(),
      'detailMutasi': _count == 1
          ? [
              {
                'periodeAwal': convertDate(
                  periodeAwalController.text.trim(),
                ),
                'periodeAkhir': convertDate(
                  periodeAkhirController.text.trim(),
                ),
                'totalMutasiDebet': int.parse(
                  totalMutasiDebetController.text.split('.').join().trim(),
                ),
                'totalMutasiKredit': int.parse(
                  totalMutasiKreditController.text.split('.').join().trim(),
                ),
                'totalAkhirTiapBulan': int.parse(
                  totalAkhirTiapBulanController.text.split('.').join().trim(),
                ),
                'saldoAwal': int.parse(
                  saldoAwalController.text.split('.').join().trim(),
                ),
                'pathBuktiMutasi': fileBuktiMutasiUrl,
              },
            ]
          : _count == 2
              ? [
                  {
                    'periodeAwal': convertDate(
                      periodeAwalController.text.trim(),
                    ),
                    'periodeAkhir': convertDate(
                      periodeAkhirController.text.trim(),
                    ),
                    'totalMutasiDebet': int.parse(
                      totalMutasiDebetController.text.split('.').join().trim(),
                    ),
                    'totalMutasiKredit': int.parse(
                      totalMutasiKreditController.text.split('.').join().trim(),
                    ),
                    'totalAkhirTiapBulan': int.parse(
                      totalAkhirTiapBulanController.text
                          .split('.')
                          .join()
                          .trim(),
                    ),
                    'saldoAwal': int.parse(
                      saldoAwalController.text.split('.').join().trim(),
                    ),
                    'pathBuktiMutasi': fileBuktiMutasiUrl!,
                  },
                  {
                    'periodeAwal': convertDate(
                      periodeAwalTwoController.text.trim(),
                    ),
                    'periodeAkhir': convertDate(
                      periodeAkhirTwoController.text.trim(),
                    ),
                    'totalMutasiDebet': int.parse(
                      totalMutasiDebetTwoController.text
                          .split('.')
                          .join()
                          .trim(),
                    ),
                    'totalMutasiKredit': int.parse(
                      totalMutasiKreditTwoController.text
                          .split('.')
                          .join()
                          .trim(),
                    ),
                    'totalAkhirTiapBulan': int.parse(
                      totalAkhirTiapBulanTwoController.text
                          .split('.')
                          .join()
                          .trim(),
                    ),
                    'saldoAwal': int.parse(
                      saldoAwalTwoController.text.split('.').join().trim(),
                    ),
                    'pathBuktiMutasi': fileBuktiMutasiTwoUrl!,
                  },
                ]
              : _count == 3
                  ? [
                      {
                        'periodeAwal': convertDate(
                          periodeAwalController.text.trim(),
                        ),
                        'periodeAkhir': convertDate(
                          periodeAkhirController.text.trim(),
                        ),
                        'totalMutasiDebet': int.parse(
                          totalMutasiDebetController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'totalMutasiKredit': int.parse(
                          totalMutasiKreditController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'totalAkhirTiapBulan': int.parse(
                          totalAkhirTiapBulanController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'saldoAwal': int.parse(
                          saldoAwalController.text.split('.').join().trim(),
                        ),
                        'pathBuktiMutasi': fileBuktiMutasiUrl,
                      },
                      {
                        'periodeAwal': convertDate(
                          periodeAwalTwoController.text.trim(),
                        ),
                        'periodeAkhir': convertDate(
                          periodeAkhirTwoController.text.trim(),
                        ),
                        'totalMutasiDebet': int.parse(
                          totalMutasiDebetTwoController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'totalMutasiKredit': int.parse(
                          totalMutasiKreditTwoController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'totalAkhirTiapBulan': int.parse(
                          totalAkhirTiapBulanTwoController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'saldoAwal': int.parse(
                          saldoAwalTwoController.text.split('.').join().trim(),
                        ),
                        'pathBuktiMutasi': fileBuktiMutasiTwoUrl,
                      },
                      {
                        'periodeAwal': convertDate(
                          periodeAwalThreeController.text.trim(),
                        ),
                        'periodeAkhir': convertDate(
                          periodeAkhirThreeController.text.trim(),
                        ),
                        'totalMutasiDebet': int.parse(
                          totalMutasiDebetThreeController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'totalMutasiKredit': int.parse(
                          totalMutasiKreditThreeController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'totalAkhirTiapBulan': int.parse(
                          totalAkhirTiapBulanThreeController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'saldoAwal': int.parse(
                          saldoAwalThreeController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'pathBuktiMutasi': fileBuktiMutasiThreeUrl,
                      },
                    ]
                  : '',
    };
  }

  // ignore: long-method
  Future<Map<String, dynamic>> _generateMutasiRekeningUpdateMap() async {
    int lengthDetail = ritelMutasiRekening!.detailMutasi!.length;
    // ignore: newline-before-return
    return {
      'id': ritelMutasiRekening!.id,
      'prakarsaId': prakarsaId,
      'namaBank': namaBankController.text.trim(),
      'numRekening': noRekeningController.text.trim(),
      'detailMutasi': lengthDetail == 1
          ? [
              {
                'id': ritelMutasiRekening!.detailMutasi![0].id,
                'periodeAwal': convertDate(periodeAwalController.text.trim()),
                'periodeAkhir': convertDate(periodeAkhirController.text.trim()),
                'totalMutasiDebet': int.parse(
                  totalMutasiDebetController.text.split('.').join().trim(),
                ),
                'totalMutasiKredit': int.parse(
                  totalMutasiKreditController.text.split('.').join().trim(),
                ),
                'totalAkhirTiapBulan': int.parse(
                  totalAkhirTiapBulanController.text.split('.').join().trim(),
                ),
                'saldoAwal': int.parse(
                  saldoAwalController.text.split('.').join().trim(),
                ),
                'pathBuktiMutasi': fileBuktiMutasiUrl,
              },
            ]
          : lengthDetail == 2
              ? [
                  {
                    'id': ritelMutasiRekening!.detailMutasi![0].id,
                    'periodeAwal':
                        convertDate(periodeAwalController.text.trim()),
                    'periodeAkhir':
                        convertDate(periodeAkhirController.text.trim()),
                    'totalMutasiDebet': int.parse(
                      totalMutasiDebetController.text.split('.').join().trim(),
                    ),
                    'totalMutasiKredit': int.parse(
                      totalMutasiKreditController.text.split('.').join().trim(),
                    ),
                    'totalAkhirTiapBulan': int.parse(
                      totalAkhirTiapBulanController.text
                          .split('.')
                          .join()
                          .trim(),
                    ),
                    'saldoAwal': int.parse(
                      saldoAwalController.text.split('.').join().trim(),
                    ),
                    'pathBuktiMutasi': fileBuktiMutasiUrl,
                  },
                  {
                    'id': ritelMutasiRekening!.detailMutasi![1].id,
                    'periodeAwal':
                        convertDate(periodeAwalTwoController.text.trim()),
                    'periodeAkhir':
                        convertDate(periodeAkhirTwoController.text.trim()),
                    'totalMutasiDebet': int.parse(
                      totalMutasiDebetTwoController.text
                          .split('.')
                          .join()
                          .trim(),
                    ),
                    'totalMutasiKredit': int.parse(
                      totalMutasiKreditTwoController.text
                          .split('.')
                          .join()
                          .trim(),
                    ),
                    'totalAkhirTiapBulan': int.parse(
                      totalAkhirTiapBulanTwoController.text
                          .split('.')
                          .join()
                          .trim(),
                    ),
                    'saldoAwal': int.parse(
                      saldoAwalTwoController.text.split('.').join().trim(),
                    ),
                    'pathBuktiMutasi': fileBuktiMutasiTwoUrl!,
                  },
                ]
              : lengthDetail == 3
                  ? [
                      {
                        'id': ritelMutasiRekening!.detailMutasi![0].id,
                        'periodeAwal':
                            convertDate(periodeAwalController.text.trim()),
                        'periodeAkhir':
                            convertDate(periodeAkhirController.text.trim()),
                        'totalMutasiDebet': int.parse(
                          totalMutasiDebetController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'totalMutasiKredit': int.parse(
                          totalMutasiKreditController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'totalAkhirTiapBulan': int.parse(
                          totalAkhirTiapBulanController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'saldoAwal': int.parse(
                          saldoAwalController.text.split('.').join().trim(),
                        ),
                        'pathBuktiMutasi': fileBuktiMutasiUrl,
                      },
                      {
                        'id': ritelMutasiRekening!.detailMutasi![1].id,
                        'periodeAwal':
                            convertDate(periodeAwalTwoController.text.trim()),
                        'periodeAkhir':
                            convertDate(periodeAkhirTwoController.text.trim()),
                        'totalMutasiDebet': int.parse(
                          totalMutasiDebetTwoController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'totalMutasiKredit': int.parse(
                          totalMutasiKreditTwoController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'totalAkhirTiapBulan': int.parse(
                          totalAkhirTiapBulanTwoController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'saldoAwal': int.parse(
                          saldoAwalTwoController.text.split('.').join().trim(),
                        ),
                        'pathBuktiMutasi': fileBuktiMutasiTwoUrl,
                      },
                      {
                        'id': ritelMutasiRekening!.detailMutasi![2].id,
                        'periodeAwal':
                            convertDate(periodeAwalThreeController.text.trim()),
                        'periodeAkhir': convertDate(
                          periodeAkhirThreeController.text.trim(),
                        ),
                        'totalMutasiDebet': int.parse(
                          totalMutasiDebetThreeController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'totalMutasiKredit': int.parse(
                          totalMutasiKreditThreeController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'totalAkhirTiapBulan': int.parse(
                          totalAkhirTiapBulanThreeController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'saldoAwal': int.parse(
                          saldoAwalThreeController.text
                              .split('.')
                              .join()
                              .trim(),
                        ),
                        'pathBuktiMutasi': fileBuktiMutasiThreeUrl,
                      },
                    ]
                  : '',
    };
  }

  Future _postData(MutasiRekeningAPIMethod mutasiRekeningAPIMethod) async {
    switch (mutasiRekeningAPIMethod) {
      case MutasiRekeningAPIMethod.add:
        final mutasiRekeningMap = await _generateMutasiRekeningMap();

        final res = await runBusyFuture(_ritelMutasiRekeningAPI
            .addMutasiRekening(mutasiRekeningMap, codeTable));

        res.fold(
          (errorMessage) => _showErrorDialog(errorMessage),
          (successMap) =>
              _showSuccessDialog('Berhasil menambahkan mutasi rekening!'),
        );
        break;
      case MutasiRekeningAPIMethod.update:
        final mutasiRekeningUpdateMap =
            await _generateMutasiRekeningUpdateMap();
        final res = await runBusyFuture(_ritelMutasiRekeningAPI
            .updateMutasiRekening(mutasiRekeningUpdateMap, codeTable));

        res.fold(
          (errorMessage) {
            _showErrorDialog(errorMessage);
            notifyListeners();
          },
          (successMap) {
            _showSuccessDialog('Berhasil mengubah mutasi rekening!');
            notifyListeners();
          },
        );
        break;
    }
  }

  Future validateInputs(MutasiRekeningAPIMethod mutasiRekeningAPIMethod) async {
    if (formKey.currentState!.validate() && _validateFiles()) {
      final response = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.confirmation,
        data: {'title': 'Konfirmasi'},
      );

      if (response != null && response.confirmed) {
        _postData(mutasiRekeningAPIMethod);
      }
    } else {
      autoValidateMode = AutovalidateMode.always;
      _setUploadFilesErrorTextIfAny();
      _showValidationErrorDialog();
      notifyListeners();
    }
  }

  bool _validateFiles() {
    if (_count == 1) {
      if (fileBuktiMutasi != null) {
        return true;
      } else {
        return false;
      }
    } else if (_count == 2) {
      if (fileBuktiMutasiTwo != null) {
        return true;
      } else {
        return false;
      }
    } else {
      if (fileBuktiMutasiThree != null) {
        return true;
      } else {
        return false;
      }
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

  void _setUploadFilesErrorTextIfAny() {
    String errMessage =
        'Bukti mutasi harus diupload. Silahkan periksa kembali apakah Anda sudah mengupload bukti mutasi.';

    if (_count == 1) {
      if (fileBuktiMutasi == null) {
        fileBuktiMutasiErrorText = errMessage;
      }
    } else if (_count == 2) {
      if (fileBuktiMutasi == null) {
        fileBuktiMutasiErrorText = errMessage;
      }
      if (fileBuktiMutasiTwo == null) {
        fileBuktiMutasiTwoErrorText = errMessage;
      }
    } else {
      if (fileBuktiMutasi == null) {
        fileBuktiMutasiErrorText = errMessage;
      }
      if (fileBuktiMutasiTwo == null) {
        fileBuktiMutasiTwoErrorText = errMessage;
      }
      if (fileBuktiMutasiThree == null) {
        fileBuktiMutasiThreeErrorText = errMessage;
      }
    }
  }

  Future _showSuccessDialog(String successMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    _navigationService.navigateTo(
      Routes.mutasiRekeningPariView,
      arguments: MutasiRekeningPariViewArguments(
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

  String convertDateToLocale(String dateString) {
    dev.log(dateString);
    final inputFormat = DateFormat('dd MMMM yyyy', 'id');
    final date = inputFormat.parse(dateString);
    final outputFormat = DateFormat('dd MMMM yyyy');
    // ignore: newline-before-return
    return outputFormat.format(date).toString();
  }

  String convertDate(String dateString) {
    dev.log(dateString);
    final inputFormat = DateFormat('dd MMMM yyyy');
    final date = inputFormat.parse(dateString);
    final outputFormat = DateFormat('dd/MM/yyyy');
    // ignore: newline-before-return
    return outputFormat.format(date).toString();
  }

  String convertDateRevers(String dateString) {
    final inputFormat = DateFormat('dd/MM/yyyy', 'id');
    final date = inputFormat.parse(dateString);
    final outputFormat = DateFormat('dd MMMM yyyy');
    // ignore: newline-before-return
    return outputFormat.format(date).toString();
  }

  // ignore: long-method
  Future _prepopulateTextFields() async {
    if (ritelMutasiRekening!.bank != null) {
      final splitBank = ritelMutasiRekening!.bank!.split(' - ');
      final namaBank = splitBank[0];
      final rekeningBank = splitBank[1];

      namaBankController.text = namaBank;

      noRekeningController.text = rekeningBank;
    }
    if (ritelMutasiRekening!.detailMutasi!.length == 1) {
      periodeAwalController.text = convertDateToLocale(
        ritelMutasiRekening!.detailMutasi![0].periodeAwal!,
      );

      periodeAkhirController.text = convertDateToLocale(
        ritelMutasiRekening!.detailMutasi![0].periodeAkhir!,
      );

      totalMutasiDebetController.text = formatter
          .format(double.parse(
            ritelMutasiRekening!.detailMutasi![0].totalMutasiDebet!,
          ))
          .toString();

      totalMutasiKreditController.text = formatter
          .format(double.parse(
            ritelMutasiRekening!.detailMutasi![0].totalMutasiKredit!,
          ))
          .toString();

      totalAkhirTiapBulanController.text = formatter
          .format(double.parse(
            ritelMutasiRekening!.detailMutasi![0].totalAkhirTiapBulan!,
          ))
          .toString();

      saldoAwalController.text = formatter
          .format(
            double.parse(ritelMutasiRekening!.detailMutasi![0].saldoAwal!),
          )
          .toString();

      fileBuktiMutasiUrl =
          ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!;

      fileBuktiMutasiUrlPublic = await _getPublicFile(
        ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!,
      );
      notifyListeners();

      // fileBuktiMutasi = await urlToFilePdf(
      //   fileBuktiMutasiUrl ?? '',
      //   ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!,
      // );
      notifyListeners();

      File _temp = await urlToFilePdf(
        fileBuktiMutasiUrl ?? '',
        ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!,
      );
      filePath = _temp.path;
      notifyListeners();
    }

    if (ritelMutasiRekening!.detailMutasi!.length == 2) {
      _count = 2;
      notifyListeners();

      periodeAwalController.text = convertDateToLocale(
        ritelMutasiRekening!.detailMutasi![0].periodeAwal!,
      );

      periodeAkhirController.text = convertDateToLocale(
        ritelMutasiRekening!.detailMutasi![0].periodeAkhir!,
      );

      totalMutasiDebetController.text = formatter
          .format(double.parse(
            ritelMutasiRekening!.detailMutasi![0].totalMutasiDebet!,
          ))
          .toString();

      totalMutasiKreditController.text = formatter
          .format(double.parse(
            ritelMutasiRekening!.detailMutasi![0].totalMutasiKredit!,
          ))
          .toString();

      totalAkhirTiapBulanController.text = formatter
          .format(double.parse(
            ritelMutasiRekening!.detailMutasi![0].totalAkhirTiapBulan!,
          ))
          .toString();

      saldoAwalController.text = formatter
          .format(
            double.parse(ritelMutasiRekening!.detailMutasi![0].saldoAwal!),
          )
          .toString();

      periodeAwalTwoController.text =
          ritelMutasiRekening!.detailMutasi![1].periodeAwal != null
              ? convertDateToLocale(
                  ritelMutasiRekening!.detailMutasi![1].periodeAwal!,
                )
              : '';

      periodeAkhirTwoController.text =
          ritelMutasiRekening!.detailMutasi![1].periodeAkhir != null
              ? convertDateToLocale(
                  ritelMutasiRekening!.detailMutasi![1].periodeAkhir!,
                )
              : '';

      totalMutasiDebetTwoController.text =
          ritelMutasiRekening!.detailMutasi![1].totalMutasiDebet != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![1].totalMutasiDebet!,
                  ))
                  .toString()
              : '';

      totalMutasiKreditTwoController.text =
          ritelMutasiRekening!.detailMutasi![1].totalMutasiKredit != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![1].totalMutasiKredit!,
                  ))
                  .toString()
              : '';

      totalAkhirTiapBulanTwoController.text =
          ritelMutasiRekening!.detailMutasi![1].totalAkhirTiapBulan != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![1].totalAkhirTiapBulan!,
                  ))
                  .toString()
              : '';

      saldoAwalTwoController.text =
          ritelMutasiRekening!.detailMutasi![1].saldoAwal != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![1].saldoAwal!,
                  ))
                  .toString()
              : '';

      fileBuktiMutasiUrl =
          ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!;

      fileBuktiMutasiUrlPublic = await _getPublicFile(
        ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!,
      );

      // fileBuktiMutasi = await urlToFilePdf(
      //   fileBuktiMutasiUrl ?? '',
      //   ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!,
      // );
      notifyListeners();

      File _temp = await urlToFilePdf(
        fileBuktiMutasiUrl ?? '',
        ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!,
      );
      filePath = _temp.path;
      notifyListeners();

      fileBuktiMutasiTwoUrl =
          ritelMutasiRekening!.detailMutasi![1].pathBuktiMutasi!;
      notifyListeners();

      fileBuktiMutasiTwoUrlPublic = await _getPublicFile(
        ritelMutasiRekening!.detailMutasi![1].pathBuktiMutasi!,
      );
      notifyListeners();

      // fileBuktiMutasiTwo = await urlToFilePdf(
      //   fileBuktiMutasiTwoUrl ?? '',
      //   ritelMutasiRekening!.detailMutasi![1].pathBuktiMutasi!,
      // );
      notifyListeners();

      File _temp2 = await urlToFilePdf(
        fileBuktiMutasiTwoUrl ?? '',
        ritelMutasiRekening!.detailMutasi![1].pathBuktiMutasi!,
      );
      filePathTwo = _temp2.path;
      notifyListeners();
    }

    if (ritelMutasiRekening!.detailMutasi!.length == 3) {
      _count = 3;
      notifyListeners();

      periodeAwalController.text = convertDateToLocale(
        ritelMutasiRekening!.detailMutasi![0].periodeAwal!,
      );

      periodeAkhirController.text = convertDateToLocale(
        ritelMutasiRekening!.detailMutasi![0].periodeAkhir!,
      );

      totalMutasiDebetController.text = formatter
          .format(double.parse(
            ritelMutasiRekening!.detailMutasi![0].totalMutasiDebet!,
          ))
          .toString();

      totalMutasiKreditController.text = formatter
          .format(double.parse(
            ritelMutasiRekening!.detailMutasi![0].totalMutasiKredit!,
          ))
          .toString();

      totalAkhirTiapBulanController.text = formatter
          .format(double.parse(
            ritelMutasiRekening!.detailMutasi![0].totalAkhirTiapBulan!,
          ))
          .toString();

      saldoAwalController.text = formatter
          .format(
            double.parse(
              ritelMutasiRekening!.detailMutasi![0].saldoAwal!,
            ),
          )
          .toString();

      periodeAwalTwoController.text = convertDateToLocale(
        ritelMutasiRekening!.detailMutasi![1].periodeAwal!,
      );

      periodeAkhirTwoController.text = convertDateToLocale(
        ritelMutasiRekening!.detailMutasi![1].periodeAkhir!,
      );

      totalMutasiDebetTwoController.text = formatter
          .format(double.parse(
            ritelMutasiRekening!.detailMutasi![1].totalMutasiDebet!,
          ))
          .toString();

      totalMutasiKreditTwoController.text = formatter
          .format(double.parse(
            ritelMutasiRekening!.detailMutasi![1].totalMutasiKredit!,
          ))
          .toString();

      totalAkhirTiapBulanTwoController.text = formatter
          .format(double.parse(
            ritelMutasiRekening!.detailMutasi![1].totalAkhirTiapBulan!,
          ))
          .toString();

      saldoAwalTwoController.text = formatter
          .format(
            double.parse(
              ritelMutasiRekening!.detailMutasi![1].saldoAwal!,
            ),
          )
          .toString();

      periodeAwalThreeController.text =
          ritelMutasiRekening!.detailMutasi![2].periodeAwal != null
              ? convertDateToLocale(
                  ritelMutasiRekening!.detailMutasi![2].periodeAwal!,
                )
              : '';

      periodeAkhirThreeController.text =
          ritelMutasiRekening!.detailMutasi![2].periodeAkhir != null
              ? convertDateToLocale(
                  ritelMutasiRekening!.detailMutasi![2].periodeAkhir!,
                )
              : '';

      totalMutasiDebetThreeController.text =
          ritelMutasiRekening!.detailMutasi![2].totalMutasiDebet != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![2].totalMutasiDebet!,
                  ))
                  .toString()
              : '';

      totalMutasiKreditThreeController.text =
          ritelMutasiRekening!.detailMutasi![2].totalMutasiKredit != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![2].totalMutasiKredit!,
                  ))
                  .toString()
              : '';

      totalAkhirTiapBulanThreeController.text =
          ritelMutasiRekening!.detailMutasi![2].totalAkhirTiapBulan != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![2].totalAkhirTiapBulan!,
                  ))
                  .toString()
              : '';

      saldoAwalThreeController.text =
          ritelMutasiRekening!.detailMutasi![2].saldoAwal != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![2].saldoAwal!,
                  ))
                  .toString()
              : '';

      fileBuktiMutasiUrl =
          ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!;

      fileBuktiMutasiUrlPublic = await _getPublicFile(
        ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!,
      );

      // fileBuktiMutasi = await urlToFilePdf(
      //   fileBuktiMutasiUrl ?? '',
      //   ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!,
      // );
      notifyListeners();

      File _temp = await urlToFilePdf(
        fileBuktiMutasiUrl ?? '',
        ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!,
      );
      filePath = _temp.path;
      notifyListeners();

      fileBuktiMutasiTwoUrl =
          ritelMutasiRekening!.detailMutasi![1].pathBuktiMutasi!;

      fileBuktiMutasiTwoUrlPublic = await _getPublicFile(
        ritelMutasiRekening!.detailMutasi![1].pathBuktiMutasi!,
      );
      notifyListeners();

      // fileBuktiMutasiTwo = await urlToFilePdf(
      //   fileBuktiMutasiTwoUrl ?? '',
      //   ritelMutasiRekening!.detailMutasi![1].pathBuktiMutasi!,
      // );
      notifyListeners();

      File _temp2 = await urlToFilePdf(
        fileBuktiMutasiTwoUrl ?? '',
        ritelMutasiRekening!.detailMutasi![1].pathBuktiMutasi!,
      );
      filePathTwo = _temp2.path;
      notifyListeners();

      fileBuktiMutasiThreeUrl =
          ritelMutasiRekening!.detailMutasi![2].pathBuktiMutasi!;

      fileBuktiMutasiThreeUrlPublic = await _getPublicFile(
        ritelMutasiRekening!.detailMutasi![2].pathBuktiMutasi!,
      );
      notifyListeners();

      // fileBuktiMutasiThree = await urlToFilePdf(
      //   fileBuktiMutasiThreeUrl ?? '',
      //   ritelMutasiRekening!.detailMutasi![2].pathBuktiMutasi!,
      // );
      notifyListeners();

      File _temp3 = await urlToFilePdf(
        fileBuktiMutasiThreeUrl ?? '',
        ritelMutasiRekening!.detailMutasi![2].pathBuktiMutasi!,
      );
      filePathThree = _temp3.path;
      notifyListeners();
    }

    if (ritelMutasiRekening!.detailMutasi!.length == 4) {
      _count = 4;
      notifyListeners();

      periodeAwalController.text =
          ritelMutasiRekening!.detailMutasi![0].periodeAwal ?? '';

      periodeAkhirController.text =
          ritelMutasiRekening!.detailMutasi![0].periodeAkhir ?? '';

      totalMutasiDebetController.text =
          ritelMutasiRekening!.detailMutasi![0].totalMutasiDebet != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![0].totalMutasiDebet!,
                  ))
                  .toString()
              : '';

      totalMutasiKreditController.text =
          ritelMutasiRekening!.detailMutasi![0].totalMutasiKredit != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![0].totalMutasiKredit!,
                  ))
                  .toString()
              : '';

      totalAkhirTiapBulanController.text =
          ritelMutasiRekening!.detailMutasi![0].totalAkhirTiapBulan != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![0].totalAkhirTiapBulan!,
                  ))
                  .toString()
              : '';

      saldoAwalController.text =
          ritelMutasiRekening!.detailMutasi![0].saldoAwal != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![0].saldoAwal!,
                  ))
                  .toString()
              : '';

      periodeAwalTwoController.text =
          ritelMutasiRekening!.detailMutasi![1].periodeAwal ?? '';

      periodeAkhirTwoController.text =
          ritelMutasiRekening!.detailMutasi![1].periodeAkhir ?? '';

      totalMutasiDebetTwoController.text =
          ritelMutasiRekening!.detailMutasi![1].totalMutasiDebet != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![1].totalMutasiDebet!,
                  ))
                  .toString()
              : '';

      totalMutasiKreditTwoController.text =
          ritelMutasiRekening!.detailMutasi![1].totalMutasiKredit != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![1].totalMutasiKredit!,
                  ))
                  .toString()
              : '';

      totalAkhirTiapBulanTwoController.text =
          ritelMutasiRekening!.detailMutasi![1].totalAkhirTiapBulan != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![1].totalAkhirTiapBulan!,
                  ))
                  .toString()
              : '';

      saldoAwalTwoController.text =
          ritelMutasiRekening!.detailMutasi![1].saldoAwal != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![1].saldoAwal!,
                  ))
                  .toString()
              : '';

      periodeAwalThreeController.text =
          ritelMutasiRekening!.detailMutasi![2].periodeAwal ?? '';

      periodeAkhirThreeController.text =
          ritelMutasiRekening!.detailMutasi![2].periodeAkhir ?? '';

      totalMutasiDebetThreeController.text =
          ritelMutasiRekening!.detailMutasi![2].totalMutasiDebet != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![2].totalMutasiDebet!,
                  ))
                  .toString()
              : '';

      totalMutasiKreditThreeController.text =
          ritelMutasiRekening!.detailMutasi![2].totalMutasiKredit != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![2].totalMutasiKredit!,
                  ))
                  .toString()
              : '';

      totalAkhirTiapBulanThreeController.text =
          ritelMutasiRekening!.detailMutasi![2].totalAkhirTiapBulan != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![2].totalAkhirTiapBulan!,
                  ))
                  .toString()
              : '';

      saldoAwalThreeController.text =
          ritelMutasiRekening!.detailMutasi![2].saldoAwal != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![2].saldoAwal!,
                  ))
                  .toString()
              : '';

      periodeAwalFourController.text =
          ritelMutasiRekening!.detailMutasi![3].periodeAwal ?? '';

      periodeAkhirFourController.text =
          ritelMutasiRekening!.detailMutasi![3].periodeAkhir ?? '';

      totalMutasiDebetFourController.text =
          ritelMutasiRekening!.detailMutasi![3].totalMutasiDebet != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![3].totalMutasiDebet!,
                  ))
                  .toString()
              : '';

      totalMutasiKreditFourController.text =
          ritelMutasiRekening!.detailMutasi![3].totalMutasiKredit != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![3].totalMutasiKredit!,
                  ))
                  .toString()
              : '';

      totalAkhirTiapBulanFourController.text =
          ritelMutasiRekening!.detailMutasi![3].totalAkhirTiapBulan != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![3].totalAkhirTiapBulan!,
                  ))
                  .toString()
              : '';

      saldoAwalFourController.text =
          ritelMutasiRekening!.detailMutasi![3].saldoAwal != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![3].saldoAwal!,
                  ))
                  .toString()
              : '';

      fileBuktiMutasiUrl =
          ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!;

      fileBuktiMutasiUrlPublic = await _getPublicFile(
        ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!,
      );
      notifyListeners();

      // fileBuktiMutasi = await urlToFilePdf(
      //   fileBuktiMutasiUrl ?? '',
      //   ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!,
      // );
      notifyListeners();

      File _temp = await urlToFilePdf(
        fileBuktiMutasiUrl ?? '',
        ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!,
      );
      filePath = _temp.path;
      notifyListeners();

      fileBuktiMutasiTwoUrl =
          ritelMutasiRekening!.detailMutasi![1].pathBuktiMutasi!;

      fileBuktiMutasiTwoUrlPublic = await _getPublicFile(
        ritelMutasiRekening!.detailMutasi![1].pathBuktiMutasi!,
      );
      notifyListeners();

      // fileBuktiMutasiTwo = await urlToFilePdf(
      //   fileBuktiMutasiTwoUrl ?? '',
      //   ritelMutasiRekening!.detailMutasi![1].pathBuktiMutasi!,
      // );
      notifyListeners();

      File _temp2 = await urlToFilePdf(
        fileBuktiMutasiTwoUrl ?? '',
        ritelMutasiRekening!.detailMutasi![1].pathBuktiMutasi!,
      );
      filePathTwo = _temp2.path;
      notifyListeners();

      fileBuktiMutasiThreeUrl =
          ritelMutasiRekening!.detailMutasi![2].pathBuktiMutasi!;

      fileBuktiMutasiThreeUrlPublic = await _getPublicFile(
        ritelMutasiRekening!.detailMutasi![2].pathBuktiMutasi!,
      );
      notifyListeners();

      // fileBuktiMutasiThree = await urlToFilePdf(
      //   fileBuktiMutasiThreeUrl ?? '',
      //   ritelMutasiRekening!.detailMutasi![2].pathBuktiMutasi!,
      // );
      notifyListeners();

      File _temp3 = await urlToFilePdf(
        fileBuktiMutasiThreeUrl ?? '',
        ritelMutasiRekening!.detailMutasi![2].pathBuktiMutasi!,
      );
      filePathThree = _temp3.path;
      notifyListeners();

      fileBuktiMutasiFourUrl =
          ritelMutasiRekening!.detailMutasi![3].pathBuktiMutasi!;

      fileBuktiMutasiFourUrlPublic = await _getPublicFile(
        ritelMutasiRekening!.detailMutasi![3].pathBuktiMutasi!,
      );
      notifyListeners();

      fileBuktiMutasiFour = await urlToFilePdf(
        fileBuktiMutasiFourUrl ?? '',
        ritelMutasiRekening!.detailMutasi![3].pathBuktiMutasi!,
      );
      notifyListeners();

      File _temp4 = await urlToFilePdf(
        fileBuktiMutasiFourUrl ?? '',
        ritelMutasiRekening!.detailMutasi![3].pathBuktiMutasi!,
      );
      filePathFour = _temp4.path;
      notifyListeners();
    }

    if (ritelMutasiRekening!.detailMutasi!.length == 5) {
      _count = 5;
      notifyListeners();

      periodeAwalController.text =
          ritelMutasiRekening!.detailMutasi![0].periodeAwal ?? '';

      periodeAkhirController.text =
          ritelMutasiRekening!.detailMutasi![0].periodeAkhir ?? '';

      totalMutasiDebetController.text =
          ritelMutasiRekening!.detailMutasi![0].totalMutasiDebet != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![0].totalMutasiDebet!,
                  ))
                  .toString()
              : '';

      totalMutasiKreditController.text =
          ritelMutasiRekening!.detailMutasi![0].totalMutasiKredit != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![0].totalMutasiKredit!,
                  ))
                  .toString()
              : '';

      totalAkhirTiapBulanController.text =
          ritelMutasiRekening!.detailMutasi![0].totalAkhirTiapBulan != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![0].totalAkhirTiapBulan!,
                  ))
                  .toString()
              : '';

      saldoAwalController.text =
          ritelMutasiRekening!.detailMutasi![0].saldoAwal != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![0].saldoAwal!,
                  ))
                  .toString()
              : '';

      periodeAwalTwoController.text =
          ritelMutasiRekening!.detailMutasi![1].periodeAwal ?? '';

      periodeAkhirTwoController.text =
          ritelMutasiRekening!.detailMutasi![1].periodeAkhir ?? '';

      totalMutasiDebetTwoController.text =
          ritelMutasiRekening!.detailMutasi![1].totalMutasiDebet != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![1].totalMutasiDebet!,
                  ))
                  .toString()
              : '';

      totalMutasiKreditTwoController.text =
          ritelMutasiRekening!.detailMutasi![1].totalMutasiKredit != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![1].totalMutasiKredit!,
                  ))
                  .toString()
              : '';

      totalAkhirTiapBulanTwoController.text =
          ritelMutasiRekening!.detailMutasi![1].totalAkhirTiapBulan != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![1].totalAkhirTiapBulan!,
                  ))
                  .toString()
              : '';

      saldoAwalTwoController.text =
          ritelMutasiRekening!.detailMutasi![1].saldoAwal != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![1].saldoAwal!,
                  ))
                  .toString()
              : '';

      periodeAwalThreeController.text =
          ritelMutasiRekening!.detailMutasi![2].periodeAwal ?? '';

      periodeAkhirThreeController.text =
          ritelMutasiRekening!.detailMutasi![2].periodeAkhir ?? '';

      totalMutasiDebetThreeController.text =
          ritelMutasiRekening!.detailMutasi![2].totalMutasiDebet != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![2].totalMutasiDebet!,
                  ))
                  .toString()
              : '';

      totalMutasiKreditThreeController.text =
          ritelMutasiRekening!.detailMutasi![2].totalMutasiKredit != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![2].totalMutasiKredit!,
                  ))
                  .toString()
              : '';

      totalAkhirTiapBulanThreeController.text =
          ritelMutasiRekening!.detailMutasi![2].totalAkhirTiapBulan != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![2].totalAkhirTiapBulan!,
                  ))
                  .toString()
              : '';

      saldoAwalThreeController.text =
          ritelMutasiRekening!.detailMutasi![2].saldoAwal != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![2].saldoAwal!,
                  ))
                  .toString()
              : '';

      periodeAwalFourController.text =
          ritelMutasiRekening!.detailMutasi![3].periodeAwal ?? '';

      periodeAkhirFourController.text =
          ritelMutasiRekening!.detailMutasi![3].periodeAkhir ?? '';

      totalMutasiDebetFourController.text =
          ritelMutasiRekening!.detailMutasi![3].totalMutasiDebet != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![3].totalMutasiDebet!,
                  ))
                  .toString()
              : '';

      totalMutasiKreditFourController.text =
          ritelMutasiRekening!.detailMutasi![3].totalMutasiKredit != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![3].totalMutasiKredit!,
                  ))
                  .toString()
              : '';

      totalAkhirTiapBulanFourController.text =
          ritelMutasiRekening!.detailMutasi![3].totalAkhirTiapBulan != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![3].totalAkhirTiapBulan!,
                  ))
                  .toString()
              : '';

      saldoAwalFourController.text =
          ritelMutasiRekening!.detailMutasi![3].saldoAwal != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![3].saldoAwal!,
                  ))
                  .toString()
              : '';

      periodeAwalFiveController.text =
          ritelMutasiRekening!.detailMutasi![4].periodeAwal ?? '';

      periodeAkhirFiveController.text =
          ritelMutasiRekening!.detailMutasi![4].periodeAkhir ?? '';

      totalMutasiDebetFiveController.text =
          ritelMutasiRekening!.detailMutasi![4].totalMutasiDebet != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![4].totalMutasiDebet!,
                  ))
                  .toString()
              : '';

      totalMutasiKreditFiveController.text =
          ritelMutasiRekening!.detailMutasi![4].totalMutasiKredit != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![4].totalMutasiKredit!,
                  ))
                  .toString()
              : '';

      totalAkhirTiapBulanFiveController.text =
          ritelMutasiRekening!.detailMutasi![4].totalAkhirTiapBulan != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![4].totalAkhirTiapBulan!,
                  ))
                  .toString()
              : '';

      saldoAwalFiveController.text =
          ritelMutasiRekening!.detailMutasi![4].saldoAwal != null
              ? formatter
                  .format(double.parse(
                    ritelMutasiRekening!.detailMutasi![4].saldoAwal!,
                  ))
                  .toString()
              : '';

      fileBuktiMutasiUrl =
          ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!;

      fileBuktiMutasiUrlPublic = await _getPublicFile(
        ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!,
      );
      notifyListeners();

      // fileBuktiMutasi = await urlToFilePdf(
      //   fileBuktiMutasiUrl ?? '',
      //   ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!,
      // );
      notifyListeners();

      File _temp = await urlToFilePdf(
        fileBuktiMutasiUrl ?? '',
        ritelMutasiRekening!.detailMutasi![0].pathBuktiMutasi!,
      );
      filePath = _temp.path;
      notifyListeners();

      fileBuktiMutasiTwoUrl =
          ritelMutasiRekening!.detailMutasi![1].pathBuktiMutasi!;

      fileBuktiMutasiTwoUrlPublic = await _getPublicFile(
        ritelMutasiRekening!.detailMutasi![1].pathBuktiMutasi!,
      );
      notifyListeners();

      // fileBuktiMutasiTwo = await urlToFilePdf(
      //   fileBuktiMutasiTwoUrl ?? '',
      //   ritelMutasiRekening!.detailMutasi![1].pathBuktiMutasi!,
      // );
      notifyListeners();

      File _temp2 = await urlToFilePdf(
        fileBuktiMutasiTwoUrl ?? '',
        ritelMutasiRekening!.detailMutasi![1].pathBuktiMutasi!,
      );
      filePathTwo = _temp2.path;
      notifyListeners();

      fileBuktiMutasiThreeUrl =
          ritelMutasiRekening!.detailMutasi![2].pathBuktiMutasi!;

      fileBuktiMutasiThreeUrlPublic = await _getPublicFile(
        ritelMutasiRekening!.detailMutasi![2].pathBuktiMutasi!,
      );
      notifyListeners();

      // fileBuktiMutasiThree = await urlToFilePdf(
      //   fileBuktiMutasiThreeUrl ?? '',
      //   ritelMutasiRekening!.detailMutasi![2].pathBuktiMutasi!,
      // );
      notifyListeners();

      File _temp3 = await urlToFilePdf(
        fileBuktiMutasiThreeUrl ?? '',
        ritelMutasiRekening!.detailMutasi![2].pathBuktiMutasi!,
      );
      filePathThree = _temp3.path;
      notifyListeners();

      fileBuktiMutasiFourUrl =
          ritelMutasiRekening!.detailMutasi![3].pathBuktiMutasi!;

      fileBuktiMutasiFourUrlPublic = await _getPublicFile(
        ritelMutasiRekening!.detailMutasi![3].pathBuktiMutasi!,
      );
      notifyListeners();

      fileBuktiMutasiFour = await urlToFilePdf(
        fileBuktiMutasiFourUrl ?? '',
        ritelMutasiRekening!.detailMutasi![3].pathBuktiMutasi!,
      );
      notifyListeners();

      File _temp4 = await urlToFilePdf(
        fileBuktiMutasiFourUrl ?? '',
        ritelMutasiRekening!.detailMutasi![3].pathBuktiMutasi!,
      );
      filePathFour = _temp4.path;
      notifyListeners();

      fileBuktiMutasiFiveUrl =
          ritelMutasiRekening!.detailMutasi![4].pathBuktiMutasi!;

      fileBuktiMutasiFiveUrlPublic = await _getPublicFile(
        ritelMutasiRekening!.detailMutasi![4].pathBuktiMutasi!,
      );
      notifyListeners();

      fileBuktiMutasiFive = await urlToFilePdf(
        fileBuktiMutasiFiveUrl ?? '',
        ritelMutasiRekening!.detailMutasi![4].pathBuktiMutasi!,
      );
      notifyListeners();

      File _temp5 = await urlToFilePdf(
        fileBuktiMutasiFiveUrl ?? '',
        ritelMutasiRekening!.detailMutasi![4].pathBuktiMutasi!,
      );

      filePathFive = _temp5.path;
      notifyListeners();
    }
  }

  Future<String> _getPublicFile(String url) async {
    String _tempUrl = '';
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(url),
    );

    res.fold(
      (err) => _tempUrl = '',
      (success) => _tempUrl = success,
    );

    return _tempUrl;
  }

  void _navigationToMutasiRekeningView() {
    _navigationService.navigateTo(
      Routes.mutasiRekeningPariView,
      arguments: MutasiRekeningPariViewArguments(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
      ),
    );
  }

  void navigateToMutasiRekeningView() async {
    if (ritelMutasiRekening == null) {
      _navigationToMutasiRekeningView();
    } else {
      await fetchMutasiRekening();
      if (ritelMutasiRekening!.totalMonth! < 3) {
        _showErrorDialog('Total period must be at least 3 months');
      } else {
        for (var i = 0; i < ritelMutasiRekening!.detailMutasi!.length; i++) {
          if (ritelMutasiRekening!.detailMutasi![i].periodeAwal == null) {
            await deleteMutasiBack(i);
          }
        }
        _navigationToMutasiRekeningView();
      }
    }
  }

  Future deleteMutasiBack(int count) async {
    if (ritelMutasiRekening == null) {
      _count = count;
      notifyListeners();
    } else {
      final res = await runBusyFuture(
        _ritelMutasiRekeningAPI.deleteMutasiRekening(
          {
            'mutasiRekeningId': int.parse(ritelMutasiRekening!.id!),
            'detailMutasiId': ritelMutasiRekening!.detailMutasi![count].id!,
            'prakarsaId': prakarsaId,
          },
          codeTable,
        ),
      );

      res.fold((err) => _showErrorDialog(err), (success) {
        _count = count;
        notifyListeners();
      });
    }
  }

  Future deleteMutasi(int count) async {
    if (ritelMutasiRekening == null) {
      _count = _count! - 1;
      notifyListeners();
    } else {
      final res = await runBusyFuture(
        _ritelMutasiRekeningAPI.deleteMutasiRekening(
          {
            'mutasiRekeningId': int.parse(ritelMutasiRekening!.id!),
            'detailMutasiId': ritelMutasiRekening!.detailMutasi![count].id!,
            'prakarsaId': prakarsaId,
          },
          codeTable,
        ),
      );

      res.fold((err) => _showErrorDialog(err), (success) async {
        await clearSetSection(count);
        await fetchMutasiRekening();
        _count = _count! - 1;
      });
    }
  }

  Future<void> clearSetSection(int countNumber) async {
    if (countNumber == 1) {
      await clearValueSectionTwo();
    } else if (countNumber == 2) {
      await clearValueSectionThree();
    } else if (countNumber == 3) {
      await clearValueSectionFour();
    } else if (countNumber == 4) {
      await clearValueSectionFive();
    } else if (countNumber == 5) {
      await clearValueSectionSix();
    }
  }

  Future<void> clearValueSectionTwo() async {
    periodeAwalTwoController.clear();
    periodeAkhirTwoController.clear();
    totalMutasiDebetTwoController.clear();
    totalMutasiKreditTwoController.clear();
    totalAkhirTiapBulanTwoController.clear();
    saldoAwalTwoController.clear();
    fileBuktiMutasiTwo = null;
    fileBuktiMutasiTwoUrl = '';
  }

  Future<void> clearValueSectionThree() async {
    periodeAwalThreeController.clear();
    periodeAkhirThreeController.clear();
    totalMutasiDebetThreeController.clear();
    totalMutasiKreditThreeController.clear();
    totalAkhirTiapBulanThreeController.clear();
    saldoAwalThreeController.clear();
    fileBuktiMutasiThree = null;
    fileBuktiMutasiThreeUrl = '';
  }

  Future<void> clearValueSectionFour() async {
    periodeAwalFourController.clear();
    periodeAkhirFourController.clear();
    totalMutasiDebetFourController.clear();
    totalMutasiKreditFourController.clear();
    totalAkhirTiapBulanFourController.clear();
    saldoAwalFourController.clear();
    fileBuktiMutasiFour = null;
    fileBuktiMutasiFourUrl = '';
  }

  Future<void> clearValueSectionFive() async {
    periodeAwalFiveController.clear();
    periodeAkhirFiveController.clear();
    totalMutasiDebetFiveController.clear();
    totalMutasiKreditFiveController.clear();
    totalAkhirTiapBulanFiveController.clear();
    saldoAwalFiveController.clear();
    fileBuktiMutasiFive = null;
    fileBuktiMutasiFiveUrl = '';
  }

  Future<void> clearValueSectionSix() async {
    periodeAwalSixController.clear();
    periodeAkhirSixController.clear();
    totalMutasiDebetSixController.clear();
    totalMutasiKreditSixController.clear();
    totalAkhirTiapBulanSixController.clear();
    saldoAwalSixController.clear();
    fileBuktiMutasiSix = null;
    fileBuktiMutasiSixUrl = '';
  }
}

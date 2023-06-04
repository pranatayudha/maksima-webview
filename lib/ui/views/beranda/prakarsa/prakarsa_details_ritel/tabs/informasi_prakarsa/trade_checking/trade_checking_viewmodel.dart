// ignore_for_file: unnecessary_null_comparison, newline-before-return, unused_import, unused_field, unused_element

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../../application/services/media_service.dart';
import '../../../../../../../../application/services/url_launcher_service.dart';
import '../../../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../../../infrastructure/apis/ritel_trade_checking_api.dart';
import '../../../../../../../../infrastructure/apis/ritel_upload_file_api.dart';

class TradeCheckingViewModel extends BaseViewModel {
  final _mediaService = locator<MaksimaMediaService>();
  final _ritelMasterAPI = locator<RitelMasterAPI>();
  final _ritelUploadeFileAPI = locator<RitelUploadFileAPI>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _urlLauncherService = locator<URLLauncherService>();
  final _ritelTradeCheckingAPI = locator<RitelTradeCheckingAPI>();

  String prakarsaId;
  String pipelineId;
  int loanTypesId;
  int status;
  int codeTable;

  TradeCheckingViewModel({
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  Future initialize() async {
    setBusy(true);
    setBusy(false);
  }

  final hasilTradeCheckingController = TextEditingController();
  void updateHasilTradeCheckingController(String val) {
    hasilTradeCheckingController.text = val;
    notifyListeners();
  }

  PlatformFile? fileTradeChecking;
  String? namePath = 'Trade-Checking.xlsx';
  String? fileTradeCheckingErrorText;

  Future pickFile() async {
    final res =
        await _mediaService.getMultiFileType(allowedExtensions: const ['xlsx']);
    if (res != null) {
      fileTradeChecking = res;
      notifyListeners();
    }
  }

  Future clearTradeChecking() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File Trade Checking',
      description: 'Anda yakin akan menghapus File ini ?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fileTradeChecking = null;
      notifyListeners();
    }
  }

  void uploadTradeChecking() async {
    final res = await runBusyFuture(
      _ritelUploadeFileAPI.uploadFileTradeChecking(
        file: fileTradeChecking!,
        prakarsaId: prakarsaId,
        codeTable: codeTable,
        summary: hasilTradeCheckingController.text,
      ),
    );

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) =>
          _showSuccessDialog('Berhasil menambahkan File Trade Checking'),
    );
  }

  Future _showSuccessDialog(String successMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    final res = await runBusyFuture(
      _ritelTradeCheckingAPI.fetchTradeChecking(
        prakarsaId: prakarsaId,
        codeTable: codeTable,
      ),
    );

    res.fold(
      (errorMessage) => errorMessage,
      (tradeChecking) => _navigationService.navigateTo(
        Routes.tradeCheckingDetails,
        arguments: TradeCheckingDetailsArguments(
          ritelTradeChecking: tradeChecking,
          pipelineId: pipelineId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
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

  void navigateBack() => _navigationService.navigateTo(
        Routes.prakarsaDetailsViewRitel,
        arguments: PrakarsaDetailsViewRitelArguments(
          index: 1,
          prakarsaId: prakarsaId,
          pipelineId: pipelineId,
          loanTypesId: loanTypesId,
          codeTable: codeTable,
        ),
      );

  void downloadTradeCheckingTemplate() {
    _urlLauncherService.browse(
      'https://storage.googleapis.com/bridgtl-prt-d-bkt-apps/dev1/file/trade-checking-template.xlsx',
    );
  }

  Future<String> getPublicFile(String url) async {
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
}

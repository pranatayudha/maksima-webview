import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../application/app/app.locator.dart';
import '../../../../../application/app/app.router.dart';
import '../../../../../application/app/constants/custom_color.dart';
import '../../../../../application/enums/bottom_sheet_type.dart';
import '../../../../../application/enums/dialog_type.dart';
import '../../../../../application/models/monitoring_pinjaman_detail.dart';
import '../../../../../infrastructure/apis/ritel_partnership_api.dart';

class TambahPartnershipViewModelRitel extends BaseViewModel {
  String? idKelolaan;
  MonitoringPinjamanDetail? pinjamanDetail;
  int? counter;
  String? status;
  int? loanType;

  TambahPartnershipViewModelRitel({
    this.idKelolaan,
    this.pinjamanDetail,
    this.counter,
    this.status,
    this.loanType,
  });

  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _partnershipsAPI = locator<RitelPartnershipAPI>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;

  final namaPartnershipController = TextEditingController();
  final jenisUsahaController = TextEditingController();
  final namaPicController = TextEditingController();
  final jabatanPicController = TextEditingController();
  final jenisKerjasamaController = TextEditingController();
  final lamaKerjasamaController = TextEditingController();

  final nomorHpPicController = TextEditingController();
  final nomorPKSController = TextEditingController();
  final emailController = TextEditingController();

  bool jenisKerjasama = false;

  void updateNamaPartnership(String val) =>
      namaPartnershipController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  void updateJenisUsaha(String val) => jenisUsahaController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  void updateNamaPIC(String val) => namaPicController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );
  void updatejabatanPic(String val) => jabatanPicController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  void updateNomorHpPIC(String val) => nomorHpPicController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  void updateNomorPKS(String val) => nomorPKSController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  void updateEmail(String val) => emailController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );
  void updateLamaKerjasamaController(String val) {
    lamaKerjasamaController.text = val;
    notifyListeners();
  }

  void updateJenisKerjasamaController(String val) {
    jenisKerjasamaController.text = val;
    notifyListeners();
    jenisKerjasama = jenisKerjasamaController.text == 'PKS' ? true : false;
  }

  Future navigateToPartnership() async {
    if (_anyFieldEdited()) {
      final response = await _dialogService.showCustomDialog(
        variant: DialogType.base,
        title: 'Edited',
        description:
            'Anda belum menyelesaikan pengisian form ini. Data-data yang sudah Anda masukkan akan hilang. Apakah Anda yakin akan membatalkan pengisian form ini?',
        data: {'color': CustomColor.primaryRed80},
        mainButtonTitle: 'Batal Isi Form',
      );

      if (response!.confirmed) {
        _navigationService.navigateTo(
          Routes.partnershipViewRitel,
          arguments: PartnershipViewRitelArguments(
            idKelolaan: idKelolaan!,
            loanType: loanType!,
          ),
        );
      }
    } else {
      _navigationService.navigateTo(
        Routes.partnershipViewRitel,
        arguments: PartnershipViewRitelArguments(
          idKelolaan: idKelolaan!,
          loanType: loanType!,
        ),
      );
    }
  }

  Future validateInputs() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final response = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.confirmation,
        data: {'title': 'Konfirmasi'},
      );

      if (response != null && response.confirmed) {
        _postData();
        false;
      }
    } else {
      autoValidateMode = AutovalidateMode.always;
      _showValidationErrorDialog();
      notifyListeners();
    }
  }

  Future _postData() async {
    final payload = await _generatePayload();
    final response = await runBusyFuture(_partnershipsAPI.addBouhweer(payload));
    response.fold(
      (errorMessage) {
        _showErrorDialog(errorMessage);
        notifyListeners();
      },
      (successMap) {
        _showSuccessDialog(
          'Berhasil menambahkan Partner',
        );
        notifyListeners();
      },
    );
  }

  Future<Map<String, dynamic>> _generatePayload() async {
    return {
      'idKelolaan': int.parse(idKelolaan!),
      'partnerName': namaPartnershipController.text.trim(),
      'picName': namaPicController.text.trim(),
      'picJabatan': jabatanPicController.text.trim(),
      'picPhone': '+62${nomorHpPicController.text.trim()}',
      'picEmail': emailController.text.trim(),
      'jenisKerjasama': jenisKerjasamaController.text.trim(),
      'lamaKerjasama': lamaKerjasamaController.text.trim(),
      'pksNum': jenisKerjasamaController.text == 'PKS'
          ? nomorPKSController.text.trim()
          : null,
    };
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

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Gagal',
      description: errorMessage,
      mainButtonTitle: 'COBA LAGI',
    );
  }

  Future _showSuccessDialog(String successMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    if (pinjamanDetail != null) {
      _navigationService.navigateTo(
        Routes.partnershipViewRitel,
        arguments: PartnershipViewRitelArguments(
          idKelolaan: idKelolaan,
          pinjamanDetail: pinjamanDetail,
          counter: counter,
          status: status,
          loanType: loanType!,
        ),
      );
    } else {
      _navigationService.navigateTo(
        Routes.partnershipViewRitel,
        arguments: PartnershipViewRitelArguments(
          idKelolaan: idKelolaan,
          loanType: loanType!,
        ),
      );
    }
  }

  bool _anyFieldEdited() {
    return namaPartnershipController.text.isNotEmpty ||
        namaPicController.text.isNotEmpty ||
        jabatanPicController.text.isNotEmpty ||
        nomorHpPicController.text.isNotEmpty ||
        emailController.text.isNotEmpty ||
        jenisKerjasamaController.text.isNotEmpty ||
        lamaKerjasamaController.text.isNotEmpty ||
        nomorPKSController.text.isNotEmpty;
  }
}

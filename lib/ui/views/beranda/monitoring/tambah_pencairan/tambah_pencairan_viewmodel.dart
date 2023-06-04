// ignore_for_file: unused_field, unused_local_variable, unused_element

import 'dart:developer' as dev;
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../application/app/app.locator.dart';
import '../../../../../application/app/app.router.dart';
import '../../../../../application/app/constants/custom_color.dart';
import '../../../../../application/app/constants/image_constants.dart';
import '../../../../../application/enums/bottom_sheet_type.dart';
import '../../../../../application/enums/dialog_type.dart';
import '../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../application/helpers/jenis_dokumen_formatter.dart';
import '../../../../../application/helpers/jenis_konfirmasi_formatter.dart';
import '../../../../../application/models/monitoring_pinjaman_detail.dart';
import '../../../../../application/models/ritel_partnerships.dart';
import '../../../../../application/services/local_db_service.dart';
import '../../../../../application/services/media_service.dart';
import '../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../infrastructure/apis/ritel_partnership_api.dart';
import '../../../../../infrastructure/apis/ritel_pencairan_api.dart';
import '../../../../../infrastructure/apis/ritel_upload_file_api.dart';
import '../../../../shared/custom_button.dart';

class TambahPencairanViewModel extends BaseViewModel {
  final int step;
  final String? idKelolaan;
  final String? idPartner;
  final MonitoringPinjamanDetail? pinjamanDetail;
  final int? counter;
  final String? status;
  final int? loanType;

  TambahPencairanViewModel({
    required this.step,
    this.idKelolaan,
    this.idPartner,
    this.pinjamanDetail,
    this.counter,
    this.status,
    this.loanType,
  });

  final _dialogService = locator<DialogService>();
  final _ritelPencairanApi = locator<RitelPencairanAPI>();
  final _ritelUploadFileAPI = locator<RitelUploadFileAPI>();
  final _ritelMasterAPI = locator<RitelMasterAPI>();
  final _navigationService = locator<NavigationService>();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  final _localDBService = locator<MaksimaLocalDBService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _ritelPartnershipAPI = locator<RitelPartnershipAPI>();
  final _mediaService = locator<MaksimaMediaService>();

  final namaPartnershipController = TextEditingController();
  final namaPICPartnership = TextEditingController();
  final tanggalKonfirmasiController = TextEditingController();
  final tanggalDokumenUnderlyingController = TextEditingController();
  final tanggalJatuhTempoDokumenUnderlying = TextEditingController();
  final bungaPinjamanController = TextEditingController();
  final jabatanPicController = TextEditingController();
  final nomorHPController = TextEditingController();
  final emailPicController = TextEditingController();
  final namaDokumenUnderlyingController = TextEditingController();
  final nomorDokumenUnderlying = TextEditingController();
  final nominalUnderlyingController = TextEditingController();
  final jenisKonfirmasi = TextEditingController();
  final hasilKonfirmasiPartnership = TextEditingController();
  final jenisDokumenUnderlyingController = TextEditingController();
  final formatter = NumberFormat('#,###', 'id_ID');

  final ppnController = TextEditingController();
  final tempoCadanganBungaController = TextEditingController();
  final tglJatuhTempoCadanganBungaController = TextEditingController();
  int? kelonggaranTarik;
  String? namaDebitur;
  String? noRekSimpanan;
  String? noRekEscrow;
  double? saldoOperasional;
  double? bungaPinjaman;
  final sharingDanaSendiriController = TextEditingController();

  Future initialize() async {
    setBusy(true);

    if (idPartner != null) {
      await _getBouwheer();
    }

    if (pinjamanDetail != null) {
      await _prepopulateTextFieldsPencairan();
    } else {
      if (_localDBService.pencairanFlagBoxIsNotEmpty()) {
        if (step == 1) {
          await _prepopulateTextFieldsKonfirmasiPartner();
        }

        if (step == 2) {
          await _prepopulateTextFieldsKonfirmasiPartner();
          await _prepopulateTextFieldsDetilPencairan();
        }
      }
    }

    setBusy(false);
  }

  Future _getBouwheer() async {
    final res = await runBusyFuture(
      _ritelPartnershipAPI.fetchDetailBouhweer(idPartner!),
    );

    res.fold(
      (l) => _showErrorDialog('Gagal memuat data'),
      (ritelPartnership) => _prepopulateTextFieldsPartnership(ritelPartnership),
    );
  }

  Future _prepopulateTextFieldsPartnership(
    RitelPartnerships partnerships,
  ) async {
    namaPartnershipController.text = partnerships.partnerName!;
    namaPICPartnership.text = partnerships.picName!;
    jabatanPicController.text = partnerships.picJabatan!;
    nomorHPController.text = partnerships.picPhone!.split('+62').join();
    emailPicController.text = partnerships.picEmail!;
  }

  Future _prepopulateTextFieldsKonfirmasiPartner() async {
    final getPencairanFlag = _localDBService.getPencairanFlag()!;

    namaPartnershipController.text = getPencairanFlag['namaPartnership'];
    namaPICPartnership.text = getPencairanFlag['namaPIC'];
    jabatanPicController.text = getPencairanFlag['jabatanPIC'];
    nomorHPController.text = getPencairanFlag['noHandphonePIC'];
    emailPicController.text = getPencairanFlag['emailPIC'];
    tanggalKonfirmasiController.text = getPencairanFlag['tanggalKonfirmasi'];
    jenisDokumenUnderlyingController.text = getPencairanFlag['jenisUnderlying'];
    namaDokumenUnderlyingController.text = getPencairanFlag['namaUnderlying'];
    nomorDokumenUnderlying.text = getPencairanFlag['noUnderlying'];
    tanggalDokumenUnderlyingController.text =
        getPencairanFlag['tanggalUnderlying'];
    nominalUnderlyingController.text = getPencairanFlag['nominalUnderlying'];
    tanggalJatuhTempoDokumenUnderlying.text =
        getPencairanFlag['tanggalJatuhTempo'];
    jenisKonfirmasi.text = getPencairanFlag['jenisKonfirmasi'];
    hasilKonfirmasiPartnership.text = getPencairanFlag['hasilKonfirmasi'];
    uploadBuktiKonfirmasiUrl = getPencairanFlag['buktiKonfirmasi'];
    uploadBuktiKonfirmasiPublicUrl =
        await _getPublicFile(uploadBuktiKonfirmasiUrl!);
  }

  Future _prepopulateTextFieldsDetilPencairan() async {
    final getPencairanFlag = _localDBService.getPencairanFlag()!;

    kelonggaranTarik = getPencairanFlag['kelonggaranTarik'];
    nomorDokumenUnderlying.text = getPencairanFlag['noUnderlying'];
    nominalUnderlyingController.text = getPencairanFlag['nominalUnderlying'];
    tanggalJatuhTempoDokumenUnderlying.text =
        getPencairanFlag['tanggalJatuhTempo'];
    namaDebitur = getPencairanFlag['namaDebitur'];
    noRekSimpanan = getPencairanFlag['noRekSimpanan'];
    noRekEscrow = getPencairanFlag['noRekEscrow'];
    saldoOperasional = double.parse(getPencairanFlag['saldoOperasional']);
    bungaPinjaman = double.parse(getPencairanFlag['bungaPinjaman']);
    bungaPinjamanController.text = bungaPinjaman!.toStringAsFixed(0);
  }

  Future _prepopulateTextFieldsPencairan() async {
    final getPencairanFlag = _localDBService.getPencairanFlag()!;

    namaPartnershipController.text = getPencairanFlag['namaPartnership'];
    namaPICPartnership.text = getPencairanFlag['namaPIC'];
    jabatanPicController.text = getPencairanFlag['jabatanPIC'];
    nomorHPController.text = getPencairanFlag['noHandphonePIC'];
    emailPicController.text = getPencairanFlag['emailPIC'];
    tanggalKonfirmasiController.text = getPencairanFlag['tanggalKonfirmasi'];
    jenisDokumenUnderlyingController.text = getPencairanFlag['jenisUnderlying'];
    namaDokumenUnderlyingController.text = getPencairanFlag['namaUnderlying'];
    nomorDokumenUnderlying.text = getPencairanFlag['noUnderlying'];
    tanggalDokumenUnderlyingController.text =
        getPencairanFlag['tanggalUnderlying'];
    nominalUnderlyingController.text = getPencairanFlag['nominalUnderlying'];
    tanggalJatuhTempoDokumenUnderlying.text =
        getPencairanFlag['tanggalJatuhTempo'];
    jenisKonfirmasi.text = getPencairanFlag['jenisKonfirmasi'];
    hasilKonfirmasiPartnership.text = getPencairanFlag['hasilKonfirmasi'];
    uploadBuktiKonfirmasiUrl = getPencairanFlag['buktiKonfirmasi'];
    uploadBuktiKonfirmasiPublicUrl =
        await _getPublicFile(uploadBuktiKonfirmasiUrl!);

    kelonggaranTarik = getPencairanFlag['kelonggaranTarik'];
    namaDebitur = getPencairanFlag['namaDebitur'];
    noRekSimpanan = getPencairanFlag['noRekSimpanan'];
    noRekEscrow = getPencairanFlag['noRekEscrow'];
    saldoOperasional = double.parse(getPencairanFlag['saldoOperasional']);
    bungaPinjaman = double.parse(getPencairanFlag['bungaPinjaman']);
    bungaPinjamanController.text = bungaPinjaman!.toStringAsFixed(0);

    tempoCadanganBungaController.text =
        pinjamanDetail!.disburse!.cadanganBungaTempo!.toString();
    nominalPencairan = double.parse(pinjamanDetail!.disburse!.amountDisburse!);
    cadanganBunga = double.parse(pinjamanDetail!.cadanganBunga!);
    tanggalJatuhTempoCadanganBunga = DateStringFormatter.forOutputRitel(
      pinjamanDetail!.disburse!.endDateTempoCadanganBunga!,
    );
    _tanggalJatuhTempoCadanganBunga = DateTime.parse(
      pinjamanDetail!.disburse!.endDateTempoCadanganBunga!,
    );
    jumlahHariPinjaman =
        pinjamanDetail!.disburse!.jumlahHariPinjaman!.toString();
    sharingDanaSendiriController.text =
        pinjamanDetail!.disburse!.sharingDanaSendiri!.toString();
    ppnController.text = formatter.format(
      double.parse(pinjamanDetail!.disburse!.ppn!),
    );
    dokumenUnderlyingUrl = pinjamanDetail!.disburse!.docUnderlying!;
    dokumenUnderlyingPublicUrl = await _getPublicFile(dokumenUnderlyingUrl!);
    suratPermohonanPencairanUrl =
        pinjamanDetail!.disburse!.docSuratPermohonanPencairan!;
    suratPermohonanPencairanPublicUrl =
        await _getPublicFile(suratPermohonanPencairanUrl!);
    suratPernyataanDebiturUrl =
        pinjamanDetail!.disburse!.docSuratPernyataanDebitur!;
    suratPernyataanDebiturPublicUrl =
        await _getPublicFile(suratPernyataanDebiturUrl!);
    _isNotRayaAccount = pinjamanDetail!.disburse!.otherPayment!;

    if (pinjamanDetail!.disburse!.otherPayment!) {
      standingInstructionUrl =
          pinjamanDetail!.disburse!.docStandingInstruction!;
      standingInstructionPublicUrl =
          await _getPublicFile(standingInstructionUrl!);
      bankRekeningPembayaranController.text =
          pinjamanDetail!.disburse!.namaBankPembayaran!;
      noRekeningPembayaranController.text =
          pinjamanDetail!.disburse!.numBankPembayaran!;
      namaRekeningPembayaranController.text =
          pinjamanDetail!.disburse!.pemilikBankPembayaran!;
    }
  }

  void updateNamaDokumenUnderlying(String val) =>
      namaDokumenUnderlyingController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateNoDokumenUnderlying(String val) =>
      nomorDokumenUnderlying.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateNominalUnderlying(String val) =>
      nominalUnderlyingController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updatePPN(String val) => ppnController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  void updateSDS(String val) {
    sharingDanaSendiriController.value.copyWith(
      text: val,
      selection: TextSelection(
        baseOffset: val.length,
        extentOffset: val.length,
      ),
    );

    _countNominalPencairan();
  }

  void updateTanggalKonfirmasi(String val) =>
      tanggalKonfirmasiController.text = val.trim();

  void updateTanggalDokumenUnderlying(String val) =>
      tanggalDokumenUnderlyingController.text = val.trim();

  void updateTanggalJatuhTempoDokumenUnderlying(String val) =>
      tanggalJatuhTempoDokumenUnderlying.text = val.trim();

  void updateJenisDokumen(String val) {
    jenisDokumenUnderlyingController.text = val;
    notifyListeners();
  }

  void updateJenisKonfirmasi(String val) {
    jenisKonfirmasi.text = val;
    notifyListeners();
  }

  void updateHasilKonfirmasi(String val) {
    hasilKonfirmasiPartnership.text = val;
    notifyListeners();
  }

  void updateTempoCadanganBunga(String val) {
    tempoCadanganBungaController.text = val;
    _setTanggalJatuhTempoCadanganBunga();
    _countJumlahHariPinjaman();
    notifyListeners();
  }

  double? nominalPencairan;

  void _countNominalPencairan() {
    nominalPencairan =
        int.parse(nominalUnderlyingController.text.split('.').join()) *
            ((100 - int.parse(sharingDanaSendiriController.text)) / 100);
    notifyListeners();

    _countCadanganBunga();
  }

  double? cadanganBunga;

  void _countCadanganBunga() {
    cadanganBunga = ((bungaPinjaman! / 100) / 360) *
        (double.parse(jumlahHariPinjaman!) * nominalPencairan!);
  }

  String? tanggalJatuhTempoCadanganBunga;
  DateTime? _tanggalJatuhTempoCadanganBunga;

  void _setTanggalJatuhTempoCadanganBunga() {
    final date = tanggalJatuhTempoDokumenUnderlying.text.split('/');
    final date2 = DateTime(
      int.parse(date[2]),
      int.parse(date[1]),
      int.parse(date[0]),
    );
    final date3 = date2.add(
      Duration(
        days: int.parse(tempoCadanganBungaController.text),
      ),
    );
    _tanggalJatuhTempoCadanganBunga = date3;
    tanggalJatuhTempoCadanganBunga = DateFormat('dd MMMM yyyy').format(date3);
    notifyListeners();
  }

  String? jumlahHariPinjaman;

  void _countJumlahHariPinjaman() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    DateTime formattedDateNow = DateTime.parse(formatter.format(now));

    final convertJatuhTempo =
        DateFormat('yyyy-MM-dd').format(_tanggalJatuhTempoCadanganBunga!);
    final formattedTanggalJatuhTempo =
        formatter.format(DateTime.parse(convertJatuhTempo));

    final difference =
        DateTime.parse(formattedTanggalJatuhTempo).difference(formattedDateNow);
    jumlahHariPinjaman = difference.inDays.toString();
    notifyListeners();
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

  final bool _isLoadingBuktiKonfirmasiFile = false;

  bool get istLoaddingBuktiKonfirmasi => _isLoadingBuktiKonfirmasiFile;

  PlatformFile? uploadBuktiKonfirmasiFile;
  String? uploadBuktiKonfirmasiUrl;
  String? uploadBuktiKonfirmasiErrorText;
  String? uploadBuktiKonfirmasiPublicUrl;

  Future captureBuktiKonfirmasi() async {
    // final res = await _dialogService.showCustomDialog(
    //   variant: DialogType.takePhotoFile,
    //   barrierDismissible: true,
    // );

    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      uploadBuktiKonfirmasiFile = res;
      uploadBuktiKonfirmasiErrorText = null;
      uploadBuktiKonfirmasi(
        uploadBuktiKonfirmasiFile!,
      );
      notifyListeners();
    }
  }

  Future uploadBuktiKonfirmasi(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) async {
        uploadBuktiKonfirmasiUrl = success;
        uploadBuktiKonfirmasiPublicUrl = await _getPublicFile(success);
        notifyListeners();
      },
    );
  }

  Future clearBuktiKonfirmasi() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus',
      description: 'Anda yakin akan menghapus bukti konfirmasi ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );
    if (response!.confirmed) {
      uploadBuktiKonfirmasiFile = null;
      uploadBuktiKonfirmasiPublicUrl = '';
      uploadBuktiKonfirmasiUrl = '';
      notifyListeners();
    }
  }

  bool _isNotRayaAccount = false;

  bool get isNotRayaAccount => _isNotRayaAccount;

  void updateRadioBtn(bool val) {
    _isNotRayaAccount = val;
    notifyListeners();
  }

  bool _isLoadingDokumenUnderlying = false;

  bool get isLoadingDokumenUnderlying => _isLoadingDokumenUnderlying;
  File? dokumenUnderlying;
  String? dokumenUnderlyingErrorText;
  String? dokumenUnderlyingUrl;
  String? dokumenUnderlyingPublicUrl;

  Future captureDokumenUnderlying() async {
    final res = await _dialogService.showCustomDialog(
      variant: DialogType.takePhotoFile,
      barrierDismissible: true,
    );

    if (res != null && res.confirmed) {
      _isLoadingDokumenUnderlying = true;
      notifyListeners();
      if (_isLoadingDokumenUnderlying) {
        dokumenUnderlying = res.data[0] as File;
        dokumenUnderlyingErrorText = null;
        uploadFileDokumenUnderlying(
          dokumenUnderlying!,
          res.data[1].toString(),
        );
        notifyListeners();
      }
    }
  }

  Future uploadFileDokumenUnderlying(File file, String type) async {
    if (type == 'image') {
      final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
        type: 'image',
        subType: 'png',
        file: file,
      ));

      res.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (url) async {
          _isLoadingDokumenUnderlying = false;
          dokumenUnderlyingUrl = url;
          dokumenUnderlyingPublicUrl = await _getPublicFile(url);
          notifyListeners();
        },
      );
    } else {
      final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
        type: 'application',
        subType: 'pdf',
        file: file,
      ));

      res.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (url) async {
          _isLoadingDokumenUnderlying = false;
          dokumenUnderlyingUrl = url;
          dokumenUnderlyingPublicUrl = await _getPublicFile(url);
          notifyListeners();
        },
      );
    }
  }

  Future clearDokumenUnderlying() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus',
      description: 'Anda yakin akan menghapus dokumen underlying ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      dokumenUnderlying = null;
      dokumenUnderlyingUrl = null;
      dokumenUnderlyingPublicUrl = null;
      notifyListeners();
    }
  }

  bool _isLoadingSuratPermohonanPencairan = false;

  bool get isLoadingSuratPermohonanPencairan =>
      _isLoadingSuratPermohonanPencairan;
  File? suratPermohonanPencairan;
  String? suratPermohonanPencairanErrorText;
  String? suratPermohonanPencairanUrl;
  String? suratPermohonanPencairanPublicUrl;

  Future captureSuratPermohonanPencairan() async {
    final res = await _dialogService.showCustomDialog(
      variant: DialogType.takePhotoFile,
      barrierDismissible: true,
    );

    if (res != null && res.confirmed) {
      _isLoadingSuratPermohonanPencairan = true;
      notifyListeners();
      if (_isLoadingSuratPermohonanPencairan) {
        suratPermohonanPencairan = res.data[0] as File;
        suratPermohonanPencairanErrorText = null;
        uploadFileSuratPermohonanPencairan(
          suratPermohonanPencairan!,
          res.data[1].toString(),
        );
        notifyListeners();
      }
    }
  }

  Future uploadFileSuratPermohonanPencairan(File file, String type) async {
    if (type == 'image') {
      final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
        type: 'image',
        subType: 'png',
        file: file,
      ));

      res.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (url) async {
          _isLoadingSuratPermohonanPencairan = false;
          suratPermohonanPencairanUrl = url;
          suratPermohonanPencairanPublicUrl = await _getPublicFile(url);
          notifyListeners();
        },
      );
    } else {
      final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
        type: 'application',
        subType: 'pdf',
        file: file,
      ));

      res.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (url) async {
          _isLoadingSuratPermohonanPencairan = false;
          suratPermohonanPencairanUrl = url;
          suratPermohonanPencairanPublicUrl = await _getPublicFile(url);
          notifyListeners();
        },
      );
    }
  }

  Future clearSuratPermohonanPencairan() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus',
      description: 'Anda yakin akan menghapus surat permohonan pencairan ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      suratPermohonanPencairan = null;
      suratPermohonanPencairanUrl = null;
      suratPermohonanPencairanPublicUrl = null;
      notifyListeners();
    }
  }

  bool _isLoadingSuratPernyataanDebitur = false;

  bool get isLoadingSuratPernyataanDebitur => _isLoadingSuratPernyataanDebitur;
  File? suratPernyataanDebitur;
  String? suratPernyataanDebiturErrorText;
  String? suratPernyataanDebiturUrl;
  String? suratPernyataanDebiturPublicUrl;

  Future captureSuratPernyataanDebitur() async {
    final res = await _dialogService.showCustomDialog(
      variant: DialogType.takePhotoFile,
      barrierDismissible: true,
    );

    if (res != null && res.confirmed) {
      _isLoadingSuratPernyataanDebitur = true;
      notifyListeners();
      if (_isLoadingSuratPernyataanDebitur) {
        suratPernyataanDebitur = res.data[0] as File;
        suratPernyataanDebiturErrorText = null;
        uploadFileSuratPernyataanDebitur(
          suratPernyataanDebitur!,
          res.data[1].toString(),
        );
        notifyListeners();
      }
    }
  }

  Future uploadFileSuratPernyataanDebitur(File file, String type) async {
    if (type == 'image') {
      final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
        type: 'image',
        subType: 'png',
        file: file,
      ));

      res.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (url) async {
          _isLoadingSuratPernyataanDebitur = false;
          suratPernyataanDebiturUrl = url;
          suratPernyataanDebiturPublicUrl = await _getPublicFile(url);
          notifyListeners();
        },
      );
    } else {
      final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
        type: 'application',
        subType: 'pdf',
        file: file,
      ));

      res.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (url) async {
          _isLoadingSuratPernyataanDebitur = false;
          suratPernyataanDebiturUrl = url;
          suratPernyataanDebiturPublicUrl = await _getPublicFile(url);
          notifyListeners();
        },
      );
    }
  }

  Future clearSuratPernyataanDebitur() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus',
      description: 'Anda yakin akan menghapus surat pernyataan debitur ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      suratPernyataanDebitur = null;
      suratPernyataanDebiturUrl = null;
      suratPernyataanDebiturPublicUrl = null;
      notifyListeners();
    }
  }

  final bankRekeningPembayaranController = TextEditingController();

  void updateBankRekeningPembayaran(String val) {
    bankRekeningPembayaranController.text = val;
    notifyListeners();
  }

  final noRekeningPembayaranController = TextEditingController();

  void updateNoRekeningPembayaran(String val) =>
      noRekeningPembayaranController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  final namaRekeningPembayaranController = TextEditingController();

  void updateNamaRekeningPembayaran(String val) =>
      namaRekeningPembayaranController.value.copyWith(
        text: val,
        selection:
            TextSelection(baseOffset: val.length, extentOffset: val.length),
      );

  bool _isLoadingStandingInstruction = false;

  bool get isLoadingStandingInstruction => _isLoadingStandingInstruction;
  File? standingInstruction;
  String? standingInstructionErrorText;
  String? standingInstructionUrl;
  String? standingInstructionPublicUrl;

  Future captureStandingInstruction() async {
    final res = await _dialogService.showCustomDialog(
      variant: DialogType.takePhotoFile,
      barrierDismissible: true,
    );

    if (res != null && res.confirmed) {
      _isLoadingStandingInstruction = true;
      notifyListeners();
      if (_isLoadingStandingInstruction) {
        standingInstruction = res.data[0] as File;
        standingInstructionErrorText = null;
        uploadFileStandingInstruction(
          standingInstruction!,
          res.data[1].toString(),
        );
        notifyListeners();
      }
    }
  }

  Future uploadFileStandingInstruction(File file, String type) async {
    if (type == 'image') {
      final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
        type: 'image',
        subType: 'png',
        file: file,
      ));

      res.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (url) async {
          _isLoadingStandingInstruction = false;
          standingInstructionUrl = url;
          standingInstructionPublicUrl = await _getPublicFile(url);
          notifyListeners();
        },
      );
    } else {
      final res = await runBusyFuture(_ritelUploadFileAPI.uploadFile(
        type: 'application',
        subType: 'pdf',
        file: file,
      ));

      res.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (url) async {
          _isLoadingStandingInstruction = false;
          standingInstructionUrl = url;
          standingInstructionPublicUrl = await _getPublicFile(url);
          notifyListeners();
        },
      );
    }
  }

  Future clearStandingInstruction() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus',
      description:
          'Anda yakin akan menghapus dokumen standing instruction ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      standingInstruction = null;
      standingInstructionUrl = null;
      standingInstructionPublicUrl = null;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> _generateDisburseMap() async {
    final convertJatuhTempo =
        DateFormat('dd/MM/yyyy').format(_tanggalJatuhTempoCadanganBunga!);

    return {
      'idKelolaan': idKelolaan!,
      'partnerId': idPartner!,
      'dateConfirm': tanggalKonfirmasiController.text.trim(),
      'jenisDocUnderlying': JenisDokumenFormatter.forInput(
        jenisDokumenUnderlyingController.text.trim(),
      ),
      'nameDocUnderlying': namaDokumenUnderlyingController.text.trim(),
      'numDocUnderlying': nomorDokumenUnderlying.text.trim(),
      'dateDocUnderlying': tanggalDokumenUnderlyingController.text.trim(),
      'nominalUnderlying': nominalUnderlyingController.text.split('.').join(),
      'dateJatuhTempoUnderlying':
          tanggalJatuhTempoDokumenUnderlying.text.trim(),
      'jenisConfirm':
          JenisKonfirmasiFormatter.forInput(jenisKonfirmasi.text.trim()),
      'hasilConfirmBouwheer':
          hasilKonfirmasiPartnership.text == 'Sesuai' ? true : false,
      'pathBuktiConfirm': uploadBuktiKonfirmasiUrl!,
      'limitTersedia': kelonggaranTarik.toString(),
      'ppn': ppnController.text.split('.').join(),
      'cadanganBunga': cadanganBunga!.toInt().toString(),
      'cadanganBungaTempo': tempoCadanganBungaController.text.trim(),
      'sharingDana': sharingDanaSendiriController.text.trim(),
      'disburseAmount': nominalPencairan!.toInt().toString(),
      'cadanganBungaEndDate': convertJatuhTempo,
      'numOfDayLoan': jumlahHariPinjaman!,
      'otherPayment': _isNotRayaAccount,
      'paymentAccountBank': _isNotRayaAccount
          ? bankRekeningPembayaranController.text.trim()
          : null,
      'paymentAccountNum':
          _isNotRayaAccount ? noRekeningPembayaranController.text.trim() : null,
      'paymentAccountName': _isNotRayaAccount
          ? namaRekeningPembayaranController.text.trim()
          : null,
      'pathUnderlyingDoc': dokumenUnderlyingUrl!,
      'pathSuratPermohonanPencairan': suratPermohonanPencairanUrl!,
      'pathSuratPernyataanDebitur': suratPernyataanDebiturUrl!,
      'pathStandingInstruction':
          _isNotRayaAccount ? standingInstructionUrl! : null,
      'bungaPinjaman': int.parse(bungaPinjamanController.text),
    };
  }

  Future<Map<String, dynamic>> _generateUpdateDisburseMap() async {
    final convertJatuhTempo =
        DateFormat('dd/MM/yyyy').format(_tanggalJatuhTempoCadanganBunga!);

    return {
      'disburseId': pinjamanDetail!.disburseId!,
      'partnerId': idPartner!,
      'dateConfirm': tanggalKonfirmasiController.text.trim(),
      'jenisDocUnderlying': JenisDokumenFormatter.forInput(
        jenisDokumenUnderlyingController.text.trim(),
      ),
      'nameDocUnderlying': namaDokumenUnderlyingController.text.trim(),
      'numDocUnderlying': nomorDokumenUnderlying.text.trim(),
      'dateDocUnderlying': tanggalDokumenUnderlyingController.text.trim(),
      'nominalUnderlying': nominalUnderlyingController.text.split('.').join(),
      'dateJatuhTempoUnderlying':
          tanggalJatuhTempoDokumenUnderlying.text.trim(),
      'jenisConfirm':
          JenisKonfirmasiFormatter.forInput(jenisKonfirmasi.text.trim()),
      'hasilConfirmBouwheer':
          hasilKonfirmasiPartnership.text == 'Sesuai' ? true : false,
      'pathBuktiConfirm': uploadBuktiKonfirmasiUrl!,
      'limitTersedia': kelonggaranTarik.toString(),
      'ppn': ppnController.text.split('.').join(),
      'cadanganBunga': cadanganBunga!.toInt().toString(),
      'cadanganBungaTempo': tempoCadanganBungaController.text.trim(),
      'sharingDana': sharingDanaSendiriController.text.trim(),
      'disburseAmount': nominalPencairan!.toInt().toString(),
      'cadanganBungaEndDate': convertJatuhTempo,
      'numOfDayLoan': jumlahHariPinjaman!,
      'otherPayment': _isNotRayaAccount,
      'paymentAccountBank': _isNotRayaAccount
          ? bankRekeningPembayaranController.text.trim()
          : null,
      'paymentAccountNum':
          _isNotRayaAccount ? noRekeningPembayaranController.text.trim() : null,
      'paymentAccountName': _isNotRayaAccount
          ? namaRekeningPembayaranController.text.trim()
          : null,
      'pathUnderlyingDoc': dokumenUnderlyingUrl!,
      'pathSuratPermohonanPencairan': suratPermohonanPencairanUrl!,
      'pathSuratPernyataanDebitur': suratPernyataanDebiturUrl!,
      'pathStandingInstruction':
          _isNotRayaAccount ? standingInstructionUrl! : null,
      'bungaPinjaman': int.parse(bungaPinjamanController.text),
    };
  }

  Future validateInputs(BuildContext ctx) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final response = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.confirmation,
        data: {'title': 'Konfirmasi'},
      );

      if (response != null && response.confirmed) {
        await _postData(ctx);
      }
    } else {
      autoValidateMode = AutovalidateMode.always;
      // _setUploadFilesErrorTextIfAny();
      // _showValidationErrorDialog();
      notifyListeners();
    }
  }

  // ignore: long-method
  Future _postData(BuildContext ctx) async {
    if (pinjamanDetail != null) {
      final disburseMap = await _generateUpdateDisburseMap();
      dev.log(disburseMap.toString());

      final res = await runBusyFuture(
        _ritelPencairanApi.revisiPencairan(disburseMap),
      );

      res.fold(
        (errorMessage) {
          _showErrorDialog(errorMessage);
          notifyListeners();
        },
        (successMap) {
          _showSuccessDialog(ctx);
          notifyListeners();
        },
      );
    } else {
      final disburseMap = await _generateDisburseMap();

      final res = await runBusyFuture(
        _ritelPencairanApi.addPencairan(disburseMap),
      );

      res.fold(
        (errorMessage) {
          _showErrorDialog(errorMessage);
          notifyListeners();
        },
        (successMap) {
          _localDBService.removePencairanFlag();
          _showSuccessDialog(ctx);
          notifyListeners();
        },
      );
    }
  }

  bool _validateUploadFiles() {
    return _isLoadingBuktiKonfirmasiFile;
  }

  void _setUploadFilesErrorTextIfAny() {
    if (dokumenUnderlyingUrl == null) {
      dokumenUnderlyingErrorText = 'Lampiran Bukti Konfirmasi harus diupload';
    }
  }

  Future _showValidationErrorDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Invalid',
      description:
          'Satu atau beberapa isian ada yang kosong atau tidak sesuai dengan validasi. Silahkan periksa isian anda.',
      mainButtonTitle: 'Selanjutnya',
    );
  }

  void getPartnership() {
    if (pinjamanDetail != null) {
      _navigationService.navigateTo(
        Routes.partnershipViewRitel,
        arguments: PartnershipViewRitelArguments(
          idKelolaan: pinjamanDetail!.kelolaanId.toString(),
          idPartner: pinjamanDetail!.partnership!.idPartner,
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
          idPartner: idPartner,
          loanType: loanType!,
        ),
      );
    }
  }

  Future navigateToPencairanStepOne() async {
    if (pinjamanDetail != null) {
      await _navigationService.navigateTo(
        Routes.tambahPencairanView,
        arguments: TambahPencairanViewArguments(
          step: 1,
          idKelolaan: idKelolaan,
          idPartner: idPartner,
          pinjamanDetail: pinjamanDetail,
          counter: counter,
          status: status,
          loanType: loanType!,
        ),
        preventDuplicates: false,
      );
    } else {
      await _navigationService.navigateTo(
        Routes.tambahPencairanView,
        arguments: TambahPencairanViewArguments(
          step: 1,
          idKelolaan: idKelolaan,
          idPartner: idPartner,
          loanType: loanType!,
        ),
        preventDuplicates: false,
      );
    }
  }

  Future _saveKonfirmasiPartnerToLocalDB() async {
    if (pinjamanDetail != null) {
      _localDBService.replacePencairanFlag({
        'kelonggaranTarik': pinjamanDetail!.disburse!.limitTersedia!,
        'namaDebitur': pinjamanDetail!.disburse!.namaDebitur!,
        'noRekSimpanan': pinjamanDetail!.disburse!.numBankPencairan!,
        'noRekEscrow': pinjamanDetail!.disburse!.numBankEscrow!,
        'saldoOperasional': pinjamanDetail!.saldoOperasional!,
        'bungaPinjaman': pinjamanDetail!.disburse!.bungaPinjaman!,
        'namaPartnership': namaPartnershipController.text,
        'namaPIC': namaPICPartnership.text,
        'jabatanPIC': jabatanPicController.text,
        'noHandphonePIC': nomorHPController.text,
        'emailPIC': emailPicController.text,
        'tanggalKonfirmasi': tanggalKonfirmasiController.text,
        'jenisUnderlying': jenisDokumenUnderlyingController.text,
        'namaUnderlying': namaDokumenUnderlyingController.text,
        'noUnderlying': nomorDokumenUnderlying.text,
        'tanggalUnderlying': tanggalDokumenUnderlyingController.text,
        'nominalUnderlying': nominalUnderlyingController.text,
        'tanggalJatuhTempo': tanggalJatuhTempoDokumenUnderlying.text,
        'jenisKonfirmasi': jenisKonfirmasi.text,
        'hasilKonfirmasi': hasilKonfirmasiPartnership.text,
        'buktiKonfirmasi': uploadBuktiKonfirmasiUrl!,
      });
    } else {
      final getPencairanFlag = _localDBService.getPencairanFlag()!;

      _localDBService.replacePencairanFlag({
        'kelonggaranTarik': getPencairanFlag['kelonggaranTarik'],
        'namaDebitur': getPencairanFlag['namaDebitur'],
        'noRekSimpanan': getPencairanFlag['noRekSimpanan'],
        'noRekEscrow': getPencairanFlag['noRekEscrow'],
        'saldoOperasional': getPencairanFlag['saldoOperasional'],
        'bungaPinjaman': getPencairanFlag['bungaPinjaman'],
        'namaPartnership': namaPartnershipController.text,
        'namaPIC': namaPICPartnership.text,
        'jabatanPIC': jabatanPicController.text,
        'noHandphonePIC': nomorHPController.text,
        'emailPIC': emailPicController.text,
        'tanggalKonfirmasi': tanggalKonfirmasiController.text,
        'jenisUnderlying': jenisDokumenUnderlyingController.text,
        'namaUnderlying': namaDokumenUnderlyingController.text,
        'noUnderlying': nomorDokumenUnderlying.text,
        'tanggalUnderlying': tanggalDokumenUnderlyingController.text,
        'nominalUnderlying': nominalUnderlyingController.text,
        'tanggalJatuhTempo': tanggalJatuhTempoDokumenUnderlying.text,
        'jenisKonfirmasi': jenisKonfirmasi.text,
        'hasilKonfirmasi': hasilKonfirmasiPartnership.text,
        'buktiKonfirmasi': uploadBuktiKonfirmasiUrl!,
      });
    }
  }

  Future navigateToPencairanStepTwo() async {
    await _saveKonfirmasiPartnerToLocalDB();

    await _navigationService.navigateTo(
      Routes.tambahPencairanView,
      arguments: TambahPencairanViewArguments(
        step: 2,
        idKelolaan: idKelolaan,
        idPartner: idPartner,
        pinjamanDetail: pinjamanDetail,
        counter: counter,
        status: status,
        loanType: loanType!,
      ),
      preventDuplicates: false,
    );
  }

  Future navigateToMonitoringDetail() async {
    if (_anyFieldEditedKonfirmasiPartnership()) {
      final response = await _dialogService.showCustomDialog(
        variant: DialogType.base,
        title: 'Edited',
        description:
            'Anda belum menyelesaikan pengisian form ini. Data-data yang sudah Anda masukkan akan hilang. Apakah Anda yakin akan membatalkan pengisian form ini?',
        data: {'color': CustomColor.primaryRed80},
        mainButtonTitle: 'Batal Isi Form',
      );

      if (response!.confirmed) {
        if (pinjamanDetail != null) {
          _localDBService.removePencairanFlag();

          _navigationService.navigateToPinjamanDetailView(
            counter: counter!,
            disburseId: int.parse(pinjamanDetail!.disburseId!),
            status: status!,
            loanType: loanType!,
            idKelolaan: idKelolaan!,
          );
        } else {
          _localDBService.removePencairanFlag();

          _navigationService.navigateTo(
            Routes.monitoringDetailView,
            arguments: MonitoringDetailViewArguments(
              idKelolaan: idKelolaan!,
              loanType: loanType!,
            ),
          );
        }
      }
    } else {
      if (pinjamanDetail != null) {
        _localDBService.removePencairanFlag();

        _navigationService.navigateToPinjamanDetailView(
          counter: counter!,
          disburseId: int.parse(pinjamanDetail!.disburseId!),
          status: status!,
          loanType: loanType!,
          idKelolaan: idKelolaan!,
        );
      } else {
        _localDBService.removePencairanFlag();

        _navigationService.navigateTo(
          Routes.monitoringDetailView,
          arguments: MonitoringDetailViewArguments(
            idKelolaan: idKelolaan!,
            loanType: loanType!,
          ),
        );
      }
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

  void _showSuccessDialog(
    BuildContext ctx,
  ) {
    showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      context: ctx,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext buildCtx) {
        return Wrap(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => _navigationService
                            .navigateTo(Routes.monitoringRitelView),
                        child: const Icon(
                          Icons.close,
                          color: CustomColor.primaryBlack80,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Image.asset(
                    ImageConstants.sendMail,
                    scale: 3,
                  ),
                  SizedBox(height: 16.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Pencairan Berhasil Diajukan',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.primaryBlack,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      AutoSizeText(
                        'Dokumen pencairan berhasil diajukan dan terkirim ke CBL untuk diproses.',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xff99A0AF),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      CustomButton(
                        label: 'Sip, mengerti',
                        onPressed: () => _navigationService
                            .navigateTo(Routes.monitoringRitelView),
                        isBusy: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  bool _anyFieldEditedKonfirmasiPartnership() {
    return (namaPartnershipController.text.isNotEmpty ||
        namaPICPartnership.text.isNotEmpty ||
        jabatanPicController.text.isNotEmpty ||
        nomorHPController.text.isNotEmpty ||
        emailPicController.text.isNotEmpty ||
        tanggalKonfirmasiController.text.isNotEmpty ||
        jenisDokumenUnderlyingController.text.isNotEmpty ||
        namaDokumenUnderlyingController.text.isNotEmpty ||
        nomorDokumenUnderlying.text.isNotEmpty ||
        tanggalDokumenUnderlyingController.text.isNotEmpty ||
        nominalUnderlyingController.text.isNotEmpty ||
        tanggalJatuhTempoDokumenUnderlying.text.isNotEmpty ||
        jenisKonfirmasi.text.isNotEmpty ||
        hasilKonfirmasiPartnership.text.isNotEmpty ||
        uploadBuktiKonfirmasiUrl != null);
  }

  bool anyKonfirmasiPartnershipFormCompleted() {
    return (namaPartnershipController.text.isNotEmpty &&
        namaPICPartnership.text.isNotEmpty &&
        jabatanPicController.text.isNotEmpty &&
        nomorHPController.text.isNotEmpty &&
        emailPicController.text.isNotEmpty &&
        tanggalKonfirmasiController.text.isNotEmpty &&
        jenisDokumenUnderlyingController.text.isNotEmpty &&
        namaDokumenUnderlyingController.text.isNotEmpty &&
        nomorDokumenUnderlying.text.isNotEmpty &&
        tanggalDokumenUnderlyingController.text.isNotEmpty &&
        nominalUnderlyingController.text.isNotEmpty &&
        tanggalJatuhTempoDokumenUnderlying.text.isNotEmpty &&
        jenisKonfirmasi.text.isNotEmpty &&
        hasilKonfirmasiPartnership.text.isNotEmpty &&
        uploadBuktiKonfirmasiUrl != null);
  }

  bool anyDetilPencairanFormCompleted() {
    return (nomorDokumenUnderlying.text.isNotEmpty &&
        nominalUnderlyingController.text.isNotEmpty &&
        ppnController.text.isNotEmpty &&
        tanggalJatuhTempoDokumenUnderlying.text.isNotEmpty &&
        tempoCadanganBungaController.text.isNotEmpty &&
        dokumenUnderlyingUrl!.isNotEmpty &&
        suratPermohonanPencairanUrl != null);
  }
}

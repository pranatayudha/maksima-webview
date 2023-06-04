// ignore_for_file: unused_field, prefer_single_quotes

import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../../application/app/constants/common.dart';
import '../../../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../../../application/models/ritel_informasi_finansial_data_laporan_period1.dart';
import '../../../../../../../../../application/models/ritel_informasi_finansial_data_laporan_period2.dart';
import '../../../../../../../../../application/models/ritel_informasi_finansial_data_laporan_period3.dart';
import '../../../../../../../../../application/models/ritel_informasi_finansial_data_laporan_period4.dart';
import '../../../../../../../../../application/models/ritel_informasi_finansial_data_laporan_period4_proyeksi.dart';
import '../../../../../../../../../infrastructure/apis/ritel_prakarsa_api.dart';

class DataLaporanFinansialViewModel extends FutureViewModel {
  String? id;
  int? page;
  String pipelineId;
  int loanTypesId;
  int status;
  final int codeTable;

  DataLaporanFinansialViewModel({
    this.id,
    this.page,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RitelPrakarsaAPI _ritelPrakarsaAPI = locator<RitelPrakarsaAPI>();
  final formatter = NumberFormat('#,###', 'id_ID');

  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;

  RitelFinansialDataLaporanPeriodOne? _ritelPrakarsaInformasiFinansialPeriodOne;

  RitelFinansialDataLaporanPeriodOne
      get ritelPrakarsaInformasiFinansialPeriodOne =>
          _ritelPrakarsaInformasiFinansialPeriodOne!;

  RitelFinansialDataLaporanPeriodTwo? _ritelPrakarsaInformasiFinansialPeriodTwo;

  RitelFinansialDataLaporanPeriodTwo
      get ritelPrakarsaInformasiFinansialPeriodTwo =>
          _ritelPrakarsaInformasiFinansialPeriodTwo!;

  RitelFinansialDataLaporanPeriodThree?
      _ritelPrakarsaInformasiFinansialPeriodThree;

  RitelFinansialDataLaporanPeriodThree
      get ritelPrakarsaInformasiFinansialPeriodThree =>
          _ritelPrakarsaInformasiFinansialPeriodThree!;

  RitelFinansialDataLaporanPeriodFour?
      _ritelPrakarsaInformasiFinansialPeriodFour;

  RitelFinansialDataLaporanPeriodFour
      get ritelPrakarsaInformasiFinansialPeriodFour =>
          _ritelPrakarsaInformasiFinansialPeriodFour!;

  RitelFinansialDataLaporanPeriodFourProyeksi?
      _ritelPrakarsaInformasiFinansialPeriodFourProyeksi;

  RitelFinansialDataLaporanPeriodFourProyeksi
      get ritelPrakarsaInformasiFinansialPeriodFourProyeksi =>
          _ritelPrakarsaInformasiFinansialPeriodFourProyeksi!;

  List<String> get jenisAnalisaFinansialOptions =>
      [Common.kmkPTR, Common.pinangPariMaksimaPrk];

  final jenisAnalisaFinansialController = TextEditingController();
  final tahunPerhitunganController = TextEditingController();
  final tanggalPerhitunganAwalController = TextEditingController();
  final tanggalPerhitunganAkhirController = TextEditingController();
  final kasOrBankController = TextEditingController();
  final piutangDagangController = TextEditingController();
  final persediaanController = TextEditingController();
  final aktivaLancarLainnyaController = TextEditingController();
  final tanahController = TextEditingController();
  final bangunanController = TextEditingController();
  final mesinPeralatanController = TextEditingController();
  final kendaraanController = TextEditingController();
  final inventarisKantorController = TextEditingController();
  final aktivaTetapLainyaController = TextEditingController();
  final aktivaTetapController = TextEditingController();
  final akumulasiPenyusutanController = TextEditingController();
  final hutangBankdown12Controller = TextEditingController();
  final hutangDagangController = TextEditingController();
  final hutangJangkaPendekLainyaController = TextEditingController();
  final hutangJangkaPendekController = TextEditingController();
  final tagLocationKunjunganController = TextEditingController();
  final hutangJangkaPanjangController = TextEditingController();
  final hutangBankJangkaPanjangController = TextEditingController();
  final modalDisetorController = TextEditingController();
  final labaDitahanController = TextEditingController();
  final labaBerjalanController = TextEditingController();
  final penyesuianModalController = TextEditingController();
  final penjualanController = TextEditingController();
  final biayaHPPController = TextEditingController();
  final biayaPenjualanController = TextEditingController();
  final biayaAdministrasiUmumController = TextEditingController();
  final biayaOperasionalController = TextEditingController();
  final biayaPenyusutanController = TextEditingController();
  final biayaBungaController = TextEditingController();
  final pendapatanLainnyaController = TextEditingController();
  final biayaOperasionallainyaController = TextEditingController();
  final biayaLainnyaController = TextEditingController();
  final pajakController = TextEditingController();
  final proyeksiPenjualanController = TextEditingController();
  final proyeksiHutangDagangController = TextEditingController();

  int? aktivaLancar;
  int? totalHutangJangkaPendek1;
  int? totalAktiva;
  int? totalAktivaTetap;
  int? totalHutangJangkaPendek;
  int? totalHutangJangkaPanjang;
  int? totalModal;
  int? totalHutang;
  int? modalSendiri;
  int? totalPasiva;
  int? labaKotor;
  int? labaOperasional;
  int? labaSebelumPajak;
  int? labaBersih;
  int? pendapatanBersih;
  int? kreditYangBisaDiberikan;
  int? nwc;
  double? sdsKMK;
  double? cr;
  double? icr;
  double? dop;
  double? qr;
  double? doi;
  int? dor;
  int? ebitda;
  int? npm;

  double? debtToEquityRatio;
  int? nwcPositif;
  double? roe;
  double? roi;
  double? roa;

  bool loadingPageOne = true;
  bool loadingPageTwo = true;
  bool loadingPageThree = true;
  bool loadingPageFour = true;

  bool isSuccessPageOne = false;
  bool isSuccessPageTwo = false;
  bool isSuccessPageThree = false;
  bool isSuccessPageFour = false;

  String? _initJenisAnalisa;

  String get initJenisAnalisa => _initJenisAnalisa!;

  double? kebutuhanKMK;

  @override
  Future futureToRun() async {
    await getInitInformasiFinansial(id!);
    if (page == 1) {
      await getInformasiFinansialPeriodOne(id!);
      await _populateTextFields(page!);
    }
    if (page == 2) {
      await getInformasiFinansialPeriodTwo(id!);
      await _populateTextFields(page!);
    }
    if (page == 3) {
      await getInformasiFinansialPeriodThree(id!);
      await _populateTextFields(page!);
    }
    if (page == 4) {
      setBusy(true);
      await getInformasiFinansialPeriodFour(id!);
      await getInformasiFinansialPeriodFourProyeksi(id!);
      await _populateTextFieldsAsumsi();
      setBusy(false);
    }
  }

  void navigateToInformasiFinansial() {
    _navigationService.navigateTo(
      Routes.informasiFinansialView,
      arguments: InformasiFinansialViewArguments(
        prakarsaId: id!,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
      ),
    );
  }

  static String convertDateYear(String dateString) {
    final inputFormat = DateFormat('dd/MM/yyyy');
    final date = inputFormat.parse(dateString);
    final outputFormat = DateFormat('yyyy');
    // ignore: newline-before-return
    return outputFormat.format(date).toString();
  }

  static String convertDate(String dateString) {
    // Split date type string by T
    final temp1 = dateString.split('T');
    final temp2 = temp1[0].split('-');

    // Convert type string to date
    final inputFormat = DateFormat('dd/MM/yyyy');
    final date = inputFormat.parse('${temp2[2]}/${temp2[1]}/${temp2[0]}');
    final outputFormat = DateFormat('dd-MMM-yyyy');

    return outputFormat.format(date).toString();
  }

  String convertDateWithoutSplash(String dateString) {
    // Split date type string by T
    final temp1 = dateString.split('T');
    final temp2 = temp1[0].split('-');

    // Convert type string to date
    final inputFormat = DateFormat('dd/MM/yyyy');
    final date = inputFormat.parse('${temp2[2]}/${temp2[1]}/${temp2[0]}');
    final outputFormat = DateFormat('dd MMM yyyy');

    return outputFormat.format(date).toString();
  }

  static String convertDateForPerhitungan(String dateString) {
    // Convert type string from choosing date
    final inputFormat = DateFormat('dd/MM/yyyy');
    final date = inputFormat.parse(dateString);
    final outputFormat = DateFormat('dd-MMM-yyyy');

    return outputFormat.format(date).toString();
  }

  static String convertDateForSave(String dateString) {
    // Convert type string to date
    final inputFormat = DateFormat('dd-MMM-yyyy');
    final date = inputFormat.parse(dateString);
    final outputFormat = DateFormat('dd/MM/yyyy');

    return outputFormat.format(date).toString();
  }

  static String convertInt(String text) {
    // Convert to in when process hit api
    final tempOne = text.split('.');
    final tempTwo = tempOne.join();
    // ignore: newline-before-return
    return tempTwo;
  }

  String thousandSeparator(
    value, {
    String separator = '.',
    String trailing = "",
  }) {
    return value.toString().replaceAllMapped(
              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
              (Match m) => '${m[1]}$separator',
            ) +
        trailing;
  }

  Future _populateTextFieldsAsumsi() async {
    proyeksiPenjualanController.text =
        (ritelPrakarsaInformasiFinansialPeriodFourProyeksi.proyeksiPenjualan!);
    proyeksiHutangDagangController.text =
        ritelPrakarsaInformasiFinansialPeriodFourProyeksi.proyeksiHutangDagang!;
  }

  Future _populateTextFields(int pagePeriod) async {
    dynamic data;
    if (pagePeriod == 1) {
      data = ritelPrakarsaInformasiFinansialPeriodOne;
    } else if (pagePeriod == 2) {
      data = ritelPrakarsaInformasiFinansialPeriodTwo;
    } else if (pagePeriod == 3) {
      data = ritelPrakarsaInformasiFinansialPeriodThree;
    }

    tahunPerhitunganController.text =
        data.yearsCalculation != null ? data.yearsCalculation!.toString() : '';
    tanggalPerhitunganAwalController.text =
        convertDate(data.dateOfCalculationFirst!);
    tanggalPerhitunganAkhirController.text =
        convertDate(data.dateOfCalculationLast!);
    // Section Neraca
    kasOrBankController.text = thousandSeparator(thousandSeparator(
      double.parse(data.neraca_kasBank!).toInt().toString(),
    ));
    piutangDagangController.text = thousandSeparator(
      double.parse(data.neraca_piutangDagang!).toInt().toString(),
    );
    persediaanController.text = thousandSeparator(
      double.parse(data.neraca_persediaan!).toInt().toString(),
    );
    aktivaLancarLainnyaController.text = thousandSeparator(
      double.parse(data.neraca_aktivaLancarLainnya!).toInt().toString(),
    );
    aktivaLancar = double.parse(data.neraca_aktivaLancar!).toInt();
    tanahController.text =
        thousandSeparator(double.parse(data.neraca_tanah!).toInt().toString());
    bangunanController.text = thousandSeparator(
      double.parse(data.neraca_bangunan!).toInt().toString(),
    );
    mesinPeralatanController.text = thousandSeparator(
      double.parse(data.neraca_mesinPeralatan!).toInt().toString(),
    );
    kendaraanController.text = thousandSeparator(
      double.parse(data.neraca_kendaraan!).toInt().toString(),
    );
    inventarisKantorController.text = thousandSeparator(
      double.parse(data.neraca_inventarisKantor!).toInt().toString(),
    );
    aktivaTetapLainyaController.text =
        double.parse(data.neraca_aktivaTetapLainnya!).toInt().toString();
    akumulasiPenyusutanController.text = thousandSeparator(
      double.parse(data.neraca_akumulasiPenyusutan!).toInt().toString(),
    );
    totalAktivaTetap = double.parse(data.neraca_totalAktivaTetap!).toInt();
    totalAktiva = double.parse(data.neraca_totalAktiva!).toInt();
    hutangDagangController.text = thousandSeparator(
      double.parse(data.neraca_hutangDagang!).toInt().toString(),
    );
    hutangBankdown12Controller.text = thousandSeparator(
      double.parse(data.neraca_hutangBank12Bulan!).toInt().toString(),
    );
    hutangJangkaPendekLainyaController.text = thousandSeparator(
      double.parse(data.neraca_hutangJangkaPendekLainnya!).toInt().toString(),
    );
    totalHutangJangkaPendek =
        double.parse(data.neraca_totalHutangJangkaPendek!).toInt();
    hutangJangkaPanjangController.text = thousandSeparator(
      double.parse(data.neraca_hutangJangkaPanjang!).toInt().toString(),
    );
    hutangBankJangkaPanjangController.text = thousandSeparator(
      double.parse(data.neraca_hutangBankJangkaPanjang!).toInt().toString(),
    );
    totalHutangJangkaPanjang =
        double.parse(data.neraca_totalHutangJangkaPanjang!).toInt();
    totalHutang = double.parse(data.neraca_totalHutang!).toInt();
    modalDisetorController.text = thousandSeparator(
      double.parse(data.neraca_modalDisetor!).toInt().toString(),
    );
    labaDitahanController.text = thousandSeparator(
      double.parse(data.neraca_labaDitahan!).toInt().toString(),
    );
    labaBerjalanController.text = thousandSeparator(
      double.parse(data.neraca_labaBerjalan!).toInt().toString(),
    );
    penyesuianModalController.text = thousandSeparator(
      double.parse(data.neraca_penyesuaianModal!).toInt().toString(),
    );
    totalModal = double.parse(data.neraca_totalModal!).toInt();
    totalPasiva = double.parse(data.neraca_totalPasiva!).toInt();
    // Section Laba Rugi
    penjualanController.text = thousandSeparator(
      double.parse(data.labaRugi_penjualan!).toInt().toString(),
    );
    biayaHPPController.text = thousandSeparator(
      double.parse(data.labaRugi_biayaHPP!).toInt().toString(),
    );
    labaKotor = double.parse(data.labaRugi_labaKotor!).toInt();
    biayaPenjualanController.text = thousandSeparator(
      double.parse(data.labaRugi_biayaPenjualan!).toInt().toString(),
    );
    biayaAdministrasiUmumController.text = thousandSeparator(
      double.parse(data.labaRugi_biayaAdministrasiUmum!).toInt().toString(),
    );
    biayaOperasionalController.text = thousandSeparator(
      double.parse(data.labaRugi_biayaOperasional!).toInt().toString(),
    );
    labaOperasional = double.parse(data.labaRugi_labaOperasional!).toInt();
    biayaPenyusutanController.text = thousandSeparator(
      double.parse(data.labaRugi_biayaPenyusutan!).toInt().toString(),
    );
    biayaBungaController.text = thousandSeparator(
      double.parse(data.labaRugi_biayaBunga!).toInt().toString(),
    );
    pendapatanLainnyaController.text = thousandSeparator(
      double.parse(data.labaRugi_pendapatanLainnya!).toInt().toString(),
    );
    biayaOperasionallainyaController.text = thousandSeparator(
      double.parse(data.labaRugi_biayaOperasionalLainnya!).toInt().toString(),
    );
    biayaLainnyaController.text = thousandSeparator(
      double.parse(data.labaRugi_biayaLainnya!).toInt().toString(),
    );
    labaSebelumPajak = double.parse(data.labaRugi_labaSebelumPajak!).toInt();
    pajakController.text = thousandSeparator(
      double.parse(data.labaRugi_pajak!).toInt().toString(),
    );
    labaBersih = double.parse(data.labaRugi_labaBersih!).toInt();
  }

  // Generate data for send to api data
  Future<Map<String, dynamic>> _generateDataFinansial() async {
    return {
      'prakarsaId': id!,
      'step': page!,
      'yearsCalculation': convertInt(tahunPerhitunganController.text),
      'dateOfCalculationFirst': tanggalPerhitunganAwalController.text.isNotEmpty
          ? convertDateForSave(tanggalPerhitunganAwalController.text)
          : '05/04/2022',
      'dateOfCalculationLast': tanggalPerhitunganAkhirController.text.isNotEmpty
          ? convertDateForSave(tanggalPerhitunganAkhirController.text)
          : '05/06/2022',
      codeTable == 1 ? 'neraca_kas/bank' : 'neraca_kasBank':
          convertInt(kasOrBankController.text),
      'neraca_totalAktiva': totalAktiva,
      'neraca_persediaan': convertInt(persediaanController.text),
      'neraca_aktivaLancarLainnya':
          convertInt(aktivaLancarLainnyaController.text),
      'neraca_aktivaLancar': aktivaLancar,
      'neraca_tanah': convertInt(tanahController.text),
      'neraca_bangunan': convertInt(bangunanController.text),
      'neraca_mesinPeralatan': convertInt(mesinPeralatanController.text),
      'neraca_kendaraan': convertInt(kendaraanController.text),
      'neraca_inventarisKantor': convertInt(inventarisKantorController.text),
      'neraca_aktivaTetapLainnya': convertInt(aktivaTetapLainyaController.text),
      'neraca_akumulasiPenyusutan':
          convertInt(akumulasiPenyusutanController.text),
      'neraca_totalPasiva': totalPasiva,
      codeTable == 1 ? 'neraca_hutangBank<12Bulan' : 'neraca_hutangBank12Bulan':
          convertInt(hutangBankdown12Controller.text),
      'neraca_totalAktivaTetap': totalAktivaTetap,
      'neraca_hutangDagang': convertInt(hutangDagangController.text),
      'neraca_piutangDagang': convertInt(piutangDagangController.text),
      'neraca_hutangJangkaPendekLainnya':
          convertInt(hutangJangkaPendekLainyaController.text),
      'neraca_totalHutangJangkaPendek': totalHutangJangkaPendek,
      'neraca_hutangJangkaPanjang':
          convertInt(hutangJangkaPanjangController.text),
      'neraca_hutangBankJangkaPanjang':
          convertInt(hutangBankJangkaPanjangController.text),
      'neraca_totalHutangJangkaPanjang': totalHutangJangkaPanjang,
      'neraca_totalHutang': totalHutang,
      'neraca_modalDisetor': convertInt(modalDisetorController.text),
      'neraca_labaDitahan': convertInt(labaDitahanController.text),
      'neraca_labaBerjalan': convertInt(labaBerjalanController.text),
      'neraca_penyesuaianModal': convertInt(penyesuianModalController.text),
      'neraca_totalModal': totalModal,
      'labaRugi_penjualan': convertInt(penjualanController.text),
      'labaRugi_biayaHPP': convertInt(biayaHPPController.text),
      'labaRugi_labaKotor': labaKotor,
      'labaRugi_biayaPenjualan': convertInt(biayaPenjualanController.text),
      'labaRugi_biayaAdministrasiUmum':
          convertInt(biayaAdministrasiUmumController.text),
      'labaRugi_biayaOperasional': convertInt(biayaOperasionalController.text),
      'labaRugi_labaOperasional': labaOperasional,
      'labaRugi_biayaPenyusutan': convertInt(biayaPenyusutanController.text),
      'labaRugi_biayaBunga': biayaBungaController.text.split('.').join(),
      'labaRugi_pendapatanLainnya':
          convertInt(pendapatanLainnyaController.text),
      'labaRugi_biayaOperasionalLainnya':
          convertInt(biayaOperasionallainyaController.text),
      'labaRugi_biayaLainnya': convertInt(biayaLainnyaController.text),
      'labaRugi_labaSebelumPajak': labaSebelumPajak,
      'labaRugi_pajak': convertInt(pajakController.text),
      'labaRugi_labaBersih': labaBersih,
    };
  }

  Future<Map<String, dynamic>> _generateDataAsumsiFinansial() async {
    return {
      'prakarsaId': id!,
      'proyeksi_penjualan': proyeksiPenjualanController.text,
      'proyeksi_hutang_dagang': proyeksiHutangDagangController.text,
    };
  }

  void navigateToPipelineView() => _navigationService.clearStackAndShow(
        Routes.mainView,
        arguments: const MainViewArguments(index: 2),
      );

  // Duration for futureBuilder in View
  Future<bool> getFutureBool() {
    return Future.delayed(const Duration(seconds: 2)).then((onValue) => true);
  }

  Future getInitInformasiFinansial(String id) async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.initInformasiFinansial(id, codeTable),
    );

    res.fold(
      (error) => error,
      (result) {
        if (result['data']['loanTypesId'] == 1) {
          updateJenisAnalisaFinansial('KMK - PTR');
        } else {
          updateJenisAnalisaFinansial('KMK - Transaksional');
        }
      },
    );
  }

  Future getInformasiFinansialPeriodOne(String id) async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.fetchInformasiFinansialPeriodOne(id, codeTable),
    );

    res.fold(
      (error) => developer.log(error),
      (result) {
        _ritelPrakarsaInformasiFinansialPeriodOne =
            RitelFinansialDataLaporanPeriodOne.fromJson(result);
        loadingPageOne = false;
        notifyListeners();
      },
    );
  }

  Future getInformasiFinansialPeriodTwo(String id) async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.fetchInformasiFinansialPeriodTwo(id, codeTable),
    );

    res.fold(
      (error) => error,
      (result) {
        _ritelPrakarsaInformasiFinansialPeriodTwo =
            RitelFinansialDataLaporanPeriodTwo.fromJson(result);

        loadingPageTwo = false;
        notifyListeners();
      },
    );
  }

  Future getInformasiFinansialPeriodThree(String id) async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.fetchInformasiFinansialPeriodThree(id, codeTable),
    );

    res.fold(
      (error) => error,
      (result) {
        _ritelPrakarsaInformasiFinansialPeriodThree =
            RitelFinansialDataLaporanPeriodThree.fromJson(result);
        developer.log(_ritelPrakarsaInformasiFinansialPeriodThree.toString());
        loadingPageThree = false;
        notifyListeners();
      },
    );
  }

  Future getInformasiFinansialPeriodFour(String id) async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.fetchInformasiFinansialPeriodFour(id, codeTable),
    );

    res.fold(
      (error) => error,
      (result) {
        _ritelPrakarsaInformasiFinansialPeriodFour =
            RitelFinansialDataLaporanPeriodFour.fromJson(result);
      },
    );
  }

  Future getInformasiFinansialPeriodFourProyeksi(String id) async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.fetchInformasiFinansialPeriodFourProyeksi(
        id,
        codeTable,
      ),
    );

    res.fold(
      (error) => error,
      (result) {
        _ritelPrakarsaInformasiFinansialPeriodFourProyeksi =
            RitelFinansialDataLaporanPeriodFourProyeksi.fromJson(result);
        loadingPageFour = false;
        notifyListeners();
      },
    );
  }

  Future saveInformasiFinansiial() async {
    final dataFinansial = await _generateDataFinansial();
    developer.log(dataFinansial.toString());
    print(dataFinansial);
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.saveInformasiFinansial(dataFinansial, codeTable),
    );

    res.fold(
      (error) {
        _showErrorDialog(error);
      },
      (result) async {
        _clearAllValues();
        if (page == 1) {
          isSuccessPageOne = true;
          notifyListeners();
        }
        if (page == 2) {
          isSuccessPageTwo = true;
          notifyListeners();
        }
        if (page == 3) {
          isSuccessPageThree = true;
          notifyListeners();
        }
      },
    );
  }

  Future saveAsumsiInfoFinansial(bool isFromForm) async {
    final dataAsumsi = await _generateDataAsumsiFinansial();

    final res = await runBusyFuture(
      _ritelPrakarsaAPI.saveAsumsiInfoFinansial(dataAsumsi, codeTable),
    );

    res.fold(
      (error) => _showErrorDialog(error),
      (result) => _showSuccessDialog(result, isFromForm),
    );
  }

  int _removeThousandsSeparator(String text) {
    final removedThousandsSeparator = text.split('.').join();
    // ignore: newline-before-return
    return int.parse(removedThousandsSeparator);
  }

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Gagal',
      description: errorMessage,
      mainButtonTitle: 'COBA LAGI',
    );
  }

  Future _showSuccessDialog(String successMessage, bool isFromForm) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    if (isFromForm) {
      _navigationService.navigateTo(
        Routes.informasiFinansialViewPeriodOne,
        arguments: InformasiFinansialViewPeriodOneArguments(
          prakarsaId: id,
          pipelineId: pipelineId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      );
    } else {
      _navigationService.navigateTo(
        Routes.informasiFinansialView,
        arguments: InformasiFinansialViewArguments(
          prakarsaId: id!,
          pipelineId: pipelineId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      );
    }
  }

  void _clearAllValues() {
    tanggalPerhitunganAkhirController.text = '';
    tanggalPerhitunganAwalController.text = '';
    tahunPerhitunganController.text = '';
    tagLocationKunjunganController.text = '';
    kasOrBankController.text = '';
    piutangDagangController.text = '';
    aktivaLancarLainnyaController.text = '';
    persediaanController.text = '';
    aktivaTetapController.text = '';
    hutangDagangController.text = '';
    hutangJangkaPendekController.text = '';
    hutangJangkaPanjangController.text = '';
    penjualanController.text = '';
    biayaHPPController.text = '';
    biayaOperasionalController.text = '';
    biayaBungaController.text = '';
    pendapatanLainnyaController.text = '';
    biayaLainnyaController.text = '';
    proyeksiPenjualanController.text = '';
    proyeksiHutangDagangController.text = '';
    aktivaLancar = null;
    totalAktiva = null;
    totalHutang = null;
    modalSendiri = null;
    totalPasiva = null;
    labaKotor = null;
    labaOperasional = null;
    pendapatanBersih = null;
    kreditYangBisaDiberikan = null;
    nwc = null;
    sdsKMK = null;
    debtToEquityRatio = null;
    nwcPositif = null;
    roe = null;
    roi = null;
    kebutuhanKMK = null;
  }

  void updateJenisAnalisaFinansial(String val) {
    jenisAnalisaFinansialController.text = val;
    _clearAllValues();
    notifyListeners();
  }

  // Tanggal perhitungan
  void updateTahunPerhitungan(String val) {
    tahunPerhitunganController.text = convertDateYear(val.trim());
    tanggalPerhitunganAwalController.text =
        convertDateForPerhitungan('01/01/${convertDateYear(val.trim())}');
    tanggalPerhitunganAkhirController.text =
        convertDateForPerhitungan('31/12/${convertDateYear(val.trim())}');
  }

  void updateTanggalPerhitunganAwal(String val) =>
      tanggalPerhitunganAwalController.text =
          convertDateForPerhitungan(val.trim());

  void updateTanggalPerhitunganAkhir(String val) =>
      tanggalPerhitunganAkhirController.text =
          convertDateForPerhitungan(val.trim());

  /// 1. Neraca
  void updateKasOrBank(String val) {
    kasOrBankController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countAktivaLancar();
  }

  void updatePiutangDagang(String val) {
    piutangDagangController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countAktivaLancar();
  }

  void updatePersediaan(String val) {
    persediaanController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countAktivaLancar();
  }

  void updateaktivaLancarLainnyaController(String val) {
    aktivaLancarLainnyaController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countAktivaLancar();
  }

  void _countAktivaLancar() {
    final int kasOrBank = kasOrBankController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(kasOrBankController.text);
    final int piutangDagang = piutangDagangController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(piutangDagangController.text);
    final int persediaan = persediaanController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(persediaanController.text);
    final int aktivaLancarLainnya = aktivaLancarLainnyaController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(aktivaLancarLainnyaController.text);

    aktivaLancar = kasOrBank + piutangDagang + persediaan + aktivaLancarLainnya;

    _countTotalAktiva();

    notifyListeners();
  }

  //////////////
  void updateTanah(String val) {
    tanahController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countTotalAktivaTetap();
    // _countModalSendiri();
  }

  void updateBangunan(String val) {
    bangunanController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countTotalAktivaTetap();
    // _countModalSendiri();
  }

  void updateMesinPeralatan(String val) {
    mesinPeralatanController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countTotalAktivaTetap();
    // _countModalSendiri();
  }

  void updateKendaraan(String val) {
    kendaraanController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countTotalAktivaTetap();
    // _countModalSendiri();
  }

  void updateInventarisKantor(String val) {
    inventarisKantorController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countTotalAktivaTetap();
    // _countModalSendiri();
  }

  void updateAktivaTetapLainnya(String val) {
    aktivaTetapLainyaController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countTotalAktivaTetap();
    // _countModalSendiri();
  }

  void updateAkumulasiPenyusutan(String val) {
    akumulasiPenyusutanController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countTotalAktivaTetap();
    // _countModalSendiri();
  }

  void _countTotalAktivaTetap() {
    final int tanah = tanahController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(tanahController.text);
    final int bangunan = bangunanController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(bangunanController.text);
    final int mesinPeralatan = mesinPeralatanController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(mesinPeralatanController.text);
    final int kendaraan = kendaraanController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(kendaraanController.text);
    final int inventarisKantor = inventarisKantorController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(inventarisKantorController.text);
    final int aktivaTetapLainnya = aktivaTetapLainyaController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(aktivaTetapLainyaController.text);
    final int akumulasiPenyusutan = akumulasiPenyusutanController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(akumulasiPenyusutanController.text);

    totalAktivaTetap = tanah +
        bangunan +
        mesinPeralatan +
        kendaraan +
        inventarisKantor +
        aktivaTetapLainnya -
        akumulasiPenyusutan;

    _countTotalAktiva();
    notifyListeners();
  }

  void _countTotalAktiva() {
    totalAktiva = (aktivaLancar ?? 0) + (totalAktivaTetap ?? 0);
    // totalPasiva = totalAktiva;

    notifyListeners();
  }

  void updateHutangDagang(String val) {
    hutangDagangController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countTotalHutangJangkaPendek();
    _countTotalHutang();
    // _countModalSendiri();
  }

  void updateHutangBankdown12(String val) {
    hutangBankdown12Controller.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countTotalHutangJangkaPendek();
    _countTotalHutang();
    _countModalSendiri();
  }

  void updateHutangJangkaPendekLainnya(String val) {
    hutangJangkaPendekLainyaController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countTotalHutangJangkaPendek();
    _countTotalHutang();
    _countModalSendiri();
  }

  void updateHutangJangkaPendek(String val) {
    hutangJangkaPendekController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countTotalHutangJangkaPendek();
    _countTotalHutang();
    _countModalSendiri();
  }

  void updateHutangJangkaPanjang(String val) {
    hutangJangkaPanjangController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countTotalHutangJangkaPanjang();
    _countTotalHutang();
    _countModalSendiri();
  }

  void updateHutangBankJangkaPanjang(String val) {
    hutangBankJangkaPanjangController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countTotalHutangJangkaPanjang();
    _countTotalHutang();
    _countModalSendiri();
  }

  void _countTotalHutangJangkaPendek() {
    final int hutangDagang = hutangDagangController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(hutangDagangController.text);
    final int hutangBankDown12 = hutangBankdown12Controller.text.isEmpty
        ? 0
        : _removeThousandsSeparator(hutangBankdown12Controller.text);
    final int hutangJangkaPendekLainnya = hutangJangkaPendekLainyaController
            .text.isEmpty
        ? 0
        : _removeThousandsSeparator(hutangJangkaPendekLainyaController.text);

    totalHutangJangkaPendek =
        hutangDagang + hutangBankDown12 + hutangJangkaPendekLainnya;

    notifyListeners();
  }

  void _countTotalHutangJangkaPanjang() {
    final int hutangJangkaPanjang = hutangJangkaPanjangController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(hutangJangkaPanjangController.text);
    final int hutangBankJangkaPanjang =
        hutangBankJangkaPanjangController.text.isEmpty
            ? 0
            : _removeThousandsSeparator(hutangBankJangkaPanjangController.text);

    totalHutangJangkaPanjang = hutangJangkaPanjang + hutangBankJangkaPanjang;

    notifyListeners();
  }

  void _countTotalHutang() {
    totalHutang =
        (totalHutangJangkaPendek ?? 00) + (totalHutangJangkaPanjang ?? 00);
    _countTotalPasiva();
    notifyListeners();
  }

  void updateModaldisetor(String val) {
    modalDisetorController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countTotalModal();
  }

  void updateLabaDitahan(String val) {
    labaDitahanController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countTotalModal();
  }

  void updateLabaBerjalan(String val) {
    labaBerjalanController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countTotalModal();
  }

  void updatePenyesuaianModal(String val) {
    penyesuianModalController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countTotalModal();
  }

  void _countTotalModal() {
    final int modalDisetor = modalDisetorController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(modalDisetorController.text);
    final int labaDitahan = labaDitahanController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(labaDitahanController.text);
    final int labaBerjalan = labaBerjalanController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(labaBerjalanController.text);
    final int penyesuaianModal = penyesuianModalController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(penyesuianModalController.text);

    totalModal = modalDisetor + labaDitahan + labaBerjalan - penyesuaianModal;
    _countTotalPasiva();
    notifyListeners();
  }

  void _countTotalPasiva() {
    totalPasiva = (totalModal ?? 0) + (totalHutang ?? 0);
    notifyListeners();
  }

  void _countModalSendiri() {
    modalSendiri = (totalPasiva ?? 0) - (totalHutang ?? 0);
    notifyListeners();
  }

  /// 2. Laba Rugi (Periode)
  void updatePenjualan(String val) {
    penjualanController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countLabaKotor();
    _countLabaOperasional();
    _countPendapatanBersih();
    _countLabaSebelumPajak();
    _countLabaBersih();
  }

  void updateBiayaHPP(String val) {
    biayaHPPController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countLabaKotor();
    _countLabaOperasional();
    _countPendapatanBersih();
    _countLabaSebelumPajak();
    _countLabaBersih();
  }

  void _countLabaKotor() {
    final int penjualan = penjualanController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(penjualanController.text);
    final int biayaHPP = biayaHPPController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(biayaHPPController.text);

    labaKotor = penjualan - biayaHPP;

    notifyListeners();
  }

  void updateBiayaPenjualan(String val) {
    biayaPenjualanController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countLabaOperasional();
    _countPendapatanBersih();
    _countLabaSebelumPajak();
    _countLabaBersih();
  }

  void updateBiayaAdministrasiUmum(String val) {
    biayaAdministrasiUmumController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countLabaOperasional();
    _countPendapatanBersih();
    _countLabaSebelumPajak();
    _countLabaBersih();
  }

  void updateBiayaOperasional(String val) {
    biayaOperasionalController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countLabaOperasional();
    _countPendapatanBersih();
    _countLabaSebelumPajak();
    _countLabaBersih();
  }

  void _countLabaOperasional() {
    final int biayaPenjualan = biayaPenjualanController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(biayaPenjualanController.text);
    final int biayaAdministrasiUmum =
        biayaAdministrasiUmumController.text.isEmpty
            ? 0
            : _removeThousandsSeparator(biayaAdministrasiUmumController.text);
    final int biayaOperasional = biayaOperasionalController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(biayaOperasionalController.text);

    labaOperasional = ((labaKotor ?? 0) -
        ((biayaPenjualan) + (biayaAdministrasiUmum) + (biayaOperasional)));
    notifyListeners();
  }

  void updateBiayaPenyusutan(String val) {
    biayaPenyusutanController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countLabaSebelumPajak();
    _countLabaBersih();
  }

  void updateBiayaBunga(String val) {
    biayaBungaController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countLabaSebelumPajak();
    _countLabaBersih();
  }

  void updatePendapatanLainnya(String val) {
    pendapatanLainnyaController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countLabaSebelumPajak();
    _countLabaBersih();
  }

  void updateBiayaOperasionalLainnya(String val) {
    biayaOperasionallainyaController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countLabaSebelumPajak();
    _countLabaBersih();
  }

  void updateBiayaLainnya(String val) {
    biayaLainnyaController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countLabaSebelumPajak();
    _countLabaBersih();
  }

  void _countLabaSebelumPajak() {
    final int biayaPenyusutan = biayaPenyusutanController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(biayaPenyusutanController.text);
    final int biayaBunga = biayaBungaController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(biayaBungaController.text);
    final int biayaOperasionallainya =
        biayaOperasionallainyaController.text.isEmpty
            ? 0
            : _removeThousandsSeparator(biayaOperasionallainyaController.text);
    final int biayaLainnya = biayaLainnyaController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(biayaLainnyaController.text);
    final int pendapatanLainnya = pendapatanLainnyaController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(pendapatanLainnyaController.text);

    labaSebelumPajak = ((labaOperasional ?? 0) + pendapatanLainnya) -
        biayaBunga -
        biayaOperasionallainya -
        biayaPenyusutan -
        biayaLainnya;

    _countTotalModal();
    notifyListeners();
  }

  void updatePajak(String val) {
    pajakController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );

    _countLabaSebelumPajak();
    _countLabaBersih();
    notifyListeners();
  }

  void _countLabaBersih() {
    final int pajak1 = pajakController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(pajakController.text);

    labaBersih = ((labaSebelumPajak ?? 0) - pajak1);
    labaBerjalanController.text = thousandSeparator(labaBersih.toString());

    _countLabaSebelumPajak();
    notifyListeners();
  }

  void _countPendapatanBersih() {
    final int pendapatanLainnya = pendapatanLainnyaController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(pendapatanLainnyaController.text);
    final int biayaLainnya = biayaLainnyaController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(biayaLainnyaController.text);

    pendapatanBersih =
        (labaOperasional ?? 0) + pendapatanLainnya - biayaLainnya;

    _countRasioKeuangan();
    notifyListeners();
  }

  /// 3. Rasio Keuangan
  void _countRasioKeuangan() {
    sdsKMK = (nwc ?? 0) / (kebutuhanKMK ?? 0);
    roi = (pendapatanBersih ?? 0) / (totalAktiva ?? 0);
////
    debtToEquityRatio = (totalHutang ?? 0) / (modalSendiri ?? 0);
    roe = (pendapatanBersih ?? 0) / (modalSendiri ?? 0);
    roa = (pendapatanBersih ?? 0) / (totalAktiva ?? 0);
    cr = (pendapatanBersih ?? 0) / (modalSendiri ?? 0);
    icr = (pendapatanBersih ?? 0) / (modalSendiri ?? 0);
    dop = (pendapatanBersih ?? 0) / (modalSendiri ?? 0);
    qr = (pendapatanBersih ?? 0) / (modalSendiri ?? 0);
    doi = (pendapatanBersih ?? 0) / (modalSendiri ?? 0);
    nwcPositif = (aktivaLancar ?? 0) - (totalHutang ?? 0);
    dor = (aktivaLancar ?? 0) - (totalHutang ?? 0);
    ebitda = (aktivaLancar ?? 0) - (totalHutang ?? 0);
    npm = (aktivaLancar ?? 0) - (totalHutang ?? 0);
/////
  }

  /// 4. Asumsi
  void updateProyeksiPenjualan(String val) {
    proyeksiPenjualanController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countKreditYangBisaDiberikan();
  }

  void updateProyeksiHutangDagang(String val) {
    proyeksiHutangDagangController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countKreditYangBisaDiberikan();
  }

  void _countKreditYangBisaDiberikan() {
    const periode = 30;

    final int piutangDagang = piutangDagangController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(piutangDagangController.text);
    final int penjualan = penjualanController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(penjualanController.text);

    final dor = piutangDagang / penjualan * periode;

    final int persediaan = persediaanController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(persediaanController.text);

    final int biayaHPP = biayaHPPController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(biayaHPPController.text);

    final doi = persediaan / biayaHPP * periode;

    final wcto = dor + doi;

    final int biayaOperasional = biayaOperasionalController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(biayaOperasionalController.text);

    final ope = biayaHPP + biayaOperasional;

    final int kasOrBank = kasOrBankController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(kasOrBankController.text);

    nwc = (aktivaLancar ?? 0) - kasOrBank - (totalHutang ?? 0);

    final int proyeksiPenjualan = proyeksiPenjualanController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(proyeksiPenjualanController.text);

    final kebutuhanModalKerja =
        (wcto / periode * ope * (proyeksiPenjualan / 100)) - (nwc ?? 0);

    final int proyeksiHutangDagang = proyeksiHutangDagangController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(proyeksiHutangDagangController.text);

    final int hutangDagang = hutangDagangController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(hutangDagangController.text);

    final nphd = (proyeksiHutangDagang / 100) * hutangDagang;

    kebutuhanKMK = kebutuhanModalKerja - nphd;

    final int hutangJangkaPendek = hutangJangkaPendekController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(hutangJangkaPendekController.text);

    kreditYangBisaDiberikan =
        (kebutuhanKMK!.isNaN ? 0 : kebutuhanKMK!.toInt()) - hutangJangkaPendek;

    _countRasioKeuangan();
    notifyListeners();
  }

  void updateAktivaTetap(String val) {
    aktivaTetapController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _countTotalAktivaDanPasiva();
    _countModalSendiri();
  }

  void _countTotalAktivaDanPasiva() {
    final int aktivaTetap = aktivaTetapController.text.isEmpty
        ? 0
        : _removeThousandsSeparator(aktivaTetapController.text);

    totalAktiva = (aktivaLancar ?? 0) + aktivaTetap;
    // totalPasiva = totalAktiva;

    _countRasioKeuangan();
    notifyListeners();
  }

  bool isDone() {
    return kasOrBankController.text.isNotEmpty &&
        piutangDagangController.text.isNotEmpty &&
        persediaanController.text.isNotEmpty &&
        aktivaLancarLainnyaController.text.isNotEmpty &&
        tanahController.text.isNotEmpty &&
        bangunanController.text.isNotEmpty &&
        mesinPeralatanController.text.isNotEmpty &&
        kendaraanController.text.isNotEmpty &&
        inventarisKantorController.text.isNotEmpty &&
        aktivaTetapLainyaController.text.isNotEmpty &&
        akumulasiPenyusutanController.text.isNotEmpty &&
        hutangDagangController.text.isNotEmpty &&
        hutangBankdown12Controller.text.isNotEmpty &&
        hutangJangkaPendekLainyaController.text.isNotEmpty &&
        hutangJangkaPanjangController.text.isNotEmpty &&
        hutangBankJangkaPanjangController.text.isNotEmpty &&
        modalDisetorController.text.isNotEmpty &&
        labaDitahanController.text.isNotEmpty &&
        labaBerjalanController.text.isNotEmpty &&
        penyesuianModalController.text.isNotEmpty &&
        penjualanController.text.isNotEmpty &&
        biayaHPPController.text.isNotEmpty &&
        biayaPenjualanController.text.isNotEmpty &&
        biayaAdministrasiUmumController.text.isNotEmpty &&
        biayaOperasionalController.text.isNotEmpty &&
        biayaPenyusutanController.text.isNotEmpty &&
        biayaBungaController.text.isNotEmpty &&
        pendapatanLainnyaController.text.isNotEmpty &&
        biayaOperasionallainyaController.text.isNotEmpty &&
        biayaLainnyaController.text.isNotEmpty &&
        pajakController.text.isNotEmpty;
  }

  bool isDoneAsumsi() {
    return proyeksiPenjualanController.text.isNotEmpty &&
        proyeksiHutangDagangController.text.isNotEmpty;
  }

  Future initialize() async {
    setBusy(true);
    setBusy(false);
  }
}

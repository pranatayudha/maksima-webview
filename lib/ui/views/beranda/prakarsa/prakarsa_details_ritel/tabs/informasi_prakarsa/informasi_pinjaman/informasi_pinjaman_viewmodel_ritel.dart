// ignore_for_file: unnecessary_null_comparison, unused_local_variable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../application/enums/bottom_sheet_type.dart';
import '../../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../../application/helpers/initial_code_table_formatter.dart';
import '../../../../../../../../application/models/ritel_informasi_pinjaman.dart';
import '../../../../../../../../application/models/ritel_kalkulasi_kredit.dart';
import '../../../../../../../../infrastructure/apis/ritel_informasi_pinjaman_api.dart';
import '../../../../../../../../infrastructure/apis/ritel_master_api.dart';

final formatter = NumberFormat('#,###', 'id_ID');

class InformasiPinjamanViewModel extends BaseViewModel {
  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final RitelInformasiPinjamanAPI _ritelInformasiPinjamanAPI =
      locator<RitelInformasiPinjamanAPI>();

  RitelInformasiPinjaman ritelInformasiPinjaman;
  String pipelinesId;
  int loanTypesId;
  String? prakarsaId;
  int codeTable;
  InformasiPinjamanViewModel({
    required this.ritelInformasiPinjaman,
    required this.pipelinesId,
    required this.loanTypesId,
    this.prakarsaId,
    required this.codeTable,
  });
  String prakarsaType = '';

  Future initialize() async {
    setBusy(true);
    prakarsaType = InitialCodeTableFormatter.getPrakarsaType(codeTable);
    if (ritelInformasiPinjaman != null) {
      if (loanTypesId == 1) {
        await _prepopulateTextFieldsRitel();
      } else {
        await _prepopulateTextFieldsPari();
      }
    }
    setBusy(false);
  }

  void navigateBack() {
    if (codeTable == 4) {
      _navigationService.navigateTo(
        Routes.prakarsaDetailsViewRitel,
        arguments: PrakarsaDetailsViewRitelArguments(
          index: 1,
          prakarsaId: prakarsaId!,
          pipelineId: pipelinesId,
          loanTypesId: loanTypesId,
          codeTable: 4,
        ),
      );
    } else {
      _navigationService.navigateTo(
        Routes.prakarsaDetailsViewRitel,
        arguments: PrakarsaDetailsViewRitelArguments(
          index: 1,
          prakarsaId: prakarsaId!,
          pipelineId: pipelinesId,
          loanTypesId: loanTypesId,
          codeTable: codeTable,
        ),
      );
    }
  }

  //////////////////////////////////   PINANG MAXIMA PARI  /////////////////////////////////////////////////////////////////
  var jenisKreditPariController = TextEditingController();
  var jenisFasilitasPariController = TextEditingController();
  var tujuanPenggunaanPariController = TextEditingController();
  var sifatKreditPariController = TextEditingController();
  var bungaPinjamanPariController = TextEditingController();

  final jangkaWaktuFasilitasPariController = TextEditingController();
  void updatejangkaWaktuFasilitasPariController(String val) {
    jangkaWaktuFasilitasPariController.text = val;
    notifyListeners();
  }

  var nominalPengajuanAwalPariController = TextEditingController();
  void updatenominalPengajuanAwalPariController(String val) {
    nominalPengajuanAwalPariController.text = val;
    notifyListeners();
  }

  RitelKalkulasiKredit? _ritelKalkulasiKredit;
  final asumsiPerhitunganKreditPariController = TextEditingController();

  var nilaiTransakiPariController = TextEditingController();

  var sharingDanaSendiriPariController = TextEditingController();
  var maksimalKreditDiberikanPariController = TextEditingController();

  bool rekomendasiPlafondPari = false;

  void updateRadioBtnPari(bool val) {
    rekomendasiPlafondPari = val;
    notifyListeners();

    if (rekomendasiPlafondPari) {
      rekomendasiPlafondDiberikanPari.text = '';

      rekomendasiPlafondDiberikanPari
        ..text = formatter
            .format(double.parse(ritelInformasiPinjaman.nominalPengajuanAwal!))
            .toString()
        ..selection = TextSelection.collapsed(
          offset: rekomendasiPlafondDiberikanPari.text.length,
        );
    } else {
      rekomendasiPlafondDiberikanPari.clear();
    }
  }

  final rekomendasiPlafondDiberikanPari = TextEditingController();
  void updaterekomendasiPlafondDiberikanPari(String val) =>
      rekomendasiPlafondDiberikanPari.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  var biayaProvisiPariController = TextEditingController();
  void updateBiayaProvisiPari(String val) {
    biayaProvisiPariController.value.copyWith(
      text: val,
      selection: TextSelection(
        baseOffset: val.length,
        extentOffset: val.length,
      ),
    );
  }

  var biayaAdministrasiPariController = TextEditingController();
  void updateBiayaAdministrasiPari(String val) {
    biayaAdministrasiPariController.value.copyWith(
      text: val,
      selection: TextSelection(
        baseOffset: val.length,
        extentOffset: val.length,
      ),
    );
  }

  var biayaPremiPariController = TextEditingController();
  void updateBiayaPremiPari(String val) {
    biayaPremiPariController.value.copyWith(
      text: val,
      selection: TextSelection(
        baseOffset: val.length,
        extentOffset: val.length,
      ),
    );
  }

  Future _prepopulateTextFieldsPari() async {
    jenisKreditPariController
      ..text = 'Pinang Ritel'
      ..selection = TextSelection.collapsed(
        offset: jenisKreditPariController.text.length,
      );

    jenisFasilitasPariController
      ..text = 'Pinang Maksima - KMK PRK Pinang PARI'
      ..selection = TextSelection.collapsed(
        offset: jenisFasilitasPariController.text.length,
      );

    if (ritelInformasiPinjaman.tujuanPenggunaan != null) {
      tujuanPenggunaanPariController
        ..text = ritelInformasiPinjaman.tujuanPenggunaan!.toString()
        ..selection = TextSelection.collapsed(
          offset: tujuanPenggunaanPariController.text.length,
        );
    }

    sifatKreditPariController
      ..text = 'Revolving'
      ..selection = TextSelection.collapsed(
        offset: sifatKreditPariController.text.length,
      );

    if (ritelInformasiPinjaman.bungaPinjaman != null) {
      bungaPinjamanPariController
        ..text = ritelInformasiPinjaman.bungaPinjaman!.split('.00').join()
        ..selection = TextSelection.collapsed(
          offset: jangkaWaktuFasilitasPariController.text.length,
        );
    }

    if (ritelInformasiPinjaman.jangkaWaktuFasilitas != null) {
      jangkaWaktuFasilitasPariController
        ..text = '${ritelInformasiPinjaman.jangkaWaktuFasilitas!} Bulan'
        ..selection = TextSelection.collapsed(
          offset: jangkaWaktuFasilitasPariController.text.length,
        );
    }

    nominalPengajuanAwalPariController
      ..text = formatter
          .format(double.parse(ritelInformasiPinjaman.nominalPengajuanAwal!))
          .toString()
      ..selection = TextSelection.collapsed(
        offset: nominalPengajuanAwalPariController.text.length,
      );

    asumsiPerhitunganKreditPariController
      ..text = ritelInformasiPinjaman.asumsiPerhitunganKredit!.toString()
      ..selection = TextSelection.collapsed(
        offset: asumsiPerhitunganKreditPariController.text.length,
      );

    if (ritelInformasiPinjaman.nilaiTransaksi != null) {
      nilaiTransakiPariController
        ..text = formatter
            .format(double.parse(ritelInformasiPinjaman.nilaiTransaksi!))
            .toString()
        ..selection = TextSelection.collapsed(
          offset: nilaiTransakiPariController.text.length,
        );
    }

    sharingDanaSendiriPariController
      ..text = formatter
          .format(double.parse(
            ritelInformasiPinjaman.sharingDanaSendiri!.toString(),
          ))
          .toString()
      ..selection = TextSelection.collapsed(
        offset: sharingDanaSendiriPariController.text.length,
      );

    if (ritelInformasiPinjaman.maksimalKredit != null) {
      maksimalKreditDiberikanPariController
        ..text = formatter
            .format(double.parse(ritelInformasiPinjaman.maksimalKredit!))
            .toString()
        ..selection = TextSelection.collapsed(
          offset: maksimalKreditDiberikanPariController.text.length,
        );
    } else {
      maksimalKreditDiberikanPariController.text = '';
    }

    if (ritelInformasiPinjaman.rekomendasiPlafond != null) {
      rekomendasiPlafondDiberikanPari
        ..text = formatter
            .format(double.parse(ritelInformasiPinjaman.rekomendasiPlafond!))
            .toString()
        ..selection = TextSelection.collapsed(
          offset: rekomendasiPlafondDiberikanPari.text.length,
        );
    } else {
      rekomendasiPlafondDiberikanPari.text = '';
    }

    if (ritelInformasiPinjaman.biayaProvisi != null) {
      biayaProvisiPariController
        ..text = formatter
            .format(double.parse(ritelInformasiPinjaman.biayaProvisi!))
            .toString()
        ..selection = TextSelection.collapsed(
          offset: biayaProvisiPariController.text.length,
        );
    }

    if (ritelInformasiPinjaman.biayaAdministrasi != null) {
      biayaAdministrasiPariController
        ..text = formatter
            .format(double.parse(ritelInformasiPinjaman.biayaAdministrasi!))
            .toString()
        ..selection = TextSelection.collapsed(
          offset: biayaAdministrasiPariController.text.length,
        );
    }

    if (ritelInformasiPinjaman.biayaPremi != null) {
      biayaPremiPariController
        ..text = formatter
            .format(double.parse(ritelInformasiPinjaman.biayaPremi!))
            .toString()
        ..selection = TextSelection.collapsed(
          offset: biayaPremiPariController.text.length,
        );
    }
  }

  Future<Map<String, dynamic>> _generateInfoPinjamanMapPari() async {
    final bungaPinjamanSplit = bungaPinjamanPariController.text.split(' %');
    final bungaPinjamanRes =
        double.parse(bungaPinjamanPariController.text.trim());

    final jangkaWaktuSplit =
        jangkaWaktuFasilitasPariController.text.split(' Bulan');
    final jangkaWaktuRes = double.parse(jangkaWaktuSplit[0]);

    return {
      'prakarsaId': ritelInformasiPinjaman.prakarsaId,
      'bungaPinjaman': bungaPinjamanRes,
      'rekomendasiPlafond': int.parse(
        rekomendasiPlafondDiberikanPari.text.replaceAll('.', '').trim(),
      ),
      'biayaProvisi':
          int.parse(biayaProvisiPariController.text.replaceAll('.', '').trim()),
      'biayaAdministrasi': int.parse(
        biayaAdministrasiPariController.text.replaceAll('.', '').trim(),
      ),
      'biayaPremi': int.parse(
        biayaPremiPariController.text.replaceAll('.', '').trim(),
      ),
    };
  }

  Future _postDataPari() async {
    final infoPinjamanMap = await _generateInfoPinjamanMapPari();

    final res = await runBusyFuture(_ritelInformasiPinjamanAPI
        .addUpdateInformasiPinjamanPari(infoPinjamanMap));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (successMap) =>
          _showSuccessDialogPari('Berhasil menambahkan informasi pinjaman!'),
    );
  }

  Future validateInputsPari() async {
    if (formKey.currentState!.validate()) {
      final response = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.confirmation,
        data: {'title': 'Konfirmasi'},
      );

      if (response != null && response.confirmed) {
        _postDataPari();
      }
    } else {
      autoValidateMode = AutovalidateMode.always;
      _showValidationErrorDialog();
      notifyListeners();
    }
  }

  Future _showSuccessDialogPari(String successMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    final res = await runBusyFuture(
      _ritelInformasiPinjamanAPI.initInformasiPinjamanPari(
        ritelInformasiPinjaman.prakarsaId,
      ),
    );

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (dataFromInit) {
        _navigationService.navigateTo(
          Routes.informasiPinjamanDetailsPari,
          arguments: InformasiPinjamanDetailsPariArguments(
            ritelInformasiPinjaman: dataFromInit,
            pipelinesId: pipelinesId,
            loanTypesId: loanTypesId,
            prakarsaId: prakarsaId!,
            codeTable: codeTable,
            status: 1,
          ),
        );
      },
    );
  }

  //////////////////////////////////   PINANG MAXIMA RITEL  /////////////////////////////////////////////////////////////////
  var jenisKreditRitelController = TextEditingController();
  var jenisFasilitasRitelController = TextEditingController();

  final tujuanPenggunaanRitelController = TextEditingController();
  void updatetujuanPenggunaanRitelController(String val) =>
      tujuanPenggunaanRitelController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final sifatKreditRitelController = TextEditingController();

  final bungaPinjamanRitelController = TextEditingController();
  void updatebungaPinjamanRitelController(String val) {
    bungaPinjamanRitelController.text = val;
    notifyListeners();
  }

  final jangkaWaktuFasilitasRitelController = TextEditingController();

  void updatejangkaWaktuFasilitasRitelController(String val) {
    jangkaWaktuFasilitasRitelController.text = val;
    notifyListeners();
  }

  var nominalPengajuanAwalRitelController = TextEditingController();

  final asumsiPerhitunganKreditRitelController = TextEditingController();
  void updateasumsiPerhitunganKreditRitelController(String val) async {
    asumsiPerhitunganKreditRitelController.text = val;

    final res = await runBusyFuture(
      _ritelInformasiPinjamanAPI.fetchKalkulasiKredit(
        prakarsaType,
        ritelInformasiPinjaman.prakarsaId.toString(),
        val,
      ),
    );

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (ritelKalkulasiKredit) {
        _ritelKalkulasiKredit = ritelKalkulasiKredit;
        notifyListeners();

        nilaiProyekRitelController
          ..text =
              formatter.format(_ritelKalkulasiKredit!.nilaiProyek!).toString()
          ..selection = TextSelection.collapsed(
            offset: nilaiProyekRitelController.text.length,
          );

        asumsiPPN10RitelController
          ..text =
              formatter.format(_ritelKalkulasiKredit!.asumsiPPN!).toString()
          ..selection = TextSelection.collapsed(
            offset: asumsiPPN10RitelController.text.length,
          );

        nilaiProyekSetelahPPNRitelController
          ..text = formatter
              .format(_ritelKalkulasiKredit!.nilaiProyekSetelahPPN!)
              .toString()
          ..selection = TextSelection.collapsed(
            offset: nilaiProyekSetelahPPNRitelController.text.length,
          );

        asumsiLaba10RitelController
          ..text =
              formatter.format(_ritelKalkulasiKredit!.asumsiLaba!).toString()
          ..selection = TextSelection.collapsed(
            offset: asumsiLaba10RitelController.text.length,
          );

        biayaProyekNettoRitelController
          ..text = formatter
              .format(_ritelKalkulasiKredit!.biayaProyekNetto!)
              .toString()
          ..selection = TextSelection.collapsed(
            offset: biayaProyekNettoRitelController.text.length,
          );

        sharingDanaSendiriRitelController
          ..text = formatter
              .format(_ritelKalkulasiKredit!.sharingDanaSendiri!)
              .toString()
          ..selection = TextSelection.collapsed(
            offset: sharingDanaSendiriRitelController.text.length,
          );

        biayaProyekNettoSDSRitelController
          ..text = formatter.format(_ritelKalkulasiKredit!.SDS!).toString()
          ..selection = TextSelection.collapsed(
            offset: biayaProyekNettoRitelController.text.length,
          );

        double besarKMKPTRResult = double.parse(
              _ritelKalkulasiKredit!.SDS!.toString(),
            ) -
            double.parse(asumsiUangMukaRitelController.text.split('.').join());

        besarnyaKMKPtrRitelController
          ..text = formatter.format(besarKMKPTRResult).toString()
          ..selection = TextSelection.collapsed(
            offset: besarnyaKMKPtrRitelController.text.length,
          );

        double maksimalKreditDiberikanResult = double.parse(
              besarnyaKMKPtrRitelController.text.split('.').join(),
            ) -
            double.parse(
              kreditBanklainRitelController.text.split('.').join(),
            );

        maksimalKreditDiberikanRitelController
          ..text = formatter.format(maksimalKreditDiberikanResult).toString()
          ..selection = TextSelection.collapsed(
            offset: maksimalKreditDiberikanRitelController.text.length,
          );
      },
    );

    // _clearAllValuesJenisKredit();
    notifyListeners();
  }

  var nilaiProyekRitelController = TextEditingController();
  var asumsiPPN10RitelController = TextEditingController();
  var nilaiProyekSetelahPPNRitelController = TextEditingController();
  var asumsiLaba10RitelController = TextEditingController();
  var biayaProyekNettoRitelController = TextEditingController();
  var sharingDanaSendiriRitelController = TextEditingController();
  var biayaProyekNettoSDSRitelController = TextEditingController();

  final asumsiUangMukaRitelController = TextEditingController();
  void updateasumsiUangMukaRitelController(String val) async {
    asumsiUangMukaRitelController.value.copyWith(
      text: val,
      selection: TextSelection(
        baseOffset: val.length,
        extentOffset: val.length,
      ),
    );

    if (asumsiPerhitunganKreditRitelController.text ==
        'Rata - Rata Transaksi') {
      double besarKMKPTRResult =
          double.parse(ritelInformasiPinjaman.biayaProyekNettoSDS!) -
              double.parse(val.split('.').join());

      besarnyaKMKPtrRitelController
        ..text = formatter.format(besarKMKPTRResult).toString()
        ..selection = TextSelection.collapsed(
          offset: besarnyaKMKPtrRitelController.text.length,
        );

      double maksimalKreditDiberikanResult = double.parse(
            besarnyaKMKPtrRitelController.text.split('.').join(),
          ) -
          double.parse(
            kreditBanklainRitelController.text.split('.').join(),
          );

      maksimalKreditDiberikanRitelController
        ..text = formatter.format(maksimalKreditDiberikanResult).toString()
        ..selection = TextSelection.collapsed(
          offset: maksimalKreditDiberikanRitelController.text.length,
        );
    } else {
      updateasumsiPerhitunganKreditRitelController(
        asumsiPerhitunganKreditRitelController.text,
      );
      double besarKMKPTRResult =
          double.parse(_ritelKalkulasiKredit!.SDS!.toString()) -
              double.parse(val.split('.').join());

      besarnyaKMKPtrRitelController
        ..text = formatter.format(besarKMKPTRResult).toString()
        ..selection = TextSelection.collapsed(
          offset: besarnyaKMKPtrRitelController.text.length,
        );
      double maksimalKreditDiberikanResult = double.parse(
            besarnyaKMKPtrRitelController.text.split('.').join(),
          ) -
          double.parse(
            kreditBanklainRitelController.text.split('.').join(),
          );

      maksimalKreditDiberikanRitelController
        ..text = formatter.format(maksimalKreditDiberikanResult).toString()
        ..selection = TextSelection.collapsed(
          offset: maksimalKreditDiberikanRitelController.text.length,
        );
    }
  }

  var besarnyaKMKPtrRitelController = TextEditingController();

  final kreditBanklainRitelController = TextEditingController();
  void updatekreditBanklainRitelController(String val) {
    kreditBanklainRitelController.value.copyWith(
      text: val,
      selection: TextSelection(
        baseOffset: val.length,
        extentOffset: val.length,
      ),
    );

    double maksimalKreditDiberikanResult =
        double.parse(besarnyaKMKPtrRitelController.text.split('.').join()) -
            double.parse(val.split('.').join());

    maksimalKreditDiberikanRitelController
      ..text = formatter.format(maksimalKreditDiberikanResult).toString()
      ..selection = TextSelection.collapsed(
        offset: maksimalKreditDiberikanRitelController.text.length,
      );
  }

  var maksimalKreditDiberikanRitelController = TextEditingController();

  bool rekomendasiPlafondRitel = false;

  void updateRadioBtnRitel(bool val) {
    rekomendasiPlafondRitel = val;
    notifyListeners();

    if (rekomendasiPlafondRitel) {
      rekomendasiPlafondDiberikanRitel
        ..text = formatter
            .format(double.parse(ritelInformasiPinjaman.nominalPengajuanAwal!))
            .toString()
        ..selection = TextSelection.collapsed(
          offset: rekomendasiPlafondDiberikanRitel.text.length,
        );

      double biayaProvisiResult =
          double.parse(ritelInformasiPinjaman.nominalPengajuanAwal!) *
              (double.parse(persentaseBiayaProvisiRitelController.text) / 100);

      biayaProvisiRitelController
        ..text = formatter.format(biayaProvisiResult).toString()
        ..selection = TextSelection.collapsed(
          offset: biayaProvisiRitelController.text.length,
        );

      // double biayaAdministrasiResult =
      //     double.parse(ritelInformasiPinjaman.nominalPengajuanAwal!) *
      //         (0.2 / 100);

      // biayaAdministrasiRitelController
      //   ..text = formatter.format(biayaAdministrasiResult).toString()
      //   ..selection = TextSelection.collapsed(
      //     offset: biayaAdministrasiRitelController.text.length,
      //   );

      // double biayaPremiResult =
      //     double.parse(ritelInformasiPinjaman.nominalPengajuanAwal!) *
      //         (1.2 / 100);

      // biayaPremiRitelController
      //   ..text = formatter.format(biayaPremiResult).toString()
      //   ..selection = TextSelection.collapsed(
      //     offset: biayaPremiRitelController.text.length,
      //   );
    } else {
      rekomendasiPlafondDiberikanRitel.clear();
      biayaProvisiRitelController.clear();
      biayaAdministrasiRitelController.clear();
      biayaPremiRitelController.clear();
    }
  }

  final persentaseBiayaProvisiRitelController = TextEditingController();
  void updatePersentaseBiayaProvisi(String val) {
    persentaseBiayaProvisiRitelController.value.copyWith(
      text: val,
      selection: TextSelection(
        baseOffset: val.length,
        extentOffset: val.length,
      ),
    );

    if (rekomendasiPlafondDiberikanRitel.text.isNotEmpty) {
      double biayaProvisiResult = double.parse(
            rekomendasiPlafondDiberikanRitel.text.split('.').join(),
          ) *
          (double.parse(val) / 100);

      biayaProvisiRitelController
        ..text = formatter.format(biayaProvisiResult).toString()
        ..selection = TextSelection.collapsed(
          offset: biayaProvisiRitelController.text.length,
        );

      // double biayaAdministrasiResult = double.parse(
      //       rekomendasiPlafondDiberikanRitel.text.split('.').join(),
      //     ) *
      //     (0.2 / 100);

      // biayaAdministrasiRitelController
      //   ..text = formatter.format(biayaAdministrasiResult).toString()
      //   ..selection = TextSelection.collapsed(
      //     offset: biayaAdministrasiRitelController.text.length,
      //   );

      // double biayaPremiResult = double.parse(
      //       rekomendasiPlafondDiberikanRitel.text.split('.').join(),
      //     ) *
      //     (1.2 / 100);

      // biayaPremiRitelController
      //   ..text = formatter.format(biayaPremiResult).toString()
      //   ..selection = TextSelection.collapsed(
      //     offset: biayaPremiRitelController.text.length,
      //   );
    }
  }

  final rekomendasiPlafondDiberikanRitel = TextEditingController();
  void updaterekomendasiPlafondDiberikanRitel(String val) {
    rekomendasiPlafondDiberikanRitel.value.copyWith(
      text: val,
      selection: TextSelection(
        baseOffset: val.length,
        extentOffset: val.length,
      ),
    );

    double biayaProvisiResult = double.parse(val.split('.').join()) *
        (double.parse(persentaseBiayaProvisiRitelController.text) / 100);

    biayaProvisiRitelController
      ..text = formatter.format(biayaProvisiResult).toString()
      ..selection = TextSelection.collapsed(
        offset: biayaProvisiRitelController.text.length,
      );

    // double biayaAdministrasiResult =
    //     double.parse(val.split('.').join()) * (0.2 / 100);

    // biayaAdministrasiRitelController
    //   ..text = formatter.format(biayaAdministrasiResult).toString()
    //   ..selection = TextSelection.collapsed(
    //     offset: biayaAdministrasiRitelController.text.length,
    //   );

    // double biayaPremiResult = double.parse(val.split('.').join()) * (1.2 / 100);

    // biayaPremiRitelController
    //   ..text = formatter.format(biayaPremiResult).toString()
    //   ..selection = TextSelection.collapsed(
    //     offset: biayaPremiRitelController.text.length,
    //   );
  }

  var biayaProvisiRitelController = TextEditingController();
  var biayaAdministrasiRitelController = TextEditingController();
  void updateBiayaAdministrasi(String val) {
    biayaAdministrasiRitelController.value.copyWith(
      text: val,
      selection: TextSelection(
        baseOffset: val.length,
        extentOffset: val.length,
      ),
    );
  }

  var biayaPremiRitelController = TextEditingController();
  void updateBiayaPremi(String val) {
    biayaPremiRitelController.value.copyWith(
      text: val,
      selection: TextSelection(
        baseOffset: val.length,
        extentOffset: val.length,
      ),
    );
  }

  // ignore: long-method
  Future _prepopulateTextFieldsRitel() async {
    jenisKreditRitelController
      ..text = 'Pinang Ritel'
      ..selection = TextSelection.collapsed(
        offset: jenisKreditRitelController.text.length,
      );

    jenisFasilitasRitelController
      ..text = 'Pinang Maksima - KMK PTR'
      ..selection = TextSelection.collapsed(
        offset: jenisFasilitasRitelController.text.length,
      );

    if (ritelInformasiPinjaman.tujuanPenggunaan != null) {
      tujuanPenggunaanRitelController
        ..text = ritelInformasiPinjaman.tujuanPenggunaan!.toString()
        ..selection = TextSelection.collapsed(
          offset: tujuanPenggunaanRitelController.text.length,
        );
    }

    sifatKreditRitelController
      ..text = ritelInformasiPinjaman.sifatKredit!
      ..selection = TextSelection.collapsed(
        offset: sifatKreditRitelController.text.length,
      );

    if (ritelInformasiPinjaman.bungaPinjaman != null) {
      bungaPinjamanRitelController
        ..text =
            '${ritelInformasiPinjaman.bungaPinjaman!.split('.00').join()} %'
        ..selection = TextSelection.collapsed(
          offset: jangkaWaktuFasilitasRitelController.text.length,
        );
    }

    if (ritelInformasiPinjaman.jangkaWaktuFasilitas != null) {
      jangkaWaktuFasilitasRitelController
        ..text = '${ritelInformasiPinjaman.jangkaWaktuFasilitas!} Bulan'
        ..selection = TextSelection.collapsed(
          offset: jangkaWaktuFasilitasRitelController.text.length,
        );
    }

    nominalPengajuanAwalRitelController
      ..text = formatter
          .format(double.parse(ritelInformasiPinjaman.nominalPengajuanAwal!))
          .toString()
      ..selection = TextSelection.collapsed(
        offset: nominalPengajuanAwalRitelController.text.length,
      );

    asumsiPerhitunganKreditRitelController
      ..text = ritelInformasiPinjaman.asumsiPerhitunganKredit!.toString()
      ..selection = TextSelection.collapsed(
        offset: asumsiPerhitunganKreditRitelController.text.length,
      );

    nilaiProyekRitelController
      ..text = formatter
          .format(double.parse(ritelInformasiPinjaman.nilaiProyek!))
          .toString()
      ..selection = TextSelection.collapsed(
        offset: nilaiProyekRitelController.text.length,
      );

    asumsiPPN10RitelController
      ..text = formatter
          .format(double.parse(ritelInformasiPinjaman.asumsiPPN!))
          .toString()
      ..selection = TextSelection.collapsed(
        offset: asumsiPPN10RitelController.text.length,
      );

    nilaiProyekSetelahPPNRitelController
      ..text = formatter
          .format(double.parse(ritelInformasiPinjaman.nilaiProyekSetelahPPN!))
          .toString()
      ..selection = TextSelection.collapsed(
        offset: nilaiProyekSetelahPPNRitelController.text.length,
      );

    asumsiLaba10RitelController
      ..text = formatter
          .format(double.parse(ritelInformasiPinjaman.asumsiLaba!))
          .toString()
      ..selection = TextSelection.collapsed(
        offset: asumsiLaba10RitelController.text.length,
      );

    biayaProyekNettoRitelController
      ..text = formatter
          .format(double.parse(ritelInformasiPinjaman.biayaProyekNetto!))
          .toString()
      ..selection = TextSelection.collapsed(
        offset: biayaProyekNettoRitelController.text.length,
      );

    sharingDanaSendiriRitelController
      ..text = formatter
          .format(double.parse(
            ritelInformasiPinjaman.sharingDanaSendiri!.toString(),
          ))
          .toString()
      ..selection = TextSelection.collapsed(
        offset: sharingDanaSendiriRitelController.text.length,
      );

    biayaProyekNettoSDSRitelController
      ..text = formatter
          .format(double.parse(ritelInformasiPinjaman.biayaProyekNettoSDS!))
          .toString()
      ..selection = TextSelection.collapsed(
        offset: biayaProyekNettoSDSRitelController.text.length,
      );

    if (ritelInformasiPinjaman.asumsiUangMuka != null) {
      asumsiUangMukaRitelController
        ..text = formatter
            .format(double.parse(ritelInformasiPinjaman.asumsiUangMuka!))
            .toString()
        ..selection = TextSelection.collapsed(
          offset: asumsiUangMukaRitelController.text.length,
        );
    }

    if (ritelInformasiPinjaman.besarKMKPTR != null) {
      besarnyaKMKPtrRitelController
        ..text = formatter
            .format(double.parse(ritelInformasiPinjaman.besarKMKPTR!))
            .toString()
        ..selection = TextSelection.collapsed(
          offset: besarnyaKMKPtrRitelController.text.length,
        );
    }

    if (ritelInformasiPinjaman.kreditBankLain != null) {
      kreditBanklainRitelController
        ..text = formatter
            .format(double.parse(ritelInformasiPinjaman.kreditBankLain!))
            .toString()
        ..selection = TextSelection.collapsed(
          offset: kreditBanklainRitelController.text.length,
        );
    }

    if (ritelInformasiPinjaman.maksimalKredit != null) {
      maksimalKreditDiberikanRitelController
        ..text = formatter
            .format(double.parse(ritelInformasiPinjaman.maksimalKredit!))
            .toString()
        ..selection = TextSelection.collapsed(
          offset: maksimalKreditDiberikanRitelController.text.length,
        );
    }

    if (ritelInformasiPinjaman.rekomendasiPlafond != null) {
      rekomendasiPlafondRitel = true;
      notifyListeners();

      rekomendasiPlafondDiberikanRitel
        ..text = formatter
            .format(double.parse(ritelInformasiPinjaman.rekomendasiPlafond!))
            .toString()
        ..selection = TextSelection.collapsed(
          offset: rekomendasiPlafondDiberikanRitel.text.length,
        );
    }

    if (ritelInformasiPinjaman.biayaProvisi != null) {
      biayaProvisiRitelController
        ..text = formatter
            .format(double.parse(ritelInformasiPinjaman.biayaProvisi!))
            .toString()
        ..selection = TextSelection.collapsed(
          offset: biayaProvisiRitelController.text.length,
        );
    }

    if (ritelInformasiPinjaman.rekomendasiPlafond != null &&
        ritelInformasiPinjaman.biayaProvisi != null) {
      double persentaseBiayaProvisi =
          (double.parse(ritelInformasiPinjaman.biayaProvisi!) * 100) /
              double.parse(ritelInformasiPinjaman.rekomendasiPlafond!);

      persentaseBiayaProvisiRitelController
        ..text = persentaseBiayaProvisi.toString()
        ..selection = TextSelection.collapsed(
          offset: persentaseBiayaProvisiRitelController.text.length,
        );
    }

    if (ritelInformasiPinjaman.biayaAdministrasi != null) {
      biayaAdministrasiRitelController
        ..text = formatter
            .format(double.parse(ritelInformasiPinjaman.biayaAdministrasi!))
            .toString()
        ..selection = TextSelection.collapsed(
          offset: biayaAdministrasiRitelController.text.length,
        );
    }

    if (ritelInformasiPinjaman.biayaPremi != null) {
      biayaPremiRitelController
        ..text = formatter
            .format(double.parse(ritelInformasiPinjaman.biayaPremi!))
            .toString()
        ..selection = TextSelection.collapsed(
          offset: biayaPremiRitelController.text.length,
        );
    }

    if (codeTable == 2 || codeTable == 3) {
      await getPublicFile(ritelInformasiPinjaman.suratPermohonanPath!);
    }
  }

  Future<Map<String, dynamic>> _generateInfoPinjamanMap() async {
    final bungaPinjamanSplit = bungaPinjamanRitelController.text.split(' %');
    final bungaPinjamanRes =
        bungaPinjamanRitelController.text.trim().split(' ')[0];

    final jangkaWaktuSplit =
        jangkaWaktuFasilitasRitelController.text.split(' Bulan');
    final jangkaWaktuRes = double.parse(jangkaWaktuSplit[0]);

    return {
      'prakarsaId': ritelInformasiPinjaman.prakarsaId,
      'jenisKredit': 'Pinang Retail',
      'loan_typesId': 1,
      'tujuanPenggunaan': tujuanPenggunaanRitelController.text.trim(),
      'sifatKredit': 'Revolving',
      'bungaPinjaman': bungaPinjamanRes,
      'jangkaWaktuFasilitas': jangkaWaktuRes,
      'nominalPengajuanAwal': int.parse(
        nominalPengajuanAwalRitelController.text.split('.').join().trim(),
      ),
      'asumsiPerhitunganKredit':
          asumsiPerhitunganKreditRitelController.text.trim(),
      'nilaiProyek': asumsiPerhitunganKreditRitelController.text ==
              ritelInformasiPinjaman.asumsiPerhitunganKredit!
          ? ritelInformasiPinjaman.nilaiProyek!
          : _ritelKalkulasiKredit!.nilaiProyek!,
      'asumsiPPN':
          int.parse(asumsiPPN10RitelController.text.split('.').join().trim()),
      'nilaiProyekSetelahPPN': int.parse(
        nilaiProyekSetelahPPNRitelController.text.split('.').join().trim(),
      ),
      'asumsiLaba':
          int.parse(asumsiLaba10RitelController.text.split('.').join().trim()),
      'biayaProyekNetto': int.parse(
        biayaProyekNettoRitelController.text.split('.').join().trim(),
      ),
      'sharingDanaSendiri': int.parse(
        sharingDanaSendiriRitelController.text.split('.').join().trim(),
      ),
      'biayaProyekNettoSDS': int.parse(
        biayaProyekNettoSDSRitelController.text.split('.').join().trim(),
      ),
      'asumsiUangMuka': int.parse(
        asumsiUangMukaRitelController.text.split('.').join().trim(),
      ),
      'besarKMKPTR': int.parse(
        besarnyaKMKPtrRitelController.text.split('.').join().trim(),
      ),
      'kreditBankLain': int.parse(
        kreditBanklainRitelController.text.split('.').join().trim(),
      ),
      'maksimalKredit': int.parse(
        maksimalKreditDiberikanRitelController.text.split('.').join().trim(),
      ),
      'rekomendasiPlafond': int.parse(
        rekomendasiPlafondDiberikanRitel.text.split('.').join().trim(),
      ),
      'biayaProvisi':
          int.parse(biayaProvisiRitelController.text.split('.').join().trim()),
      'biayaAdministrasi': int.parse(
        biayaAdministrasiRitelController.text.split('.').join().trim(),
      ),
      'biayaPremi': int.parse(
        biayaPremiRitelController.text.split('.').join().trim(),
      ),
    };
  }

  Future _postData() async {
    final infoPinjamanMap = await _generateInfoPinjamanMap();
    final res = await runBusyFuture(_ritelInformasiPinjamanAPI
        .addUpdateInformasiPinjaman(infoPinjamanMap, prakarsaType));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (successMap) =>
          _showSuccessDialog('Berhasil menambahkan informasi pinjaman!'),
    );
  }

  Future validateInputs() async {
    if (formKey.currentState!.validate()) {
      final response = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.confirmation,
        data: {'title': 'Konfirmasi'},
      );

      if (response != null && response.confirmed) {
        _postData();
      }
    } else {
      autoValidateMode = AutovalidateMode.always;
      _showValidationErrorDialog();
      notifyListeners();
    }
  }

  Future _showSuccessDialog(String successMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    final res = await runBusyFuture(
      _ritelInformasiPinjamanAPI.initInformasiPinjaman(
        ritelInformasiPinjaman.prakarsaId,
        prakarsaType,
      ),
    );

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (dataFromInit) {
        _navigationService.navigateTo(
          Routes.informasiPinjamanDetailsRitel,
          arguments: InformasiPinjamanDetailsRitelArguments(
            ritelInformasiPinjaman: dataFromInit,
            pipelinesId: pipelinesId,
            loanTypesId: loanTypesId,
            prakarsaId: ritelInformasiPinjaman.prakarsaId!,
            status: 1,
            codeTable: codeTable,
          ),
        );
      },
    );
  }

  Future _showValidationErrorDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Invalid',
      description:
          'Satu atau beberapa data mandatory ada yang kosong atau tidak sesuai validasi. Silahkan periksa kembali data Anda.',
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

  String? docSuratPermohonan;
  Future<String> getPublicFile(String path) async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(path),
    );

    res.fold(
      (err) => docSuratPermohonan = '',
      (success) => docSuratPermohonan = success,
    );

    return docSuratPermohonan!;
  }

  //////////////////////////////////   PINANG MAXIMA RITEL  /////////////////////////////////////////////////////////////////
}

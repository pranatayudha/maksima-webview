import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../application/app/app.locator.dart';
import '../../../../../application/app/app.router.dart';
import '../../../../../application/enums/dialog_type.dart';
import '../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../application/helpers/jenis_dokumen_formatter.dart';
import '../../../../../application/helpers/jenis_konfirmasi_formatter.dart';
import '../../../../../application/models/monitoring_pinjaman_detail.dart';
import '../../../../../application/services/local_db_service.dart';
import '../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../infrastructure/apis/ritel_monitoring_api.dart';

class PinjamanDetailViewModel extends FutureViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;

  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final RitelMonitoringAPI _ritelMonitoringAPI = locator<RitelMonitoringAPI>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();
  final _localDBService = locator<MaksimaLocalDBService>();
  final formatter = NumberFormat('#,###', 'id_ID');

  final int disburseId;
  final int counter;
  final String status;
  final int loanType;
  final String idKelolaan;

  PinjamanDetailViewModel({
    required this.disburseId,
    required this.counter,
    required this.status,
    required this.loanType,
    required this.idKelolaan,
  });

  MonitoringPinjamanDetail? _pinjamanDetail;

  MonitoringPinjamanDetail? get pinjamanDetail => _pinjamanDetail;

  String? docUnderlyingPublicUrl;
  String? docConfirmPublicUrl;
  String? docSuratPermohonanPencairanPublicUrl;
  String? docSuratPernyataanDebiturPublicUrl;
  String? docStandingInstructionPublicUrl;

  @override
  Future futureToRun() async {
    setBusy(true);

    await fetchPinjamanDetail();

    if (pinjamanDetail != null) {
      await _preLoadImages();
    }

    notifyListeners();

    setBusy(false);
  }

  Future _preLoadImages() async {
    if (pinjamanDetail!.disburse!.docUnderlying!.isNotEmpty) {
      String tempUrl =
          await _getPublicFile(pinjamanDetail!.disburse!.docUnderlying!);
      docUnderlyingPublicUrl = tempUrl;
    }

    if (pinjamanDetail!.partnership!.docConfirm!.isNotEmpty) {
      String tempUrl =
          await _getPublicFile(pinjamanDetail!.partnership!.docConfirm!);
      docConfirmPublicUrl = tempUrl;
    }

    if (pinjamanDetail!.disburse!.docSuratPermohonanPencairan!.isNotEmpty) {
      String tempUrl = await _getPublicFile(
        pinjamanDetail!.disburse!.docSuratPermohonanPencairan!,
      );
      docSuratPermohonanPencairanPublicUrl = tempUrl;
    }

    if (pinjamanDetail!.disburse!.docSuratPernyataanDebitur!.isNotEmpty) {
      String tempUrl = await _getPublicFile(
        pinjamanDetail!.disburse!.docSuratPernyataanDebitur!,
      );
      docSuratPernyataanDebiturPublicUrl = tempUrl;
    }

    if (pinjamanDetail!.disburse!.docStandingInstruction!.isNotEmpty) {
      String tempUrl = await _getPublicFile(
        pinjamanDetail!.disburse!.docStandingInstruction!,
      );
      docStandingInstructionPublicUrl = tempUrl;
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

  Future fetchPinjamanDetail() async {
    final res = await runBusyFuture(_ritelMonitoringAPI.fetchPinjamanDetail(
      idKelolaan: disburseId,
    ));

    res.fold(
      (l) => _showErrorDialog(l),
      (pinjamanDetail) {
        _pinjamanDetail = pinjamanDetail;
      },
    );
  }

  Future<String> _getPublicFile(String url) async {
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

  Future navigateBack() async {
    await _navigationService.navigateToMonitoringDetailView(
      idKelolaan: pinjamanDetail!.kelolaanId!.toString(),
      loanType: loanType,
    );
  }

  Future navigateToTambahPencairan() async {
    _localDBService.storePencairanFlag({
      'kelonggaranTarik': pinjamanDetail!.disburse!.limitTersedia!,
      'namaDebitur': pinjamanDetail!.disburse!.namaDebitur!,
      'noRekSimpanan': pinjamanDetail!.disburse!.numBankPencairan!,
      'noRekEscrow': pinjamanDetail!.disburse!.numBankEscrow!,
      'saldoOperasional': pinjamanDetail!.saldoOperasional!,
      'bungaPinjaman': pinjamanDetail!.disburse!.bungaPinjaman!,
      'namaPartnership': pinjamanDetail!.partnership!.parnerName!,
      'namaPIC': pinjamanDetail!.partnership!.picName!,
      'jabatanPIC': pinjamanDetail!.partnership!.picJabatan!,
      'noHandphonePIC':
          pinjamanDetail!.partnership!.picNum!.split('+62').join(),
      'emailPIC': pinjamanDetail!.partnership!.picEmail!,
      'tanggalKonfirmasi': DateStringFormatter.forOutputRitelKTPTerbit(
        pinjamanDetail!.partnership!.confirmDate!,
      ),
      'jenisUnderlying': JenisDokumenFormatter.forOutput(
        pinjamanDetail!.partnership!.typeDocUnderLying!,
      ),
      'namaUnderlying': pinjamanDetail!.partnership!.nameDocUnderlying!,
      'noUnderlying': pinjamanDetail!.partnership!.noDokUnderlying!,
      'tanggalUnderlying': DateStringFormatter.forOutputRitelKTPTerbit(
        pinjamanDetail!.partnership!.dateDocUnderlying!,
      ),
      'nominalUnderlying': formatter.format(
        double.parse(pinjamanDetail!.partnership!.nominalUnderlying!),
      ),
      'tanggalJatuhTempo': DateStringFormatter.forOutputRitelKTPTerbit(
        pinjamanDetail!.partnership!.endDateUnderlying!,
      ),
      'jenisKonfirmasi': JenisKonfirmasiFormatter.forOutput(
        pinjamanDetail!.partnership!.typeConfirm!,
      ),
      'hasilKonfirmasi': pinjamanDetail!.partnership!.konfirmBouwheer!
          ? 'Sesuai'
          : 'Tidak Sesuai',
      'buktiKonfirmasi': pinjamanDetail!.partnership!.docConfirm!,
    });

    await _navigationService.navigateToTambahPencairanView(
      step: 1,
      idKelolaan: pinjamanDetail!.kelolaanId!.toString(),
      pinjamanDetail:
          pinjamanDetail!.copyWith(disburseId: disburseId.toString()),
      idPartner: pinjamanDetail!.partnership!.idPartner!,
      counter: counter,
      status: status,
      loanType: loanType,
    );
  }

  Future navigateToPenurunanPinjaman() async {
    final disburseData = {
      'id': disburseId,
      'saldoEscrow': _pinjamanDetail!.saldoEscrow!,
      'noDokumenUnderlying': _pinjamanDetail!.disburse!.numDocUnderlying!,
      'nominalUnderlying':
          double.parse(_pinjamanDetail!.disburse!.amountUnderlying!)
              .toStringAsFixed(0),
      'sumberRekeningPenurunan': _pinjamanDetail!.numBankEscrow!,
      'sumberRekeningPinjaman': _pinjamanDetail!.numBankPencairan!,
      'nominalOutstanding':
          double.parse(_pinjamanDetail!.disburse!.amountDisburse!)
              .toStringAsFixed(0),
      'counter': counter,
      'status': status,
      'loanType': loanType,
      'namaDebitur': _pinjamanDetail!.disburse!.namaDebitur!,
      'nominalPinjaman':
          double.parse(_pinjamanDetail!.disburse!.amountDisburse!)
              .toStringAsFixed(0),
      'idKelolaan': idKelolaan,
    };

    await _navigationService.navigateToPenurunanPinjamanView(
      disburseData: disburseData,
    );
  }
}

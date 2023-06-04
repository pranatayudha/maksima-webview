// ignore_for_file: unused_field, unused_element

import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../application/app/app.locator.dart';
import '../../../../../application/app/app.router.dart';
import '../../../../../application/enums/dialog_type.dart';
import '../../../../../application/models/monitoring_detail.dart';
import '../../../../../application/services/local_db_service.dart';
import '../../../../../infrastructure/apis/ritel_monitoring_api.dart';

enum PinjamanFilter {
  semua,
  aktif,
  lunas,
}

class MonitoringDetailViewModel extends FutureViewModel {
  final String idKelolaan;
  final int loanType;

  MonitoringDetailViewModel(
    this.idKelolaan,
    this.loanType,
  );

  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final RitelMonitoringAPI _ritelMonitoringAPI = locator<RitelMonitoringAPI>();
  final _localDBService = locator<MaksimaLocalDBService>();

  MonitoringDetail? _monitoringDetail;

  MonitoringDetail? get monitoringDetail => _monitoringDetail;

  PinjamanFilter _currentPinjamanFilter = PinjamanFilter.semua;

  PinjamanFilter get currentPinjamanFilter => _currentPinjamanFilter;

  @override
  Future futureToRun() async {
    await getMonitoringDetail();
  }

  @override
  void onFutureError(error, key) async {
    final res = await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Gagal mengambil Data',
      description: error.toString(),
      mainButtonTitle: 'Coba lagi',
    );

    if (res?.confirmed ?? false) {
      await getMonitoringDetail();
    }
  }

  void changePinjamanListFilter(PinjamanFilter filter) {
    _currentPinjamanFilter = filter;
    notifyListeners();
  }

  Future navigateToMonitoringList() async {
    await _navigationService.navigateTo(
      Routes.monitoringRitelView,
    );
  }

  Future navigateToPencairanStepOne() async {
    if (_localDBService.pencairanFlagBoxIsNotEmpty()) {
      _localDBService.replacePencairanFlag({
        'kelonggaranTarik':
            _monitoringDetail!.summaryPinjaman!.kelonggaranTarik!,
        'namaDebitur': _monitoringDetail!.header!.namaDebitur!,
        'bungaPinjaman': _monitoringDetail!.header!.bungaPinjaman!,
        'noRekSimpanan': _monitoringDetail!.summaryPinjaman!.numRekSimpanan!,
        'noRekEscrow': _monitoringDetail!.summaryPinjaman!.numRekEscrow!,
        'saldoOperasional':
            _monitoringDetail!.summaryPinjaman!.saldoOperasional!,
      });
    } else {
      _localDBService.storePencairanFlag({
        'kelonggaranTarik':
            _monitoringDetail!.summaryPinjaman!.kelonggaranTarik!,
        'namaDebitur': _monitoringDetail!.header!.namaDebitur!,
        'bungaPinjaman': _monitoringDetail!.header!.bungaPinjaman!,
        'noRekSimpanan': _monitoringDetail!.summaryPinjaman!.numRekSimpanan!,
        'noRekEscrow': _monitoringDetail!.summaryPinjaman!.numRekEscrow!,
        'saldoOperasional':
            _monitoringDetail!.summaryPinjaman!.saldoOperasional!,
      });
    }

    await _navigationService.navigateTo(
      Routes.tambahPencairanView,
      arguments: TambahPencairanViewArguments(
        step: 1,
        idKelolaan: idKelolaan,
        loanType: loanType,
      ),
    );
  }

  Future navigateToPinjamanDetail(
    int counter,
    String disburseId,
    String status,
  ) async {
    await _navigationService.navigateToPinjamanDetailView(
      counter: counter,
      disburseId: int.parse(disburseId),
      status: status,
      loanType: loanType,
      idKelolaan: idKelolaan,
    );
  }

  Future getMonitoringDetail() async {
    final res = await runBusyFuture(
      _ritelMonitoringAPI.fetchMonitoringDetail(idKelolaan: idKelolaan),
    );

    if (kDebugMode) {
      print('Monitoring Detail Res : $res');
    }

    _monitoringDetail = res;

    notifyListeners();
  }
}

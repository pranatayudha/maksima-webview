// ignore_for_file: unused_field, prefer_final_fields, unused_element

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../application/app/app.locator.dart';
import '../../../../application/app/app.router.dart';
import '../../../../application/enums/dialog_type.dart';
import '../../../../application/models/monitoring_list_item_ritel.dart';
import '../../../../application/services/local_db_service.dart';
import '../../../../infrastructure/apis/ritel_monitoring_api.dart';
import 'widgets/modal_filter.dart';
import 'widgets/modal_list_guide.dart';

enum LoanTypeFilter { semua, maksima, pari }

enum StatusTypeFilter {
  semua,
  approval,
  verifikasi,
  aktif,
  jatuhTempoSevenDays,
  jatuhTempo,
  telatBayar,
  revisi,
  tolak
}

class MonitoringRitelViewModel extends BaseViewModel {
  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final RitelMonitoringAPI _ritelMonitoringAPI = locator<RitelMonitoringAPI>();

  final searchController = TextEditingController();

  static const int _itemRequestThreshold = 20;
  int _currentPage = 1;

  List<MonitoringListItemRitel> _monitoringList = [];

  List<MonitoringListItemRitel> get monitoringList => _monitoringList;

  final Map<LoanTypeFilter, String> loanTypeFilters = {
    LoanTypeFilter.semua: 'Semua',
    LoanTypeFilter.maksima: 'PTR',
    LoanTypeFilter.pari: 'PARI',
  };

  LoanTypeFilter _currentLoanTypeFilter = LoanTypeFilter.semua;

  LoanTypeFilter get currentLoanTypeFilter => _currentLoanTypeFilter;

  set setLoanTypeFilter(val) {
    _currentLoanTypeFilter = val;
    notifyListeners();
  }

  final Map<StatusTypeFilter, String> statusTypeFilters = {
    StatusTypeFilter.semua: 'Semua',
    StatusTypeFilter.approval: 'Approval CBL',
    StatusTypeFilter.verifikasi: 'Verifikasi ADK',
    StatusTypeFilter.aktif: 'Aktif',
    StatusTypeFilter.jatuhTempoSevenDays: 'H-7 Jatuh Tempo',
    StatusTypeFilter.jatuhTempo: 'Jatuh Tempo',
    StatusTypeFilter.telatBayar: 'Telat Bayar',
    StatusTypeFilter.revisi: 'Revisi',
    StatusTypeFilter.tolak: 'Tolak',
  };

  StatusTypeFilter _currentStatusTypeFilter = StatusTypeFilter.semua;

  StatusTypeFilter get currentStatusTypeFilter => _currentStatusTypeFilter;

  set setStatusTypeFilter(val) {
    _currentStatusTypeFilter = val;
    notifyListeners();
  }

  Future initialize() async {
    await getData();
  }

  // @override
  // void onError(error) async {
  //   final res = await _dialogService.showCustomDialog(
  //     variant: DialogType.error,
  //     title: 'Gagal mengambil Data',
  //     description: error.toString(),
  //     mainButtonTitle: 'Coba lagi',
  //   );
  //
  //   if (res?.confirmed ?? false) {
  //     await getData();
  //   }
  // }

  @override
  void onFutureError(dynamic error, Object? key) async {
    if (error is String) {
      final res = await _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: 'Gagal mengambil Data',
        description: error,
        mainButtonTitle: 'Coba lagi',
      );

      if (res?.confirmed ?? false) {
        await getData();
      }
    }
  }

  Future navigateToMonitoringDetails(
    String? idKelolaan,
    int? loanType,
  ) async {
    if (idKelolaan != null && loanType != null) {
      await _navigationService.navigateTo(
        Routes.monitoringDetailView,
        arguments: MonitoringDetailViewArguments(
          idKelolaan: idKelolaan,
          loanType: loanType,
        ),
      );

      await refreshData();
    }
  }

  Future getData() async {
    final int? loanType;
    final String? statusFilter;

    switch (_currentLoanTypeFilter) {
      case LoanTypeFilter.maksima:
        loanType = 1;
        break;
      case LoanTypeFilter.pari:
        loanType = 2;
        break;
      default:
        loanType = null;
        break;
    }

    switch (_currentStatusTypeFilter) {
      case StatusTypeFilter.approval:
        statusFilter = 'Approval';
        break;
      case StatusTypeFilter.verifikasi:
        statusFilter = 'Verifikasi';
        break;
      case StatusTypeFilter.aktif:
        statusFilter = 'Aktif';
        break;
      case StatusTypeFilter.jatuhTempoSevenDays:
        statusFilter = 'H-7 Jatuh Tempo';
        break;
      case StatusTypeFilter.jatuhTempo:
        statusFilter = 'Jatuh Tempo';
        break;
      case StatusTypeFilter.telatBayar:
        statusFilter = 'Telat';
        break;
      case StatusTypeFilter.revisi:
        statusFilter = 'Revisi';
        break;
      case StatusTypeFilter.tolak:
        statusFilter = 'Tolak';
        break;
      default:
        statusFilter = null;
        break;
    }

    final res = await runBusyFuture(_ritelMonitoringAPI.fetchMonitoring(
      page: _currentPage,
      limit: _itemRequestThreshold,
      loanType: loanType,
      textSearch: searchController.text.trim(),
      status: statusFilter,
    ));

    _monitoringList.addAll(res ?? []);
    notifyListeners();
  }

  Future refreshData() async {
    _currentPage = 1;
    _monitoringList.clear();
    await getData();
    notifyListeners();
  }

  Future handleItemCreated(int index) async {
    if (kDebugMode) print('handleItemCreated : $index');

    final itemPosition = index + 1;
    final requestMoreData =
        itemPosition % _itemRequestThreshold == 0 && itemPosition != 0;
    final pageToRequest =
        itemPosition ~/ _itemRequestThreshold; // ~/ divide and truncate

    if (requestMoreData && pageToRequest > _currentPage) {
      _currentPage = pageToRequest + 1;
      getData();
    }
  }

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Error',
      description: errorMessage,
      mainButtonTitle: 'OK',
    );
  }

  void showModalFilter({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ViewModelBuilder.nonReactive(
          viewModelBuilder: () => this,
          disposeViewModel: false,
          initialiseSpecialViewModelsOnce: true,
          builder: (context, vm, child) => const ModalFilter(),
        );
      },
    );
  }

  void showModalListGuide({required BuildContext context}) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return const ModalListGuide();
      },
    );
  }

  Future navigateToHomePage() async {
    await _navigationService.clearStackAndShow(Routes.mainView);
  }
}

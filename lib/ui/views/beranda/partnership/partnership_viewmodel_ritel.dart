// ignore_for_file: unused_element

import 'dart:developer' as developer;

import '../../../../application/models/monitoring_pinjaman_detail.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../application/app/app.locator.dart';
import '../../../../application/app/app.router.dart';
import '../../../../application/enums/dialog_type.dart';
import '../../../../application/models/ritel_partnerships.dart';
import '../../../../infrastructure/apis/ritel_partnership_api.dart';

class PartnershipViewModelRitel extends FutureViewModel {
  String? idKelolaan;
  MonitoringPinjamanDetail? pinjamanDetail;
  int? counter;
  String? status;
  int? loanType;

  PartnershipViewModelRitel({
    this.idKelolaan,
    this.pinjamanDetail,
    this.counter,
    this.status,
    this.loanType,
  });

  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _partnershipAPI = locator<RitelPartnershipAPI>();

  List<RitelPartnerships> _partners = [];
  List<RitelPartnerships> get partners => _partners;

  @override
  Future futureToRun() async {
    await _fetchPartners();
  }

  Future _fetchPartners() async {
    final res = await runBusyFuture(
      _partnershipAPI.fetchBouhweerList(kelolaanId: int.parse(idKelolaan!)),
    );

    res.fold(
      (errorMessage) => developer.log(errorMessage),
      (partners) {
        _partners = partners;
      },
    );
  }

  Future refreshData() async {
    await _fetchPartners();
  }

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Error',
      description: errorMessage,
      mainButtonTitle: 'OK',
    );
  }

  void navigateToKonfirmasiPartner() {
    if (pinjamanDetail != null) {
      _navigationService.navigateTo(
        Routes.tambahPencairanView,
        arguments: TambahPencairanViewArguments(
          step: 1,
          pinjamanDetail: pinjamanDetail,
          counter: counter,
          status: status,
          loanType: loanType!,
          idKelolaan: idKelolaan!,
        ),
      );
    } else {
      _navigationService.navigateTo(
        Routes.tambahPencairanView,
        arguments: TambahPencairanViewArguments(
          step: 1,
          idKelolaan: idKelolaan!,
          loanType: loanType!,
        ),
      );
    }
  }

  void navigateToTambahPartnership() {
    if (pinjamanDetail != null) {
      _navigationService.navigateTo(
        Routes.tambahPartnershipViewRitel,
        arguments: TambahPartnershipViewRitelArguments(
          idKelolaan: idKelolaan!,
          pinjamanDetail: pinjamanDetail,
          counter: counter,
          status: status,
          loanType: loanType!,
        ),
      );
    } else {
      _navigationService.navigateTo(
        Routes.tambahPartnershipViewRitel,
        arguments: TambahPartnershipViewRitelArguments(
          idKelolaan: idKelolaan!,
          loanType: loanType!,
        ),
      );
    }
  }

  void navigateToTambahPencairan(String idPartner) {
    if (pinjamanDetail != null) {
      _navigationService.navigateTo(
        Routes.tambahPencairanView,
        arguments: TambahPencairanViewArguments(
          step: 1,
          idPartner: idPartner,
          pinjamanDetail: pinjamanDetail,
          counter: counter,
          status: status,
          loanType: loanType!,
        ),
      );
    } else {
      _navigationService.navigateTo(
        Routes.tambahPencairanView,
        arguments: TambahPencairanViewArguments(
          step: 1,
          idKelolaan: idKelolaan!,
          idPartner: idPartner,
          loanType: loanType!,
        ),
      );
    }
  }
}

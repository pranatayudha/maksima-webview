// ignore_for_file: unused_field, no_leading_underscores_for_local_identifiers

import 'dart:developer' as developer;

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../../application/helpers/initial_code_table_formatter.dart';
import '../../../../../../../../../application/models/ritel_laporan_kunjungan_nasabah.dart';
import '../../../../../../../../../infrastructure/apis/ritel_laporan_kunjungan_nasabah_api.dart';
import '../../../../../../../../../infrastructure/apis/ritel_master_api.dart';

final RitelLaporanKunjunganNasabah
    loadingIndicatorLaporanKunjunganNasabahListItem =
    RitelLaporanKunjunganNasabah(name: '^');

class InformasiAgunanLKNViewModel extends FutureViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final RitelLaporanKunjunganNasabahAPI _ritelLaporanKunjunganNasabahAPI =
      locator<RitelLaporanKunjunganNasabahAPI>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();

  String prakarsaId;
  String pipelineId;
  int loanTypesId;
  int status;
  RitelLaporanKunjunganNasabah? detailsLkn;
  final int codeTable;

  InformasiAgunanLKNViewModel({
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    this.detailsLkn,
    required this.codeTable,
  });

  String prakarsaType = '';
  @override
  Future futureToRun() async {
    prakarsaType = InitialCodeTableFormatter.getPrakarsaType(codeTable);

    if (detailsLkn != null) {
      await _getListKunjungan();
    }
    await fetchLaporanKunjunganNasabah();
  }

  List<RitelLaporanKunjunganNasabah>? _ritelLaporanKunjunganNasabah;

  List<RitelLaporanKunjunganNasabah>? get ritelLaporanKunjunganNasabah =>
      _ritelLaporanKunjunganNasabah;

  List<String> listUrlLkn = [];

  Future fetchLaporanKunjunganNasabah() async {
    final res = await runBusyFuture(
      _ritelLaporanKunjunganNasabahAPI.fetchLaporanKunjunganNasabah(
        prakarsaId: prakarsaId,
        prakarsaType: prakarsaType,
      ),
    );

    res.fold(
      (errorMessage) => developer.log(errorMessage),
      (ritelLaporanKunjunganNasabah) {
        _ritelLaporanKunjunganNasabah = ritelLaporanKunjunganNasabah;
      },
    );
  }

  void navigateToInfoAgunanLknDetails(
    RitelLaporanKunjunganNasabah ritelLaporanKunjunganNasabah,
  ) {
    _navigationService.navigateTo(
      Routes.informasiAgunanLknDetails,
      arguments: InformasiAgunanLknDetailsArguments(
        ritelLaporanKunjunganNasabah: ritelLaporanKunjunganNasabah,
        status: status,
        codeTable: codeTable,
      ),
    );
  }

  Future _getListKunjungan() async {
    detailsLkn!.dataLkn!.visitPath!.forEach((path) async {
      listUrlLkn.add(await _getPublicFile(path.path!));
    });
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
}

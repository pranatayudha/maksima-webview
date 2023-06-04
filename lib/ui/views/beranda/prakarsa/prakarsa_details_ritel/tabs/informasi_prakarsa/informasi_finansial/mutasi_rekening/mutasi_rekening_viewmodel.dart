// ignore_for_file: unused_field

import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../../application/models/RitelMutasiRekeningHeader.dart';
import '../../../../../../../../../application/models/ritel_mutasi_rekening.dart';
import '../../../../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../../../../infrastructure/apis/ritel_mutasi_rekening_api.dart';

final RitelMutasiRekening loadingIndicatorMutasiRekeningListItem =
    RitelMutasiRekening(prakarsaId: '^');

class MutasiRekeningViewModel extends FutureViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final RitelMutasiRekeningAPI _ritelMutasiRekeningAPI =
      locator<RitelMutasiRekeningAPI>();
  final _ritelMasterAPI = locator<RitelMasterAPI>();

  String? prakarsaId;
  String? pipelineId;
  int? loanTypesId;
  int? status;
  final int codeTable;
  DetailMutasi? detailMutasi;

  MutasiRekeningViewModel({
    this.prakarsaId,
    this.pipelineId,
    this.loanTypesId,
    this.status,
    this.detailMutasi,
    required this.codeTable,
  });

  @override
  Future futureToRun() async {
    await fetchMutasiRekening();
    if (codeTable == 2 || codeTable == 3) {
      await fetchMutasiRekeningHeader();
    }
    if (detailMutasi != null) {
      await getPublicFile();
    }
  }

  String convertDateToLocale(String dateString) {
    final inputFormat = DateFormat('dd MMMM yyyy', 'id');
    final date = inputFormat.parse(dateString);
    final outputFormat = DateFormat('dd MMM yy');
    // ignore: newline-before-return
    return outputFormat.format(date).toString();
  }

  List<RitelMutasiRekening> _ritelMutasiRekening = [];

  List<RitelMutasiRekening> get ritelMutasiRekening => _ritelMutasiRekening;

  Future fetchMutasiRekening() async {
    final res = await runBusyFuture(
      _ritelMutasiRekeningAPI.fetchMutasiRekening(prakarsaId!, codeTable),
    );

    res.fold(
      (errorMessage) => _ritelMutasiRekening = [],
      (ritelMutasiRekening) {
        final mutasiMap = List<RitelMutasiRekening>.from(
          ritelMutasiRekening.map(
            (i) => RitelMutasiRekening.fromJson(i as Map<String, dynamic>),
          ),
        );
        _ritelMutasiRekening = mutasiMap;
      },
    );
  }

  RitelMutasiRekeningHeader? _ritelMutasiRekeningHeader;

  RitelMutasiRekeningHeader get ritelMutasiRekeningHeader =>
      _ritelMutasiRekeningHeader!;

  Future fetchMutasiRekeningHeader() async {
    final res = await runBusyFuture(
      _ritelMutasiRekeningAPI.fetchMutasiRekeningHeader(prakarsaId!, codeTable),
    );

    res.fold(
      (errorMessage) => errorMessage,
      (result) {
        _ritelMutasiRekeningHeader = result;
      },
    );
  }

  String? pathBuktiMutasi;

  Future getPublicFile() async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(detailMutasi!.pathBuktiMutasi!),
    );

    res.fold(
      (err) => pathBuktiMutasi = '',
      (success) => pathBuktiMutasi = success,
    );
  }

  String thousandSeparator(
    value, {
    String separator = '.',
    String trailing = '',
  }) {
    return value.toString().replaceAllMapped(
              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
              (Match m) => '${m[1]}$separator',
            ) +
        trailing;
  }

  void navigateToMutasiRekeningDetails(
    RitelMutasiRekening ritelMutasiRekening,
    int index,
  ) async {
    _navigationService.navigateTo(
      Routes.mutasiRekeningDetails,
      arguments: MutasiRekeningDetailsArguments(
        ritelMutasiRekening: ritelMutasiRekening,
        pipelineId: pipelineId!,
        loanTypesId: loanTypesId!,
        status: status!,
        codeTable: codeTable,
        index: index,
      ),
    );
  }

  void navigateToMutasiRekeningForm() async {
    _navigationService.navigateTo(
      Routes.mutasiRekeningFormView,
      arguments: MutasiRekeningFormViewArguments(
        prakarsaId: prakarsaId!,
        pipelineId: pipelineId!,
        loanTypesId: loanTypesId!,
        status: status!,
        codeTable: codeTable,
      ),
    );
  }

  void navigateBack() {
    _navigationService.navigateTo(
      Routes.informasiFinansialView,
      arguments: InformasiFinansialViewArguments(
        prakarsaId: prakarsaId!,
        pipelineId: pipelineId!,
        loanTypesId: loanTypesId!,
        status: status!,
        codeTable: codeTable,
      ),
    );
  }
}

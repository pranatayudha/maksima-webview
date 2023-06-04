import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../../application/models/detail_crr_prakarsa.dart';
import '../../../../../../../../infrastructure/apis/ritel_upload_crr_api.dart';

class CreditRistRatingViewModel extends FutureViewModel {
  final String prakarsaId;
  final String pipelineId;
  final int codeTable;
  final int loanTypesId;

  CreditRistRatingViewModel({
    required this.prakarsaId,
    required this.codeTable,
    required this.loanTypesId,
    required this.pipelineId,
  });

  final RitelUploadCRRAPI _ritelUploadCRRAPI = locator<RitelUploadCRRAPI>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Future futureToRun() async {
    setBusy(true);
    await getDetailScoreCRR();
    setBusy(false);
  }

  DetailCRRPrakarsa? _detailCRRPrakarsa;

  DetailCRRPrakarsa get detailCRRPrakarsa => _detailCRRPrakarsa!;

  Future getDetailScoreCRR() async {
    final res = await runBusyFuture(
      _ritelUploadCRRAPI.getCRRDetail(
        prakarsaId: prakarsaId,
        codeTable: codeTable,
      ),
    );

    res.fold(
      (error) => _showErrorDataFromInitDialog(),
      (result) {
        _detailCRRPrakarsa = result;
      },
    );
  }

  void riskRating(int rating) {
    rating > 650 ? true : false;
  }

  Future _showErrorDataFromInitDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Invalid',
      description:
          'Beberapa isian ada yang kosong pada halaman Informasi Finansial atau Informasi Non Finansial, silahkan periksa kembali.',
      mainButtonTitle: 'OK',
    );

    _navigationService.navigateTo(
      Routes.prakarsaDetailsViewRitel,
      arguments: PrakarsaDetailsViewRitelArguments(
        index: 1,
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        codeTable: codeTable,
      ),
    );
  }
}

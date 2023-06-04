import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../application/enums/bottom_sheet_type.dart';
import '../../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../../../infrastructure/apis/ritel_prakarsa_api.dart';

class HasilAnalisaPinjamanViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final RitelPrakarsaAPI _ritelPrakarsaAPI = locator<RitelPrakarsaAPI>();
  final DialogService _dialogService = locator<DialogService>();
  final _ritelMasterAPI = locator<RitelMasterAPI>();

  String debiturName;
  String prakarsaId;
  String pipelineId;
  int loanTypesId;
  int codeTable;

  HasilAnalisaPinjamanViewModel({
    required this.debiturName,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  });

  Future initialize() async {
    setBusy(true);
    await getDraftPTK();
    setBusy(false);
  }

  String? fileDraftPTK;
  String? fileDraftPtkPrivate;

  Future getDraftPTK() async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.fetchDraftPTK(
        prakarsaId: prakarsaId,
      ),
    );

    res.fold((error) => fileDraftPTK = '', (url) async {
      fileDraftPtkPrivate = url;
      final resPublicFile = await runBusyFuture(
        _ritelMasterAPI.getPublicFile(url),
      );

      resPublicFile.fold((error) => fileDraftPTK = '', (url) {
        fileDraftPTK = url;
        notifyListeners();
      });
    });
  }

  Future showConfirmSendToCheckerDialog() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.confirmation,
      data: {
        'title': 'Konfirmasi Kirim ke Checker',
        'description':
            'Apakah Anda yakin data yang diinput sudah sesuai?\nInformasi yang telah Anda input akan dikirim kembali ke Checker untuk proses verifikasi ADK dan CBL',
      },
    );

    if (response != null && response.confirmed) {
      final res = await _ritelPrakarsaAPI.sendToChecker(
        prakarsaId: prakarsaId,
        draftPTKPath: fileDraftPtkPrivate!,
      );

      res.fold(
        (errorMessage) => _showErrorDialog(errorMessage),
        (success) => _navigationService.navigateTo(
          Routes.hasilAnalisaPinjamanSuccessView,
          arguments: HasilAnalisaPinjamanSuccessViewArguments(
            debiturName: debiturName,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            codeTable: codeTable,
          ),
        ),
      );
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
}

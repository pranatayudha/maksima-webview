import 'package:file_picker/file_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../../application/helpers/initial_code_table_formatter.dart';
import '../../../../../../../../application/services/media_service.dart';
import '../../../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../../../infrastructure/apis/ritel_upload_crr_api.dart';

class UploadCRRViewModel extends FutureViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final MaksimaMediaService _mediaService = locator<MaksimaMediaService>();
  final NavigationService _navigationService = locator<NavigationService>();

  final RitelUploadCRRAPI _ritelUploadCRRAPI = locator<RitelUploadCRRAPI>();
  final _ritelMasterAPI = locator<RitelMasterAPI>();

  String prakarsaId;
  String pipelineId;
  int loanTypesId;
  String? url;
  int status;
  bool _isLoadingCrr = false;

  final int codeTable;

  UploadCRRViewModel({
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    this.url,
    required this.status,
    required this.codeTable,
  });

  String prakarsaType = '';
  bool get isLoadingCrr => _isLoadingCrr;

  @override
  Future futureToRun() async {
    prakarsaType = InitialCodeTableFormatter.getPrakarsaType(codeTable);
    if (url != null) {
      await getPublicFile(url!);
    }
  }

  PlatformFile? fileCRR;
  String? namePath;

  Future pickFile() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      if (_isPdf(res.extension!)) {
        fileCRR = res;
        notifyListeners();
      } else {
        _showErrorDialog('File yang diperbolehkan hanya pdf!');
      }
    }
  }

  bool _isPdf(String type) {
    return (type == 'pdf');
  }

  Future clearCRR() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus file CRR',
      description: 'Anda yakin akan menghapus file CRR ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response != null) {
      fileCRR = null;
      notifyListeners();
    }
  }

  void uploadFileCRR() async {
    final res = await runBusyFuture(
      _ritelUploadCRRAPI.uploadCRR(
        file: fileCRR!,
        prakarsaId: prakarsaId,
        prakarsaType: prakarsaType,
      ),
    );

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) => _showSuccessDialog('Berhasil menambahkan CRR!'),
    );
  }

  Future _showSuccessDialog(String successMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    final res = await runBusyFuture(
      _ritelUploadCRRAPI.fetchCRR(
        prakarsaId: prakarsaId,
        prakarsaType: prakarsaType,
      ),
    );

    res.fold(
      (error) => _showErrorDialog(error),
      (url) => _navigationService.navigateTo(
        Routes.uploadCRRDetails,
        arguments: UploadCRRDetailsArguments(
          prakarsaId: prakarsaId,
          pipelineId: pipelineId,
          loanTypesId: loanTypesId,
          url: url,
          status: status,
          codeTable: codeTable,
        ),
      ),
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

  void navigateBack() {
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

  String? urlPublic;
  Future<String> getPublicFile(String urlPrivate) async {
    print(urlPrivate);
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(urlPrivate),
    );

    res.fold(
      (error) => _showErrorDialog(error),
      (res) {
        urlPublic = res;
        notifyListeners();
      },
    );

    return urlPublic!;
  }
}

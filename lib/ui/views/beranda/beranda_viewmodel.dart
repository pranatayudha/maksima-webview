import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../application/app/app.locator.dart';
import '../../../application/app/app.router.dart';
import '../../../application/enums/dialog_type.dart';
import '../../../application/models/ritel_pipelines.dart';
import '../../../application/models/user.dart';
import '../../../application/services/local_db_service.dart';
import '../../../infrastructure/apis/ritel_pipeline_perorangan_api.dart';

class BerandaViewModel extends FutureViewModel {
  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final RitelPipelinePeroranganAPI _ritelPipelinePeroranganAPI =
      locator<RitelPipelinePeroranganAPI>();

  static const int itemRequestThreshold = 5;

  List<RitelPipelines> _ritelPipelines = [];

  List<RitelPipelines> get ritelPipelines => _ritelPipelines;

  User? get user => _localDBService.getUser();

  @override
  Future futureToRun() async {
    await fetchPipelines(page: 1, textSearch: '', recordCount: 5, status: '');
  }

  Future fetchPipelines({
    int? page,
    String? textSearch,
    dynamic recordCount,
    dynamic status,
  }) async {
    final res = await runBusyFuture(
      _ritelPipelinePeroranganAPI.fetchPipelines(
        page: page,
        recordCount: recordCount,
        textSearch: textSearch,
        status: status,
      ),
    );

    res.fold(
      (errorMessage) => _ritelPipelines = [],
      (ritelPipelinesList) => _ritelPipelines = ritelPipelinesList,
    );
  }

  Future navigateToPipelineDetailView(RitelPipelines ritelPipelines) async {
    switch (ritelPipelines.codeTable!) {
      case 1:
        return await _navigationService.navigateTo(
          Routes.pipelineDetailsViewRitel,
          arguments: PipelineDetailsViewRitelArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perorangan',
            statusPipeline: convertStatusPipeline(
              ritelPipelines.statusScreening!,
            ),
          ),
        );
      case 2:
        return await _navigationService.navigateTo(
          Routes.pipelineDetailsCvViewRitel,
          arguments: PipelineDetailsCvViewRitelArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perorangan',
            statusPipeline: convertStatusPipeline(
              ritelPipelines.statusScreening!,
            ),
            codeTable: 2,
          ),
        );
      case 3:
        return await _navigationService.navigateTo(
          Routes.pipelineDetailsPtViewRitel,
          arguments: PipelineDetailsPtViewRitelArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perorangan',
            statusPipeline: convertStatusPipeline(
              ritelPipelines.statusScreening!,
            ),
          ),
        );
      case 4:
        return await _navigationService.navigateTo(
          Routes.pipelineDetailsViewPari,
          arguments: PipelineDetailsViewPariArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perorangan',
            statusPipeline: convertStatusPipeline(
              ritelPipelines.statusScreening!,
            ),
          ),
        );
    }
  }

  Future refreshData() async {
    await fetchPipelines(page: 1, textSearch: '', recordCount: 5, status: '');
    notifyListeners();
  }

  void navigateTo(String route) => _navigationService.navigateTo(route);

  void showAppInfoDialog() => _dialogService.showCustomDialog(
        variant: DialogType.appInfo,
        barrierDismissible: true,
      );

  void navigateToAkunView() => _navigationService.navigateTo(
        Routes.akunView,
        arguments: const AkunViewArguments(fromBerandaHeader: true),
      );

  void navigateToPipelineView() => _navigationService.navigateTo(
        Routes.mainView,
        arguments: const MainViewArguments(index: 1),
        preventDuplicates: false,
      );

  int convertStatusPipeline(String status) {
    switch (status) {
      case 'Data Belum Lengkap':
        return 1;
      case 'Belum Pre-Screening':
        return 2;
      case 'Sedang Pre-Screening':
        return 3;
      default:
        return 4;
    }
  }
}

// ignore_for_file: unused_field

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../application/app/app.locator.dart';
import '../../../application/app/app.router.dart';
import '../../../application/models/filter_ritel.dart';
import '../../../application/models/ritel_pipelines.dart';
import '../../../infrastructure/apis/ritel_pipeline_perorangan_api.dart';
import '../../../infrastructure/apis/ritel_pipeline_perusahaan_pt_api.dart';

final RitelPipelines loadingIndicatorPipelineListItem =
    RitelPipelines(pipelinesId: '^');

class PipelineViewModelRitel extends FutureViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final RitelPipelinePerusahaanPtAPI _ritelPipelinePerusahaanPtAPI =
      locator<RitelPipelinePerusahaanPtAPI>();
  final RitelPipelinePeroranganAPI _ritelPipelinePeroranganAPI =
      locator<RitelPipelinePeroranganAPI>();

  static const int _itemRequestThreshold = 10;
  int _currentPage = 0;

  final List<String> _filterList = [];

  List<String> get filterList => _filterList;

  List<RitelPipelines> _ritelPipelines = [];

  List<RitelPipelines> get ritelPipelines => _ritelPipelines;

  final List<FilterRitel> _filterLoanType = [];

  List<FilterRitel> get filterLoanType => _filterLoanType;
  int selectedFilterLoanType = 0;

  final List<FilterRitel> _filterStatusDebitur = [];

  List<FilterRitel> get filterStatusDebitur => _filterStatusDebitur;
  int selectedFilterStatusDebitur = 0;

  @override
  Future futureToRun() async {
    fetchPipelines(
      page: 1,
      recordCount: _itemRequestThreshold,
      textSearch: '',
      status: '',
    );
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
      (ritelPipelinesList) {
        _ritelPipelines = ritelPipelinesList;

        _filterList.clear();
        _filterList.addAll([
          'Semua',
          'PTR',
          'PARI',
          'Data belum lengkap',
          'Belum pre-screening',
          'Sedang pre-screening',
          'Pre-screening selesai',
          'Pre-screening gagal',
        ]);
        _setFilterRitel();
      },
    );
  }

  Future fetchPipelinesWithoutLimit({
    int? page,
    String? textSearch,
    dynamic status,
    dynamic loanType,
  }) async {
    final res = await runBusyFuture(
      _ritelPipelinePeroranganAPI.fetchPipelinesWithoutLimit(
        page: page,
        textSearch: textSearch,
        status: status,
        loanType: loanType,
      ),
    );

    res.fold(
      (errorMessage) => _ritelPipelines = [],
      (ritelPipelinesList) => _ritelPipelines = ritelPipelinesList,
    );
  }

  Future refreshData() async {
    await fetchPipelines(
      page: 1,
      recordCount: _itemRequestThreshold,
      textSearch: '',
      status: '',
    );
    selectedFilterLoanType = 0;
    selectedFilterStatusDebitur = 0;
    notifyListeners();
  }

  Future handleItemCreated(int index) async {
    final itemPosition = index + 1;
    final requestMoreData =
        itemPosition % _itemRequestThreshold == 0 && itemPosition != 0;
    final pageToRequest =
        itemPosition ~/ _itemRequestThreshold; // ~/ divide and truncate

    if (requestMoreData && pageToRequest > _currentPage) {
      _currentPage = pageToRequest;
      _showLoadingIndicator();

      final res = await _ritelPipelinePeroranganAPI.fetchPipelines(
        page: _currentPage,
        recordCount: _itemRequestThreshold,
        textSearch: '',
        status: '',
      );

      res.fold(
        (errorMessage) => _ritelPipelines = [],
        (ritelPipelineList) => _ritelPipelines.addAll(ritelPipelineList),
      );

      _removeLoadingIndicator();
    }
  }

  void _showLoadingIndicator() {
    _ritelPipelines.add(loadingIndicatorPipelineListItem);
    notifyListeners();
  }

  void _removeLoadingIndicator() {
    _ritelPipelines.remove(loadingIndicatorPipelineListItem);
    notifyListeners();
  }

  Future search(String textSearch) async {
    await fetchPipelinesWithoutLimit(
      page: 1,
      textSearch: textSearch,
      status: '',
      loanType: '',
    );
    notifyListeners();
  }

  Future filterBy(String filterBy) async {
    if (filterBy == 'Data belum lengkap') {
      await fetchPipelinesWithoutLimit(
        page: 1,
        textSearch: '',
        status: 1,
        loanType: '',
      );
    } else if (filterBy == 'Belum pre-screening') {
      await fetchPipelinesWithoutLimit(
        page: 1,
        textSearch: '',
        status: 2,
        loanType: '',
      );
    } else if (filterBy == 'Sedang pre-screening') {
      await fetchPipelinesWithoutLimit(
        page: 1,
        textSearch: '',
        status: 3,
        loanType: '',
      );
    } else if (filterBy == 'Pre-screening selesai') {
      await fetchPipelinesWithoutLimit(
        page: 1,
        textSearch: '',
        status: 4,
        loanType: '',
      );
    } else if (filterBy == 'Pre-screening gagal') {
      await fetchPipelinesWithoutLimit(
        page: 1,
        textSearch: '',
        status: 5,
        loanType: '',
      );
    } else if (filterBy == 'PTR') {
      await fetchPipelinesWithoutLimit(
        page: 1,
        textSearch: '',
        status: '',
        loanType: 1,
      );
    } else if (filterBy == 'PARI') {
      await fetchPipelinesWithoutLimit(
        page: 1,
        textSearch: '',
        status: '',
        loanType: 2,
      );
    } else {
      await fetchPipelines(
        page: 1,
        recordCount: _itemRequestThreshold,
        textSearch: '',
        status: '',
      );
    }

    notifyListeners();
  }

  // ignore: long-method
  void navigateToPipelineDetailView(RitelPipelines ritelPipelines) {
    if (ritelPipelines.statusScreening == 'Data Belum Lengkap') {
      if (ritelPipelines.codeTable == 4) {
        _navigationService.navigateTo(
          Routes.pipelineDetailsViewPari,
          arguments: PipelineDetailsViewPariArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perorangan',
            statusPipeline: 1,
          ),
        );
      } else if (ritelPipelines.codeTable == 2) {
        _navigationService.navigateTo(
          Routes.pipelineDetailsCvViewRitel,
          arguments: PipelineDetailsCvViewRitelArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perusahaan CV',
            statusPipeline: 1,
            codeTable: 4,
          ),
        );
      } else if (ritelPipelines.codeTable == 3) {
        _navigationService.navigateTo(
          Routes.pipelineDetailsPtViewRitel,
          arguments: PipelineDetailsPtViewRitelArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perusahaan PT',
            statusPipeline: 1,
          ),
        );
      } else {
        _navigationService.navigateTo(
          Routes.pipelineDetailsViewRitel,
          arguments: PipelineDetailsViewRitelArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perorangan',
            statusPipeline: 1,
          ),
        );
      }
    } else if (ritelPipelines.statusScreening == 'Belum Pre-Screening') {
      if (ritelPipelines.codeTable == 4) {
        _navigationService.navigateTo(
          Routes.pipelineDetailsViewPari,
          arguments: PipelineDetailsViewPariArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perorangan',
            statusPipeline: 2,
          ),
        );
      } else if (ritelPipelines.codeTable == 2) {
        _navigationService.navigateTo(
          Routes.pipelineDetailsCvViewRitel,
          arguments: PipelineDetailsCvViewRitelArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perusahaan CV',
            statusPipeline: 2,
            codeTable: 4,
          ),
        );
      } else if (ritelPipelines.codeTable == 3) {
        _navigationService.navigateTo(
          Routes.pipelineDetailsPtViewRitel,
          arguments: PipelineDetailsPtViewRitelArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perusahaan PT',
            statusPipeline: 2,
          ),
        );
      } else {
        _navigationService.navigateTo(
          Routes.pipelineDetailsViewRitel,
          arguments: PipelineDetailsViewRitelArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perorangan',
            statusPipeline: 2,
          ),
        );
      }
    } else if (ritelPipelines.statusScreening == 'Sedang Pre-Screening') {
      if (ritelPipelines.codeTable == 4) {
        _navigationService.navigateTo(
          Routes.pipelineDetailsViewPari,
          arguments: PipelineDetailsViewPariArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perorangan',
            statusPipeline: 3,
          ),
        );
      } else if (ritelPipelines.codeTable == 2) {
        _navigationService.navigateTo(
          Routes.pipelineDetailsCvViewRitel,
          arguments: PipelineDetailsCvViewRitelArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perusahaan CV',
            statusPipeline: 3,
            codeTable: 4,
          ),
        );
      } else if (ritelPipelines.codeTable == 3) {
        _navigationService.navigateTo(
          Routes.pipelineDetailsPtViewRitel,
          arguments: PipelineDetailsPtViewRitelArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perusahaan PT',
            statusPipeline: 3,
          ),
        );
      } else {
        _navigationService.navigateTo(
          Routes.pipelineDetailsViewRitel,
          arguments: PipelineDetailsViewRitelArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perorangan',
            statusPipeline: 3,
          ),
        );
      }
    } else {
      if (ritelPipelines.codeTable == 4) {
        _navigationService.navigateTo(
          Routes.pipelineDetailsViewPari,
          arguments: PipelineDetailsViewPariArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perorangan',
            statusPipeline: 4,
          ),
        );
      } else if (ritelPipelines.codeTable == 2) {
        _navigationService.navigateTo(
          Routes.pipelineDetailsCvViewRitel,
          arguments: PipelineDetailsCvViewRitelArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perusahaan CV',
            statusPipeline: 4,
            codeTable: 4,
          ),
        );
      } else if (ritelPipelines.codeTable == 3) {
        _navigationService.navigateTo(
          Routes.pipelineDetailsPtViewRitel,
          arguments: PipelineDetailsPtViewRitelArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perusahaan PT',
            statusPipeline: 4,
          ),
        );
      } else {
        _navigationService.navigateTo(
          Routes.pipelineDetailsViewRitel,
          arguments: PipelineDetailsViewRitelArguments(
            id: ritelPipelines.pipelinesId!,
            debiturType: 'Perorangan',
            statusPipeline: 4,
          ),
        );
      }
    }
  }

  void _setFilterRitel() {
    _filterLoanType.clear();
    _filterStatusDebitur.clear();

    _filterLoanType.addAll([
      FilterRitel(name: 'Semua', value: 0),
      FilterRitel(name: 'PTR', value: 1),
      FilterRitel(name: 'PARI', value: 2),
    ]);

    _filterStatusDebitur.addAll([
      FilterRitel(name: 'Data belum lengkap', value: 1),
      FilterRitel(name: 'Belum pre-screening', value: 2),
      FilterRitel(name: 'Sedang pre-screening', value: 3),
      FilterRitel(name: 'Pre-screening selesai', value: 4),
      FilterRitel(name: 'Pre-screening gagal', value: 5),
    ]);
  }

  void setFilterLoanType(int val) {
    selectedFilterLoanType = val;
    if (val == 0) {
      selectedFilterStatusDebitur = val;
    }
    notifyListeners();
  }

  void setFilterStatusDebitur(int val) {
    selectedFilterStatusDebitur = val;
    notifyListeners();
  }
}

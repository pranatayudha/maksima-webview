import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../application/app/app.locator.dart';
import '../../../../application/app/app.router.dart';
import '../../../../application/models/filter_ritel.dart';
import '../../../../application/models/ritel_prakarsa.dart';
import '../../../../infrastructure/apis/ritel_prakarsa_api.dart';

final RitelPrakarsa loadingIndicatorPrakarsaListItem =
    RitelPrakarsa(prakarsaId: '^');

class PrakarsaViewModelRitel extends FutureViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final RitelPrakarsaAPI _ritelPrakarsaAPI = locator<RitelPrakarsaAPI>();

  static const int _itemRequestThreshold = 10;
  int _currentPage = 0;

  final List<String> _filterList = [];

  List<String> get filterList => _filterList;

  List<RitelPrakarsa> _ritelPrakarsa = [];

  List<RitelPrakarsa> get ritelPrakarsa => _ritelPrakarsa;

  final List<FilterRitel> _filterLoanType = [];

  List<FilterRitel> get filterLoanType => _filterLoanType;
  int selectedFilterLoanType = 0;

  final List<FilterRitel> _filterStatusDebitur = [];

  List<FilterRitel> get filterStatusDebitur => _filterStatusDebitur;
  int selectedFilterStatusDebitur = 0;

  @override
  Future futureToRun() async {
    fetchPrakarsa(
      page: 1,
      recordCount: _itemRequestThreshold,
      textSearch: '',
      status: '',
    );
  }

  Future fetchPrakarsa({
    int? page,
    String? textSearch,
    dynamic recordCount,
    dynamic status,
  }) async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.fetchPrakarsa(
        page: page,
        recordCount: recordCount,
        textSearch: textSearch,
        status: status,
      ),
    );

    res.fold(
      (errorMessage) => _ritelPrakarsa = [],
      (ritelPrakarsaList) {
        _ritelPrakarsa = ritelPrakarsaList;
        _filterList.clear();
        _filterList.addAll([
          'Semua',
          'PTR',
          'PARI',
          'Lengkapi Informasi Prakarsa',
          'Siap Dikirim ke Checker',
          'Verifikasi ADK',
          'Verifikasi CBL',
          'Menunggu Putusan',
          'Offering Debitur',
          'Akad Kredit',
          'Pembuatan Fasilitas',
        ]);
        _setFilterRitel();
      },
    );
  }

  Future fetchPrakarsaWithoutLimit({
    String? textSearch,
    dynamic status,
    dynamic loanType,
  }) async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.fetchPrakarsaWithoutLimit(
        textSearch: textSearch,
        status: status,
        loanType: loanType,
      ),
    );

    res.fold(
      (errorMessage) => _ritelPrakarsa = [],
      (ritelPrakarsaList) => _ritelPrakarsa = ritelPrakarsaList,
    );
  }

  Future refreshData() async {
    await fetchPrakarsa(
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

      final res = await _ritelPrakarsaAPI.fetchPrakarsa(
        page: _currentPage,
        recordCount: _itemRequestThreshold,
        textSearch: '',
        status: '',
      );

      res.fold(
        (errorMessage) => _ritelPrakarsa = [],
        (ritelPrakarsaList) => _ritelPrakarsa.addAll(ritelPrakarsaList),
      );

      _removeLoadingIndicator();
    }
  }

  void _showLoadingIndicator() {
    _ritelPrakarsa.add(loadingIndicatorPrakarsaListItem);
    notifyListeners();
  }

  void _removeLoadingIndicator() {
    _ritelPrakarsa.remove(loadingIndicatorPrakarsaListItem);
    notifyListeners();
  }

  Future search(String textSearch) async {
    await fetchPrakarsaWithoutLimit(
      textSearch: textSearch,
      status: '',
      loanType: '',
    );
    notifyListeners();
  }

  Future filterBy(String filterBy) async {
    if (filterBy == 'Lengkapi Informasi Prakarsa') {
      await fetchPrakarsaWithoutLimit(
        textSearch: '',
        status: 1,
        loanType: '',
      );
    } else if (filterBy == 'Siap Dikirim ke Checker') {
      await fetchPrakarsaWithoutLimit(
        textSearch: '',
        status: 2,
        loanType: '',
      );
    } else if (filterBy == 'Verifikasi ADK') {
      await fetchPrakarsaWithoutLimit(
        textSearch: '',
        status: 3,
        loanType: '',
      );
    } else if (filterBy == 'Verifikasi CBL') {
      await fetchPrakarsaWithoutLimit(
        textSearch: '',
        status: 4,
        loanType: '',
      );
    } else if (filterBy == 'Menunggu Putusan') {
      await fetchPrakarsaWithoutLimit(
        textSearch: '',
        status: 5,
        loanType: '',
      );
    } else if (filterBy == 'Offering Debitur') {
      await fetchPrakarsaWithoutLimit(
        textSearch: '',
        status: 6,
        loanType: '',
      );
    } else if (filterBy == 'Akad Kredit') {
      await fetchPrakarsaWithoutLimit(
        textSearch: '',
        status: 7,
        loanType: '',
      );
    } else if (filterBy == 'Pembuatan Fasilitas') {
      await fetchPrakarsaWithoutLimit(
        textSearch: '',
        status: 8,
        loanType: '',
      );
    } else if (filterBy == 'PTR') {
      await fetchPrakarsaWithoutLimit(
        textSearch: '',
        status: '',
        loanType: 1,
      );
    } else if (filterBy == 'PARI') {
      await fetchPrakarsaWithoutLimit(
        textSearch: '',
        status: '',
        loanType: 2,
      );
    } else {
      await fetchPrakarsa(
        page: 1,
        recordCount: _itemRequestThreshold,
        textSearch: '',
        status: '',
      );
    }

    notifyListeners();
  }

  void navigateToPrakarsaDetailView(RitelPrakarsa ritelPrakarsa) {
    _navigationService.navigateTo(
      Routes.prakarsaDetailsViewRitel,
      arguments: PrakarsaDetailsViewRitelArguments(
        prakarsaId: ritelPrakarsa.prakarsaId!,
        pipelineId: ritelPrakarsa.pipelinesId!,
        loanTypesId: ritelPrakarsa.loan_typesId!,
        codeTable: ritelPrakarsa.codeTable!,
      ),
    );
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
      FilterRitel(name: 'Lengkapi Informasi Prakarsa', value: 1),
      FilterRitel(name: 'Siap Dikirim ke Checker', value: 2),
      FilterRitel(name: 'Verifikasi ADK', value: 3),
      FilterRitel(name: 'Verifikasi CBL', value: 4),
      FilterRitel(name: 'Menunggu Putusan', value: 5),
      FilterRitel(name: 'Offering Debitur', value: 6),
      FilterRitel(name: 'Akad Kredit', value: 7),
      FilterRitel(name: 'Pembuatan Fasilitas', value: 8),
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

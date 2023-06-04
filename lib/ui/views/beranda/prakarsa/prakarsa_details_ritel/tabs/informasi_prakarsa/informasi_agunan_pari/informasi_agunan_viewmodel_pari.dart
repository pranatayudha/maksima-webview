import 'package:stacked/stacked.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/helpers/initial_code_table_formatter.dart';
import '../../../../../../../../application/models/ritel_prakarsa_agunan_pokok.dart';
import '../../../../../../../../infrastructure/apis/ritel_informasi_agunan_pokok_api.dart';

class InformasiAgunanViewModelPari extends FutureViewModel {
  String prakarsaId;
  String pipelineId;
  int loanTypesId;
  int status;
  int codeTable;

  final _ritelPrakarsaAgunanPokokApi = locator<RitelInformasiAgunanPokokAPI>();

  InformasiAgunanViewModelPari({
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  @override
  Future futureToRun() async {
    fetchAgunanPokokList();
  }

  List<RitelPrakarsaAgunanPokok>? _ritelPrakarsaAgunanPokokList;
  List<RitelPrakarsaAgunanPokok>? get ritelPrakarsaAgunanPokokList =>
      _ritelPrakarsaAgunanPokokList;
  static const agunanPokokBusyObject = 'agunan-pokok';
  Future fetchAgunanPokokList() async {
    _ritelPrakarsaAgunanPokokList = await runBusyFuture(
      _ritelPrakarsaAgunanPokokApi.fetchAgunanPokok(
        prakarsaId: prakarsaId,
        prakarsaType: InitialCodeTableFormatter.getPrakarsaType(codeTable),
      ),
      busyObject: agunanPokokBusyObject,
    );
  }
}

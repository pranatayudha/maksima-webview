import 'package:stacked/stacked.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/models/ritel_prakarsa_revisi_adk_or_cbl.dart';
import '../../../../../../../../infrastructure/apis/ritel_prakarsa_api.dart';

class RevisiViewModel extends FutureViewModel {
  final RitelPrakarsaAPI _ritelPrakarsaAPI = locator<RitelPrakarsaAPI>();

  final String ticket;
  final String checker;
  final String id;
  late bool isDataAvailable;

  RevisiViewModel({
    required this.ticket,
    required this.checker,
    required this.id,
  });

  RitelRevisiAdkOrCbl? _ritelRevisiAdkOrCbl;

  RitelRevisiAdkOrCbl get ritelRevisiAdkOrCbl => _ritelRevisiAdkOrCbl!;

  @override
  Future futureToRun() async {
    setBusy(true);
    await fetchRevisiDetail();
    setBusy(false);
  }

  Future fetchRevisiDetail() async {
    final res = await runBusyFuture(_ritelPrakarsaAPI.fetchRevisiAdkOrCbl(
      ticket: ticket,
      checker: checker,
      id: id,
    ));

    res.fold(
      (error) => error,
      (result) {
        _ritelRevisiAdkOrCbl = result;
      },
    );
  }
}

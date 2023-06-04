import 'dart:html' as html;

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../application/app/app.locator.dart';
import '../../../../../../application/enums/dialog_type.dart';
import '../../../../../../infrastructure/apis/ritel_screening_api.dart';

class SLIKViewModelRitel extends FutureViewModel {
  String? name;
  String? url;

  SLIKViewModelRitel({
    this.name,
    this.url,
  });

  final DialogService _dialogService = locator<DialogService>();
  final RitelScreeningAPI _ritelScreeningAPI = locator<RitelScreeningAPI>();

  String? urlBase64;

  @override
  Future futureToRun() => getData();

  Future getData() async {
    if (url!.isNotEmpty || url != null) {
      await getUrlBase64(url!);
    } else {
      _showErrorDialog(
          'iDeb SLIK Tidak Tersedia. Silahkan kordinasi dengan pihak developer');
    }
  }

  Future getUrlBase64(String link) async {
    final resBase64 =
        await runBusyFuture(_ritelScreeningAPI.fetchBase64Slik(link));
    resBase64.fold(
      (errorMessage) => errorMessage,
      (result) async {
        urlBase64 = result;
        notifyListeners();
      },
    );
  }

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Error',
      description: errorMessage,
      mainButtonTitle: 'OK',
    );
  }

  void savePDFToDevice() {
    String url = 'data:application/zip;base64,$urlBase64';
    html.AnchorElement anchorElement = new html.AnchorElement(href: url);
    anchorElement.download = 'SLIK-${name}.zip';
    anchorElement.click();
  }
}

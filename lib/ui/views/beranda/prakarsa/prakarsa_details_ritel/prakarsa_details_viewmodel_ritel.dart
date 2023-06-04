import 'dart:developer' as developer;

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../application/app/app.locator.dart';
import '../../../../../application/app/app.router.dart';
import '../../../../../application/app/constants/common.dart';
import '../../../../../application/enums/dialog_type.dart';
import '../../../../../application/models/ritel_prakarsa_info_prakarsa.dart';
import '../../../../../application/models/ritel_prakarsa_info_prakarsa_header.dart';
import '../../../../../application/models/ritel_prakarsa_perorangan.dart';
import '../../../../../application/models/ritel_prakarsa_status_pengajuan.dart';
import '../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../infrastructure/apis/ritel_prakarsa_api.dart';

class PrakarsaDetailsViewModelRitel extends FutureViewModel {
  final RitelPrakarsaAPI _ritelPrakarsaAPI = locator<RitelPrakarsaAPI>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final _ritelMasterAPI = locator<RitelMasterAPI>();

  String prakarsaId;
  String pipelineId;
  int codeTable;
  int? loanTypeId;

  PrakarsaDetailsViewModelRitel({
    required this.prakarsaId,
    required this.pipelineId,
    required this.codeTable,
    this.loanTypeId,
  });

  RitelPrakarsaStatusPengajuan? _ritelPrakarsaStatusPengajuan;

  RitelPrakarsaStatusPengajuan get ritelPrakaraStatusPengajuan =>
      _ritelPrakarsaStatusPengajuan!;

  RitelPrakarsaInfoPrakarsaHeader? _ritelPrakarsaInfoPrakarsaHeader;

  RitelPrakarsaInfoPrakarsaHeader get ritelPrakarsaInfoPrakarsaHeader =>
      _ritelPrakarsaInfoPrakarsaHeader!;

  RitelPrakarsaInfoPrakarsaPerorangan? _ritelPrakarsaInfoPrakarsaPerorangan;

  RitelPrakarsaInfoPrakarsaPerorangan get ritelPrakarsaInfoPrakarsaPerorangan =>
      _ritelPrakarsaInfoPrakarsaPerorangan!;

  RitelPrakarsaInfoPrakarsaPTCV? _ritelPrakarsaInfoPrakarsaPTCV;

  RitelPrakarsaInfoPrakarsaPTCV get ritelPrakarsaInfoPrakarsaPTCV =>
      _ritelPrakarsaInfoPrakarsaPTCV!;

  RitelPrakarsaPerorangan? _ritelPrakarsaPerorangan;

  RitelPrakarsaPerorangan get ritelPrakarsaPerorangan =>
      _ritelPrakarsaPerorangan!;

  @override
  Future futureToRun() async {
    await fetchStatusPengajuan();
    if (codeTable == Common.CodeTable.Perorangan ||
        codeTable == Common.CodeTable.PARI) {
      await fetchInfoPrakarsaPerorangan();
    } else {
      await fetchInfoPrakarsaPTCV();
    }
    await fetchPrakarsaById();
    // await getDraftPTK();
  }

  Future fetchStatusPengajuan() async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.fetchStatusPengajuan(prakarsaId, codeTable),
    );

    res.fold(
      (l) => _showErrorDialog('Gagal memuat data'),
      (ritelPrakarsaStatusPengajuan) {
        _ritelPrakarsaStatusPengajuan = ritelPrakarsaStatusPengajuan;
      },
    );
  }

  Future fetchInfoPrakarsaPerorangan() async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.fetchInfoPrakarsaPerorangan(prakarsaId),
    );

    res.fold(
      (l) => _showErrorDialog('Gagal memuat data'),
      (ritelPrakarsaInfoPrakarsa) {
        _ritelPrakarsaInfoPrakarsaPerorangan = ritelPrakarsaInfoPrakarsa;
        _ritelPrakarsaInfoPrakarsaHeader = ritelPrakarsaInfoPrakarsa.header!;
      },
    );
  }

  Future fetchInfoPrakarsaPTCV() async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.fetchInfoPrakarsaPTCV(prakarsaId, codeTable),
    );

    res.fold(
      (l) => _showErrorDialog('Gagal memuat data'),
      (ritelPrakarsaInfoPrakarsa) {
        _ritelPrakarsaInfoPrakarsaPTCV = ritelPrakarsaInfoPrakarsa;
        _ritelPrakarsaInfoPrakarsaHeader = ritelPrakarsaInfoPrakarsa.header!;
      },
    );
  }

  Future fetchPrakarsaById() async {
    final res = await runBusyFuture(_ritelPrakarsaAPI.fetchById(
      prakarsaId: prakarsaId,
      pipelineId: pipelineId,
      codeTable: codeTable,
    ));

    res.fold(
      (l) => _showErrorDialog('Gagal memuat data'),
      (ritelPrakarsaPerorangan) {
        _ritelPrakarsaPerorangan = ritelPrakarsaPerorangan;
      },
    );
  }

  void navigateToPrakarsaDetailView() {
    _navigationService.navigateTo(
      Routes.prakarsaDetailsViewRitel,
      arguments: PrakarsaDetailsViewRitelArguments(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypeId,
        codeTable: codeTable,
      ),
    );
  }

  String? fileDraftPTK;
  String? fileDraftPTKPrivate;

  Future getDraftPTK() async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.fetchDraftPTK(
        prakarsaId: prakarsaId,
      ),
    );

    res.fold((error) => fileDraftPTK = '', (url) async {
      fileDraftPTKPrivate = url;
      final resPublicFile = await runBusyFuture(
        _ritelMasterAPI.getPublicFile(url),
      );

      resPublicFile.fold((error) => fileDraftPTK = '', (url) {
        fileDraftPTK = url;
        notifyListeners();
      });
    });
  }

  Future postSendToChecker() async {
    await getDraftPTK();
    final res = await _ritelPrakarsaAPI.sendToChecker(
      prakarsaId: prakarsaId,
      draftPTKPath: fileDraftPTKPrivate!,
    );

    res.fold(
      (error) => developer.log(error, name: 'ERROR TO CHECKER'),
      (result) async {
        await fetchStatusPengajuan();
        if (codeTable == Common.CodeTable.Perorangan ||
            codeTable == Common.CodeTable.PARI) {
          await fetchInfoPrakarsaPerorangan();
        } else {
          await fetchInfoPrakarsaPTCV();
        }
        await fetchPrakarsaById();
        notifyListeners();
      },
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

  void navigateToPrakarsaList() {
    _navigationService.clearStackAndShow(
      Routes.mainView,
      arguments: const MainViewArguments(
        index: 2,
        prakarsaTabsIndex: 1,
      ),
    );
  }
}

// ignore_for_file: newline-before-return, unused_element

import 'dart:developer' as developer;

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../../application/models/ritel_legalitas_usaha.dart';
import '../../../../../../../../application/models/ritel_legalitas_usaha_lainnya.dart';
import '../../../../../../../../application/models/ritel_legalitas_usaha_utama.dart';
import '../../../../../../../../application/models/ritel_prakarsa_perorangan.dart';
import '../../../../../../../../application/services/url_launcher_service.dart';
import '../../../../../../../../infrastructure/apis/ritel_legalitas_usaha_api.dart';
import '../../../../../../../../infrastructure/apis/ritel_master_api.dart';

class LegalitasUsahaPariViewModel extends FutureViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  final RitelLegalitasUsahaAPI _ritelLegalitasUsahaAPI =
      locator<RitelLegalitasUsahaAPI>();
  final _ritelMasterAPI = locator<RitelMasterAPI>();
  final _urlLauncherService = locator<URLLauncherService>();

  String prakarsaId;
  RitelPrakarsaPerorangan ritelPrakarsaPerorangan;
  String pipelineId;
  int loanTypesId;
  RitelLegalitasUsahaUtama? mainDocument;
  RitelLegalitasUsahaLainnya? additionalDocument;
  final int codeTable;

  LegalitasUsahaPariViewModel({
    required this.prakarsaId,
    required this.ritelPrakarsaPerorangan,
    required this.pipelineId,
    required this.loanTypesId,
    this.mainDocument,
    this.additionalDocument,
    required this.codeTable,
  });

  bool? _isActiveGrid = true;
  bool? _isActiveList = false;

  bool? get isActiveGrid => _isActiveGrid;

  bool? get isActiveList => _isActiveList;

  RitelLegalitasUsaha? _ritelLegalitasUsaha;

  RitelLegalitasUsaha? get ritelLegalitasUsaha => _ritelLegalitasUsaha;

  @override
  Future futureToRun() async {
    await fetchLegalitasUsaha();
  }

  void changeToGridView() {
    _isActiveGrid = true;
    _isActiveList = false;
    notifyListeners();
  }

  void changeToListView() {
    _isActiveGrid = false;
    _isActiveList = true;
    notifyListeners();
  }

  Future fetchLegalitasUsaha() async {
    final res = await runBusyFuture(
      _ritelLegalitasUsahaAPI.fetchLegalitasUsaha(prakarsaId),
    );

    res.fold(
      (errorMessage) => developer.log(errorMessage),
      (ritelLegalitasUsaha) {
        _ritelLegalitasUsaha = ritelLegalitasUsaha;
      },
    );
  }

  void navigateToTambahDokumen() {
    _navigationService.navigateTo(
      Routes.tambahDokumenPariView,
      arguments: TambahDokumenPariViewArguments(
        prakarsaId: prakarsaId,
        // uploadDocFrom: uploadDocFrom,
        ritelPrakarsaPerorangan: ritelPrakarsaPerorangan,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        codeTable: codeTable,
      ),
    );
  }

  void navigateToUpdateDokumen({
    RitelLegalitasUsahaUtama? ritelLegalitasUsahaUtama,
    RitelLegalitasUsahaLainnya? ritelLegalitasUsahaLainnya,
    required int status,
  }) {
    if (ritelLegalitasUsahaUtama != null) {
      _navigationService.navigateTo(
        Routes.updateDokumenPariView,
        arguments: UpdateDokumenPariViewArguments(
          prakarsaId: prakarsaId,
          uploadDocFrom: 3,
          ritelLegalitasUsahaUtama: ritelLegalitasUsahaUtama,
          ritelLegalitasUsahaLainnya: null,
          ritelPrakarsaPerorangan: ritelPrakarsaPerorangan,
          pipelineId: pipelineId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      );
    } else {
      _navigationService.navigateTo(
        Routes.updateDokumenPariView,
        arguments: UpdateDokumenPariViewArguments(
          prakarsaId: prakarsaId,
          uploadDocFrom: 3,
          ritelLegalitasUsahaUtama: null,
          ritelLegalitasUsahaLainnya: ritelLegalitasUsahaLainnya,
          ritelPrakarsaPerorangan: ritelPrakarsaPerorangan,
          pipelineId: pipelineId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      );
    }
  }

  Future deleteDokumen({
    RitelLegalitasUsahaUtama? ritelLegalitasUsahaUtama,
    RitelLegalitasUsahaLainnya? ritelLegalitasUsahaLainnya,
  }) async {
    Map<String, String> payload = {};
    if (ritelLegalitasUsahaUtama != null) {
      if (ritelLegalitasUsahaUtama.type == 'others akta') {
        payload.addAll({
          'prakarsaId': prakarsaId,
          'docName': 'others',
          'path': ritelLegalitasUsahaUtama.path!,
        });
      } else {
        payload.addAll({
          'prakarsaId': prakarsaId,
          'docName': ritelLegalitasUsahaUtama.type!,
          'path': '',
        });
      }
    } else {
      payload.addAll({
        'prakarsaId': prakarsaId,
        'docName': 'additional',
        'path': ritelLegalitasUsahaLainnya!.path!,
      });
    }

    final res = await runBusyFuture(
      _ritelLegalitasUsahaAPI.deleteDocumentPari(payload),
    );

    res.fold(
      (errorMessage) => developer.log(errorMessage),
      (successMessage) => _showSuccessDialog('Berhasil menghapus dokumen!'),
    );
  }

  Future _showSuccessDialog(String successMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    _navigationService.navigateTo(
      Routes.legalitasUsahaPariView,
      arguments: LegalitasUsahaPariViewArguments(
        prakarsaId: prakarsaId,
        ritelPrakarsaPerorangan: ritelPrakarsaPerorangan,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: 1,
        codeTable: codeTable,
      ),
      preventDuplicates: false,
    );
  }

  void navigateToInfoPrakarsa() {
    if (loanTypesId == 2) {
      _navigationService.navigateTo(
        Routes.prakarsaDetailsViewRitel,
        arguments: PrakarsaDetailsViewRitelArguments(
          index: 1,
          prakarsaId: prakarsaId,
          pipelineId: ritelPrakarsaPerorangan.id!,
          loanTypesId: loanTypesId,
          codeTable: 4,
        ),
      );
    } else {
      _navigationService.navigateTo(
        Routes.prakarsaDetailsViewRitel,
        arguments: PrakarsaDetailsViewRitelArguments(
          index: 1,
          prakarsaId: prakarsaId,
          pipelineId: ritelPrakarsaPerorangan.id!,
          loanTypesId: loanTypesId,
          codeTable: codeTable,
        ),
      );
    }
  }

  // Future savePDFToDevice(
  //   RitelLegalitasUsahaUtama? ritelLegalitasUsahaUtama,
  //   RitelLegalitasUsahaLainnya? ritelLegalitasUsahaLainnya,
  // ) async {
  //   if (ritelLegalitasUsahaUtama != null) {
  //     if (Platform.isAndroid) {
  //       final allowWriteFile = await _requestWritePermission();

  //       if (allowWriteFile) {
  //         try {
  //           final file = await _writeToFile(ritelLegalitasUsahaUtama, null);
  //           if (file != null) {
  //             await _dialogService.showCustomDialog(
  //               variant: DialogType.base,
  //               title: 'File Tersimpan',
  //               description:
  //                   'Silahkan buka folder Download di device Android Anda untuk menemukan file legalitas usaha yang baru saja disimpan.',
  //               mainButtonTitle: 'OK',
  //             );
  //           }
  //         } catch (e) {
  //           _showErrorDialog(e.toString());
  //         }
  //       }
  //     } else {
  //       await _dialogService.showCustomDialog(
  //         variant: DialogType.base,
  //         title: 'Fitur Tidak Tersedia',
  //         description:
  //             'Mohon maaf, saat ini fitur simpan file tidak tersedia untuk pengguna iOS.',
  //         mainButtonTitle: 'OK',
  //       );
  //     }
  //   } else {
  //     if (Platform.isAndroid) {
  //       final allowWriteFile = await _requestWritePermission();

  //       if (allowWriteFile) {
  //         try {
  //           final file = await _writeToFile(null, ritelLegalitasUsahaLainnya);
  //           if (file != null) {
  //             await _dialogService.showCustomDialog(
  //               variant: DialogType.base,
  //               title: 'File Tersimpan',
  //               description:
  //                   'Silahkan buka folder Download di device Android Anda untuk menemukan file legalitas usaha yang baru saja disimpan.',
  //               mainButtonTitle: 'OK',
  //             );
  //           }
  //         } catch (e) {
  //           _showErrorDialog(e.toString());
  //         }
  //       }
  //     } else {
  //       await _dialogService.showCustomDialog(
  //         variant: DialogType.base,
  //         title: 'Fitur Tidak Tersedia',
  //         description:
  //             'Mohon maaf, saat ini fitur simpan file tidak tersedia untuk pengguna iOS.',
  //         mainButtonTitle: 'OK',
  //       );
  //     }
  //   }
  // }

  // Future<bool> _requestWritePermission() async {
  //   var status = await Permission.storage.status;
  //   if (status != PermissionStatus.granted) {
  //     status = await Permission.storage.request();
  //   }
  //   return status == PermissionStatus.granted;
  // }

  // Future<File?> _writeToFile(
  //   RitelLegalitasUsahaUtama? ritelLegalitasUsahaUtama,
  //   RitelLegalitasUsahaLainnya? ritelLegalitasUsahaLainnya,
  // ) async {
  //   final downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;

  //   if (ritelLegalitasUsahaUtama != null) {
  //     await getPublicFile(ritelLegalitasUsahaUtama.path!);
  //     final fileBytes = await urlToFile(mainDoc!);
  //     if (ritelLegalitasUsahaUtama.fileType == 'jpg' ||
  //         ritelLegalitasUsahaUtama.fileType == 'jpeg' ||
  //         ritelLegalitasUsahaUtama.fileType == 'png') {
  //       final file = File(
  //         '${downloadsDirectory!.path}/legalitas_usaha_${ritelLegalitasUsahaUtama.number!.split(' ').join()}.${ritelLegalitasUsahaUtama.fileType!}',
  //       )..writeAsBytesSync(fileBytes.readAsBytesSync());
  //       return file;
  //     } else {
  //       final file = File(
  //         '${downloadsDirectory!.path}/legalitas_usaha_${ritelLegalitasUsahaUtama.number!.split(' ').join()}.pdf',
  //       )..writeAsBytesSync(fileBytes.readAsBytesSync());
  //       return file;
  //     }
  //   } else {
  //     final fileBytes = await urlToFile(additionalDoc!);
  //     if (ritelLegalitasUsahaLainnya?.fileType == 'jpg' ||
  //         ritelLegalitasUsahaLainnya?.fileType == 'jpeg' ||
  //         ritelLegalitasUsahaLainnya?.fileType == 'png') {
  //       final file = File(
  //         '${downloadsDirectory!.path}/Legalitas_Usaha_${ritelLegalitasUsahaLainnya?.docName!.split(' ').join()}.${ritelLegalitasUsahaLainnya?.fileType!}',
  //       )..writeAsBytesSync(fileBytes.readAsBytesSync());
  //       return file;
  //     } else {
  //       final file = File(
  //         '${downloadsDirectory!.path}/Legalitas_Usaha_${ritelLegalitasUsahaLainnya?.docName!.split(' ').join()}.pdf',
  //       )..writeAsBytesSync(fileBytes.readAsBytesSync());
  //       return file;
  //     }
  //   }
  // }

  void savePDFToDevice(
    RitelLegalitasUsahaUtama? ritelLegalitasUsahaUtama,
    RitelLegalitasUsahaLainnya? ritelLegalitasUsahaLainnya,
    String path,
  ) async {
    if (ritelLegalitasUsahaUtama != null) {
      await getPublicFileMain(path);
      _urlLauncherService.browse(mainDoc!);
    }

    if (ritelLegalitasUsahaLainnya != null) {
      await getPublicFileAdditional(path);
      _urlLauncherService.browse(additionalDoc!);
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

  String? mainDoc;

  Future<String> getPublicFileMain(String path) async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(path),
    );

    res.fold(
      (err) => mainDoc = '',
      (success) => mainDoc = success,
    );

    return mainDoc!;
  }

  String? additionalDoc;

  Future<String> getPublicFileAdditional(String path) async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(path),
    );

    res.fold(
      (err) => additionalDoc = '',
      (success) => additionalDoc = success,
    );

    return additionalDoc!;
  }
}

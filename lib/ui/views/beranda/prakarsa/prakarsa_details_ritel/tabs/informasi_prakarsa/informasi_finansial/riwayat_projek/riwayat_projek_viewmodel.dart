// ignore_for_file: unnecessary_null_comparison, no_leading_underscores_for_local_identifiers


import 'package:file_picker/file_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../../../application/models/ritel_riwayat_projek.dart';
import '../../../../../../../../../application/services/media_service.dart';
import '../../../../../../../../../application/services/url_launcher_service.dart';
import '../../../../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../../../../infrastructure/apis/ritel_riwayat_projek_api.dart';
import '../../../../../../../../../infrastructure/apis/ritel_upload_file_api.dart';

class RiwayatProyekViewModel extends BaseViewModel {
  final _mediaService = locator<MaksimaMediaService>();
  final _ritelUploadFileAPI = locator<RitelUploadFileAPI>();
  final _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final RitelRiwayatProyekAPI _ritelPrakarsaRiwayatProyekApi =
      locator<RitelRiwayatProyekAPI>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();
  final _urlLauncherService = locator<URLLauncherService>();

  String prakarsaId;
  RitelRiwayatProjek? ritelRiwayatProjek;
  String pipelineId;
  int loanTypesId;
  int status;
  final int codeTable;

  RiwayatProyekViewModel({
    required this.prakarsaId,
    this.ritelRiwayatProjek,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  Future initialize() async {
    setBusy(true);
    // if (ritelRiwayatProjek != null) {
    //   fileRiwayatProjek = await urlToFileExcelRiwayatProjek(
    //     await getPublicFile(
    //       ritelRiwayatProjek!.pathRiwayatProject!,
    //     ),
    //   );
    //   namePath = ritelRiwayatProjek!.namePath!;
    // }
    setBusy(false);
  }

  PlatformFile? fileRiwayatProjek;
  String? namePath = 'Riwayat-proyek.xlsx';

  Future pickFile() async {
    final res =
        await _mediaService.getMultiFileType(allowedExtensions: const ['xlsx']);
    if (res != null) {
      fileRiwayatProjek = res;
      notifyListeners();
    }
  }

  Future clearRiwayatProjek() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File Riwayat Proyek',
      description: 'Anda yakin akan menghapus File ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fileRiwayatProjek = null;
      notifyListeners();
    }
  }

  void uploadFileRiwayatProyek() async {
    final res = await runBusyFuture(
      _ritelUploadFileAPI.uploadFileRiwayatProyekAlon(
        file: fileRiwayatProjek!,
        prakarsaId: prakarsaId,
        codeTable: codeTable,
      ),
    );

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) => _showSuccessDialog('Berhasil menambahkan riwayat projek'),
    );
  }

  Future _showSuccessDialog(String successMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    final res = await runBusyFuture(_ritelPrakarsaRiwayatProyekApi
        .fetchRiwayatProyek(prakarsaId, codeTable));

    res.fold(
      (error) => _showErrorDialog(error),
      (ritelRiwayatProjek) => _navigationService.navigateTo(
        Routes.riwayatProjekDetails,
        arguments: RiwayatProjekDetailsArguments(
          ritelRiwayatProjek: ritelRiwayatProjek,
          pipelineId: pipelineId,
          loanTypesId: loanTypesId,
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

  void navigateBack() => _navigationService.navigateTo(
        Routes.informasiFinansialView,
        arguments: InformasiFinansialViewArguments(
          prakarsaId: prakarsaId,
          pipelineId: pipelineId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      );

  // Future downloadRiwayatProjekTemplate() async {
  //   if (Platform.isAndroid) {
  //     final allowWriteFile = await _requestWritePermission();

  //     if (allowWriteFile) {
  //       try {
  //         final file = await _writeToFile();
  //         if (file != null) {
  //           await _dialogService.showCustomDialog(
  //             variant: DialogType.base,
  //             title: 'File Tersimpan',
  //             description:
  //                 'Silahkan buka folder Download di device Android Anda untuk menemukan file riwayat projek yang baru saja disimpan.',
  //             mainButtonTitle: 'OK',
  //           );
  //         }
  //       } catch (e) {
  //         _showErrorDialog(e.toString());
  //       }
  //     }
  //   } else {
  //     await _dialogService.showCustomDialog(
  //       variant: DialogType.base,
  //       title: 'Fitur Tidak Tersedia',
  //       description:
  //           'Mohon maaf, saat ini fitur simpan file tidak tersedia untuk pengguna iOS.',
  //       mainButtonTitle: 'OK',
  //     );
  //   }
  // }

  // Future<bool> _requestWritePermission() async {
  //   var status = await Permission.storage.status;
  //   if (status != PermissionStatus.granted) {
  //     status = await Permission.storage.request();
  //   }
  //   // ignore: newline-before-return
  //   return status == PermissionStatus.granted;
  // }

  // Future<File?> _writeToFile() async {
  //   final downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
  //   String fileUrl =
  //       'https://storage.googleapis.com/bridgtl-prt-d-bkt-apps/dev1/file/Template-Riwayat-Projek.xlsx';
  //   final fileBytes = await urlToFileExcelRiwayatProjek(fileUrl);
  //   final file =
  //       File('${downloadsDirectory!.path}/template-riwayat-projek.xlsx')
  //         ..writeAsBytes(fileBytes.readAsBytesSync());
  //   // ignore: newline-before-return
  //   return file;
  // }

  void downloadRiwayatProjekTemplate() {
    _urlLauncherService.browse(
      'https://storage.googleapis.com/bridgtl-prt-d-bkt-apps/dev1/file/Template-Riwayat-Projek.xlsx',
    );
  }

  Future<String> getPublicFile(String url) async {
    String _tempUrl = '';
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(url),
    );

    res.fold(
      (err) => _tempUrl = '',
      (success) => _tempUrl = success,
    );

    return _tempUrl;
  }
}

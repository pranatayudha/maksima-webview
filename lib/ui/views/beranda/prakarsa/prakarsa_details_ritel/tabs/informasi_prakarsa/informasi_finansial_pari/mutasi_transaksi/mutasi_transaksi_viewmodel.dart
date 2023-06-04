// ignore_for_file: prefer_conditional_assignment

import 'dart:developer' as dev;

import 'package:file_picker/file_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../../../application/models/ritel_mutasi_transaksi_pari.dart';
import '../../../../../../../../../application/services/media_service.dart';
import '../../../../../../../../../application/services/url_launcher_service.dart';
import '../../../../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../../../../infrastructure/apis/ritel_prakarsa_api.dart';
import '../../../../../../../../../infrastructure/apis/ritel_upload_file_api.dart';

class MutasiTransaksiPariViewModel extends BaseViewModel {
  final _mediaService = locator<MaksimaMediaService>();
  final _ritelUploadFileAPI = locator<RitelUploadFileAPI>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _ritelMasterAPI = locator<RitelMasterAPI>();
  final _ritelPrakarsaAPI = locator<RitelPrakarsaAPI>();
  final _urlLauncherService = locator<URLLauncherService>();

  String prakarsaId;
  RitelMutasiTransaksiPariModel? mutasiTransaksiPariModel;
  String pipelineId;
  int loanTypesId;
  int status;
  final int codeTable;

  MutasiTransaksiPariViewModel({
    required this.prakarsaId,
    this.mutasiTransaksiPariModel,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  Future initialize() async {
    setBusy(true);
    if (mutasiTransaksiPariModel != null) {
      namePath = mutasiTransaksiPariModel!.data!.transaksi!.pathUrl!
          .split('PARI')
          .last;
      // fileMutasiTransaksi ??= await urlToFileExcelPopulate(
      //   await getPublicFile(
      //     mutasiTransaksiPariModel!.data!.transaksi!.pathUrl!,
      //   ),
      // );

      dev.log(fileMutasiTransaksi.toString());
    }
    setBusy(false);
  }

  PlatformFile? fileMutasiTransaksi;
  String? namePath;

  Future pickFile() async {
    final res = await _mediaService.getMultiFileType(allowedExtensions: const ['xlsx']);
    // namePath = res!.path.split('/').last;
    fileMutasiTransaksi = res;
    notifyListeners();
  }

  void uploadFileMutasiTransaksi() async {
    final res = await runBusyFuture(
      _ritelUploadFileAPI.uploadFileMutasiTransaksiPari(
        file: fileMutasiTransaksi!,
        prakarsaId: prakarsaId,
      ),
    );

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) => _showSuccessDialog('Berhasil menambahkan Mutasi Transaksi'),
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

  Future<String> getPublicFile(String url) async {
    String tempUrl = '';
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(url),
    );

    res.fold(
      (err) => tempUrl = '',
      (success) => tempUrl = success,
    );

    return tempUrl;
  }

  Future _showSuccessDialog(String successMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    final res = await runBusyFuture(
      _ritelPrakarsaAPI.fetchMutasiTransaksiPari(prakarsaId),
    );

    res.fold(
      (error) => _showErrorDialog(error),
      (result) => _navigationService.navigateTo(
        Routes.mutasiTransaksiDetail,
        arguments: MutasiTransaksiDetailArguments(
          ritelMutasiTransaksiPariModel: result,
          pipelineId: pipelineId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      ),
    );
  }

  Future clearMutasiTransaksi() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus File Mutasi Transaksi',
      description: 'Anda yakin akan menghapus File ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      fileMutasiTransaksi = null;
      notifyListeners();
    }
  }

  // Future downloadMutasiTransaksiTemplate(String url) async {
  //   if (Platform.isAndroid) {
  //     final allowWriteFile = await _requestWritePermission();

  //     if (allowWriteFile) {
  //       try {
  //         final file = await _writeToFile(url);
  //         if (file != null) {
  //           await _dialogService.showCustomDialog(
  //             variant: DialogType.base,
  //             title: 'File Tersimpan',
  //             description:
  //                 'Silahkan buka folder Download di device Android Anda untuk menemukan file mutasi transaksi yang baru saja disimpan.',
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

  // Future<File?> _writeToFile(String url) async {
  //   final downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
  //   String fileUrl = await getPublicFile(url);
  //   final fileBytes = await urlToFileExcelMutasiTransaksi(fileUrl);
  //   // ignore: newline-before-return
  //   return File('${downloadsDirectory!.path}/mutasi_transaksi.xlsx')
  //     ..writeAsBytes(fileBytes.readAsBytesSync());
  // }

  void downloadMutasiTransaksiTemplate(String url) {
    _urlLauncherService.browse(url);
  }

  void navigateBack() => _navigationService.navigateTo(
        Routes.informasiFinansialViewPari,
        arguments: InformasiFinansialViewPariArguments(
          prakarsaId: prakarsaId,
          pipelineId: pipelineId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
      );
}

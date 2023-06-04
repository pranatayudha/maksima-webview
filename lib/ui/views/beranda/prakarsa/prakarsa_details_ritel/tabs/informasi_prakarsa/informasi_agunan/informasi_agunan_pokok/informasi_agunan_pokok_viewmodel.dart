// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../../../application/helpers/initial_code_table_formatter.dart';
import '../../../../../../../../../application/helpers/thousands_separator_input_formatter.dart';
import '../../../../../../../../../application/models/ritel_prakarsa_agunan_pokok.dart';
import '../../../../../../../../../application/models/ritel_prakarsa_agunan_pokok_detail.dart';
import '../../../../../../../../../application/services/media_service.dart';
import '../../../../../../../../../application/services/url_launcher_service.dart';
import '../../../../../../../../../infrastructure/apis/ritel_informasi_agunan_pokok_api.dart';
import '../../../../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../../../../infrastructure/apis/ritel_upload_file_api.dart';

class InformasiAgunanPokokViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _mediaService = locator<MaksimaMediaService>();
  final _ritelUploadFileAPI = locator<RitelUploadFileAPI>();
  final _urlLauncher = locator<URLLauncherService>();
  final jenisAgunanPokokController = TextEditingController();
  final numberFormatter = ThousandsSeparatorInputFormatter();
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;
  final RitelInformasiAgunanPokokAPI _ritelPrakarsaAgunanPokokApi =
      locator<RitelInformasiAgunanPokokAPI>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();

  static const agunanPokokBusyObject = 'agunan-pokok';
  static const agunanPokokDetailBusyObject = 'agunan-pokok-detail';
  static const agunanPokokFormBusyObject = 'agunan-pokok-form';
  static const agunanPokokUploadFileBusyObject = 'agunan-pokok-upload-file';
  static const agunanPokokDeleteBusyObject = 'agunan-pokok-delete';
  static const agunanPokokDownloadTemplateBusyObject =
      'agunan-pokok-download-template';

  String prakarsaId;
  RitelPrakarsaAgunanPokokDetail? agunanPokokDetail;
  String pipelineId;
  int loanTypesId;
  int status;
  String? url;
  final int codeTable;

  InformasiAgunanPokokViewModel({
    required this.prakarsaId,
    this.agunanPokokDetail,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    this.url,
    required this.codeTable,
  });

  String prakarsaType = '';

  Future initialize() async {
    setBusy(true);

    prakarsaType = InitialCodeTableFormatter.getPrakarsaType(codeTable);
    await fetchAgunanPokokList();
    if (agunanPokokDetail != null) {
      await fetchAgunanPokokDetail(int.parse(agunanPokokDetail!.id!));
      await _prepopulateTextField();
      if (url != null) {
        await getPublicFile(url!);
      }
    }
    setBusy(false);
  }

  Future _prepopulateTextField() async {
    if (agunanPokokDetail!.jenisAgunanPokok == 193) {
      updateJenisAgunanPokokController('Persediaan');
    } else if (agunanPokokDetail!.jenisAgunanPokok == 250) {
      updateJenisAgunanPokokController('Piutang');
    }

    if (agunanPokokDetail!.totalNilaiPasarWajarAgunan != null) {
      updateNominalTotalNilaiPasarWajarAgunanController(
        double.parse(agunanPokokDetail!.totalNilaiPasarWajarAgunan!)
            .toInt()
            .toString(),
      );
    }

    if (agunanPokokDetail!.nominalTotalPiutang != null) {
      updateNominalTotalPiutangController(
        double.parse(agunanPokokDetail!.nominalTotalPiutang!)
            .toInt()
            .toString(),
      );
    }

    if (agunanPokokDetail!.jenisPengikatan != null) {
      updateJenisPengikatanController(agunanPokokDetail!.jenisPengikatan!);
    }

    if (agunanPokokDetail!.NPW != null) {
      updateNominalNPWController(
        double.parse(agunanPokokDetail!.NPW!).toInt().toString(),
      );
    }

    if (agunanPokokDetail!.NL != null) {
      updateNominalNLController(
        double.parse(agunanPokokDetail!.NL!).toInt().toString(),
      );
    }

    if (agunanPokokDetail!.PNPW != null) {
      updateNominalPNPWController(
        double.parse(agunanPokokDetail!.PNPW!).toInt().toString(),
      );
    }

    if (agunanPokokDetail!.PNL != null) {
      updateNominalPNLController(
        double.parse(agunanPokokDetail!.PNL!).toInt().toString(),
      );
    }

    if (agunanPokokDetail!.nilaiPengikatan != null) {
      updateNominalNilaiPengikatanController(
        double.parse(agunanPokokDetail!.nilaiPengikatan!).toInt().toString(),
      );
    }
    if ((agunanPokokDetail?.pathFotoAgunanPersediaan ?? []).isNotEmpty) {
      String _tempUrl =
          await getPublicFile(agunanPokokDetail!.pathFotoAgunanPersediaan![0]);
      uploadFotoAgunanPersediaanUrl = _tempUrl;
      // uploadFotoAgunanPersediaanFile = await urlToFile(_tempUrl);
      notifyListeners();
    }

    if (agunanPokokDetail!.pathUploadExcel != null) {
      _uploadedDokumenFileName = agunanPokokDetail!.pathUploadExcel!.substring(
        agunanPokokDetail!.pathUploadExcel!.indexOf(
              '.',
              agunanPokokDetail!.pathUploadExcel!.indexOf('/file/'),
            ) +
            1,
      );
    }
  }

  String? _uploadedDokumenFileName;

  String? get uploadedDokumenFileName => _uploadedDokumenFileName;

  String? _uploadedDokumenFotoName;

  String? get uploadedDokumenFotoName => _uploadedDokumenFotoName;

  String? documentType;

  List<RitelPrakarsaAgunanPokok>? _ritelPrakarsaAgunanPokokList;

  List<RitelPrakarsaAgunanPokok>? get ritelPrakarsaAgunanPokokList =>
      _ritelPrakarsaAgunanPokokList;

  Future fetchAgunanPokokList() async {
    _ritelPrakarsaAgunanPokokList = await runBusyFuture(
      _ritelPrakarsaAgunanPokokApi.fetchAgunanPokok(
        prakarsaId: prakarsaId,
        prakarsaType: prakarsaType,
      ),
      busyObject: agunanPokokBusyObject,
    );
  }

  RitelPrakarsaAgunanPokokDetail? _ritelPrakarsaAgunanPokokDetail;

  RitelPrakarsaAgunanPokokDetail? get ritelPrakarsaAgunanPokokDetail =>
      _ritelPrakarsaAgunanPokokDetail;

  Future fetchAgunanPokokDetail(int id) async {
    final res = await runBusyFuture(
      _ritelPrakarsaAgunanPokokApi.fetchAgunanPokokDetail(
        id: id,
        prakarsaId: prakarsaId,
        prakarsaType: prakarsaType,
      ),
      busyObject: agunanPokokDetailBusyObject,
    );

    _ritelPrakarsaAgunanPokokDetail = res;
    urlPublic = '';
    if (_ritelPrakarsaAgunanPokokDetail!.pathUploadExcel != null) {
      _uploadedDokumenFileName = getUploadedDokumenFileName(
        _ritelPrakarsaAgunanPokokDetail!.pathUploadExcel!,
      );
      urlPublic = await getPublicFile(
        _ritelPrakarsaAgunanPokokDetail!.pathUploadExcel!,
      );
      notifyListeners();
    }
    documentType = _ritelPrakarsaAgunanPokokDetail?.jenisAgunanPokok != 250
        ? 'Persediaan'
        : 'Piutang';
    if (_ritelPrakarsaAgunanPokokDetail!.pathFotoAgunanPersediaan != null) {
      // listFileFotoPersediaan.clear();
      listPathFotoPersediaan.clear();
      listPathFotoPersediaanPublic.clear();

      for (String path
          in _ritelPrakarsaAgunanPokokDetail!.pathFotoAgunanPersediaan!) {
        String temp = await getPublicFoto(path);
        // listFileFotoPersediaan.add(await urlToFile(temp));
        listPathFotoPersediaan.add(path);
        listPathFotoPersediaanPublic.add(temp);
        notifyListeners();
      }
    }

    notifyListeners();
  }

  Future deleteAgunanPokok(int id) async {
    final res = await runBusyFuture(
      _ritelPrakarsaAgunanPokokApi.deleteAgunanPokok(
        id: id,
        prakarsaId: prakarsaId,
        prakarsaType: prakarsaType,
      ),
      busyObject: agunanPokokDeleteBusyObject,
    );

    res.fold(
      (l) => _showErrorDialog(l),
      (r) => _showSuccessDialog(
        'Berhasil menghapus Informasi Agunan Pokok.',
        true,
      ),
    );
    // _navigationService.navigateTo(
    //   Routes.informasiAgunanViewRitel,
    //   arguments: InformasiAgunanViewRitelArguments(
    //     prakarsaId: prakarsaId,
    //     pipelineId: pipelineId,
    //     loanTypesId: loanTypesId,
    //     status: status,
    //     codeTable: codeTable,
    //   ),
    // );
  }

  Future _showSuccessDialog(
    String successMessage,
    bool isContinue,
  ) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    if (isContinue) {
      _navigationService.navigateTo(
        Routes.informasiAgunanViewRitel,
        arguments: InformasiAgunanViewRitelArguments(
          prakarsaId: prakarsaId,
          pipelineId: pipelineId,
          loanTypesId: loanTypesId,
          status: status,
          codeTable: codeTable,
        ),
        preventDuplicates: false,
      );
    }
  }

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Gagal',
      description: errorMessage,
      mainButtonTitle: 'COBA LAGI',
    );
  }

  Future downloadDokumenRincianTemplate(String jenisAgunanPokok) async {
    final url = jenisAgunanPokok == 'Persediaan'
        ? 'https://storage.googleapis.com/bridgtl-prt-d-bkt-apps/dev1/file/Tamplate-Persediaan.xlsx'
        : 'https://storage.googleapis.com/bridgtl-prt-d-bkt-apps/dev1/file/Template-Piutang.xlsx';

    _urlLauncher.browse(url);
  }

  PlatformFile? dokumen;

  Future pickFile({required int jenisAgunanPokok, int? idAgunanPokok}) async {
    final res =
        await _mediaService.getMultiFileType(allowedExtensions: const ['xlsx']);

    if (res != null) {
      dokumen = res;
      uploadFile(
        file: dokumen!,
        jenisAgunanPokok: jenisAgunanPokok,
        idAgunanPokok: idAgunanPokok,
      );
      notifyListeners();
    }
  }

  Future uploadFile({
    required PlatformFile file,
    required int jenisAgunanPokok,
    int? idAgunanPokok,
  }) async {
    final res = await runBusyFuture(
      _ritelUploadFileAPI.uploadDokumenAgunanPokok(
        file: file,
        prakarsaId: prakarsaId,
        jenisAgunanPokok: jenisAgunanPokok,
        idAgunanPokok: idAgunanPokok,
        prakarsaType: prakarsaType,
      ),
      busyObject: agunanPokokUploadFileBusyObject,
    );

    await res.fold(
      (errorMessage) async => await _showErrorDialog(errorMessage),
      (idAgunanPokok) async => await loadFormAgunanPokokData(idAgunanPokok),
    );
  }

  Future saveAgunanPokok(
    RitelPrakarsaAgunanPokokDetail _agunanPokokDetail,
    NavigatorState navigator,
  ) async {
    List<String?> temp = [];
    if (jenisAgunanPokokController.text == documentType) {
      int? jenisAgunanPokokId;

      if (jenisAgunanPokokController.text == 'Persediaan') {
        jenisAgunanPokokId = 193;
        temp = listPathFotoPersediaan;
        temp.removeWhere((path) => path == null);
      } else if (jenisAgunanPokokController.text == 'Piutang') {
        jenisAgunanPokokId = 250;
      }

      final Map<String, dynamic> data = {
        'id': int.parse(_agunanPokokDetail.id!),
        'prakarsaId': _agunanPokokDetail.prakarsaId!,
        'jenisAgunanPokok': jenisAgunanPokokId,
        'jenisPengikatan': jenisPengikatanController.text,
        'NPW': nominalNPWController.value.text.replaceAll('.', ''),
        'NL': int.parse(nominalNLController.value.text.replaceAll('.', '')),
        'PNPW': int.parse(nominalPNPWController.value.text.replaceAll('.', '')),
        'PNL': int.parse(nominalPNLController.value.text.replaceAll('.', '')),
        'nilaiPengikatan': int.parse(
          nominalNilaiPengikatanController.value.text.replaceAll('.', ''),
        ),
        'pathFotoAgunanPersediaan': jenisAgunanPokokId != 250 ? temp : '',
      };

      final res = await runBusyFuture(
        _ritelPrakarsaAgunanPokokApi.saveAgunanPokok(
          data,
          prakarsaType,
        ),
        busyObject: agunanPokokFormBusyObject,
      );

      await res.fold(
        (errorMessage) async => await _showErrorDialog(errorMessage),
        (success) async {
          await _showSuccessDialog(
            'Berhasil menyimpan Informasi Agunan Pokok.',
            true,
          );
        },
      );
    } else {
      await _showErrorDialog('Dokumen yang di Upload tidak sesuai');
    }
  }

  void unselectUploadedDokumen() {
    _uploadedDokumenFileName = null;
    notifyListeners();
  }

  Future loadFormAgunanPokokData(int agunanPokokId) async {
    await fetchAgunanPokokDetail(agunanPokokId);
    final agunanPokokDetail = ritelPrakarsaAgunanPokokDetail!;

    if (agunanPokokDetail.jenisAgunanPokok == 193) {
      documentType = 'Persediaan';
      updateJenisAgunanPokokController('Persediaan');
    } else if (agunanPokokDetail.jenisAgunanPokok == 250) {
      documentType = 'Piutang';
      updateJenisAgunanPokokController('Piutang');
    }

    if (agunanPokokDetail.totalNilaiPasarWajarAgunan != null) {
      updateNominalTotalNilaiPasarWajarAgunanController(
        double.parse(agunanPokokDetail.totalNilaiPasarWajarAgunan!)
            .toInt()
            .toString(),
      );
    }

    if (agunanPokokDetail.nominalTotalPiutang != null) {
      updateNominalTotalPiutangController(
        double.parse(agunanPokokDetail.nominalTotalPiutang!).toInt().toString(),
      );
    }

    if (agunanPokokDetail.jenisPengikatan != null) {
      updateJenisPengikatanController(agunanPokokDetail.jenisPengikatan!);
    }

    if (agunanPokokDetail.NPW != null) {
      updateNominalNPWController(
        double.parse(agunanPokokDetail.NPW!).toInt().toString(),
      );
    }

    if (agunanPokokDetail.NL != null) {
      updateNominalNLController(
        double.parse(agunanPokokDetail.NL!).toInt().toString(),
      );
    }

    if (agunanPokokDetail.PNPW != null) {
      updateNominalPNPWController(
        double.parse(agunanPokokDetail.PNPW!).toInt().toString(),
      );
    }

    if (agunanPokokDetail.PNL != null) {
      updateNominalPNLController(
        double.parse(agunanPokokDetail.PNL!).toInt().toString(),
      );
    }

    if (agunanPokokDetail.nilaiPengikatan != null) {
      updateNominalNilaiPengikatanController(
        double.parse(agunanPokokDetail.nilaiPengikatan!).toInt().toString(),
      );
    }

    if (agunanPokokDetail.pathUploadExcel != null) {
      _uploadedDokumenFileName = agunanPokokDetail.pathUploadExcel!.substring(
        agunanPokokDetail.pathUploadExcel!.indexOf(
              '.',
              agunanPokokDetail.pathUploadExcel!.indexOf('/file/'),
            ) +
            1,
      );
    }
  }

  String getUploadedDokumenFileName(String url) {
    try {
      var length =
          _ritelPrakarsaAgunanPokokDetail!.pathUploadExcel!.split('.').length;
      var test = _ritelPrakarsaAgunanPokokDetail!.pathUploadExcel!.split('.');
      // ignore: prefer-conditional-expressions
      if (length == 4) {
        return '${test[3]}.xlsx';
      } else {
        return '${test[4]}.xlsx';
      }
    } catch (e) {
      return '-';
    }
  }

  Future<String> _getPublicFile(String url) async {
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

  void updateJenisAgunanPokokController(String val) {
    jenisAgunanPokokController.text = val;
    notifyListeners();
  }

  final jenisPengikatanController = TextEditingController();

  void updateJenisPengikatanController(String val) {
    jenisPengikatanController.text = val;
    notifyListeners();
  }

  final nominalTotalNilaiPasarWajarAgunanController = TextEditingController();

  void updateNominalTotalNilaiPasarWajarAgunanController(String val) =>
      nominalTotalNilaiPasarWajarAgunanController.value =
          numberFormatter.formatEditUpdate(
        TextEditingValue.empty,
        nominalTotalNilaiPasarWajarAgunanController.value.copyWith(
          text: val,
          selection: TextSelection(
            baseOffset: val.length,
            extentOffset: val.length,
          ),
        ),
      );

  final nominalTotalPiutangController = TextEditingController();

  void updateNominalTotalPiutangController(String val) =>
      nominalTotalPiutangController.value = numberFormatter.formatEditUpdate(
        TextEditingValue.empty,
        nominalTotalPiutangController.value.copyWith(
          text: val,
          selection: TextSelection(
            baseOffset: val.length,
            extentOffset: val.length,
          ),
        ),
      );

  final nominalNPWController = TextEditingController();

  void updateNominalNPWController(String val) =>
      nominalNPWController.value = numberFormatter.formatEditUpdate(
        TextEditingValue.empty,
        nominalNPWController.value.copyWith(
          text: val,
          selection: TextSelection(
            baseOffset: val.length,
            extentOffset: val.length,
          ),
        ),
      );

  final nominalNLController = TextEditingController();

  void updateNominalNLController(String val) =>
      nominalNLController.value = numberFormatter.formatEditUpdate(
        TextEditingValue.empty,
        nominalNLController.value.copyWith(
          text: val,
          selection: TextSelection(
            baseOffset: val.length,
            extentOffset: val.length,
          ),
        ),
      );

  final nominalPNPWController = TextEditingController();

  void updateNominalPNPWController(String val) =>
      nominalPNPWController.value = numberFormatter.formatEditUpdate(
        TextEditingValue.empty,
        nominalPNPWController.value.copyWith(
          text: val,
          selection: TextSelection(
            baseOffset: val.length,
            extentOffset: val.length,
          ),
        ),
      );

  final nominalPNLController = TextEditingController();

  void updateNominalPNLController(String val) =>
      nominalPNLController.value = numberFormatter.formatEditUpdate(
        TextEditingValue.empty,
        nominalPNLController.value.copyWith(
          text: val,
          selection: TextSelection(
            baseOffset: val.length,
            extentOffset: val.length,
          ),
        ),
      );

  final nominalNilaiPengikatanController = TextEditingController();

  void updateNominalNilaiPengikatanController(String val) =>
      nominalNilaiPengikatanController.value = numberFormatter.formatEditUpdate(
        TextEditingValue.empty,
        nominalNilaiPengikatanController.value.copyWith(
          text: val,
          selection: TextSelection(
            baseOffset: val.length,
            extentOffset: val.length,
          ),
        ),
      );

  void navigateToInformasiAgunanView() {
    _navigationService.navigateTo(
      Routes.informasiAgunanViewRitel,
      arguments: InformasiAgunanViewRitelArguments(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
      ),
    );
  }

  String? urlPublic;

  Future<String> getPublicFile(String urlPrivate) async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(urlPrivate),
    );

    res.fold(
      (error) => _showErrorDialog(error),
      (res) {
        urlPublic = res;
        notifyListeners();
      },
    );
    // ignore: newline-before-return
    return urlPublic!;
  }

  String? urlPublicFoto;

  Future<String> getPublicFoto(String urlPrivate) async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(urlPrivate),
    );

    res.fold(
      (error) => _showErrorDialog(error),
      (res) {
        urlPublicFoto = res;
        notifyListeners();
      },
    );
    // ignore: newline-before-return
    return urlPublicFoto!;
  }

  PlatformFile? uploadFotoAgunanPersediaanFile;
  String? uploadFotoAgunanPersediaanErrorText;
  String? uploadFotoAgunanPersediaanUrl;
  List<String?> listPathFotoPersediaan = [];
  List<String?> listPathFotoPersediaanPublic = [];

  // List<PlatformFile?> listFileFotoPersediaan = [];

  Future captureFotoAgunanPersediaan() async {
    final res = await _mediaService.getMultiFileType();

    if (res != null) {
      // listFileFotoPersediaan.add(res);
      uploadFotoAgunanPersediaanErrorText = null;
      uploadFotoAgunanPersediaan(
        res,
      );
      notifyListeners();
    }
  }

  Future uploadFotoAgunanPersediaan(PlatformFile file) async {
    final res = await runBusyFuture(_ritelUploadFileAPI.uploadFiles(
      file: file,
    ));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (success) async {
        listPathFotoPersediaan.add(success);
        listPathFotoPersediaanPublic.add(await getPublicFoto(success));

        notifyListeners();
      },
    );
  }

  Future clearFotoAgunanPersediaan(int index) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Hapus Foto',
      description: 'Anda yakin akan menghapus foto agunan persediaan ini?',
      data: {'color': CustomColor.primaryRed80},
      mainButtonTitle: 'HAPUS',
    );

    if (response!.confirmed) {
      // listFileFotoPersediaan[index] = null;
      listPathFotoPersediaan.removeAt(index);
      listPathFotoPersediaanPublic.removeAt(index);
      // listFileFotoPersediaan.removeWhere((path) => path == null);
      // listPathFotoPersediaan.removeWhere((path) => path == null);
      // listPathFotoPersediaanPublic.removeWhere((path) => path == null);
      notifyListeners();
    }
  }
}

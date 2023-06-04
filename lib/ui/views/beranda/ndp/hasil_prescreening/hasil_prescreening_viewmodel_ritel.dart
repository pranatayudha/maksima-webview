import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../application/app/app.locator.dart';
import '../../../../../application/app/app.router.dart';
import '../../../../../application/enums/dialog_type.dart';
import '../../../../../application/models/ritel_hasil_prescreening_cv_model.dart';
import '../../../../../application/models/ritel_hasil_prescreening_header_cv_model.dart';
import '../../../../../application/models/ritel_screening_header.dart';
import '../../../../../application/models/ritel_screening_isHaveSpouse.dart';
import '../../../../../application/models/ritel_screening_summary_debitur.dart';
import '../../../../../application/models/ritel_screening_summary_spouse.dart';
import '../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../infrastructure/apis/ritel_screening_api.dart';

class HasilPrescreeningViewModelRitel extends FutureViewModel {
  final String? pipelineflagId;
  final String? name;
  final String? ktpNum;
  final String? tanggalLahir;
  final String? tempatLahir;
  final bool? isDebitur;
  final int? codeTable;
  final int? mgmt;

  HasilPrescreeningViewModelRitel({
    this.pipelineflagId,
    this.name,
    this.ktpNum,
    this.tanggalLahir,
    this.tempatLahir,
    this.isDebitur,
    this.codeTable,
    this.mgmt,
  });

  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final RitelScreeningAPI _ritelScreeningAPI = locator<RitelScreeningAPI>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();

  /** Getter and Setter */

  RitelScreeningHeader? _ritelScreeningHeader;

  RitelScreeningHeader get ritelScreeningHeader => _ritelScreeningHeader!;

  RitelScreeningDebitur? _ritelScreeningDebitur;

  RitelScreeningDebitur get ritelScreeningDebitur => _ritelScreeningDebitur!;

  RitelScreeningSpouse? _ritelScreeningSpouse;

  RitelScreeningSpouse get ritelScreeningSpouse => _ritelScreeningSpouse!;

  RitelScreeningIsHaveSpouse? _ritelScreeningIsHaveSpouse;

  RitelScreeningIsHaveSpouse get ritelScreeningIsHaveSpouse =>
      _ritelScreeningIsHaveSpouse!;

  bool _isChangeNik = false;

  bool get isChangeNik => _isChangeNik;

  bool _isChangeName = false;

  bool get isChangeName => _isChangeName;

  bool _isChangeBirthDate = false;

  bool get isChangeBirthDate => _isChangeBirthDate;

  bool _isChangePlaceOfBirth = false;

  bool get isChangePlaceOfBirth => _isChangePlaceOfBirth;

  bool _isLoadingHeaderData = true;

  bool get isLoadingHeaderData => _isLoadingHeaderData;

  bool _isLoadingDebiturData = true;

  bool get isLoadingDebiturData => _isLoadingDebiturData;

  bool _isLoadingSpouseData = true;

  bool get isLoadingSpouseData => _isLoadingSpouseData;

  /** Data Generate */

  Future<Map<String, dynamic>> _generateDataDukcapilMap() async {
    return {
      'pipeline_flagId': int.parse(pipelineflagId!),
      'mgmt': codeTable == 2 || codeTable == 3
          ? int.parse(nomorMgmtController.text)
          : '',
      'ktpNum': isDebitur! ? nomorNIKController.text : '',
      'fullName': isDebitur! ? nameController.text : '',
      'placeOfBirth': isDebitur! ? tempatLahirController.text : '',
      'dateOfBirth': isDebitur! ? tanggalLahirController.text : null,
      'spouseKtpNum': isDebitur! ? '' : nomorNIKController.text,
      'spouseFullname': isDebitur! ? '' : nameController.text,
      'spousePlaceOfBirth': isDebitur! ? '' : tempatLahirController.text,
      'spouseDateOfBirth': isDebitur! ? null : tanggalLahirController.text,
    };
  }

  /** Validation Success and Error */

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Gagal',
      description: errorMessage,
      mainButtonTitle: 'COBA LAGI',
    );
  }

  Future _showSuccessDialogDelete(String successMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    _navigationService.clearStackAndShow(
      Routes.mainView,
      arguments: const MainViewArguments(index: 1),
    );
  }

  Future _showSuccessDialogPut(String successMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    notifyListeners();

    _navigationService.clearStackAndShow(
      Routes.mainView,
      arguments: const MainViewArguments(index: 1),
    );
  }

  /************************************/

  /** Start Controller Field Editing */

  final nomorMgmtController = TextEditingController();

  final nomorNIKController = TextEditingController();

  void updateNomorNIKController(String val) {
    nomorNIKController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    if (nomorNIKController.text != ktpNum) {
      _isChangeNik = true;
      notifyListeners();
    }
  }

  final nameController = TextEditingController();

  void updateNameController(String val) {
    nameController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    if (nameController.text != name!) {
      _isChangeName = true;
      notifyListeners();
    }
  }

  final tempatLahirController = TextEditingController();

  void updateTempatLahirController(String val) {
    tempatLahirController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    if (tempatLahirController.text != tempatLahir) {
      _isChangePlaceOfBirth = true;
      notifyListeners();
    }
  }

  final tanggalLahirController = TextEditingController();

  void updateTanggalLahirController(String val) {
    tanggalLahirController.text = val.trim();
    if (tanggalLahirController.text != tanggalLahir) {
      _isChangeBirthDate = true;
      notifyListeners();
    }
  }

  /** End Controller Field Editing */

  @override
  Future futureToRun() async {
    setBusy(true);
    print('PERTAMA');
    if (codeTable == 2 || codeTable == 3) {
      print('KEDUA');
      await getScreeningHeaderCV();
      await getScreeningCV();
    } else {
      print('KETIGA');
      await getScreeningHeader(pipelineflagId!);
      await getScreeninDebitur(pipelineflagId!);
      await getScreeningSpouse(pipelineflagId!);
      await getScreeningIsHaveSpouse(pipelineflagId!);
    }

    await _prePopulateTextFields();
    setBusy(false);
  }

  static String convertDate(String dateString) {
    final inputFormat = DateFormat('dd MMMM yyyy', 'id');
    final date = inputFormat.parse(dateString);
    final outputFormat = DateFormat('dd/MM/yyyy');
    // ignore: newline-before-return
    return outputFormat.format(date).toString();
  }

  Future _prePopulateTextFields() async {
    nomorNIKController.text = ktpNum!;
    nameController.text = name!;
    tempatLahirController.text = tempatLahir!;
    tanggalLahirController.text = convertDate(tanggalLahir!);
    nomorMgmtController.text = mgmt.toString();
  }

  /** Function Call API */

  RitelHasilPreScreeningHeaderCV? _ritelHasilPrescreeningHeaderCV;
  RitelHasilPreScreeningHeaderCV get ritelHasilPrescreeningHeaderCV =>
      _ritelHasilPrescreeningHeaderCV!;

  bool _getTimeOut = false;
  bool get getTimeOut => _getTimeOut;

  Future getScreeningHeaderCV() async {
    final res = await runBusyFuture(
      _ritelScreeningAPI.getScreeningCVHeader(pipelineflagId),
    );
    print(res);

    res.fold(
      (errorMessage) {
        errorMessage;
        _getTimeOut = true;
        // _isLoadingHeaderData = true;
      },
      (result) {
        _ritelHasilPrescreeningHeaderCV = result;
        // _isLoadingHeaderData = false;
      },
    );
  }

  RitelHasilPreScreeningCV? _ritelHasilPrescreeningCV;
  RitelHasilPreScreeningCV get ritelHasilPrescreeningCV =>
      _ritelHasilPrescreeningCV!;

  var listPengurus;

  Future getScreeningCV() async {
    final res = await runBusyFuture(
      _ritelScreeningAPI.getScreeningCV(pipelineflagId),
    );

    print(res);

    res.fold(
      (errorMessage) {
        errorMessage;
        // _isLoadingHeaderData = true;
      },
      (result) {
        listPengurus = result;
        // _isLoadingHeaderData = false;
      },
    );
  }

  Future getScreeningHeader(String pipelineflagId) async {
    final res = await runBusyFuture(
      _ritelScreeningAPI.getScreeningHeader(pipelineflagId),
    );

    res.fold(
      (errorMessage) {
        errorMessage;
        _isLoadingHeaderData = true;
      },
      (result) {
        _ritelScreeningHeader = result;
        _isLoadingHeaderData = false;
      },
    );
  }

  Future getScreeninDebitur(String pipelineflagId) async {
    final res = await runBusyFuture(
      _ritelScreeningAPI.getScreeningDebitur(pipelineflagId),
    );

    res.fold(
      (errorMessage) {
        errorMessage;
        _isLoadingDebiturData = true;
      },
      (result) {
        _ritelScreeningDebitur = RitelScreeningDebitur.fromJson(result);
        _isLoadingDebiturData = false;
      },
    );
  }

  Future getScreeningSpouse(String pipelineflagId) async {
    final res = await runBusyFuture(
      _ritelScreeningAPI.getScreeningSpouse(pipelineflagId),
    );
    res.fold(
      (error) {
        error;
        _isLoadingSpouseData = true;
      },
      (result) {
        if (result != 'succcess') {
          _ritelScreeningSpouse = RitelScreeningSpouse.fromJson(result);
          _isLoadingSpouseData = false;
        }
      },
    );
  }

  Future getScreeningIsHaveSpouse(String pipelineflagId) async {
    final res = await runBusyFuture(
      _ritelScreeningAPI.getScreeningIsHaveSpouse(pipelineflagId),
    );
    res.fold(
      (error) => error,
      (result) {
        _ritelScreeningIsHaveSpouse =
            RitelScreeningIsHaveSpouse(isHaveSpouse: result);
      },
    );
  }

  Future putScreeningDukcapil(BuildContext ctx) async {
    Navigator.of(ctx).pop();

    final dukcapilMap = await _generateDataDukcapilMap();
    final res = await runBusyFuture(
      _ritelScreeningAPI.putScreeningDukcapil(dukcapilMap),
    );
    res.fold(
      (errorMessage) {
        _showErrorDialog(errorMessage);
        notifyListeners();
      },
      (successMap) {
        _showSuccessDialogPut(successMap);
      },
    );
  }

  Future deleteScreening(BuildContext ctx) async {
    Navigator.of(ctx).pop();
    String _debiturName = (codeTable == 2 || codeTable == 3)
        ? _ritelHasilPrescreeningHeaderCV?.titlePipeline ?? '-'
        : name ?? '-';

    final res =
        await runBusyFuture(_ritelScreeningAPI.deleteScreening(pipelineflagId));

    res.fold((error) => _showErrorDialog(error), (result) {
      _showSuccessDialogDelete(
        'Berhasil mengapus data $_debiturName',
      );
    });
  }

  Future _showSuccessDialogPrakarsa(
    String successMessage,
    String prakarsaId,
  ) async {
    final res = await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    if (res!.confirmed) {
      if (codeTable == 2 || codeTable == 3) {
        _navigationService.navigateTo(
          Routes.prakarsaDetailsViewRitel,
          arguments: PrakarsaDetailsViewRitelArguments(
            prakarsaId: prakarsaId,
            pipelineId: _ritelHasilPrescreeningHeaderCV!.pipelinesId!,
            loanTypesId: 1,
            codeTable: _ritelHasilPrescreeningHeaderCV!.codeTable!,
          ),
        );
      } else {
        _navigationService.navigateTo(
          Routes.prakarsaDetailsViewRitel,
          arguments: PrakarsaDetailsViewRitelArguments(
            prakarsaId: prakarsaId,
            pipelineId: _ritelScreeningHeader!.pipelinesId!,
            loanTypesId: _ritelScreeningHeader!.codeTable! == 4 ? 2 : 1,
            codeTable: _ritelScreeningHeader!.codeTable!,
          ),
        );
      }
    }
  }

  Future sendToPrakarsa() async {
    final res =
        await runBusyFuture(_ritelScreeningAPI.sendToPrakarsa(pipelineflagId));

    res.fold(
      (error) => _showErrorDialog(res.toString()),
      (prakarsaId) {
        _showSuccessDialogPrakarsa(
          'Berhasil mengirim data ke prakarsa!',
          prakarsaId,
        );
      },
    );
  }

  String? urlDebitur;

  Future<String> getPublicFileDebitur(String url) async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(url),
    );

    res.fold(
      (err) => urlDebitur = '',
      (success) => urlDebitur = success,
    );

    return urlDebitur!;
  }

  String? urlSpouse;

  Future<String> getPublicFileSpouse(String url) async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getPublicFile(url),
    );

    res.fold(
      (err) => urlSpouse = '',
      (success) => urlSpouse = success,
    );

    return urlSpouse!;
  }

  Future runPrescreening() async {
    final res =
        await runBusyFuture(_ritelScreeningAPI.runPrescreening(pipelineflagId));

    res.fold(
      (error) => error,
      (success) => _navigationService.navigateTo(
        Routes.pipelineSuccessViewRitel,
        arguments: PipelineSuccessViewRitelArguments(
          pipelineId: ritelScreeningHeader.pipelinesId!,
          debiturName: name!,
        ),
      ),
    );
  }

  Future runPrescreeningPTCV() async {
    final res = await runBusyFuture(_ritelScreeningAPI
        .runPrescreening(_ritelHasilPrescreeningHeaderCV!.pipelineFlagId!));

    res.fold(
      (error) => error,
      (success) => _navigationService.navigateTo(
        Routes.pipelineSuccessViewRitel,
        arguments: PipelineSuccessViewRitelArguments(
          pipelineId: _ritelHasilPrescreeningHeaderCV!.pipelineFlagId!,
          debiturName: _ritelHasilPrescreeningHeaderCV!.titlePipeline!,
        ),
      ),
    );
  }
}

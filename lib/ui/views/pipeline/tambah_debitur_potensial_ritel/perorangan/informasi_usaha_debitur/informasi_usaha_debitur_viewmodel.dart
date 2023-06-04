import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../application/app/app.locator.dart';
import '../../../../../../application/app/app.router.dart';
import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../application/enums/bottom_sheet_type.dart';
import '../../../../../../application/enums/dialog_type.dart';
import '../../../../../../application/enums/pipeline_perorangan_api_method.dart';
import '../../../../../../application/models/economy_sector_ritel.dart';
import '../../../../../../application/models/economy_sub_sector_ritel.dart';
import '../../../../../../application/models/ritel_informasi_usaha.dart';
import '../../../../../../application/models/ritel_postal_code.dart';
import '../../../../../../application/services/local_db_service.dart';
import '../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../../../infrastructure/apis/ritel_pipeline_perorangan_api.dart';
import 'dart:developer' as dev;

class InformasiUsahaDebiturViewModel extends BaseViewModel {
  String? pipelineId;
  RitelInformasiUsaha? ritelInformasiUsaha;
  bool fromTdpPeroranganView;
  bool? fromPipelineDetailsView;
  int? statusPipeline;

  InformasiUsahaDebiturViewModel({
    this.pipelineId,
    this.ritelInformasiUsaha,
    required this.fromTdpPeroranganView,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  });

  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final RitelPipelinePeroranganAPI _ritelPipelinePeroranganAPI =
      locator<RitelPipelinePeroranganAPI>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();

  Future initialize() async {
    setBusy(true);
    await getEconomySector();
    if (ritelInformasiUsaha != null) {
      await _prepopulateTextFields();
      if (ritelInformasiUsaha!.postalCode!.isNotEmpty) {
        getPostalCode(ritelInformasiUsaha!.postalCode!);
      }
    }
    setBusy(false);
  }

  Future _prepopulateTextFields() async {
    if (ritelInformasiUsaha!.addressIdParent != null) {
      if (ritelInformasiUsaha!.addressIdParent! ==
          ritelInformasiUsaha!.addressIdChild!) {
        updateRadioBtn(true);
      } else {
        addressController
          ..text = ritelInformasiUsaha!.tagLocation!.name!
          ..selection =
              TextSelection.collapsed(offset: addressController.text.length);

        detailAddressController
          ..text = ritelInformasiUsaha!.detail!
          ..selection = TextSelection.collapsed(
            offset: detailAddressController.text.length,
          );

        postalCodeController
          ..text = ritelInformasiUsaha!.postalCode!
          ..selection =
              TextSelection.collapsed(offset: postalCodeController.text.length);

        provinceController
          ..text = ritelInformasiUsaha!.province!
          ..selection =
              TextSelection.collapsed(offset: provinceController.text.length);

        cityController
          ..text = ritelInformasiUsaha!.city!
          ..selection =
              TextSelection.collapsed(offset: cityController.text.length);

        districtController
          ..text = ritelInformasiUsaha!.district!
          ..selection =
              TextSelection.collapsed(offset: districtController.text.length);

        villageController
          ..text = ritelInformasiUsaha!.village!
          ..selection =
              TextSelection.collapsed(offset: villageController.text.length);

        rtController
          ..text = ritelInformasiUsaha!.rt!
          ..selection =
              TextSelection.collapsed(offset: rtController.text.length);

        rwController
          ..text = ritelInformasiUsaha!.rw!
          ..selection =
              TextSelection.collapsed(offset: rwController.text.length);
      }
    }
    namaUsahaController
      ..text = ritelInformasiUsaha!.businessName!
      ..selection =
          TextSelection.collapsed(offset: namaUsahaController.text.length);

    sektorController
      ..text = ritelInformasiUsaha!.economySectorsName!
      ..selection =
          TextSelection.collapsed(offset: sektorController.text.length);

    subSektorController
      ..text = ritelInformasiUsaha!.economySubSectorsName!
      ..selection =
          TextSelection.collapsed(offset: subSektorController.text.length);

    isValidPostalCode = postalCodeController.text.isNotEmpty;
  }

  double? _lat;
  double? _lng;

  bool _sameAddress = false;

  bool get sameAddress => _sameAddress;

  void updateRadioBtn(bool val) async {
    _sameAddress = val;

    notifyListeners();

    if (_sameAddress) {
      final getPipelineFlag = _localDBService.getPeroranganFlag();

      addressController
        ..text = getPipelineFlag!['dataDiriAddress']!['tagLocation']!['name']!
        ..selection =
            TextSelection.collapsed(offset: addressController.text.length);

      detailAddressController
        ..text = getPipelineFlag['dataDiriAddress']!['detail']!
        ..selection = TextSelection.collapsed(
          offset: detailAddressController.text.length,
        );

      postalCodeController
        ..text = getPipelineFlag['dataDiriAddress']!['postalCode']!
        ..selection =
            TextSelection.collapsed(offset: postalCodeController.text.length);

      provinceController
        ..text = getPipelineFlag['dataDiriAddress']!['province']!
        ..selection =
            TextSelection.collapsed(offset: provinceController.text.length);

      cityController
        ..text = getPipelineFlag['dataDiriAddress']!['city']!
        ..selection =
            TextSelection.collapsed(offset: cityController.text.length);

      districtController
        ..text = getPipelineFlag['dataDiriAddress']!['district']!
        ..selection =
            TextSelection.collapsed(offset: districtController.text.length);

      villageController
        ..text = getPipelineFlag['dataDiriAddress']!['village']!
        ..selection =
            TextSelection.collapsed(offset: villageController.text.length);

      rtController
        ..text = getPipelineFlag['dataDiriAddress']!['rt']!
        ..selection = TextSelection.collapsed(offset: rtController.text.length);

      rwController
        ..text = getPipelineFlag['dataDiriAddress']!['rw']!
        ..selection = TextSelection.collapsed(offset: rwController.text.length);
      await getPostalCode(getPipelineFlag['dataDiriAddress']!['postalCode']!);
    } else {
      addressController.clear();
      detailAddressController.clear();
      postalCodeController.clear();
      provinceController.clear();
      cityController.clear();
      districtController.clear();
      villageController.clear();
      rtController.clear();
      rwController.clear();
    }
  }

  final namaUsahaController = TextEditingController();

  void updateNamaUsaha(String val) => namaUsahaController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final sektorController = TextEditingController();

  final subSektorController = TextEditingController();

  final addressController = TextEditingController();

  void updateAddress(String val) => addressController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final detailAddressController = TextEditingController();

  void updateDetailAddress(String val) =>
      detailAddressController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  // Kode Pos Controller
  List<RitelPostalCode> _ritelPostalCode = [];
  List<RitelPostalCode> _ritelPostalCodeSecond = [];

  List<RitelPostalCode> get ritelPostalCode => _ritelPostalCode;

  final postalCodeController = TextEditingController();

  void updatePostalCode(String val) async {
    postalCodeController.value.copyWith(
      text: val,
      selection: TextSelection(
        baseOffset: val.length,
        extentOffset: val.length,
      ),
    );
    provinceController.clear();
    cityController.clear();
    // districtController.clear();
    // villageController.clear();
    // rtController.clear();
    // rwController.clear();
    getPostalCode(postalCodeController.text);
  }

  bool isValidPostalCode = false;
  Future getPostalCode(
    String postalCode,
  ) async {
    final res =
        await runBusyFuture(_ritelMasterAPI.getDetailByPostalCode(postalCode));

    res.fold(
      (error) {
        error;
        isValidPostalCode = false;
      },
      (result) {
        final postalCode = List<RitelPostalCode>.from(
          result.map(
            (i) => RitelPostalCode.fromJson(i as Map<String, dynamic>),
          ),
        );
        _ritelPostalCode = postalCode;
        provinceController.text = _ritelPostalCode[0].province.toString();
        cityController.text = _ritelPostalCode[0].city.toString();
        isValidPostalCode = true;
      },
    );
  }

  final provinceController = TextEditingController();

  void updateProvince(String val) => provinceController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final cityController = TextEditingController();

  void updateCity(String val) => cityController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final districtController = TextEditingController();

  void clearDistrict() {
    districtController.clear();
    notifyListeners();
  }

  List<RitelPostalCode> filterDistrict(String query) {
    List<RitelPostalCode> res = [];
    RitelPostalCode temp = RitelPostalCode();
    for (var i = 0; i < _ritelPostalCode.length; i++) {
      if (i == 0) {
        temp = _ritelPostalCode[i];
      } else if (temp.district != _ritelPostalCode[i].district!) {
        res.add(temp);
        temp = _ritelPostalCode[i];
      }
    }

    res.add(temp);

    return res.toList();
  }

  Future updateDistrict(RitelPostalCode ritelPostalCode) async {
    districtController.text = ritelPostalCode.district!.trim();
    notifyListeners();

    await getVillage(
      ritelPostalCode.postalCode!,
    );
  }

  Future getVillage(
    String postalCode,
  ) async {
    final res = await runBusyFuture(
      _ritelMasterAPI.getDetailByPostalCode(postalCode),
    );

    res.fold(
      (error) => dev.log(error),
      (result) {
        final postalCode = List<RitelPostalCode>.from(
          result.map(
            (i) => RitelPostalCode.fromJson(i as Map<String, dynamic>),
          ),
        );
        _ritelPostalCodeSecond = postalCode;
      },
    );
  }

  final villageController = TextEditingController();

  Future updateVillage(RitelPostalCode ritelPostalCode) async {
    villageController.text = ritelPostalCode.village!.trim();
    notifyListeners();
  }

  void clearVillage() {
    villageController.clear();
    notifyListeners();
  }

  List<RitelPostalCode> filterVillage(String query) {
    List<RitelPostalCode> temp = [];

    for (var i = 0; i < _ritelPostalCodeSecond.length; i++) {
      if (districtController.text
          .trim()
          .contains(_ritelPostalCodeSecond[i].district!)) {
        temp.add(_ritelPostalCodeSecond[i]);
      } else {
        temp;
      }
    }

    return temp.toList();

    // return _ritelPostalCodeSecond
    //     .where((element) => element.village!.toLowerCase().contains(query))
    //     .toList();
  }

  final rtController = TextEditingController();

  void updateRt(String val) => rtController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  final rwController = TextEditingController();

  void updateRw(String val) => rwController.value.copyWith(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );

  Future _showSuccessDialog({
    required String successMessage,
    required bool isContinue,
  }) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: successMessage,
      mainButtonTitle: 'OK',
    );

    if (isContinue) {
      _navigationService.navigateTo(
        Routes.tDPPeroranganViewRitel,
        arguments: TDPPeroranganViewRitelArguments(
          pipelineId: pipelineId,
          fromPipelineDetailsView: fromPipelineDetailsView,
          statusPipeline: statusPipeline,
        ),
      );
    } else {
      _navigationService.back();
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

  Future navigateBack() async {
    if (pipelineId != null) {
      _navigationService.back(result: {
        'pipelineId': pipelineId,
        'informasiDataDiriCompleted': 2,
        'informasiUsahaCompleted': 2,
      });
    } else if (_anyFieldEditedUsaha()) {
      final response = await _dialogService.showCustomDialog(
        variant: DialogType.base,
        title: 'Edited',
        description:
            'Anda belum menyelesaikan pengisian form ini. Data-data yang sudah Anda masukkan akan hilang. Apakah Anda yakin akan membatalkan pengisian form ini?',
        data: {'color': CustomColor.primaryRed80},
        mainButtonTitle: 'Batal Isi Form',
      );

      if (response!.confirmed) _navigationService.back();
    } else {
      _navigationService.back();
    }
  }

  Future navigateToAddressSelectionViewUsaha() async {
    _navigationService
        .navigateTo(Routes.addressSelectionView)!
        .then((chosenPlace) {
      if (chosenPlace != null) {
        addressController.text = chosenPlace['address'] as String;
        _lat = chosenPlace['lat'] as double;
        _lng = chosenPlace['lng'] as double;
      }
    });
  }

  bool _anyFieldEditedUsaha() {
    return namaUsahaController.text.isNotEmpty ||
        sektorController.text.isNotEmpty ||
        subSektorController.text.isNotEmpty ||
        addressController.text.isNotEmpty ||
        detailAddressController.text.isNotEmpty ||
        postalCodeController.text.isNotEmpty ||
        provinceController.text.isNotEmpty ||
        cityController.text.isNotEmpty ||
        districtController.text.isNotEmpty ||
        villageController.text.isNotEmpty ||
        rtController.text.isNotEmpty ||
        rwController.text.isNotEmpty;
  }

  List<EconomySectorRitel> _economySectors = [];

  List<EconomySectorRitel> get economySector => _economySectors;
  String? _economySectorId;

  Future updateEconomySector(EconomySectorRitel economySectorRitel) async {
    _economySubSectors.clear();
    subSektorController.clear();
    sektorController.text = economySectorRitel.name!.trim();
    _economySectorId = economySectorRitel.economy_sectorsId;
    await getEconomySubSector(_economySectorId!);
    notifyListeners();
  }

  List<EconomySectorRitel> filterEconomySector(String query) {
    return _economySectors
        .where((element) => element.name!.toLowerCase().contains(query))
        .toList();
  }

  void clearEconomySector() {
    sektorController.clear();
    subSektorController.clear();
    _economySubSectors.clear();
    _economySectorId = null;
    notifyListeners();
  }

  Future getEconomySector() async {
    final res = await runBusyFuture(_ritelMasterAPI.getEconomySectors());

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (economySectors) => _economySectors = economySectors,
    );
  }

  List<EconomySubSectorRitel> _economySubSectors = [];

  List<EconomySubSectorRitel> get economySubSectors => _economySubSectors;
  String? _economySubSectorId;

  void updateEconomySubSector(EconomySubSectorRitel economySubSectorRitel) {
    subSektorController.text =
        '${economySubSectorRitel.code!.trim()} - ${economySubSectorRitel.economySubSectorsName!.trim()}';
    _economySubSectorId = economySubSectorRitel.economy_sub_sectorsId;
    notifyListeners();
  }

  List<EconomySubSectorRitel> filterEconomySubSector(String query) {
    return _economySubSectors
        .where((element) =>
            element.economySubSectorsName!.toLowerCase().contains(query))
        .toList();
  }

  void clearEconomySubSector() {
    subSektorController.clear();
    notifyListeners();
  }

  Future getEconomySubSector(String id) async {
    final res = await runBusyFuture(_ritelMasterAPI.getEconomySubSectors(id));

    res.fold(
      (errorMessage) => _showErrorDialog(errorMessage),
      (economySubSectors) => _economySubSectors = economySubSectors,
    );
  }

  Future<Map<String, dynamic>> _generateInfoUsahaMap() async {
    var latLng = '${_lat.toString()}, ${_lng.toString()}';

    return {
      'addressIsSame': _sameAddress,
      'individual_pipelinesId': int.parse(pipelineId!),
      'businessName': namaUsahaController.text.isNotEmpty
          ? namaUsahaController.text.trim()
          : '',
      'economy_sectorsId':
          _economySectorId ?? ritelInformasiUsaha!.economy_sectorsId!,
      'economy_sub_sectorsId':
          _economySubSectorId ?? ritelInformasiUsaha!.economy_sub_sectorsId!,
      'partnershipsId': 0,
      'tagLocation': _sameAddress
          ? {
              'latLng': '',
              'name': '',
            }
          : ritelInformasiUsaha != null
              ? addressController.text.trim() ==
                      ritelInformasiUsaha!.tagLocation!.name!
                  ? ritelInformasiUsaha!.tagLocation!
                  : latLng.isNotEmpty
                      ? {
                          'latLng': latLng,
                          'name': addressController.text.trim(),
                        }
                      : {
                          'latLng': '',
                          'name': '',
                        }
              : latLng.isNotEmpty
                  ? {
                      'latLng': latLng,
                      'name': addressController.text.trim(),
                    }
                  : {
                      'latLng': '',
                      'name': '',
                    },
      'detail': _sameAddress
          ? ''
          : detailAddressController.text.isNotEmpty
              ? detailAddressController.text.trim()
              : '',
      'postalCode': _sameAddress
          ? ''
          : postalCodeController.text.isNotEmpty
              ? postalCodeController.text.trim()
              : '',
      'province': _sameAddress
          ? ''
          : provinceController.text.isNotEmpty
              ? provinceController.text.trim()
              : '',
      'city': _sameAddress
          ? ''
          : cityController.text.isNotEmpty
              ? cityController.text.trim()
              : '',
      'district': _sameAddress
          ? ''
          : districtController.text.isNotEmpty
              ? districtController.text.trim()
              : '',
      'village': _sameAddress
          ? ''
          : villageController.text.isNotEmpty
              ? villageController.text.trim()
              : '',
      'rt': _sameAddress
          ? ''
          : rtController.text.isNotEmpty
              ? rtController.text.trim()
              : '',
      'rw': _sameAddress
          ? ''
          : rwController.text.isNotEmpty
              ? rwController.text.trim()
              : '',
    };
  }

  Future<Map<String, dynamic>> _generateDataDiriAddressMap() async {
    final getPipelineFlag = _localDBService.getPeroranganFlag();
    // ignore: newline-before-return
    return {
      'tagLocation': getPipelineFlag!['dataDiriAddress']!['tagLocation']!,
      'detail': getPipelineFlag['dataDiriAddress']!['detail']!,
      'postalCode': getPipelineFlag['dataDiriAddress']!['postalCode']!,
      'province': getPipelineFlag['dataDiriAddress']!['province']!,
      'city': getPipelineFlag['dataDiriAddress']!['city']!,
      'district': getPipelineFlag['dataDiriAddress']!['district']!,
      'village': getPipelineFlag['dataDiriAddress']!['village']!,
      'rt': getPipelineFlag['dataDiriAddress']!['rt']!,
      'rw': getPipelineFlag['dataDiriAddress']!['rw']!,
    };
  }

  Future _postData(
    PipelinePeroranganAPIMethod pipelinePeroranganAPIMethod,
    bool isContinue,
  ) async {
    final infoUsahaMap = await _generateInfoUsahaMap();
    final dataDiriAddressMap = await _generateDataDiriAddressMap();

    switch (pipelinePeroranganAPIMethod) {
      case PipelinePeroranganAPIMethod.addDataDiri:
        break;
      case PipelinePeroranganAPIMethod.updateDataDiri:
        break;
      case PipelinePeroranganAPIMethod.addUsaha:
        final res = await runBusyFuture(
          _ritelPipelinePeroranganAPI.addInformasiUsaha(infoUsahaMap),
        );

        res.fold(
          (errorMessage) {
            _showErrorDialog(errorMessage);
            notifyListeners();
          },
          (successMap) {
            final getPipelineFlag = _localDBService.getPeroranganFlag();

            _localDBService.replacePeroranganFlag(
              {
                'informasi_data_diri': 2,
                'informasi_usaha': 2,
                'dataDiriAddress': dataDiriAddressMap,
                'debiturName': getPipelineFlag!['debiturName']!,
              },
            );

            _showSuccessDialog(
              successMessage: 'Berhasil menambahkan informasi usaha!',
              isContinue: true,
            );
            notifyListeners();
          },
        );
        break;
      case PipelinePeroranganAPIMethod.updateUsaha:
        final res = await runBusyFuture(
          _ritelPipelinePeroranganAPI.updateInformasiUsaha(infoUsahaMap),
        );

        res.fold(
          (errorMessage) {
            _showErrorDialog(errorMessage);
            notifyListeners();
          },
          (successMap) {
            final getPipelineFlag = _localDBService.getPeroranganFlag();

            if (getPipelineFlag!['informasi_lainnya'] == 2 &&
                getPipelineFlag['informasi_data_diri'] == 2) {
              _localDBService.replacePeroranganFlag(
                {
                  'informasi_data_diri': 2,
                  'informasi_usaha': 2,
                  'informasi_lainnya': 2,
                  'dataDiriAddress': dataDiriAddressMap,
                  'debiturName': getPipelineFlag['debiturName']!,
                },
              );
            } else {
              _localDBService.replacePeroranganFlag(
                {
                  'informasi_data_diri': 2,
                  'informasi_usaha': 2,
                  'dataDiriAddress': dataDiriAddressMap,
                  'debiturName': getPipelineFlag['debiturName']!,
                },
              );
            }

            _showSuccessDialog(
              successMessage: 'Berhasil mengubah informasi usaha!',
              isContinue: true,
            );
            notifyListeners();
          },
        );
        break;
      case PipelinePeroranganAPIMethod.addLainnya:
        break;
      case PipelinePeroranganAPIMethod.updateLainnya:
        break;
    }
  }

  Future _showValidationErrorDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Invalid',
      description:
          'Satu atau beberapa data mandatory ada yang kosong atau tidak sesuai validasi. Silahkan periksa kembali data Anda.',
      mainButtonTitle: 'OK',
    );
  }

  Future validateInputs(
    PipelinePeroranganAPIMethod pipelinePeroranganAPIMethod, {
    bool isContinue = false,
  }) async {
    if (formKey.currentState!.validate()) {
      // formKey.currentState!.save();

      final response = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.confirmation,
        data: {'title': 'Konfirmasi'},
      );

      if (response != null && response.confirmed) {
        _postData(pipelinePeroranganAPIMethod, isContinue);
      }
    } else {
      autoValidateMode = AutovalidateMode.always;
      _showValidationErrorDialog();
      notifyListeners();
    }
  }
}

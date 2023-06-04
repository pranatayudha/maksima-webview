// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../application/enums/mutasi_rekening_api_method.dart';
import '../../../../../../../../../application/helpers/input_validators.dart';
import '../../../../../../../../../application/models/ritel_mutasi_rekening.dart';
import '../../../../../../../../shared/custom_textfield.dart';
import '../../../../../../../../shared/form_layout_ritel.dart';
import '../../../../../../../../shared/thick_light_grey_divider.dart';
import 'mutasi_rekening_form_section.dart';
import 'mutasi_rekening_form_section_five.dart';
import 'mutasi_rekening_form_section_four.dart';
import 'mutasi_rekening_form_section_six.dart';
import 'mutasi_rekening_form_section_three.dart';
import 'mutasi_rekening_form_section_two.dart';
import 'mutasi_rekening_form_viewmodel.dart';

class MutasiRekeningFormView
    extends ViewModelBuilderWidget<MutasiRekeningFormViewModel> {
  final RitelMutasiRekening? ritelMutasiRekening;
  final String prakarsaId;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;
  final int? index;

  const MutasiRekeningFormView({
    Key? key,
    this.ritelMutasiRekening,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
    this.index,
  }) : super(key: key);

  @override
  void onViewModelReady(MutasiRekeningFormViewModel viewModel) =>
      viewModel.initialize();

  @override
  MutasiRekeningFormViewModel viewModelBuilder(BuildContext context) =>
      MutasiRekeningFormViewModel(
        ritelMutasiRekening: ritelMutasiRekening,
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
        index: index,
      );

  @override
  Widget builder(
    BuildContext context,
    MutasiRekeningFormViewModel viewModel,
    Widget? child,
  ) {
    return FormLayoutRitel(
      title: 'Detail Mutasi Rekening',
      onBackButtonPressed: viewModel.navigateToMutasiRekeningView,
      addButtonVisible: viewModel.count == 6 ? false : true,
      onAddButtonPressed: viewModel.count != 6 ? viewModel.addWidget : null,
      isBusy: false,
      mainButtonTitle: 'Simpan',
      onMainButtonPressed: viewModel.loadUploadMutasiOne == 1 ||
              viewModel.loadUploadMutasiTwo == 1 ||
              viewModel.loadUploadMutasiThree == 1 ||
              viewModel.loadUploadMutasiFour == 1 ||
              viewModel.loadUploadMutasiFive == 1 ||
              viewModel.loadUploadMutasiSix == 1
          ? null
          : () => ritelMutasiRekening == null
              ? viewModel.validateInputs(MutasiRekeningAPIMethod.add)
              : viewModel.validateInputs(MutasiRekeningAPIMethod.update),
      child: Column(
        children: [
          Form(
            key: viewModel.formKey,
            autovalidateMode: viewModel.autoValidateMode,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
                  child: _buildListDebitur(viewModel),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: _buildNoRekening(viewModel),
                ),
                const ThickLightGreyDivider(),
                const MutasiRekeningFormSection(),
                if (viewModel.count == 2)
                  Column(
                    children: const [
                      ThickLightGreyDivider(),
                      MutasiRekeningFormSectionTwo(),
                    ],
                  )
                else if (viewModel.count == 3)
                  Column(
                    children: const [
                      ThickLightGreyDivider(),
                      MutasiRekeningFormSectionTwo(),
                      ThickLightGreyDivider(),
                      MutasiRekeningFormSectionThree(),
                    ],
                  )
                else if (viewModel.count == 4)
                  Column(
                    children: const [
                      ThickLightGreyDivider(),
                      MutasiRekeningFormSectionTwo(),
                      ThickLightGreyDivider(),
                      MutasiRekeningFormSectionThree(),
                      ThickLightGreyDivider(),
                      MutasiRekeningFormSectionFour(),
                    ],
                  )
                else if (viewModel.count == 5)
                  Column(
                    children: const [
                      ThickLightGreyDivider(),
                      MutasiRekeningFormSectionTwo(),
                      ThickLightGreyDivider(),
                      MutasiRekeningFormSectionThree(),
                      ThickLightGreyDivider(),
                      MutasiRekeningFormSectionFour(),
                      ThickLightGreyDivider(),
                      MutasiRekeningFormSectionFive(),
                    ],
                  )
                else if (viewModel.count == 6)
                  Column(
                    children: const [
                      ThickLightGreyDivider(),
                      MutasiRekeningFormSectionTwo(),
                      ThickLightGreyDivider(),
                      MutasiRekeningFormSectionThree(),
                      ThickLightGreyDivider(),
                      MutasiRekeningFormSectionFour(),
                      ThickLightGreyDivider(),
                      MutasiRekeningFormSectionFive(),
                      ThickLightGreyDivider(),
                      MutasiRekeningFormSectionSix(),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuButton<String> _buildListDebitur(
    MutasiRekeningFormViewModel viewModel,
  ) {
    return PopupMenuButton(
      offset: Offset(0, 65.h),
      itemBuilder: (BuildContext context) {
        return [
          'Bank Mandiri',
          'Bank BRI',
          'Bank RAYA',
          'Bank BCA',
          'Bank BNI',
          'Bank BTN',
          'Bank CIMB Niaga',
          'Bank KB Bukopin',
          'Bank Mega',
          'Bank DKI',
          'Bank UOB',
          'Permata Bank',
          'Shinhan Bank',
          'Bank Syariah Indonesia',
          'OCBC NISP',
          'Bank Danamon',
          'DBS',
          'BTPN',
          'Bank Jatim'
        ].map<PopupMenuItem<String>>((value) {
          return PopupMenuItem(value: value, child: Text(value));
        }).toList();
      },
      onSelected: (String val) => viewModel.updateNamaBank(val),
      child: CustomTextField(
        textEditingController: viewModel.namaBankController,
        label: 'Nama Bank',
        hintText: 'Pilih Nama Bank',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        fillColor: Colors.white,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Nama Bank',
        ),
      ),
    );
  }

  CustomTextField _buildNoRekening(MutasiRekeningFormViewModel vm) {
    return CustomTextField(
      textEditingController: vm.noRekeningController,
      label: 'No. Rekening',
      hintText: 'No. Rekening',
      keyboardType: TextInputType.number,
      onSave: vm.updateNoRekening,
      onChanged: vm.updateNoRekening,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'No. Rekening',
      ),
      withMaxLength: true,
      maxLength: 15,
    );
  }
}

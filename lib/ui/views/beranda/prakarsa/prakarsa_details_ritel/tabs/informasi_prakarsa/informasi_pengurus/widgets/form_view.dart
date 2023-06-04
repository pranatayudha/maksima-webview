// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../../application/app/constants/common.dart';
import '../../../../../../../../../application/models/ritel_informasi_pengurus_cv.dart';
import '../../../../../../../../../application/models/ritel_informasi_pengurus_pt.dart';
import '../../../../../../../../shared/form_layout.dart';
import '../../../../../../../../shared/thick_light_grey_divider.dart';
import '../cv/cv_form_section.dart';
import '../cv/cv_upload_section.dart';
import '../informasi_pengurus_viewmodel.dart';
import '../pt/pt_form_section.dart';
import '../pt/pt_upload_section.dart';
import 'data_navigator.dart';

class InformasiPengurusFormView
    extends ViewModelBuilderWidget<InformasiPengurusViewModel> {
  final String prakarsaId;
  final String pipelineId;
  final int status;
  final int codeTable;
  final List<RitelInformasiPengurusPT>? PTFormData;
  final List<RitelInformasiPengurusCV>? CVFormData;

  const InformasiPengurusFormView({
    required this.codeTable,
    required this.prakarsaId,
    required this.pipelineId,
    required this.status,
    this.PTFormData,
    this.CVFormData,
    Key? key,
  }) : super(key: key);

  @override
  InformasiPengurusViewModel viewModelBuilder(BuildContext context) =>
      InformasiPengurusViewModel(
        prakarsaId: prakarsaId,
        status: status,
        codeTable: codeTable,
        pipelineId: pipelineId,
        ritelInformasiPengurusPTForm: PTFormData,
        ritelInformasiPengurusCVForm: CVFormData,
      );

  @override
  void onViewModelReady(InformasiPengurusViewModel viewModel) =>
      viewModel.initialize();

  @override
  Widget builder(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
    Widget? child,
  ) {
    return FormLayout(
      title: 'Informasi Pengurus/Pemilik',
      description:
          'Pastikan seluruh data terisi dengan benar sesuai Akta Pendirian / Akta Perubahan Terakhir',
      header: DataNavigator(
        length: codeTable == Common.CodeTable.PT
            ? viewModel.ritelInformasiPengurusPTForm?.length ?? 0
            : viewModel.ritelInformasiPengurusCVForm?.length ?? 0,
        prefix: 'Pengurus',
        index: viewModel.informasiPengurusDataNavigatorIndex,
        onChanged: viewModel.changeinformasiPengurusDataNavigatorIndex,
      ),
      onBackButtonPressed: () => viewModel.navigateToInformasiPengurusView(),
      isBusy: false,
      mainButtonTitle: 'UPDATE',
      onMainButtonPressed: () => viewModel.validateInputs(),
      child: Column(
        children: [
          if (codeTable == Common.CodeTable.PT)
            const InformasiPengurusPemilikPTFormSection()
          else
            const InformasiPengurusPemilikCVFormSection(),
          const ThickLightGreyDivider(),
          if (codeTable == Common.CodeTable.PT)
            const PTUploadSection()
          else
            const CVUploadSection(),
        ],
      ),
    );
  }
}

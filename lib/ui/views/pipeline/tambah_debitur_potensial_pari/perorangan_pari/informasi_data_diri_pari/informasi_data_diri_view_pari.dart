import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../application/enums/pipeline_perorangan_api_method.dart';
import '../../../../../../application/models/ritel_informasi_data_diri.dart';
import '../../../../../shared/form_layout.dart';
import '../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_data_diri_form_section_pari.dart';
import 'informasi_data_diri_upload_section_pari.dart';
import 'informasi_data_diri_viewmodel_pari.dart';

class InformasiDataDiriViewPari
    extends ViewModelBuilderWidget<InformasiDataDiriViewModelPari> {
  final String? pipelineId;
  final RitelInformasiDataDiri? ritelInformasiDataDiri;
  final bool fromTdpPeroranganView;
  final bool? fromPipelineDetailsView;
  final int? statusPipeline;

  const InformasiDataDiriViewPari({
    Key? key,
    this.pipelineId,
    required this.fromTdpPeroranganView,
    this.ritelInformasiDataDiri,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  }) : super(key: key);

  @override
  void onViewModelReady(InformasiDataDiriViewModelPari viewModel) =>
      viewModel.initialize();

  @override
  InformasiDataDiriViewModelPari viewModelBuilder(BuildContext context) =>
      InformasiDataDiriViewModelPari(
        pipelineId: pipelineId,
        fromTdpPeroranganView: fromTdpPeroranganView,
        ritelInformasiDataDiri: ritelInformasiDataDiri,
        fromPipelineDetailsView: fromPipelineDetailsView,
        statusPipeline: statusPipeline,
      );

  @override
  Widget builder(
    BuildContext context,
    InformasiDataDiriViewModelPari viewModel,
    Widget? child,
  ) {
    return FormLayout(
      title: 'Informasi Data Diri Debitur',
      description:
          'Lengkapi semua informasi dibawah untuk menambahkan debitur ke Pipeline. Pastikan seluruh data terisi dengan benar',
      onBackButtonPressed: viewModel.navigateBack,
      forwardButtonVisible: false,
      isBusy: false,
      mainButtonTitle: viewModel.pipelineId == null ? 'SIMPAN' : 'UPDATE',
      onMainButtonPressed: viewModel.isBusy
          ? null
          : () => viewModel.pipelineId == null
              ? viewModel
                  .validateInputs(PipelinePeroranganAPIMethod.addDataDiri)
              : viewModel
                  .validateInputs(PipelinePeroranganAPIMethod.updateDataDiri),
      child: Column(
        children: const [
          InformasiDataDiriFormSectionPari(),
          ThickLightGreyDivider(),
          InformasiDataDiriUploadSectionPari(),
        ],
      ),
    );
  }
}

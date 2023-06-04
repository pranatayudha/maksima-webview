import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../application/enums/pipeline_perorangan_api_method.dart';
import '../../../../../../application/models/ritel_informasi_data_diri.dart';
import '../../../../../shared/form_layout.dart';
import '../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_data_diri_form_section.dart';
import 'informasi_data_diri_upload_section.dart';
import 'informasi_data_diri_viewmodel.dart';

class InformasiDataDiriView
    extends ViewModelBuilderWidget<InformasiDataDiriViewModel> {
  final String? pipelineId;
  final RitelInformasiDataDiri? ritelInformasiDataDiri;
  final bool fromTdpPeroranganView;
  final bool? fromPipelineDetailsView;
  final int? statusPipeline;

  const InformasiDataDiriView({
    Key? key,
    this.pipelineId,
    required this.fromTdpPeroranganView,
    this.ritelInformasiDataDiri,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  }) : super(key: key);

  @override
  void onViewModelReady(InformasiDataDiriViewModel viewModel) =>
      viewModel.initialize();

  @override
  InformasiDataDiriViewModel viewModelBuilder(BuildContext context) =>
      InformasiDataDiriViewModel(
        pipelineId: pipelineId,
        fromTdpPeroranganView: fromTdpPeroranganView,
        ritelInformasiDataDiri: ritelInformasiDataDiri,
        fromPipelineDetailsView: fromPipelineDetailsView,
        statusPipeline: statusPipeline,
      );

  @override
  Widget builder(
    BuildContext context,
    InformasiDataDiriViewModel viewModel,
    Widget? child,
  ) {
    return FormLayout(
      title: 'Informasi Data Diri Debitur',
      description:
          'Lengkapi semua informasi dibawah untuk menambahkan debitur pengurus ke Pipeline. Pastikan seluruh data terisi dengan benar.',
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
          InformasiDataDiriFormSection(),
          ThickLightGreyDivider(),
          InformasiDataDiriUploadSection(),
        ],
      ),
    );
  }
}

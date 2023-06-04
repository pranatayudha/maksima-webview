import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../application/enums/pipeline_perorangan_api_method.dart';
import '../../../../../../application/models/ritel_informasi_lainnya.dart';
import '../../../../../shared/form_layout.dart';
import '../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_lainnya_form_section.dart';
import 'informasi_lainnya_upload_section.dart';
import 'informasi_lainnya_viewmodel.dart';

class InformasiLainnyaView
    extends ViewModelBuilderWidget<InformasiLainnyaViewModel> {
  final String? pipelineId;
  final RitelInformasiLainnya? ritelInformasiLainnya;
  final bool fromTdpPeroranganView;
  final bool? fromPipelineDetailsView;
  final int? statusPipeline;

  const InformasiLainnyaView({
    Key? key,
    this.pipelineId,
    this.ritelInformasiLainnya,
    required this.fromTdpPeroranganView,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  }) : super(key: key);

  @override
  void onViewModelReady(InformasiLainnyaViewModel viewModel) =>
      viewModel.initialize();

  @override
  InformasiLainnyaViewModel viewModelBuilder(BuildContext context) =>
      InformasiLainnyaViewModel(
        pipelineId: pipelineId,
        ritelInformasiLainnya: ritelInformasiLainnya,
        fromTdpPeroranganView: fromTdpPeroranganView,
        fromPipelineDetailsView: fromPipelineDetailsView,
        statusPipeline: statusPipeline,
      );

  @override
  Widget builder(
    BuildContext context,
    InformasiLainnyaViewModel viewModel,
    Widget? child,
  ) {
    return FormLayout(
      title: 'Informasi Lainnya',
      description:
          'Lengkapi semua informasi dibawah untuk menambahkan debitur pengurus ke Pipeline. Pastikan seluruh data terisi dengan benar.',
      onBackButtonPressed: viewModel.navigateBack,
      forwardButtonVisible: false,
      isBusy: false,
      mainButtonTitle: viewModel.isLoadingPostData
          ? 'Mohon tunggu...'
          : viewModel.ritelInformasiLainnya == null
              ? 'SIMPAN'
              : 'UPDATE',
      onMainButtonPressed: viewModel.isLoadingPostData
          ? null
          : () => viewModel.ritelInformasiLainnya == null
              ? viewModel.validateInputs(PipelinePeroranganAPIMethod.addLainnya)
              : viewModel
                  .validateInputs(PipelinePeroranganAPIMethod.updateLainnya),
      child: Column(
        children: const [
          InformasiLainnyaFormSection(),
          ThickLightGreyDivider(),
          InformasiLainnyaUploadSection(),
        ],
      ),
    );
  }
}

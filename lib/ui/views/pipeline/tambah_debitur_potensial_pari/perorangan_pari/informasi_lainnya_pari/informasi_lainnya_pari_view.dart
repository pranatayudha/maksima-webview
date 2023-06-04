import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../application/enums/pipeline_perorangan_api_method.dart';
import '../../../../../../application/models/ritel_informasi_lainnya.dart';
import '../../../../../shared/form_layout.dart';
import '../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_lainnya_form_section.dart';
import 'informasi_lainnya_upload_section.dart';
import 'informasi_lainnya_viewmodel.dart';

class InformasiLainnyaPariView
    extends ViewModelBuilderWidget<InformasiLainnyaPariViewModel> {
  final String? pipelineId;
  final RitelInformasiLainnya? ritelInformasiLainnya;
  final bool fromTdpPeroranganView;
  final bool? fromPipelineDetailsView;
  final int? statusPipeline;

  const InformasiLainnyaPariView({
    Key? key,
    this.pipelineId,
    this.ritelInformasiLainnya,
    required this.fromTdpPeroranganView,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  }) : super(key: key);

  @override
  void onViewModelReady(InformasiLainnyaPariViewModel viewModel) =>
      viewModel.initialize();

  @override
  InformasiLainnyaPariViewModel viewModelBuilder(BuildContext context) =>
      InformasiLainnyaPariViewModel(
        pipelineId: pipelineId,
        ritelInformasiLainnya: ritelInformasiLainnya,
        fromTdpPeroranganView: fromTdpPeroranganView,
        fromPipelineDetailsView: fromPipelineDetailsView,
        statusPipeline: statusPipeline,
      );

  @override
  Widget builder(
    BuildContext context,
    InformasiLainnyaPariViewModel viewModel,
    Widget? child,
  ) {
    return FormLayout(
      title: 'Informasi Lainnya PARI',
      description:
          'Lengkapi semua informasi dibawah untuk menambahkan debitur pengurus ke Pipeline. Pastikan seluruh data terisi dengan benar. PARI',
      onBackButtonPressed: viewModel.navigateBack,
      forwardButtonVisible: false,
      isBusy: viewModel.isBusy,
      mainButtonTitle:
          viewModel.ritelInformasiLainnya == null ? 'SIMPAN' : 'UPDATE',
      onMainButtonPressed: viewModel.isBusy
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

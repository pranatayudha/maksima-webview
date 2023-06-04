import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../application/enums/pipeline_perorangan_api_method.dart';
import '../../../../../../application/models/ritel_informasi_usaha.dart';
import '../../../../../shared/form_layout.dart';
import 'informasi_usaha_debitur_form_section.dart';
import 'informasi_usaha_debitur_viewmodel.dart';

class InformasiUsahaDebiturView
    extends ViewModelBuilderWidget<InformasiUsahaDebiturViewModel> {
  final String? pipelineId;
  final RitelInformasiUsaha? ritelInformasiUsaha;
  final bool fromTdpPeroranganView;
  final bool? fromPipelineDetailsView;
  final int? statusPipeline;

  const InformasiUsahaDebiturView({
    Key? key,
    this.pipelineId,
    this.ritelInformasiUsaha,
    required this.fromTdpPeroranganView,
    this.fromPipelineDetailsView = false,
    this.statusPipeline,
  }) : super(key: key);

  @override
  void onViewModelReady(InformasiUsahaDebiturViewModel viewModel) =>
      viewModel.initialize();

  @override
  InformasiUsahaDebiturViewModel viewModelBuilder(BuildContext context) =>
      InformasiUsahaDebiturViewModel(
        pipelineId: pipelineId,
        ritelInformasiUsaha: ritelInformasiUsaha,
        fromTdpPeroranganView: fromTdpPeroranganView,
        fromPipelineDetailsView: fromPipelineDetailsView,
        statusPipeline: statusPipeline,
      );

  @override
  Widget builder(
    BuildContext context,
    InformasiUsahaDebiturViewModel viewModel,
    Widget? child,
  ) {
    return FormLayout(
      title: 'Informasi Usaha Debitur',
      description:
          'Lengkapi semua informasi dibawah untuk menambahkan debitur pengurus ke Pipeline. Pastikan seluruh data terisi dengan benar.',
      onBackButtonPressed: viewModel.navigateBack,
      forwardButtonVisible: false,
      isBusy: false,
      mainButtonTitle:
          viewModel.ritelInformasiUsaha == null ? 'SIMPAN' : 'UPDATE',
      onMainButtonPressed: viewModel.isBusy
          ? null
          : () => viewModel.ritelInformasiUsaha == null
              ? viewModel.validateInputs(PipelinePeroranganAPIMethod.addUsaha)
              : viewModel
                  .validateInputs(PipelinePeroranganAPIMethod.updateUsaha),
      child: Column(
        children: const [
          InformasiUsahaDebiturFormSection(),
        ],
      ),
    );
  }
}

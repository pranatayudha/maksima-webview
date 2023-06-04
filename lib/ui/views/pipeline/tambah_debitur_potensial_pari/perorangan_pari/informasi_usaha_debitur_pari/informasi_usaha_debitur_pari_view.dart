import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../application/enums/pipeline_perorangan_pari_api_method.dart';
import '../../../../../../application/models/ritel_informasi_usaha.dart';
import '../../../../../shared/form_layout.dart';
import 'informasi_usaha_debitur_pari_form_section.dart';
import 'informasi_usaha_debitur_pari_viewmodel.dart';

class InformasiUsahaDebiturPariView
    extends ViewModelBuilderWidget<InformasiUsahaDebiturPariViewModel> {
  final String? pipelineId;
  final RitelInformasiUsaha? ritelInformasiUsaha;
  final bool fromTdpPeroranganView;
  final bool? fromPipelineDetailsView;
  final int? statusPipeline;

  const InformasiUsahaDebiturPariView({
    Key? key,
    this.pipelineId,
    this.ritelInformasiUsaha,
    required this.fromTdpPeroranganView,
    this.fromPipelineDetailsView = false,
    this.statusPipeline,
  }) : super(key: key);

  @override
  void onViewModelReady(InformasiUsahaDebiturPariViewModel viewModel) =>
      viewModel.initialize();

  @override
  InformasiUsahaDebiturPariViewModel viewModelBuilder(BuildContext context) =>
      InformasiUsahaDebiturPariViewModel(
        pipelineId: pipelineId,
        ritelInformasiUsaha: ritelInformasiUsaha,
        fromTdpPeroranganView: fromTdpPeroranganView,
        fromPipelineDetailsView: fromPipelineDetailsView,
        statusPipeline: statusPipeline,
      );

  @override
  Widget builder(
    BuildContext context,
    InformasiUsahaDebiturPariViewModel viewModel,
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
              ? viewModel
                  .validateInputs(PipelinePeroranganPariAPIMethod.addUsahaPari)
              : viewModel.validateInputs(
                  PipelinePeroranganPariAPIMethod.updateUsahaPari,
                ),
      child: Column(
        children: const [
          InformasiUsahaDebiturPariFormSection(),
        ],
      ),
    );
  }
}

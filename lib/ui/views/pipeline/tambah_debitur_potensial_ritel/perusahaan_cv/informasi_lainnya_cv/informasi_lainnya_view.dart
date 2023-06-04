import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../application/enums/pipeline_perusahaan_cv_api_method.dart';
import '../../../../../../application/models/ritel_informasi_lainnya_cv.dart';
import '../../../../../shared/form_layout.dart';
import '../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_lainnya_perusahaan_form_section.dart';
import 'informasi_lainnya_upload_section.dart';
import 'informasi_lainnya_viewmodel.dart';

class InformasiLainnyaCvView
    extends ViewModelBuilderWidget<InformasiLainnyaCvViewModel> {
  final String? pipelineId;
  final RitelInformasiLainnyaCv? ritelInformasiLainnya;
  final bool fromTdpPerusahaanView;
  final bool? fromPipelineDetailsView;
  final int? statusPipeline;

  const InformasiLainnyaCvView({
    Key? key,
    this.pipelineId,
    this.ritelInformasiLainnya,
    required this.fromTdpPerusahaanView,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  }) : super(key: key);

  @override
  void onViewModelReady(InformasiLainnyaCvViewModel viewModel) =>
      viewModel.initialize();

  @override
  InformasiLainnyaCvViewModel viewModelBuilder(BuildContext context) =>
      InformasiLainnyaCvViewModel(
        pipelineId: pipelineId,
        ritelInformasiLainnya: ritelInformasiLainnya,
        fromTdpPerusahaanView: fromTdpPerusahaanView,
        fromPipelineDetailsView: fromPipelineDetailsView,
        statusPipeline: statusPipeline,
      );

  @override
  Widget builder(
    BuildContext context,
    InformasiLainnyaCvViewModel viewModel,
    Widget? child,
  ) {
    return FormLayout(
      title: 'Informasi Lainnya',
      description:
          'Lengkapi semua informasi dibawah untuk menambahkan debitur ke Pipeline. Pastikan seluruh data terisi dengan benar.',
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
          : () => viewModel
              .validateInputs(PipelinePerusahaanCvAPIMethod.updateLainnya),
      child: Column(
        children: const [
          InformasiLainnyaCvFormSection(),
          ThickLightGreyDivider(),
          InformasiLainnyaUploadSection(),
        ],
      ),
    );
  }
}

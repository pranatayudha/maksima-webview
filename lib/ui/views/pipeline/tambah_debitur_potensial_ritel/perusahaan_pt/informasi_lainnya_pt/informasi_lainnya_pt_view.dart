import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../application/enums/pipeline_perusahaan_pt_api_method.dart';
import '../../../../../../application/models/ritel_informasi_lainnya_pt.dart';
import '../../../../../shared/form_layout.dart';
import '../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_lainnya_pt_form_section.dart';
import 'informasi_lainnya_pt_upload_section.dart';
import 'informasi_lainnya_pt_viewmodel.dart';

class InformasiLainnyaPtView
    extends ViewModelBuilderWidget<InformasiLainnyaPtViewModel> {
  final String? pipelineId;
  final RitelInformasiLainnyaPt? ritelInformasiLainnyaPt;
  final bool fromTdpPerusahaanPtView;
  final bool? fromPipelineDetailsView;
  final int? statusPipeline;

  const InformasiLainnyaPtView({
    Key? key,
    this.pipelineId,
    this.ritelInformasiLainnyaPt,
    required this.fromTdpPerusahaanPtView,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  }) : super(key: key);

  @override
  void onViewModelReady(InformasiLainnyaPtViewModel viewModel) =>
      viewModel.initialize();

  @override
  InformasiLainnyaPtViewModel viewModelBuilder(BuildContext context) =>
      InformasiLainnyaPtViewModel(
        pipelineId: pipelineId,
        ritelInformasiLainnyaPt: ritelInformasiLainnyaPt,
        fromTdpPerusahaanView: fromTdpPerusahaanPtView,
        fromPipelineDetailsView: fromPipelineDetailsView,
        statusPipeline: statusPipeline,
      );

  @override
  Widget builder(
    BuildContext context,
    InformasiLainnyaPtViewModel viewModel,
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
          : viewModel.ritelInformasiLainnyaPt == null
              ? 'SIMPAN'
              : 'UPDATE',
      onMainButtonPressed: viewModel.isLoadingPostData
          ? null
          : () => viewModel.ritelInformasiLainnyaPt == null
              ? viewModel
                  .validateInputs(PipelinePerusahaanPtAPIMethod.addLainnya)
              : viewModel
                  .validateInputs(PipelinePerusahaanPtAPIMethod.updateLainnya),
      child: Column(
        children: const [
          InformasiLainnyaPtFormSection(),
          ThickLightGreyDivider(),
          InformasiLainnyaPtUploadSection(),
        ],
      ),
    );
  }
}

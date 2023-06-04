import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../application/enums/pipeline_perusahaan_pt_api_method.dart';
import '../../../../../../application/models/ritel_informasi_perusahaan_pt.dart';
import '../../../../../shared/form_layout.dart';
import '../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_perusahaan_pt_form_section.dart';
import 'informasi_perusahaan_pt_form_section1.dart';
import 'informasi_perusahaan_pt_upload_section.dart';
import 'informasi_perusahaan_pt_viewmodel.dart';

// import 'informasi_data_diri_form_section.dart';
// import 'informasi_data_diri_upload_section.dart';

class InformasiPerusahaanPtView
    extends ViewModelBuilderWidget<InformasiPerusahaanPtViewModel> {
  final String? pipelineId;
  final RitelInformasiPerusahaanPt? ritelInformasiPerusahaanPt;
  final bool fromTdpPerusahaanPtView;
  final bool? fromPipelineDetailsView;
  final int? statusPipeline;

  const InformasiPerusahaanPtView({
    Key? key,
    this.pipelineId,
    required this.fromTdpPerusahaanPtView,
    this.ritelInformasiPerusahaanPt,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  }) : super(key: key);

  @override
  void onViewModelReady(InformasiPerusahaanPtViewModel viewModel) =>
      viewModel.initialize();

  @override
  InformasiPerusahaanPtViewModel viewModelBuilder(BuildContext context) =>
      InformasiPerusahaanPtViewModel(
        pipelineId: pipelineId,
        fromTdpPeroranganView: fromTdpPerusahaanPtView,
        ritelInformasiPerusahaanPt: ritelInformasiPerusahaanPt,
        fromPipelineDetailsView: fromPipelineDetailsView,
        statusPipeline: statusPipeline,
      );

  @override
  Widget builder(
    BuildContext context,
    InformasiPerusahaanPtViewModel viewModel,
    Widget? child,
  ) {
    return FormLayout(
      title: 'Informasi Perusahaan PT',
      description:
          'Lengkapi semua informasi dibawah untuk menambahkan debitur ke Pipeline. Pastikan seluruh data terisi dengan benar.',
      onBackButtonPressed: viewModel.navigateBack,
      forwardButtonVisible: false,
      isBusy: false,
      mainButtonTitle: viewModel.pipelineId == null ? 'SIMPAN' : 'UPDATE',
      onMainButtonPressed: () => viewModel.pipelineId == null
              ? viewModel.validateInputs(
                  PipelinePerusahaanPtAPIMethod.addInformasiPerusahaanPt,
                )
              : viewModel.validateInputs(
                  PipelinePerusahaanPtAPIMethod.updateInformasiPerusahaanPt,
                ),
      child: Column(
        children: const [
          InformasiPerusahaanPtFormSection(),
          ThickLightGreyDivider(),
          InformasiPerusahaanPtFormSection1(),
          ThickLightGreyDivider(),
          InformasiPerusahaanPtUploadSection(),
        ],
      ),
    );
  }
}

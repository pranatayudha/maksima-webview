import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../application/enums/pipeline_perusahaan_cv_api_method.dart';
import '../../../../../../application/models/ritel_informasi_perusahaan_cv.dart';
import '../../../../../shared/form_layout.dart';
import '../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_perusahaan_cv_form_section.dart';
import 'informasi_perusahaan_cv_form_section1.dart';
import 'informasi_perusahaan_cv_upload_section.dart';
import 'informasi_perusahaan_cv_viewmodel.dart';

// import 'informasi_data_diri_form_section.dart';
// import 'informasi_data_diri_upload_section.dart';

class InformasiPerusahaanCvView
    extends ViewModelBuilderWidget<InformasiPerusahaanCvViewModel> {
  final String? pipelineId;
  final RitelInformasiPerusahaanCV? ritelInformasiPerusahaanCv;
  final bool fromTdpPeroranganView;
  final bool? fromPipelineDetailsView;
  final int? statusPipeline;

  const InformasiPerusahaanCvView({
    Key? key,
    this.pipelineId,
    required this.fromTdpPeroranganView,
    this.ritelInformasiPerusahaanCv,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  }) : super(key: key);

  @override
  void onViewModelReady(InformasiPerusahaanCvViewModel viewModel) =>
      viewModel.initialize();

  @override
  InformasiPerusahaanCvViewModel viewModelBuilder(BuildContext context) =>
      InformasiPerusahaanCvViewModel(
        pipelineId: pipelineId,
        fromTdpPeroranganView: fromTdpPeroranganView,
        ritelInformasiPerusahaanCv: ritelInformasiPerusahaanCv,
        fromPipelineDetailsView: fromPipelineDetailsView,
        statusPipeline: statusPipeline,
      );

  @override
  Widget builder(
    BuildContext context,
    InformasiPerusahaanCvViewModel viewModel,
    Widget? child,
  ) {
    return FormLayout(
      title: 'Informasi Perusahaan',
      description:
          'Lengkapi semua informasi dibawah untuk menambahkan debitur ke Pipeline. Pastikan seluruh data terisi dengan benar.',
      onBackButtonPressed: viewModel.navigateBack,
      forwardButtonVisible: false,
      isBusy: false,
      mainButtonTitle: viewModel.pipelineId == null ? 'SIMPAN' : 'UPDATE',
      onMainButtonPressed: viewModel.isBusy
          ? null
          : () => viewModel.pipelineId == null
              ? viewModel.validateInputs(
                  PipelinePerusahaanCvAPIMethod.addInformasiPerusahaanCv,
                )
              : viewModel.validateInputs(
                  PipelinePerusahaanCvAPIMethod.updateInformasiPerusahaanCv,
                ),
      child: Form(
        key: viewModel.formKey,
        autovalidateMode: viewModel.autoValidateMode,
        child: Column(
          children: const [
            InformasiPerusahaanCvFormSection(),
            ThickLightGreyDivider(),
            InformasiPerusahaanCvFormSection1(),
            ThickLightGreyDivider(),
            InformasiPerusahaanCvUploadSection(),
          ],
        ),
      ),
    );
  }
}

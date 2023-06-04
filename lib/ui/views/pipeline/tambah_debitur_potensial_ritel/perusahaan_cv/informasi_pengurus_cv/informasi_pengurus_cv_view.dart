import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../application/enums/pipeline_perusahaan_cv_api_method.dart';
import '../../../../../../application/models/ritel_list_informasi_pengurus_pemilik_cv.dart';
import '../../../../../shared/form_layout.dart';
import '../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_pengurus_cv_upload_section.dart';
import 'informasi_pengurus_cv_viewmodel.dart';
import 'informasi_pengurus_form_section.dart';

class InformasiPengurusCvView
    extends ViewModelBuilderWidget<InformasiPengurusCvViewModel> {
  final String? pipelineId;
  final RitelListInformasiPengurusPemilikCV? ritelInformasiPengurusCv;
  // final bool fromTdpPerusahaanCvView;
  final bool? fromPipelineDetailsView;
  final int? statusPipeline;
  final int nomorPengurus;

  const InformasiPengurusCvView({
    Key? key,
    this.pipelineId,
    this.ritelInformasiPengurusCv,
    // required this.fromTdpPerusahaanCvView,
    this.fromPipelineDetailsView = false,
    this.statusPipeline,
    this.nomorPengurus = 0,
  }) : super(key: key);

  @override
  void onViewModelReady(InformasiPengurusCvViewModel viewModel) =>
      viewModel.initialize();

  @override
  InformasiPengurusCvViewModel viewModelBuilder(BuildContext context) =>
      InformasiPengurusCvViewModel(
        pipelineId: pipelineId,
        fromPipelineDetailsView: fromPipelineDetailsView,
        ritelInformasiPengurusCv: ritelInformasiPengurusCv,
        statusPipeline: statusPipeline,
      );

  @override
  Widget builder(
    BuildContext context,
    InformasiPengurusCvViewModel viewModel,
    Widget? child,
  ) {
    return FormLayout(
      title: 'Informasi Pengurus/Pemilik',
      description:
          'Lengkapi semua informasi dibawah untuk menambahkan debitur pengurus ke Pipeline. Pastikan seluruh data terisi dengan benar.',
      header: Container(
        padding: EdgeInsets.only(bottom: 12.h),
        child: Text(
          statusPipeline != 1
              ? 'Pengurus ${viewModel.ritelListPengurusPerusahaanModel.length + 1}'
              : 'Pengurus ${(nomorPengurus + 1).toString()}',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
        ),
      ),
      onBackButtonPressed: viewModel.navigateBack,
      // forwardButtonVisible: false,
      isBusy: false,
      mainButtonTitle: statusPipeline != 1 ? 'SIMPAN' : 'UPDATE',
      onMainButtonPressed: viewModel.isBusy
          ? null
          : () => statusPipeline != 1
              ? viewModel
                  .validateInputs(PipelinePerusahaanCvAPIMethod.addPengurusCv)
              : viewModel.validateInputs(
                  PipelinePerusahaanCvAPIMethod.updatePengurusCv,
                ),
      child: Column(
        children: const [
          InformasiPengurusCvFormSection(),
          ThickLightGreyDivider(),
          InformasiPengurusCvUploadSection(),
        ],
      ),
    );
  }
}

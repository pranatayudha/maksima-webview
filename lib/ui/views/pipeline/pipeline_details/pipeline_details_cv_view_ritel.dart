import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../application/app/constants/custom_color.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_outlined_button.dart';
import '../../../shared/network_sensitive.dart';
import '../../../shared/processing_indicator.dart';
import '../../../shared/styles.dart';
import '../../../shared/thick_light_grey_divider.dart';
import 'pipeline_details_perusahaan_cv_viewmodel_ritel.dart';
import 'widgets/info_debitur_cv_ritel.dart';
import 'widgets/piepline_details_header_ritel_cv.dart';

class PipelineDetailsCvViewRitel
    extends ViewModelBuilderWidget<PipelineDetailsPerusahaanCvViewModelRitel> {
  final String id;
  final String debiturType;
  final int statusPipeline;
  final int codeTable;

  const PipelineDetailsCvViewRitel(
    this.id,
    this.debiturType,
    this.statusPipeline,
    this.codeTable, {
    Key? key,
  }) : super(key: key);

  @override
  PipelineDetailsPerusahaanCvViewModelRitel viewModelBuilder(
    BuildContext context,
  ) =>
      PipelineDetailsPerusahaanCvViewModelRitel(
        pipelineId: id,
        statusPipeline: statusPipeline,
        codeTable: codeTable,
      );

  @override
  Widget builder(
    BuildContext context,
    PipelineDetailsPerusahaanCvViewModelRitel viewModel,
    Widget? child,
  ) {
    CustomButton buildMulaiPreScreeningBtn() {
      return CustomButton(
        label: 'Mulai Pre-Screening',
        radius: 8.r,
        isBusy: false,
        onPressed: statusPipeline == 2
            ? viewModel.showKonfirmasiPreScreeningDialog
            : null,
      );
    }

    CustomOutlinedButton buildEditDataBtn() {
      return CustomOutlinedButton(
        label: 'Edit Data',
        radius: 8.r,
        labelColor: Colors.blue,
        color: Colors.white,
        onPressed: statusPipeline != 1 && statusPipeline != 2
            ? null
            : viewModel.navigateToTDPPerusahaanCvView,
      );
    }

    return NetworkSensitive(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff0a64b8),
          shadowColor: Colors.transparent,
          title: Center(
            child: Text(
              'Informasi Calon Debitur',
              style: tsHeading6White,
            ),
          ),
          leadingWidth: 30.w,
          leading: Container(
            margin: EdgeInsets.only(left: 5.w),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 24.sp,
              ),
              onPressed: viewModel.navigateToPipelineView,
            ),
          ),
        ),
        body: SafeArea(
          top: false,
          child: (viewModel.informasiPerusahaanCv == null && viewModel.isBusy)
              ? Container(
                  color: Colors.white,
                  child: const Center(
                    child: ProcessingIndicator(
                      label: 'Memuat data...',
                      labelColor: CustomColor.primaryBlue,
                    ),
                  ),
                )
              : Column(
                  children: [
                    PipelineDetailsHeaderRitelCv(statusPipeline),
                    InfoDebiturPerusahaanCvRitel(
                      pipelineId: id,
                      statusPipeline: statusPipeline,
                    ),
                    const ThickLightGreyDivider(),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                      child: Column(
                        children: [
                          buildEditDataBtn(),
                          const SizedBox(height: 18),
                          buildMulaiPreScreeningBtn(),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

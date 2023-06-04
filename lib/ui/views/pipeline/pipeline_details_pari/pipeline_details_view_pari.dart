// ignore_for_file: unused_import

import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../application/app/app.locator.dart';
import '../../../../application/app/constants/custom_color.dart';
import '../../../../application/app/constants/icon_constants.dart';
import '../../../../application/services/url_launcher_service.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_outlined_button.dart';
import '../../../shared/network_sensitive.dart';
import '../../../shared/processing_indicator.dart';
import '../../../shared/styles.dart';
import '../../../shared/thick_light_grey_divider.dart';
import 'pipeline_details_viewmodel_pari.dart';
import 'widgets/info_debitur_perorangan_pari.dart';
import 'widgets/pipeline_details_header_pari_perorangan.dart';

// import 'widgets/info_debitur_perorangan_ritel.dart';
// import 'widgets/pipeline_details_header_ritel_perorangan.dart';

class PipelineDetailsViewPari
    extends ViewModelBuilderWidget<PipelineDetailsViewModelPari> {
  final String id;
  final String debiturType;
  final int statusPipeline;

  const PipelineDetailsViewPari(
    this.id,
    this.debiturType,
    this.statusPipeline, {
    Key? key,
  }) : super(key: key);

  @override
  PipelineDetailsViewModelPari viewModelBuilder(BuildContext context) =>
      PipelineDetailsViewModelPari(
        pipelineId: id,
        statusPipeline: statusPipeline,
      );

  @override
  Widget builder(
    BuildContext context,
    PipelineDetailsViewModelPari viewModel,
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
            : viewModel.navigateToTDPPeroranganView,
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
          centerTitle: true,
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
          child: (viewModel.informasiDataDiri == null && viewModel.isBusy)
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
                    PipelineDetailsHeaderPariPerorangan(statusPipeline),
                    const InfoDebiturPeroranganPari(),
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
          // if (debiturType == 'Perorangan')
          // PipelineDetailsHeaderRitelPerorangan(status),
          // else
          //   PipelineDetailsHeaderRitel(
          //     status: status,
          //     debiturType: debiturType,
          //   ),
          // if (debiturType == 'PT' || debiturType == 'Perusahaan - PT')
          //   const InfoDebiturPTRitel()
          // else if (debiturType == 'CV' || debiturType == 'Perusahaan - CV')
          //   const InfoDebiturCVRitel()
          // else
          // const InfoDebiturPeroranganRitel(),
          // const ThickLightGreyDivider(),
          // if (status == 1)
          // Container(
          //   color: Colors.white,
          //   padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
          //   child: Column(
          //     children: [
          //       _buildEditDataBtn(),
          //       const SizedBox(height: 18),
          //       _buildMulaiPreScreeningBtn(),
          //     ],
          //   ),
          // )
          // else if (status == 2)
          //   Container(
          //     color: Colors.white,
          //     padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
          //     child: Column(
          //       children: [
          //         _buildEditDataBtn(),
          //         const SizedBox(height: 18),
          //         _buildMulaiPreScreeningBtn(),
          //       ],
          //     ),
          //   )
        ),
      ),
    );
  }
}

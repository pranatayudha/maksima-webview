import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../application/enums/pipeline_perusahaan_pt_api_method.dart';
import '../../../../../../application/models/ritel_list_informasi_pengurus_pemilik_pt.dart';
import '../../../../../shared/form_layout.dart';
import '../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_pengurus_pt_viewmodel.dart';
import 'screen/informasi_pengurus_pt_form_section.dart';
import 'screen/informasi_pengurus_pt_upload_section.dart';

class InformasiPengurusPtView
    extends ViewModelBuilderWidget<InformasiPengurusPtViewModel> {
  final String? pipelineId;
  final bool fromTdpPerusahaanPtView;
  final bool? fromPipelineDetailsView;
  final int? statusPipeline;
  final int nomorPengurus;
  // statusPipeline digunakan sebagai sebuah kondisi apakah dia update atau simpan
  // jika 1 maka update, selain itu simpan.
  final RitelListPengurusPerusahaanPTModel? ritelListPengurusPerusahaan;

  const InformasiPengurusPtView({
    Key? key,
    this.pipelineId,
    required this.fromTdpPerusahaanPtView,
    this.fromPipelineDetailsView = false,
    this.statusPipeline,
    this.ritelListPengurusPerusahaan,
    this.nomorPengurus = 0,
  }) : super(key: key);

  @override
  void onViewModelReady(InformasiPengurusPtViewModel viewModel) =>
      viewModel.initialize();

  @override
  InformasiPengurusPtViewModel viewModelBuilder(BuildContext context) =>
      InformasiPengurusPtViewModel(
        pipelineId: pipelineId,
        ritelListPengurus: ritelListPengurusPerusahaan,
        fromTdpPerusahaanPtView: fromTdpPerusahaanPtView,
        fromTdpPipelineDetailsView: fromPipelineDetailsView,
        statusPipeline: statusPipeline,
      );

  @override
  Widget builder(
    BuildContext context,
    InformasiPengurusPtViewModel viewModel,
    Widget? child,
  ) {
    return FormLayout(
      title: 'Informasi Pengurus/Pemilik',
      description:
          'Lengkapi informasi pengurus untuk menambahkan debitur ke Pipeline. Pastikan seluruh data terisi dengan benar',
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
      isBusy: false,
      mainButtonTitle: statusPipeline != 1 ? 'SIMPAN' : 'UPDATE',
      onMainButtonPressed: viewModel.isBusy
          ? null
          : () => statusPipeline != 1
              ? viewModel
                  .validateInputs(PipelinePerusahaanPtAPIMethod.addPengurusPt)
              : viewModel.validateInputs(
                  PipelinePerusahaanPtAPIMethod.updatePengurusPt,
                ),
      child: Column(
        children: const [
          InformasiPengurusPtFormSection(),
          ThickLightGreyDivider(),
          InformasiPengurusPtUploadSection(),
        ],
      ),
    );
  }
}

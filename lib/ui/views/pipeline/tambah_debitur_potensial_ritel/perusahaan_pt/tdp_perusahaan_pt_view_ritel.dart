// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../application/app/constants/icon_constants.dart';
import '../../../../shared/app_bar_widget_close.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/network_sensitive.dart';
import '../../../../shared/styles.dart';
import '../../../../shared/thick_light_grey_divider.dart';
import '../../widgets/item_divider.dart';
import '../widgets/dotted_form_button.dart';
import 'tdp_perusahaan_pt_viewmodel_ritel.dart';

class TDPPerusahaanPtViewRitel
    extends ViewModelBuilderWidget<TDPPerusahaanPtViewModel> {
  final String? pipelineId;
  final bool? fromPipelineDetailsView;
  final bool? fromTDPViewRitel;
  final int? statusPipeline;
  final int? stepperPengurus;

  const TDPPerusahaanPtViewRitel({
    Key? key,
    this.pipelineId,
    this.fromPipelineDetailsView = false,
    this.fromTDPViewRitel = false,
    this.statusPipeline,
    this.stepperPengurus = 0,
  }) : super(key: key);

  @override
  TDPPerusahaanPtViewModel viewModelBuilder(BuildContext context) =>
      TDPPerusahaanPtViewModel(
        pipelineId: pipelineId,
        fromPipelineDetailsView: fromPipelineDetailsView,
        fromTDPViewRitel: fromTDPViewRitel,
        statusPipeline: statusPipeline,
      );

  @override
  Widget builder(
    BuildContext context,
    TDPPerusahaanPtViewModel viewModel,
    Widget? child,
  ) {
    return NetworkSensitive(
      child: Scaffold(
        appBar: AppBarWidgetClose.titleWithBackButton(
          title: 'Tambah Debitur Perusahaan',
          onBackButtonTapped: viewModel.checkCompletedForm,
        ),
        body: viewModel.isBusy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : WillPopScope(
                child: SafeArea(
                  child: GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 8.h),
                              child: Text(
                                'Lengkapi semua informasi dibawah untuk menambahkan debitur perusahaan ke Pipeline.',
                                style: tsDescription,
                              ),
                            ),
                            const ThickLightGreyDivider(),
                            _tabsMenuTDP(viewModel),
                          ],
                        ),
                        Column(
                          children: [
                            _buildSimpanButton(viewModel),
                            SizedBox(height: 10.h),
                            _buildLanjutKePrescreeningButton(viewModel),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                onWillPop: () async {
                  await showWarning(context, viewModel);

                  return true;
                },
              ),
      ),
    );
  }

  Container _tabsMenuTDP(TDPPerusahaanPtViewModel viewModel) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 26.75.h, 0, 30.75.h),
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            left: 29.25.w,
            top: 21.h,
            bottom: 21.h,
            child: Container(
              width: 1.w,
              color: const Color(0xffE9E9E9),
            ),
          ),
          Column(
            children: [
              DottedFormButton(
                label: 'Informasi Perusahaan',
                iconPath: IconConstants.chart,
                completed: pipelineId != null
                    ? viewModel.ritelStepperPerusahaanModel.informasiPerusahaan!
                        ? 2
                        : !viewModel.ritelStepperPerusahaanModel
                                .informasiPerusahaan!
                            ? 1
                            : 0
                    : 0,
                onTap: () => viewModel.navigateToInformasiPerusahaanPt(),
                enabled: true,
              ),
              const ItemDivider(),
              DottedFormButton(
                label: 'Informasi Pengurus/Pemilik',
                iconPath: IconConstants.user,
                completed: pipelineId != null
                    ? viewModel.ritelStepperPerusahaanModel
                            .informasiPengurusPemilik!
                        ? 2
                        : viewModel.ritelListPengurusPerusahaanModel.isNotEmpty
                            ? 1
                            : 0
                    : 0,
                onTap: () => viewModel.navigateToInformasiPengurusPt(),
                enabled: pipelineId == null
                    ? false
                    : viewModel
                        .ritelStepperPerusahaanModel.informasiPerusahaan!,
              ),
              const ItemDivider(),
              DottedFormButton(
                label: 'Informasi Lainnya',
                iconPath: IconConstants.paper,
                completed: pipelineId != null
                    ? viewModel.ritelStepperPerusahaanModel.informasiLainnya!
                        ? 2
                        : 0
                    : 0,
                onTap: () => viewModel.navigateToInformasiLainnyaPt(),
                enabled: pipelineId == null
                    ? false
                    : viewModel
                        .ritelStepperPerusahaanModel.informasiPengurusPemilik!,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding _buildSimpanButton(TDPPerusahaanPtViewModel vm) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: CustomButton(
        label: 'SIMPAN',
        radius: 8.r,
        isBusy: vm.isBusy,
        onPressed: pipelineId == null ? null : vm.savePipeline,
      ),
    );
  }

  Padding _buildLanjutKePrescreeningButton(TDPPerusahaanPtViewModel vm) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: CustomButton(
        label: 'Lanjut ke Pre-Screening',
        radius: 8.r,
        isBusy: false,
        labelColor: pipelineId == null
            ? Colors.white
            : vm.ritelStepperPerusahaanModel.informasiLainnya!
                ? Colors.blue
                : Colors.white,
        color: Colors.grey[50],
        onPressed: pipelineId == null
            ? null
            : vm.ritelStepperPerusahaanModel.informasiLainnya!
                ? vm.showKonfirmasiPreScreeningDialog
                : null,
      ),
    );
  }

  Future<bool?> showWarning(
    BuildContext context,
    TDPPerusahaanPtViewModel vm,
  ) async {
    vm.checkCompletedForm();
  }
}

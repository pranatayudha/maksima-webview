import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../application/app/constants/icon_constants.dart';
import '../../../../shared/app_bar_widget_close.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/network_sensitive.dart';
import '../../../../shared/styles.dart';
import '../../../../shared/thick_light_grey_divider.dart';
import '../../tambah_debitur_potensial_ritel/widgets/dotted_form_button.dart';
import '../../widgets/item_divider.dart';
import 'tdp_perorangan_viewmodel_pari.dart';

class TDPPeroranganViewPari
    extends ViewModelBuilderWidget<TDPPeroranganViewModelPari> {
  final String? pipelineId;
  final bool? fromPipelineDetailsView;
  final bool? fromTDPViewRitel;
  final int? statusPipeline;

  const TDPPeroranganViewPari({
    Key? key,
    this.pipelineId,
    this.fromPipelineDetailsView = false,
    this.fromTDPViewRitel = false,
    this.statusPipeline,
  }) : super(key: key);

  @override
  TDPPeroranganViewModelPari viewModelBuilder(BuildContext context) =>
      TDPPeroranganViewModelPari(
        pipelineId: pipelineId,
        fromPipelineDetailsView: fromPipelineDetailsView,
        statusPipeline: statusPipeline,
        fromTDPViewRitel: fromTDPViewRitel,
      );

  @override
  Widget builder(
    BuildContext context,
    TDPPeroranganViewModelPari viewModel,
    Widget? child,
  ) {
    return NetworkSensitive(
      child: Scaffold(
        appBar: AppBarWidgetClose.titleWithBackButton(
          title: 'Tambah Debitur Potensial',
          // onBackButtonTapped: viewModel.checkCompletedForm,
          onBackButtonTapped: pipelineId == null
              ? viewModel.navigateToPipelineView
              : viewModel.navigateToPipelineDetailsView,
        ),
        body: WillPopScope(
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
                          'Lengkapi semua informasi dibawah untuk menambahkan Calon Debitur ke Pipeline.',
                          style: tsHeading11,
                        ),
                      ),
                      const ThickLightGreyDivider(),
                      Container(
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
                                  label: 'Informasi Data Diri Debitur',
                                  iconPath: IconConstants.chart,
                                  completed:
                                      viewModel.informasiDataDiriCompleted == 2
                                          ? 2
                                          : 0,
                                  onTap: viewModel.navigateToInformasiDataDiri,
                                  enabled: true,
                                ),
                                const ItemDivider(),
                                DottedFormButton(
                                  label: 'Informasi Usaha Debitur',
                                  iconPath: IconConstants.user,
                                  completed:
                                      viewModel.informasiUsahaCompleted == 2
                                          ? 2
                                          : 0,
                                  onTap: viewModel.navigateToInformasiUsahaPari,
                                  enabled:
                                      viewModel.informasiDataDiriCompleted == 2
                                          ? true
                                          : false,
                                ),
                                const ItemDivider(),
                                DottedFormButton(
                                  label: 'Informasi Lainnya',
                                  iconPath: IconConstants.paper,
                                  completed:
                                      viewModel.informasiLainnyaCompleted == 2
                                          ? 2
                                          : 0,
                                  onTap:
                                      viewModel.navigateToInformasiLainnyaPari,
                                  enabled:
                                      viewModel.informasiUsahaCompleted == 2
                                          ? true
                                          : false,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
          onWillPop: () async => false,
        ),
      ),
    );
  }

  Padding _buildSimpanButton(TDPPeroranganViewModelPari vm) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: CustomButton(
        label: 'SIMPAN',
        radius: 8.r,
        isBusy: false,
        onPressed: vm.informasiDataDiriCompleted == 2 ? vm.savePipeline : null,
      ),
    );
  }

  Padding _buildLanjutKePrescreeningButton(TDPPeroranganViewModelPari vm) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: CustomButton(
        label: 'Lanjut ke Pre-Screening',
        radius: 8.r,
        isBusy: false,
        labelColor: vm.allFormsCompleted ? Colors.blue : Colors.white,
        color: Colors.grey[50],
        onPressed:
            vm.allFormsCompleted ? vm.showKonfirmasiPreScreeningDialog : null,
      ),
    );
  }
}

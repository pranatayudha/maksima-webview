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
import 'tdp_perorangan_viewmodel_ritel.dart';

class TDPPeroranganViewRitel
    extends ViewModelBuilderWidget<TDPPeroranganViewModel> {
  final String? pipelineId;
  final bool? fromPipelineDetailsView;
  final bool? fromTDPViewRitel;
  final int? statusPipeline;

  const TDPPeroranganViewRitel({
    Key? key,
    this.pipelineId,
    this.fromPipelineDetailsView = false,
    this.fromTDPViewRitel = false,
    this.statusPipeline,
  }) : super(key: key);

  @override
  TDPPeroranganViewModel viewModelBuilder(BuildContext context) =>
      TDPPeroranganViewModel(
        pipelineId: pipelineId,
        fromPipelineDetailsView: fromPipelineDetailsView,
        fromTDPViewRitel: fromTDPViewRitel,
        statusPipeline: statusPipeline,
      );

  @override
  Widget builder(
    BuildContext context,
    TDPPeroranganViewModel viewModel,
    Widget? child,
  ) {
    return NetworkSensitive(
      child: Scaffold(
        appBar: AppBarWidgetClose.titleWithBackButton(
          title: 'Tambah Debitur Potensial',
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
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(0, 26.75.h, 0, 30.75.h),
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
                                        completed: viewModel
                                            .informasiDataDiriCompleted,
                                        onTap: () => viewModel
                                            .navigateToInformasiDataDiri(),
                                        enabled: true,
                                      ),
                                      const ItemDivider(),
                                      DottedFormButton(
                                        label: 'Informasi Usaha Debitur',
                                        iconPath: IconConstants.user,
                                        completed:
                                            viewModel.informasiUsahaCompleted,
                                        onTap: () => viewModel
                                            .navigateToInformasiUsaha(),
                                        enabled: viewModel.hasPipelineId &&
                                            viewModel.checkDataDiriCompleted,
                                      ),
                                      const ItemDivider(),
                                      DottedFormButton(
                                        label: 'Informasi Lainnya',
                                        iconPath: IconConstants.paper,
                                        completed:
                                            viewModel.informasiLainnyaCompleted,
                                        onTap: () => viewModel
                                            .navigateToInformasiLainnya(),
                                        enabled: viewModel.hasPipelineId &&
                                            viewModel.checkUsahaCompleted,
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

  Padding _buildSimpanButton(TDPPeroranganViewModel vm) {
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

  Padding _buildLanjutKePrescreeningButton(TDPPeroranganViewModel vm) {
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

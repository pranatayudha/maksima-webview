import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../application/app/app.locator.dart';
import '../../../../../application/app/constants/custom_color.dart';
import '../../../../../application/app/constants/icon_constants.dart';
import '../../../../../application/helpers/status_prakarsa_int_formatter.dart';
import '../../../../../application/services/url_launcher_service.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/network_sensitive.dart';
import '../../../../shared/processing_indicator.dart';
import '../../../../shared/styles.dart';
import 'prakarsa_details_viewmodel_ritel.dart';
import 'tabs/status_prakarsa_tabs.dart';
import 'widgets/prakarsa_details_header_ritel.dart';

class PrakarsaDetailsViewRitel
    extends ViewModelBuilderWidget<PrakarsaDetailsViewModelRitel> {
  final int? index;
  final String prakarsaId;
  final String pipelineId;
  final int? loanTypesId;
  final int? codeTable;

  const PrakarsaDetailsViewRitel({
    Key? key,
    this.index = 0,
    required this.prakarsaId,
    required this.pipelineId,
    this.loanTypesId,
    this.codeTable,
  }) : super(key: key);

  @override
  PrakarsaDetailsViewModelRitel viewModelBuilder(BuildContext context) =>
      PrakarsaDetailsViewModelRitel(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        codeTable: codeTable!,
        loanTypeId: loanTypesId!,
      );

  @override
  // ignore: long-method
  Widget builder(
    BuildContext context,
    PrakarsaDetailsViewModelRitel viewModel,
    Widget? child,
  ) {
    return NetworkSensitive(
      child: WillPopScope(
        onWillPop: () async {
          viewModel.navigateToPrakarsaList();
          // ignore: newline-before-return
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff0a64b8),
            shadowColor: Colors.transparent,
            leading: Container(
              margin: EdgeInsets.only(left: 5.w),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24.sp,
                ),
                onPressed: viewModel.navigateToPrakarsaList,
              ),
            ),
            title: Center(
              child: Text(
                'Status Prakarsa',
                style: tsHeading6White,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  final splitPIC = viewModel
                      .ritelPrakaraStatusPengajuan.header!.pic!
                      .split(' - ');
                  locator<URLLauncherService>().call(splitPIC[1]);
                },
                child: Image.asset(IconConstants.calling, scale: 3),
              ),
            ],
          ),
          body: SafeArea(
            top: false,
            child: (viewModel.isBusy)
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
                      PrakarsaDetailsHeaderRitel(
                        header: viewModel.ritelPrakarsaInfoPrakarsaHeader,
                        prakarsaId: prakarsaId,
                        pipelineId: pipelineId,
                        codeTable: codeTable!,
                        statusPengajuanBody:
                            viewModel.ritelPrakaraStatusPengajuan.body!,
                      ),
                      StatusPrakarsaTabs(
                        index: index!,
                        header: viewModel.ritelPrakarsaInfoPrakarsaHeader,
                        prakarsaId: prakarsaId,
                        pipelineId: pipelineId,
                        statusPengajuanBody:
                            viewModel.ritelPrakaraStatusPengajuan.body!,
                        prakarsaPerorangan: viewModel.ritelPrakarsaPerorangan,
                        loanTypesId: loanTypesId!,
                        codeTable: codeTable!,
                        status: StatusPrakarsaIntFormatter.toInt(
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status!,
                        ),
                        approvalStep: viewModel
                            .ritelPrakaraStatusPengajuan.header!.approvalStep!,
                      ),
                      // BUTTON SEND CHECKER - NANDA HASYIM
                      if (viewModel.ritelPrakarsaInfoPrakarsaHeader.status == 'Revisi ADK - 1' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi ADK - 2' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi ADK - 3' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi ADK - 4' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi ADK - 5' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi ADK - 6' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi ADK - 7' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi ADK - 8' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi ADK - 9' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi ADK - 10' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi CBL - 1' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi CBL - 2' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi CBL - 3' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi CBL - 4' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi CBL - 5' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi CBL - 6' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi CBL - 7' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi CBL - 8' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi CBL - 9' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi CBL - 10' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi Pemutus Pusat - 1' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi Pemutus Pusat - 2' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi Pemutus Pusat - 3' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi Pemutus Pusat - 4' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi Pemutus Pusat - 5' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi Pemutus Pusat - 6' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi Pemutus Pusat - 7' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi Pemutus Pusat - 8' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi Pemutus Pusat - 9' ||
                          viewModel.ritelPrakarsaInfoPrakarsaHeader.status ==
                              'Revisi Pemutus Pusat - 10')
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            color: Color(0xffFFFFFF),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(40, 41, 61, 0.08),
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                              BoxShadow(
                                color: Color.fromRGBO(96, 97, 112, 0.24),
                                blurRadius: 32,
                                offset: Offset(0, 20),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(16),
                          child: CustomButton(
                            label: 'Kirim Kembali ke Checker',
                            isBusy: false,
                            onPressed: viewModel.postSendToChecker,
                          ),
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

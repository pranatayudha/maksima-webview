import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../application/app/constants/image_constants.dart';
import '../../../../../../../../application/services/url_launcher_service.dart';
import '../../../../../../../shared/custom_button.dart';
import '../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../shared/styles.dart';
import 'hasil_analisa_pinjaman_viewmodel.dart';

class HasilAnalisaPinjamanViewRitel
    extends ViewModelBuilderWidget<HasilAnalisaPinjamanViewModel> {
  final String debiturName;
  final String prakarsaId;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;
  final int? status;

  const HasilAnalisaPinjamanViewRitel({
    Key? key,
    required this.debiturName,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
    this.status,
  }) : super(key: key);

  @override
  void onViewModelReady(HasilAnalisaPinjamanViewModel viewModel) =>
      viewModel.initialize();

  @override
  HasilAnalisaPinjamanViewModel viewModelBuilder(BuildContext context) =>
      HasilAnalisaPinjamanViewModel(
        debiturName: debiturName,
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        codeTable: codeTable,
      );

  @override
  Widget builder(
    BuildContext context,
    HasilAnalisaPinjamanViewModel viewModel,
    Widget? child,
  ) {
    return NetworkSensitive(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Draft PTK',
            style: tsHeading6,
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          centerTitle: true,
          actions: [
            if (!viewModel.isBusy || viewModel.fileDraftPTK != null)
              Container(
                margin: EdgeInsets.only(right: 15.w),
                padding: EdgeInsets.zero,
                width: 33.w,
                child: IconButton(
                  icon: const Icon(
                    Icons.download,
                    color: CustomColor.primaryOrange,
                  ),
                  onPressed: () => locator<URLLauncherService>()
                      .browse(viewModel.fileDraftPTK!),
                ),
              ),
          ],
        ),
        body: viewModel.isBusy || viewModel.fileDraftPTK == null
            ? const Center(child: CircularProgressIndicator())
            : viewModel.fileDraftPTK == ''
                ? Center(child: _buildHaventDraftPTK())
                : _buildDraftPTK(viewModel),
      ),
    );
  }

  Container _buildHaventDraftPTK() {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
      margin: EdgeInsets.fromLTRB(32.w, 0, 32.w, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageConstants.slikDitolak, scale: 2.5),
          SizedBox(height: 16.h),
          Text(
            'Tidak ada dokumen Draft PTK',
            style: tsHeading8,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  SafeArea _buildDraftPTK(HasilAnalisaPinjamanViewModel viewModel) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Container(
          //   color: Colors.white,
          //   padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
          //   child: Text(
          //     'Berikut hasil pembuatan PTK oleh sistem. Periksa kembali sebelum dikirim ke Checker',
          //     style: TextStyle(
          //         fontSize: 14.sp,
          //         fontWeight: FontWeight.w400,
          //         color: const Color(0xff03213E)),
          //   ),
          // ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 16, bottom: 16),
              child: SfPdfViewer.network(viewModel.fileDraftPTK!),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  if (status == 1)
                    Expanded(
                      child: CustomButton(
                        isBusy: false,
                        radius: 8.r,
                        color: const Color(0xff027DEF),
                        label: 'Dikirim ke Checker',
                        onPressed: viewModel.showConfirmSendToCheckerDialog,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

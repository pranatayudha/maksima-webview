import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../application/models/ritel_riwayat_projek.dart';
import '../../../../../../../../shared/custom_button.dart';
import '../../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../../shared/processing_indicator.dart';
import '../../../../../../../../shared/styles.dart';
import 'riwayat_projek_viewmodel.dart';
import 'upload_button_riwayat_proyek.dart';

class RiwayatProjekView extends ViewModelBuilderWidget<RiwayatProyekViewModel> {
  final String prakarsaId;
  final RitelRiwayatProjek? ritelRiwayatProjek;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;

  const RiwayatProjekView({
    Key? key,
    required this.prakarsaId,
    this.ritelRiwayatProjek,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  RiwayatProyekViewModel viewModelBuilder(BuildContext context) =>
      RiwayatProyekViewModel(
        prakarsaId: prakarsaId,
        ritelRiwayatProjek: ritelRiwayatProjek,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
      );

  @override
  void onViewModelReady(RiwayatProyekViewModel viewModel) =>
      viewModel.initialize();

  @override
  Widget builder(
    BuildContext context,
    RiwayatProyekViewModel viewModel,
    Widget? child,
  ) {
    Padding buildSimpanRiwayatProyek(RiwayatProyekViewModel viewModel) {
      return Padding(
        padding: EdgeInsets.all(16.w),
        child: CustomButton(
          label: 'Simpan',
          radius: 8.r,
          isBusy: viewModel.isBusy,
          onPressed: viewModel.uploadFileRiwayatProyek,
        ),
      );
    }

    return NetworkSensitive(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          title: Text(
            'Riwayat Projek',
            style: tsHeading6,
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: viewModel.navigateBack,
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24.sp,
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15.w),
              padding: EdgeInsets.zero,
              width: 30.w,
              child: IconButton(
                icon: Icon(
                  Icons.download_sharp,
                  color: const Color(0xffF07126),
                  size: 24.sp,
                ),
                onPressed: () => viewModel.downloadRiwayatProjekTemplate(),
              ),
            ),
          ],
        ),
        body: ModalProgressHUD(
          inAsyncCall: viewModel.isBusy,
          progressIndicator: const ProcessingIndicator(
            label: 'Memuat data...',
            labelColor: CustomColor.primaryBlack,
          ),
          child: SafeArea(
            child: WillPopScope(
              onWillPop: () async => false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          'Download template diatas terlebih dahulu untuk mengisi dokumen riwayat proyek dan upload pada kolom dibawah',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: _buildUploadRiwayatProyek(viewModel),
                      ),
                    ],
                  ),
                  buildSimpanRiwayatProyek(viewModel),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  UploadButtonRiwayatProyek _buildUploadRiwayatProyek(
    RiwayatProyekViewModel viewModel,
  ) {
    return UploadButtonRiwayatProyek(
      fileRiwayatProyek: viewModel.fileRiwayatProjek,
      nameFile: viewModel.fileRiwayatProjek == null
          ? ''
          : viewModel.namePath.toString(),
      onPressed: viewModel.fileRiwayatProjek == null
          ? viewModel.pickFile
          : viewModel.clearRiwayatProjek,
      errorText: '',
    );
  }
}

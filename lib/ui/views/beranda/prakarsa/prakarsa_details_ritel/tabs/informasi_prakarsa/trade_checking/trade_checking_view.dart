import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../shared/custom_button.dart';
import '../../../../../../../shared/custom_textfield.dart';
import '../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../shared/processing_indicator.dart';
import '../../../../../../../shared/styles.dart';
import 'trade_checking_viewmodel.dart';
import 'upload_button_trade_checking.dart';

class TradeCheckingView extends ViewModelBuilderWidget<TradeCheckingViewModel> {
  final String prakarsaId;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;

  const TradeCheckingView({
    Key? key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  TradeCheckingViewModel viewModelBuilder(BuildContext context) =>
      TradeCheckingViewModel(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
      );

  @override
  void onViewModelReady(TradeCheckingViewModel viewModel) =>
      viewModel.initialize();

  @override
  Widget builder(
    BuildContext context,
    TradeCheckingViewModel viewModel,
    Widget? child,
  ) {
    Padding buildSimpanTradeChecking(TradeCheckingViewModel viewModel) {
      return Padding(
        padding: EdgeInsets.all(16.w),
        child: CustomButton(
          label: 'Simpan',
          radius: 8.r,
          isBusy: viewModel.isBusy,
          onPressed: viewModel.uploadTradeChecking,
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
            'Trade Checking',
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
                onPressed: () => viewModel.downloadTradeCheckingTemplate(),
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          'Download template diatas terlebih dahulu untuk mengisi dokumen informasi supplier buyer dan upload pada kolom dibawah',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: _buildUploadTradeChecking(viewModel),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: CustomTextField(
                          label: 'Hasil Trade Checking *',
                          labelSize: 12.sp,
                          textEditingController:
                              viewModel.hasilTradeCheckingController,
                          hintText: 'Masukkan Hasil Trade Checking',
                          onSave: viewModel.updateHasilTradeCheckingController,
                        ),
                      ),
                    ],
                  ),
                  buildSimpanTradeChecking(viewModel),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  UploadButtonTradeChecking _buildUploadTradeChecking(
    TradeCheckingViewModel viewModel,
  ) {
    return UploadButtonTradeChecking(
      fileTradeChecking: viewModel.fileTradeChecking,
      nameFile: viewModel.fileTradeChecking == null
          ? ''
          : viewModel.namePath.toString(),
      onPressed: viewModel.fileTradeChecking == null
          ? viewModel.pickFile
          : viewModel.clearTradeChecking,
      errorText: '',
    );
  }
}

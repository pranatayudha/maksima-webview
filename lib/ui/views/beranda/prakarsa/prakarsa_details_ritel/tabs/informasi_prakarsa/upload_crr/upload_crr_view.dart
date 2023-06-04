
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../shared/custom_button.dart';
import '../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../shared/styles.dart';
import '../../../../../../../shared/upload_item_button_with_container.dart';
import 'upload_crr_viewmodel.dart';

class UploadCRRView extends ViewModelBuilderWidget<UploadCRRViewModel> {
  final String prakarsaId;
  final String pipelineId;
  final int loanTypesId;
  final String? url;
  final int status;
  final int codeTable;

  const UploadCRRView({
    Key? key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
    this.url,
  }) : super(key: key);

  // @override
  // void onViewModelReady(UploadCRRViewModel viewModel) => viewModel.initialize();

  @override
  UploadCRRViewModel viewModelBuilder(BuildContext context) =>
      UploadCRRViewModel(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        url: url,
        status: status,
        codeTable: codeTable,
      );

  @override
  Widget builder(
    BuildContext context,
    UploadCRRViewModel viewModel,
    Widget? child,
  ) {
    return NetworkSensitive(
      child: WillPopScope(
        onWillPop: () async {
          viewModel.navigateBack();

          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: Text(
              'Upload CRR',
              style: tsHeading6,
            ),
            centerTitle: true,
            leading: GestureDetector(
              onTap: viewModel.navigateBack, //navigateBack
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 24.sp,
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: _buildUploadCRR(viewModel),
              ),
              _buildSimpanCRR(viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildSimpanCRR(UploadCRRViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: CustomButton(
        label: 'Simpan',
        radius: 8.r,
        isBusy: viewModel.isBusy,
        onPressed: viewModel.fileCRR != null ? viewModel.uploadFileCRR : null,
      ),
    );
  }

  UploadItemButtonWithContainer _buildUploadCRR(
    UploadCRRViewModel vm,
  ) {
    return UploadItemButtonWithContainer(
      file: vm.fileCRR,
      path: 'CRR',
      label: 'CRR *',
      onPressed: vm.fileCRR == null ? vm.pickFile : vm.clearCRR,
      errorText: '',
    );
  }
}

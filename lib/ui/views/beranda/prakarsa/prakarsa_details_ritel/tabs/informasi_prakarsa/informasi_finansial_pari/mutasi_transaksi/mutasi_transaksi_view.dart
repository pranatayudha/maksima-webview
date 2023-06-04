
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../application/models/ritel_mutasi_transaksi_pari.dart';
import '../../../../../../../../shared/custom_button.dart';
import '../../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../../shared/processing_indicator.dart';
import '../../../../../../../../shared/styles.dart';
import '../../../../../../../../shared/upload_item_button_with_container.dart';
import 'mutasi_transaksi_viewmodel.dart';

class MutasiTransaksiPariView
    extends ViewModelBuilderWidget<MutasiTransaksiPariViewModel> {
  final String prakarsaId;
  final RitelMutasiTransaksiPariModel? ritelMutasiTransaksiPariModel;
  final PlatformFile? fileMutasiTransaksiPari;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;

  const MutasiTransaksiPariView({
    Key? key,
    required this.prakarsaId,
    this.ritelMutasiTransaksiPariModel,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
    this.fileMutasiTransaksiPari,
  }) : super(key: key);

  @override
  MutasiTransaksiPariViewModel viewModelBuilder(BuildContext context) =>
      MutasiTransaksiPariViewModel(
        prakarsaId: prakarsaId,
        mutasiTransaksiPariModel: ritelMutasiTransaksiPariModel,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
      );

  @override
  void onViewModelReady(MutasiTransaksiPariViewModel viewModel) =>
      viewModel.initialize();

  @override
  Widget builder(
    BuildContext context,
    MutasiTransaksiPariViewModel viewModel,
    Widget? child,
  ) {
    Padding buildSimpanMutasiTransaksiPari(
      MutasiTransaksiPariViewModel viewModel,
    ) {
      return Padding(
        padding: EdgeInsets.all(16.w),
        child: CustomButton(
          label: 'Simpan',
          radius: 8.r,
          isBusy: viewModel.isBusy,
          onPressed: viewModel.uploadFileMutasiTransaksi,
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
            'Mutasi Transaksi',
            style: tsHeading6,
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: viewModel.navigateBack,
            // onTap: () {},
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
                onPressed: () => viewModel.downloadMutasiTransaksiTemplate(
                  'https://storage.googleapis.com/bridgtl-prt-d-bkt-apps/dev1/file/Template-mutasi-transaksi.xlsx',
                ),
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
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: _buildUploadMutasiTransaksiPari(viewModel),
                  ),
                  buildSimpanMutasiTransaksiPari(viewModel),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  UploadItemButtonWithContainer _buildUploadMutasiTransaksiPari(
    MutasiTransaksiPariViewModel viewModel,
  ) {
    return UploadItemButtonWithContainer(
      file: viewModel.fileMutasiTransaksi,
      path: 'Mutasi Transaksi',
      label: 'Mutasi Transaksi *',
      onPressed: viewModel.fileMutasiTransaksi == null
          ? viewModel.pickFile
          : viewModel.clearMutasiTransaksi,
      errorText: '',
    );
  }
}

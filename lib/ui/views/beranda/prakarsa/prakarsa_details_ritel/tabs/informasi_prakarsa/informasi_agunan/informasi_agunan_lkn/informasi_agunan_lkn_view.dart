import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../application/app/constants/image_constants.dart';
import '../../../../../../../../shared/processing_indicator.dart';
import '../../../../../../../../shared/styles.dart';
import 'informasi_agunan_lkn_viewmodel.dart';
import 'widgets/informasi_agunan_lkn_card.dart';

class InformasiAgunanLKNView
    extends ViewModelBuilderWidget<InformasiAgunanLKNViewModel> {
  final String prakarsaId;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;

  const InformasiAgunanLKNView({
    Key? key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  InformasiAgunanLKNViewModel viewModelBuilder(BuildContext context) =>
      InformasiAgunanLKNViewModel(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
      );

  @override
  Widget builder(
    BuildContext context,
    InformasiAgunanLKNViewModel viewModel,
    Widget? child,
  ) {
    return viewModel.isBusy
        ? Container(
            color: Colors.white,
            child: const Center(
              child: ProcessingIndicator(
                label: 'Memuat data...',
                labelColor: CustomColor.primaryBlue,
              ),
            ),
          )
        : viewModel.ritelLaporanKunjunganNasabah!.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageConstants.mutasiRekening1,
                      scale: 2.5,
                    ),
                    Text(
                      'Belum ada informasi laporan kunjungan nasabah',
                      style: tsHeading6,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Klik tombol di bawah untuk menambahkan',
                      style: TextStyle(
                        color: const Color(0xff66788A),
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: viewModel.ritelLaporanKunjunganNasabah!.length,
                itemBuilder: (context, index) {
                  final laporanKunjunganNasabah =
                      viewModel.ritelLaporanKunjunganNasabah![index];
                  // ignore: newline-before-return
                  return InformasiAgunanLKNCard(
                    ritelLaporanKunjunganNasabah: laporanKunjunganNasabah,
                    onPressed: () => viewModel.navigateToInfoAgunanLknDetails(
                      laporanKunjunganNasabah,
                    ),
                  );
                },
              );
  }
}

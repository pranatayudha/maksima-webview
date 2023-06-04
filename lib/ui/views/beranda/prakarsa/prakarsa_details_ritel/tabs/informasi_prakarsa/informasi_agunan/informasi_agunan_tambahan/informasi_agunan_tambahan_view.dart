import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../application/app/constants/image_constants.dart';
import '../../../../../../../../shared/processing_indicator.dart';
import '../../../../../../../../shared/styles.dart';
import 'informasi_agunan_tambahan_viewmodel.dart';
import 'widgets/informasi_agunan_tambahan_card.dart';

class InformasiAgunanTambahanView
    extends ViewModelBuilderWidget<InformasiAgunanTambahanViewModel> {
  final String prakarsaId;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;

  const InformasiAgunanTambahanView({
    Key? key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  InformasiAgunanTambahanViewModel viewModelBuilder(BuildContext context) =>
      InformasiAgunanTambahanViewModel(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
      );

  @override
  Widget builder(
    BuildContext context,
    InformasiAgunanTambahanViewModel viewModel,
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
        : viewModel.ritelInformasiAgunanTambahan!.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageConstants.mutasiRekening1,
                      scale: 2.5,
                    ),
                    Text(
                      'Belum ada agunan tambahan',
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
                itemCount: viewModel.ritelInformasiAgunanTambahan!.length,
                itemBuilder: (context, index) {
                  final agunanTambahan =
                      viewModel.ritelInformasiAgunanTambahan![index];
                  // ignore: newline-before-return
                  return InformasiAgunanTambahanCard(
                    ritelInformasiAgunanTambahan: agunanTambahan,
                    onPressed: () => viewModel
                        .navigateToAgunanTambahanDetails(agunanTambahan),
                  );
                },
              );
  }
}

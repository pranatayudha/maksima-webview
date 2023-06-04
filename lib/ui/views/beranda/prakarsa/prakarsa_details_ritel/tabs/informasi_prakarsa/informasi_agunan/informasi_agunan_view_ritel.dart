// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../shared/custom_button.dart';
import '../../../../../../../shared/styles.dart';
import '../../../prakarsa_details_view_ritel.dart';
import 'informasi_agunan_lkn/informasi_agunan_lkn_form.dart';
import 'informasi_agunan_pokok/widgets/informasi_agunan_pokok_form.dart';
import 'informasi_agunan_tambahan/informasi_agunan_tambahan_form.dart';
import 'informasi_agunan_viewmodel_ritel.dart';
import 'widgets/informasi_agunan_button.dart';
import 'widgets/informasi_agunan_tabs.dart';

class InformasiAgunanViewRitel extends StatelessWidget {
  final String prakarsaId;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;

  const InformasiAgunanViewRitel({
    Key? key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InformasiAgunanViewModel>.reactive(
      viewModelBuilder: () => InformasiAgunanViewModel(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
      ),
      builder: (context, viewModel, child) {
        return WillPopScope(
          onWillPop: () async {
            locator<NavigationService>().navigateTo(
              Routes.prakarsaDetailsViewRitel,
              arguments: PrakarsaDetailsViewRitelArguments(
                index: 1,
                loanTypesId: loanTypesId,
                prakarsaId: prakarsaId,
                pipelineId: pipelineId,
                codeTable: codeTable,
              ),
            );
            // ignore: newline-before-return
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24.sp,
                ),
                onTap: () => Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => PrakarsaDetailsViewRitel(
                      index: 1,
                      pipelineId: pipelineId,
                      prakarsaId: prakarsaId,
                      loanTypesId: loanTypesId,
                      codeTable: codeTable,
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              title: Text(
                'Informasi Agunan & LKN',
                style: tsHeading6,
              ),
              centerTitle: true,
              foregroundColor: Colors.black,
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
            body: Column(
              children: [
                InformasiAgunanTabs(
                  prakarsaId: prakarsaId,
                  pipelineId: pipelineId,
                  loanTypesId: loanTypesId,
                  status: status,
                  codeTable: codeTable,
                ),
                if (status <= 2)
                  _buildTambahInformasi(
                    context,
                    prakarsaId,
                    pipelineId,
                    loanTypesId,
                    status,
                    codeTable,
                    viewModel,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ignore: long-parameter-list
Align _buildTambahInformasi(
  BuildContext context,
  String prakarsaId,
  String pipelineId,
  int loanTypesId,
  int status,
  int codeTable,
  InformasiAgunanViewModel viewModel,
) {
  return Align(
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
          Expanded(
            child: CustomButton(
              isBusy: false,
              label: 'Tambah Informasi',
              onPressed: () => _buildModalBottom(
                context,
                prakarsaId,
                pipelineId,
                loanTypesId,
                status,
                codeTable,
                viewModel,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// ignore: long-parameter-list
void _buildModalBottom(
  BuildContext context,
  String prakarsaId,
  String pipelineId,
  int loanTypesId,
  int status,
  int codeTable,
  InformasiAgunanViewModel viewModel,
) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    builder: (BuildContext context) {
      return Wrap(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        'Tambah Informasi',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Image.asset(
                          IconConstants.x,
                          scale: 3,
                          color: const Color(0xff333F48),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                if (viewModel.ritelPrakarsaAgunanPokokList!.isEmpty)
                  InformasiAgunanButton(
                    label: 'Informasi Agunan Pokok',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InformasiAgunanPokokForm(
                          prakarsaId: prakarsaId,
                          pipelineId: pipelineId,
                          loanTypesId: loanTypesId,
                          status: status,
                          codeTable: codeTable,
                        ),
                      ),
                    ),
                  ),
                InformasiAgunanButton(
                  label: 'Informasi Agunan Tambahan',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InformasiAgunanTambahanForm(
                        prakarsaId: prakarsaId,
                        pipelineId: pipelineId,
                        loanTypesId: loanTypesId,
                        status: status,
                        codeTable: codeTable,
                      ),
                    ),
                  ),
                  isLast: true,
                ),
                // InformasiAgunanButton(
                //   label: 'Laporan Kunjungan Nasabah',
                //   onPressed: () => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => InformasiAgunanLknForm(
                //         prakarsaId: prakarsaId,
                //         pipelineId: pipelineId,
                //         loanTypesId: loanTypesId,
                //         status: status,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

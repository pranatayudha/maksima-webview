import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../shared/custom_button.dart';
import '../../../../../../../shared/styles.dart';
import '../../../prakarsa_details_view_ritel.dart';
import 'informasi_agunan_tambahan_pari/informasi_agunan_tambahan_form_pari.dart';
import 'informasi_agunan_viewmodel_pari.dart';
import 'widgets/informasi_agunan_button_pari.dart';
import 'widgets/informasi_agunan_tabs_pari.dart';

class InformasiAgunanViewPari extends StatelessWidget {
  final String prakarsaId;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;
  final int status;

  const InformasiAgunanViewPari({
    Key? key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InformasiAgunanViewModelPari>.reactive(
      viewModelBuilder: () => InformasiAgunanViewModelPari(
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
                codeTable: 4,
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
                      codeTable: 4,
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
                InformasiAgunanTabsPari(
                  prakarsaId: prakarsaId,
                  pipelineId: pipelineId,
                  loanTypesId: loanTypesId,
                  codeTable: codeTable,
                  status: status,
                ),
                if (status <= 2)
                  _buildTambahInformasi(
                    context,
                    prakarsaId,
                    pipelineId,
                    loanTypesId,
                    codeTable,
                    status,
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
  int codeTable,
  int status,
  InformasiAgunanViewModelPari viewModel,
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
                codeTable,
                status,
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
  int codeTable,
  int status,
  InformasiAgunanViewModelPari viewModel,
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
                // if (viewModel.ritelPrakarsaAgunanPokokList!.isEmpty)
                //   InformasiAgunanButtonPari(
                //     label: 'Informasi Agunan Pokok',
                //     onPressed: () => Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => InformasiAgunanPokokFormPari(
                //           prakarsaId: prakarsaId,
                //           pipelineId: pipelineId,
                //           loanTypesId: loanTypesId,
                //           status: status,
                //           codeTable: codeTable,
                //         ),
                //       ),
                //     ),
                //   ),
                InformasiAgunanButtonPari(
                  label: 'Informasi Agunan Tambahan',
                  isLast: true,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InformasiAgunanTambahanFormPari(
                        prakarsaId: prakarsaId,
                        pipelineId: pipelineId,
                        loanTypesId: loanTypesId,
                        status: status,
                        codeTable: codeTable,
                      ),
                    ),
                  ),
                ),
                /*InformasiAgunanButtonPari(
                  label: 'Laporan Kunjungan Nasabah',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InformasiAgunanLknFormPari(
                        prakarsaId: prakarsaId,
                        pipelineId: pipelineId,
                        loanTypesId: loanTypesId,
                        status: status,
                      ),
                    ),
                  ),
                  isLast: true,
                ),*/
              ],
            ),
          ),
        ],
      );
    },
  );
}

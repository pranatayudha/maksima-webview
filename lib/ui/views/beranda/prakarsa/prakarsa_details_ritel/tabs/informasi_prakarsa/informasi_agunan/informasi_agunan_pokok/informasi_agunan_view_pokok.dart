// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../application/app/constants/image_constants.dart';
import '../../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../../shared/processing_indicator.dart';
import '../../../../../../../../shared/styles.dart';
import 'informasi_agunan_pokok_viewmodel.dart';
import 'widgets/informasi_agunan_pokok_preview.dart';

class InformasiAgunanViewPokok
    extends ViewModelBuilderWidget<InformasiAgunanPokokViewModel> {
  final String prakarsaId;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;

  const InformasiAgunanViewPokok({
    Key? key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  InformasiAgunanPokokViewModel viewModelBuilder(BuildContext context) =>
      InformasiAgunanPokokViewModel(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
      );

  @override
  void onViewModelReady(InformasiAgunanPokokViewModel viewModel) =>
      viewModel.initialize();

  @override
  // ignore: long-method
  Widget builder(
    BuildContext context,
    InformasiAgunanPokokViewModel viewModel,
    Widget? child,
  ) {
    return NetworkSensitive(
      child: Builder(
        builder: (context) {
          if (viewModel
              .busy(InformasiAgunanPokokViewModel.agunanPokokBusyObject)) {
            return Container(
              color: Colors.white,
              child: const Center(
                child: ProcessingIndicator(
                  label: 'Memuat data...',
                  labelColor: CustomColor.primaryBlue,
                ),
              ),
            );
          }

          if (viewModel.hasErrorForKey(
            InformasiAgunanPokokViewModel.agunanPokokBusyObject,
          )) {
            return Center(
              child: Text(viewModel
                  .error(InformasiAgunanPokokViewModel.agunanPokokBusyObject)
                  .toString()),
            );
          }

          // if (viewModel.ritelPrakarsaAgunanPokokList!.length == null) {
          //   return Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Image.asset(
          //           ImageConstants.mutasiRekening1,
          //           scale: 2.5,
          //         ),
          //         Text(
          //           'Belum ada agunan pokok',
          //           style: tsHeading6,
          //           textAlign: TextAlign.center,
          //         ),
          //         SizedBox(height: 8.h),
          //         Text(
          //           'Klik tombol di bawah untuk menambahkan',
          //           style: TextStyle(
          //             color: const Color(0xff66788A),
          //             fontSize: 14.sp,
          //           ),
          //           textAlign: TextAlign.center,
          //         ),
          //       ],
          //     ),
          //   );
          // }

          return Container(
            child: viewModel.ritelPrakarsaAgunanPokokList?.isEmpty ?? false
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageConstants.mutasiRekening1,
                          scale: 2.5,
                        ),
                        Text(
                          'Belum ada agunan pokok',
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
                : RefreshIndicator(
                    onRefresh: viewModel.fetchAgunanPokokList,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          viewModel.ritelPrakarsaAgunanPokokList?.length ?? 0,
                      itemBuilder: (ctx, i) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ViewModelBuilder<
                                      InformasiAgunanPokokViewModel>.nonReactive(
                                    disposeViewModel: false,
                                    viewModelBuilder: () => viewModel,
                                    onModelReady: (viewModel) =>
                                        viewModel.fetchAgunanPokokDetail(
                                      int.parse(viewModel
                                          .ritelPrakarsaAgunanPokokList![i]
                                          .id!),
                                    ),
                                    builder: (ctx, viewModel, child) {
                                      return InformasiAgunanPokokPreview(
                                        id: int.parse(viewModel
                                            .ritelPrakarsaAgunanPokokList![i]
                                            .id!),
                                        prakarsaId: prakarsaId,
                                        pipelineId: pipelineId,
                                        loanTypesId: loanTypesId,
                                        status: status,
                                        codeTable: codeTable,
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding:
                                EdgeInsets.fromLTRB(19.5.w, 16.h, 24.5.w, 16.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      IconConstants.paper,
                                      scale: 2.5,
                                    ),
                                    SizedBox(width: 19.45.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Agunan Pokok #${viewModel.ritelPrakarsaAgunanPokokList![i].id ?? ''}',
                                          style: TextStyle(
                                            color: const Color(0xff03213E),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '-',
                                          style: TextStyle(
                                            color: const Color(0xff66788A),
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  IconConstants.chevronRight,
                                  scale: 2.5,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}

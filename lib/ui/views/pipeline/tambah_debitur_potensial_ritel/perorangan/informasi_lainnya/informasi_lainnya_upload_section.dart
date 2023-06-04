import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../shared/upload_item_button_ritel.dart';
import 'informasi_lainnya_viewmodel.dart';

class InformasiLainnyaUploadSection
    extends HookViewModelWidget<InformasiLainnyaViewModel> {
  const InformasiLainnyaUploadSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiLainnyaViewModel viewModel,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: viewModel.isLoadingImage
            ? [
                Container(
                  padding: EdgeInsets.only(bottom: 8.h, top: 16.0),
                  child: Text(
                    'Memuat Data Foto Kunjungan',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]
            : List.generate(
                viewModel.listUrlFotoKunjungan.length + 1,
                (index) {
                  // ignore: prefer-conditional-expressions
                  if (index == 0) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 8.h, top: 16.0),
                      child: Text(
                        'Foto Kunjungan (minimal 3)',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else {
                    return UploadItemButtonRitel(
                      imageUrl: viewModel.listUrlPublicFotoKunjungan[index - 1],
                      label: 'Foto Kunjungan $index',
                      onPressed:
                          viewModel.listUrlPublicFotoKunjungan[index - 1] ==
                                  null
                              ? () {
                                  viewModel.captureFotoKunjungan(index - 1);
                                }
                              : () {
                                  viewModel.clearFotoKunjungan(index - 1);
                                },
                      errorText:
                          viewModel.listUrlPublicFotoKunjungan[index - 1] ==
                                  null
                              ? viewModel.fotoKunjunganDuaErrorText
                              : null,
                      isLoading: viewModel.isLoadingFotoKunjungan,
                    );
                  }
                },
              ),
      ),
    );
  }
}

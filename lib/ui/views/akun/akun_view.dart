import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/glass_status_bar_scroll_aware.dart';
import '../../shared/thick_light_grey_divider.dart';
import 'akun_viewmodel.dart';
import 'widgets/akun_header.dart';
import 'widgets/divisi_and_jabatan.dart';
import 'widgets/pengaturan_akun.dart';
import 'widgets/pengaturan_aplikasi.dart';

class AkunView extends ViewModelBuilderWidget<AkunViewModel> {
  final bool fromBerandaHeader;

  const AkunView({
    this.fromBerandaHeader = false,
    Key? key,
  }) : super(key: key);

  @override
  AkunViewModel viewModelBuilder(BuildContext context) => AkunViewModel();

  @override
  void onViewModelReady(AkunViewModel viewModel) => viewModel.initialize();

  @override
  Widget builder(
    BuildContext context,
    AkunViewModel viewModel,
    Widget? child,
  ) {
    return GlassStatusBarScrollAware(
      withModalProgressHUD: true,
      inAsyncCall: viewModel.isBusy,
      processingIndicatorMessage: 'Logging out...',
      children: [
        AkunHeader(showBackArrowButton: fromBerandaHeader),
        const DivisiAndJabatan(),
        const PengaturanAkun(),
        const ThickLightGreyDivider(),
        const PengaturanAplikasi(),
      ],
    );
  }
}

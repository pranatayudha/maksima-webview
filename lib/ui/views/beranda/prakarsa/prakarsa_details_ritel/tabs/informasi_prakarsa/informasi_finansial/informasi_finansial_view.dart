import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../shared/app_bar_widget.dart';
import '../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../shared/processing_indicator.dart';
import '../widgets/dotted_form_button.dart';
import 'informasi_finansial_viewmodel.dart';
import 'widgets/ItemDivider.dart';

class InformasiFinansialView
    extends ViewModelBuilderWidget<InformasiFinansialViewModel> {
  final String prakarsaId;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;

  const InformasiFinansialView({
    Key? key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  InformasiFinansialViewModel viewModelBuilder(BuildContext context) =>
      InformasiFinansialViewModel(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
      );

  @override
  void onViewModelReady(InformasiFinansialViewModel viewModel) =>
      viewModel.initialize();

  @override
  Widget builder(
    BuildContext context,
    InformasiFinansialViewModel viewModel,
    Widget? child,
  ) {
    return NetworkSensitive(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBarWidget.titleWithBackButton(
          title: 'Informasi Finansial',
          onBackButtonTapped: viewModel.navigateBack,
        ),
        body: SafeArea(
          child: WillPopScope(
            onWillPop: () async {
              viewModel.navigateBack();
              // ignore: newline-before-return
              return true;
            },
            child: viewModel.isBusy
                ? Container(
                    color: Colors.white,
                    child: const Center(
                      child: ProcessingIndicator(
                        label: 'Memuat data ...',
                        labelColor: CustomColor.primaryBlue,
                      ),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildBody(context, viewModel),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Column _buildBody(
    BuildContext context,
    InformasiFinansialViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 26.75.h, 0, 30.75.h),
          color: Colors.white,
          child: Stack(
            children: [
              if (codeTable == 1) _buildTabsMenuPerorangan(viewModel),
              if (codeTable == 2 || codeTable == 3)
                _buildMenuPerusahaan(viewModel),
            ],
          ),
        ),
      ],
    );
  }

  Column _buildMenuPerusahaan(InformasiFinansialViewModel viewModel) {
    return Column(
      children: [
        DottedFormButton(
          description: 'Mutasi rekening dalam 6 bulan',
          label: 'Mutasi Rekening',
          iconPath: IconConstants.chart,
          completed:
              viewModel.ritelFinansialMenuStepper.mutasiRekening! ? true : null,
          onTap: viewModel.navigateToMutasiRekening,
          enabled: true,
        ),
        const ItemDivider(),
        DottedFormButton(
          description: 'File riwayat projek',
          label: 'Riwayat Projek',
          iconPath: IconConstants.chart,
          completed:
              viewModel.ritelFinansialMenuStepper.riwayatProject! ? true : null,
          onTap: viewModel.ritelFinansialMenuStepper.mutasiRekening!
              ? viewModel.navigateToRiwayatProyek
              : () => {},
          enabled: viewModel.ritelFinansialMenuStepper.mutasiRekening!
              ? true
              : false,
        ),
        const ItemDivider(),
        DottedFormButton(
          description: 'Laporan Finansial dalam 3 periode',
          label: 'Data Laporan Finansial',
          iconPath: IconConstants.user,
          completed: viewModel.ritelFinansialMenuStepper.informasiFinansial!
              ? true
              : null,
          onTap: viewModel.ritelFinansialMenuStepper.riwayatProject!
              ? viewModel.navigateToDataLaporanFinansial
              : () => {},
          enabled: viewModel.ritelFinansialMenuStepper.riwayatProject!
              ? true
              : false,
        ),
      ],
    );
  }

  Column _buildTabsMenuPerorangan(InformasiFinansialViewModel viewModel) {
    return Column(
      children: [
        DottedFormButton(
          description: 'Laporan Finansial dalam 3 periode',
          label: 'Data Laporan Finansial',
          iconPath: IconConstants.user,
          completed: viewModel.ritelFinansialMenuStepper.informasiFinansial!,
          onTap: viewModel.navigateToDataLaporanFinansial,
          enabled: true,
        ),
        const ItemDivider(),
        DottedFormButton(
          description: 'Mutasi rekening dalam 6 bulan',
          label: 'Mutasi Rekening',
          iconPath: IconConstants.chart,
          completed: viewModel.ritelFinansialMenuStepper.mutasiRekening!,
          onTap: viewModel.navigateToMutasiRekening,
          enabled: true,
        ),
        const ItemDivider(),
        DottedFormButton(
          description: 'File riwayat projek',
          label: 'Riwayat Projek',
          iconPath: IconConstants.chart,
          completed: viewModel.ritelFinansialMenuStepper.riwayatProject!,
          onTap: viewModel.navigateToRiwayatProyek,
          enabled: true,
        ),
      ],
    );
  }
}

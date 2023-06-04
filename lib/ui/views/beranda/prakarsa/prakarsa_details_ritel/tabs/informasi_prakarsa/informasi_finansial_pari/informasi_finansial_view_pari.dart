import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../shared/app_bar_widget.dart';
import '../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../shared/processing_indicator.dart';
import '../widgets/dotted_form_button.dart';
import 'data_laporan_finansial/screen/informasi_finansial_form_period_pari.dart';
import 'data_laporan_finansial/screen/informasi_finansial_view_period_pari.dart';
import 'informasi_finansial_viewmodel_pari.dart';
import 'widgets/ItemDivider.dart';

class InformasiFinansialViewPari
    extends ViewModelBuilderWidget<InformasiFinansialViewModelPari> {
  final String prakarsaId;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;
  final int status;

  const InformasiFinansialViewPari({
    Key? key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
    required this.status,
  }) : super(key: key);

  @override
  InformasiFinansialViewModelPari viewModelBuilder(BuildContext context) =>
      InformasiFinansialViewModelPari(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
      );

  @override
  void onViewModelReady(InformasiFinansialViewModelPari viewModel) =>
      viewModel.initialize();

  @override
  Widget builder(
    BuildContext context,
    InformasiFinansialViewModelPari viewModel,
    Widget? child,
  ) {
    return NetworkSensitive(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBarWidget.titleWithBackButton(
          title: 'Informasi Finansial',
          onBackButtonTapped: viewModel.navigateBack,
        ),
        body: Container(
          color: Colors.white,
          child: SafeArea(
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
      ),
    );
  }

  Column _buildBody(
    BuildContext context,
    InformasiFinansialViewModelPari viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 26.75.h, 0, 30.75.h),
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                children: [
                  DottedFormButton(
                    description: 'Mutasi rekening Koran dalam 3 bulan',
                    label: 'Mutasi Rekening Koran',
                    iconPath: IconConstants.paper,
                    completed:
                        viewModel.ritelFinansialMenuStepperPari.mutasiRekening!
                            ? true
                            : null,
                    onTap: viewModel.navigateToMutasiRekeningPari,
                    enabled: true,
                  ),
                  const ItemDivider(),
                  DottedFormButton(
                    description: 'Mutasi Transaksi di aplikasi PARI',
                    label: 'Mutasi Transaksi di PARI',
                    iconPath: IconConstants.paper,
                    scale: 2.5,
                    onTap: viewModel.navigateToMutasiTransaksiPari,
                    completed:
                        viewModel.ritelFinansialMenuStepperPari.mutasiTransaksi!
                            ? true
                            : null,
                    enabled:
                        viewModel.ritelFinansialMenuStepperPari.mutasiRekening!
                            ? true
                            : false,
                  ),
                  const ItemDivider(),
                  DottedFormButton(
                    description: 'Laporan Finansial dalam 3 periode',
                    label: 'Data Laporan Finansial',
                    iconPath: IconConstants.statistic,
                    scale: 3.5,
                    completed: viewModel
                            .ritelFinansialMenuStepperPari.dataLaporanFinansial!
                        ? true
                        : null,
                    enabled:
                        viewModel.ritelFinansialMenuStepperPari.mutasiTransaksi!
                            ? true
                            : false,
                    onTap: viewModel
                            .ritelFinansialMenuStepperPari.dataLaporanFinansial!
                        ? () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    InformasiFinansialViewPeriodPari(
                                  pipelineId: pipelineId,
                                  loanTypesId: loanTypesId,
                                  prakarsaId: prakarsaId,
                                  status: status,
                                ),
                              ),
                            )
                        : () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    InformasiFinansialFormPeriodPari(
                                  pipelineId: pipelineId,
                                  loanTypesId: loanTypesId,
                                  prakarsaId: prakarsaId,
                                  status: status,
                                ),
                              ),
                            ),
                  ),
                  const ItemDivider(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

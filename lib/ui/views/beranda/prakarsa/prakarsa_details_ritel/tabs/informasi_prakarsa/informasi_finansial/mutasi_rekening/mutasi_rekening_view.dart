import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../application/app/constants/image_constants.dart';
import '../../../../../../../../shared/app_bar_widget.dart';
import '../../../../../../../../shared/custom_button.dart';
import '../../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../../shared/processing_indicator.dart';
import '../../../../../../../../shared/styles.dart';
import '../../../../../../../../shared/thick_light_grey_divider.dart';
import 'mutasi_rekening_viewmodel.dart';
import 'widgets/mutasi_rekening_card.dart';

class MutasiRekeningView
    extends ViewModelBuilderWidget<MutasiRekeningViewModel> {
  final String prakarsaId;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;

  const MutasiRekeningView({
    Key? key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  MutasiRekeningViewModel viewModelBuilder(BuildContext context) =>
      MutasiRekeningViewModel(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
      );

  @override
  Widget builder(
    BuildContext context,
    MutasiRekeningViewModel viewModel,
    Widget? child,
  ) {
    return NetworkSensitive(
      child: WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBarWidget.titleWithBackButton(
            title: 'Mutasi Rekening',
            onBackButtonTapped: viewModel.navigateBack,
          ),
          body: viewModel.isBusy
              ? Container(
                  color: Colors.white,
                  child: const Center(
                    child: ProcessingIndicator(
                      label: 'Memuat data...',
                      labelColor: CustomColor.primaryBlue,
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    viewModel.ritelMutasiRekening.isEmpty
                        ? Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 5,
                              ),
                              Image.asset(
                                ImageConstants.mutasiRekening1,
                                scale: 2.5,
                              ),
                              Text(
                                'Belum ada mutasi rekening',
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
                          )
                        : Expanded(
                            child: _buildListViewMutasiRekening(viewModel),
                          ),
                    if (status <= 2)
                      _buildBtnTambahMutasiRekening(context, viewModel),
                  ],
                ),
        ),
        onWillPop: () async {
          viewModel.navigateBack();
          // ignore: newline-before-return
          return true;
        },
      ),
    );
  }

  ListView _buildListViewMutasiRekening(MutasiRekeningViewModel viewModel) {
    final formatter = NumberFormat('#,###', 'id_ID');
    // ignore: newline-before-return
    return ListView(
      shrinkWrap: true,
      children: [
        if (codeTable == 2 || codeTable == 3)
          if (viewModel.ritelMutasiRekening.length > 1)
            _summaryHeader(viewModel, formatter),
        const ThickLightGreyDivider(),
        for (var i = 0; i < viewModel.ritelMutasiRekening.length; i++)
          MutasiRekeningCard(
            ritelMutasiRekening: viewModel.ritelMutasiRekening[i],
            onPressed: () => viewModel.navigateToMutasiRekeningDetails(
              viewModel.ritelMutasiRekening[i],
              i,
            ),
          ),
      ],
    );
  }

  Padding _summaryHeader(
    MutasiRekeningViewModel viewModel,
    NumberFormat formatter,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleAndSubtitle(
            'Periode Awal - Periode Akhir',
            // viewModel.ritelMutasiRekeningHeader.periode!,
            '${viewModel.convertDateToLocale(
              viewModel.ritelMutasiRekeningHeader.periode!.split(' - ')[0],
            )} - ${viewModel.convertDateToLocale(
              viewModel.ritelMutasiRekeningHeader.periode!.split(' - ')[1],
            )}',
          ),
          SizedBox(height: 8.h),
          _buildTitleAndSubtitle(
            'Total Mutasi Kredit',
            formatter.format(
              double.parse(
                viewModel.ritelMutasiRekeningHeader.totalMutasiKredit!,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          _buildTitleAndSubtitle(
            'Ratas Mutasi Kredit tiap bulan',
            formatter.format(
              double.parse(
                viewModel.ritelMutasiRekeningHeader.ratasMutasiKredit!,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          _buildTitleAndSubtitle(
            'Total Mutasi Debet',
            formatter.format(
              double.parse(
                viewModel.ritelMutasiRekeningHeader.totalMutasiDebet!,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          _buildTitleAndSubtitle(
            'Ratas Mutasi Debet tiap bulan',
            formatter.format(
              double.parse(
                viewModel.ritelMutasiRekeningHeader.ratasMutasiDebet!,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          _buildTitleAndSubtitle(
            'Total Saldo Akhir',
            formatter.format(
              double.parse(
                viewModel.ritelMutasiRekeningHeader.totalSaldoAKhir!,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildTitleAndSubtitle(String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            color: const Color(0xff828896),
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14.sp,
            color: const Color(0xff162B3A),
          ),
        ),
      ],
    );
  }

  Padding _buildBtnTambahMutasiRekening(
    BuildContext context,
    MutasiRekeningViewModel viewModel,
  ) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: CustomButton(
        label: 'Tambah Mutasi Rekening',
        radius: 8.r,
        isBusy: viewModel.isBusy,
        onPressed: viewModel.navigateToMutasiRekeningForm,
      ),
    );
  }
}

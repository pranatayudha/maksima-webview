import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../application/app/constants/common.dart';
import '../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../application/models/ritel_prakarsa_perorangan.dart';
import 'credit_risk_rating/credit_rist_rating_view.dart';
import 'informasi_prakarsa_viewmodel.dart';
import 'widgets/dotted_form_button.dart';
import 'widgets/item_divider.dart';

class InformasiPrakarsaView
    extends ViewModelBuilderWidget<InformasiPrakarsaViewModel> {
  final String prakarsaId;
  final String? pipelinesId;
  final RitelPrakarsaPerorangan ritelPrakarsaPerorangan;
  final int loanTypesId;
  final int codeTable;
  final int status;

  const InformasiPrakarsaView({
    Key? key,
    required this.prakarsaId,
    this.pipelinesId,
    required this.ritelPrakarsaPerorangan,
    required this.loanTypesId,
    required this.codeTable,
    required this.status,
  }) : super(key: key);

  @override
  InformasiPrakarsaViewModel viewModelBuilder(BuildContext context) =>
      InformasiPrakarsaViewModel(
        prakarsaId: prakarsaId,
        pipelinesId: pipelinesId!,
        ritelPrakarsaPerorangan: ritelPrakarsaPerorangan,
        loanTypesId: loanTypesId,
        codeTable: codeTable,
        status: status,
      );

  @override
  Widget builder(
    BuildContext context,
    InformasiPrakarsaViewModel viewModel,
    Widget? child,
  ) {
    return viewModel.isBusy
        ? Container(
            color: Colors.white,
            child: const Center(child: CircularProgressIndicator()),
          )
        : SingleChildScrollView(
            child: _buildStepper(context, viewModel),
          );
  }

  // ignore: long-method
  Column _buildStepper(BuildContext context, InformasiPrakarsaViewModel vm) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        if (codeTable == Common.CodeTable.Perorangan ||
            codeTable == Common.CodeTable.PARI) ...[
          DottedFormButton(
            label: 'Informasi Debitur',
            description: 'Data Diri Debitur',
            iconPath: IconConstants.chart,
            completed: vm.ritelInfoPrakarsa.body!.informasi_debitur!.status,
            onTap: vm.navigateToInformasiDebitur,
            enabled: true,
          ),
          const ItemDivider(),
        ],
        if (codeTable == Common.CodeTable.CV ||
            codeTable == Common.CodeTable.PT) ...[
          DottedFormButton(
            label: 'Informasi Perusahaan',
            description: 'Data Perusahaan dari Debitur',
            iconPath: IconConstants.chart,
            completed: vm.ritelInfoPrakarsa.body!.informasi_perusahaan!.status,
            onTap: vm.navigateToInformasiPerusahaan,
            enabled: true,
          ),
          const ItemDivider(),
          DottedFormButton(
            label: 'Informasi Pengurus/Pemilik',
            description: 'Data pengurus perusahaan',
            iconPath: IconConstants.user,
            completed:
                vm.ritelInfoPrakarsa.body!.informasi_pengurus_pemilik!.status,
            onTap: vm.navigateToInformasiPengurusView,
            enabled: true,
          ),
          const ItemDivider(),
        ],
        if (codeTable == Common.CodeTable.PT ||
            codeTable == Common.CodeTable.CV) ...[
          DottedFormButton(
            label: 'Trade Checking',
            description: 'Dokumen Informasi Supplier dan Buyer',
            iconPath: IconConstants.paper,
            completed: vm.ritelInfoPrakarsa.body!.trade_checking!.status,
            onTap: vm.navigateToTradeChecking,
            enabled: true,
          ),
          const ItemDivider(),
        ],
        DottedFormButton(
          label: 'Legalitas Usaha',
          description: 'Dokumen persyaratan usaha',
          iconPath: IconConstants.paperLegalitas,
          scale: 3.5,
          completed: vm.ritelInfoPrakarsa.body!.legalitas_usaha!.status,
          onTap: vm.navigateToLegalitasUsaha,
          enabled: true,
        ),
        const ItemDivider(),
        DottedFormButton(
          label: 'Hasil Prescreening',
          description: 'SLIK, Dukcapil, DHN, dan LPG',
          iconPath: IconConstants.searchBg,
          scale: 4.5,
          completed: vm.ritelInfoPrakarsa.body!.hasil_pre_screening!.status,
          onTap: vm.navigateToHasilPreScreening,
          enabled: true,
        ),
        const ItemDivider(),
        DottedFormButton(
          label: 'Informasi Finansial',
          description: 'Laba Rugi, neraca, keuangan Debitur',
          iconPath: IconConstants.statistic,
          scale: 4,
          completed: vm.ritelInfoPrakarsa.body!.informasi_finansial!.status,
          onTap: vm.navigateToInformasiFinansial,
          enabled: true,
        ),
        const ItemDivider(),
        DottedFormButton(
          label: 'Informasi Non Finansial',
          description: 'Input Analisa Kualitatif',
          iconPath: IconConstants.paper,
          completed: vm.ritelInfoPrakarsa.body!.informasi_non_finansial!.status,
          onTap: vm.navigateToInformasiNonFinansial,
          enabled: true,
        ),
        const ItemDivider(),
        if (codeTable != 4)
          DottedFormButton(
            label: 'Credit Risk Rating',
            description: 'Rating Resiko Kredit',
            iconPath: IconConstants.paper,
            completed: vm.ritelInfoPrakarsa.body!.upload_crr!.status,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreditRistRating(
                  prakarsaId: prakarsaId,
                  codeTable: codeTable,
                  pipelineId: pipelinesId!,
                  loanTypesId: loanTypesId,
                ),
              ),
            ),
            enabled: true,
          ),
        if (codeTable == 4)
          DottedFormButton(
            label: 'Upload CRR',
            description: 'Upload PDF CRR',
            iconPath: IconConstants.paper,
            completed: vm.ritelInfoPrakarsa.body!.upload_crr!.status,
            onTap: vm.navigateToUploadCRR,
            enabled: true,
          ),
        const ItemDivider(),
        DottedFormButton(
          label: 'Informasi Agunan & LKN',
          description: 'Geotagging kunjungan serta agunan',
          iconPath: IconConstants.gps,
          scale: 4,
          completed: vm.ritelInfoPrakarsa.body!.informasi_agunan_lkn!.status,
          // onTap: vm.navigateToInformasiAgunan,
          onTap: vm.navigateToInformasiAgunanLkn,

          enabled: true,
        ),
        const ItemDivider(),
        DottedFormButton(
          label: 'Informasi Pinjaman',
          description: 'SKPP',
          iconPath: IconConstants.cash,
          scale: 4,
          completed: vm.ritelInfoPrakarsa.body!.informasi_pinjaman!.status,
          onTap: vm.navigateToInformasiPinjaman,
          enabled: true,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}

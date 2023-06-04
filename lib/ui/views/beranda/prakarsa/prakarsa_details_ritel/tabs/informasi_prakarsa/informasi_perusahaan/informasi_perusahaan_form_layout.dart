import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../application/models/ritel_informasi_perusahaan_pt.dart';
import '../../../../../../../shared/form_layout.dart';
import '../../../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_perusahaan_form_section.dart';
import 'informasi_perusahaan_upload_section.dart';
import 'informasi_perusahaan_viewmodel.dart';

class InformasiPerusahaanLayout
    extends ViewModelBuilderWidget<InformasiPerusahaanViewModelRitel> {
  final String prakarsaId;
  final String pipelineId;
  final int status;
  final int codeTable;
  final RitelInformasiPerusahaanPt ritelInformasiPerusahaanPt;

  const InformasiPerusahaanLayout({
    Key? key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.status,
    required this.codeTable,
    required this.ritelInformasiPerusahaanPt,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    InformasiPerusahaanViewModelRitel viewModel,
    Widget? child,
  ) {
    return FormLayout(
      title: 'Informasi Perusahaan',
      description:
          'Lengkapi semua informasi dibawah untuk menambahkan debitur ke Pipeline. Pastikan seluruh data terisi dengan benar',
      onBackButtonPressed: () => Navigator.pop(context),
      // onBackButtonPressed: viewModel.navigateBack,

      isBusy: false,
      mainButtonTitle: 'SIMPAN',
      onMainButtonPressed: viewModel.fotoSkKumhamPendirianTerakhirUrl == null ||
              viewModel.fotoSkKumhamPerubahanTerakhirUrl == null
          ? null
          : () => viewModel.validateInputs(),
      child: Column(
        children: [
          InformasiPerusahaanFormSection(codeTable),
          const ThickLightGreyDivider(),
          const InformasiPrakarsaPerusahaanUploadSection(),
        ],
      ),
    );
  }

  @override
  InformasiPerusahaanViewModelRitel viewModelBuilder(BuildContext context) =>
      InformasiPerusahaanViewModelRitel(
        prakarsaId: prakarsaId,
        status: status,
        codeTable: codeTable,
        pipelineId: pipelineId,
        ritelInformasiPerusahaanPt: ritelInformasiPerusahaanPt,
      );
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../../application/enums/informasi_agunan_lkn_api_method.dart';
import '../../../../../../../../../application/models/ritel_laporan_kunjungan_nasabah.dart';
import '../../../../../../../../shared/form_layout.dart';
import 'informasi_agunan_lkn_form_section.dart';
import 'informasi_agunan_lkn_form_viewmodel.dart';

class InformasiAgunanLknForm
    extends ViewModelBuilderWidget<InformasiAgunanLknFormViewModel> {
  final String prakarsaId;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;

  final RitelLaporanKunjunganNasabah? ritelLaporanKunjunganNasabah;

  const InformasiAgunanLknForm({
    Key? key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    this.ritelLaporanKunjunganNasabah,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  void onViewModelReady(InformasiAgunanLknFormViewModel viewModel) =>
      viewModel.initialize();

  @override
  InformasiAgunanLknFormViewModel viewModelBuilder(BuildContext context) =>
      InformasiAgunanLknFormViewModel(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        ritelLaporanKunjunganNasabah: ritelLaporanKunjunganNasabah,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
      );

  @override
  Widget builder(
    BuildContext context,
    InformasiAgunanLknFormViewModel viewModel,
    Widget? child,
  ) {
    return FormLayout(
      title: 'Laporan Kunjungan Nasabah',
      description:
          'Lengkapi semua informasi dibawah untuk menambahkan debitur ke Pipeline. Pastikan seluruh data terisi dengan benar.',
      onBackButtonPressed: viewModel.navigateBack,
      isBusy: false,
      mainButtonTitle:
          viewModel.ritelLaporanKunjunganNasabah == null ? 'SIMPAN' : 'UPDATE',
      onMainButtonPressed: () => viewModel.ritelLaporanKunjunganNasabah == null
              ? viewModel.validateInputs(InformasiAgunanLKNAPIMethod.add)
              : viewModel.validateInputs(InformasiAgunanLKNAPIMethod.update),
      child: Column(
        children: const [
          InformasiAgunanLKNFormSection(),
        ],
      ),
    );
  }
}

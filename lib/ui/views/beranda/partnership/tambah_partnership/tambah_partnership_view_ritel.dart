import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../application/models/monitoring_pinjaman_detail.dart';
import '../../../../shared/form_layout.dart';
import 'tambah_partnership_viewmodel_ritel.dart';
import 'widgets/info_partnership_form_section.dart';

class TambahPartnershipViewRitel
    extends ViewModelBuilderWidget<TambahPartnershipViewModelRitel> {
  final String? idKelolaan;
  final MonitoringPinjamanDetail? pinjamanDetail;
  final int? counter;
  final String? status;
  final int? loanType;

  const TambahPartnershipViewRitel({
    Key? key,
    this.idKelolaan,
    this.pinjamanDetail,
    this.counter,
    this.status,
    this.loanType,
  }) : super(key: key);

  @override
  TambahPartnershipViewModelRitel viewModelBuilder(BuildContext context) =>
      TambahPartnershipViewModelRitel(
        idKelolaan: idKelolaan,
        pinjamanDetail: pinjamanDetail,
        counter: counter,
        status: status,
        loanType: loanType,
      );

  @override
  Widget builder(
    BuildContext context,
    TambahPartnershipViewModelRitel viewModel,
    Widget? child,
  ) {
    return FormLayout(
      title: 'Tambah Partner',
      description: 'Masukkan Informasi Partner',
      onBackButtonPressed: viewModel.navigateToPartnership,
      isBusy: viewModel.isBusy,
      mainButtonTitle: 'Tambah Partner',
      onMainButtonPressed: viewModel.isBusy ||
              viewModel.jenisKerjasamaController.text == 'Non PKS'
          ? null
          : viewModel.validateInputs,
      child: Form(
        key: viewModel.formKey,
        autovalidateMode: viewModel.autoValidateMode,
        child: Column(
          children: const [
            InfoPartnershipFormSectionRitel(),
          ],
        ),
      ),
    );
  }
}

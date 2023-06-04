import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../application/models/ritel_informasi_pinjaman.dart';
import '../../../../../../../shared/form_layout.dart';
import '../../../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_pinjaman_viewmodel_ritel.dart';
import 'pinang_maxima_pari/widgets/informasi_pinjaman_form_kebutuhan_kredit_pari.dart';
import 'pinang_maxima_pari/widgets/informasi_pinjaman_form_kebutuhan_lainnya_pari.dart';
import 'pinang_maxima_pari/widgets/informasi_pinjaman_form_pari.dart';

class InformasiPinjamanViewPari
    extends ViewModelBuilderWidget<InformasiPinjamanViewModel> {
  final RitelInformasiPinjaman ritelInformasiPinjaman;
  final String pipelinesId;
  final int loanTypesId;
  final String prakarsaId;
  final int codeTable;

  const InformasiPinjamanViewPari({
    Key? key,
    required this.ritelInformasiPinjaman,
    required this.pipelinesId,
    required this.loanTypesId,
    required this.prakarsaId,
    required this.codeTable,
  }) : super(key: key);

  @override
  InformasiPinjamanViewModel viewModelBuilder(BuildContext context) =>
      InformasiPinjamanViewModel(
        ritelInformasiPinjaman: ritelInformasiPinjaman,
        pipelinesId: pipelinesId,
        loanTypesId: loanTypesId,
        prakarsaId: prakarsaId,
        codeTable: codeTable,
      );

  @override
  void onViewModelReady(InformasiPinjamanViewModel viewModel) =>
      viewModel.initialize();

  @override
  Widget builder(
    BuildContext context,
    InformasiPinjamanViewModel viewModel,
    Widget? child,
  ) {
    return FormLayout(
      title: 'Informasi Pinjaman',
      description:
          'Lengkapi semua informasi di bawah untuk melanjutkan prakarsa. Pastikan seluruh data terisi dengan benar.',
      onBackButtonPressed: viewModel.navigateBack,
      isBusy: viewModel.isBusy,
      mainButtonTitle: 'Submit Info Pinjaman',
      onMainButtonPressed: viewModel.validateInputsPari,
      child: Form(
        key: viewModel.formKey,
        autovalidateMode: viewModel.autoValidateMode,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
          child: Column(
            children: const [
              InformasiPinjamanFormPari(),
              ThickLightGreyDivider(),
              InformasiPinjamanFormKebutuhanKreditPari(),
              ThickLightGreyDivider(),
              InformasiPinjamanFormBiayaLainnyaPari(),
            ],
          ),
        ),
      ),
    );
  }
}

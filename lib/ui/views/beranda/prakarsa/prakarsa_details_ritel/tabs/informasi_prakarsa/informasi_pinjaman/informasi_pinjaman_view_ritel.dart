import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../application/models/ritel_informasi_pinjaman.dart';
import '../../../../../../../shared/form_layout.dart';
import '../../../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_pinjaman_viewmodel_ritel.dart';
import 'pinang_maxima_ritel/widgets/informasi_pinjaman_doc_section.dart';
import 'pinang_maxima_ritel/widgets/informasi_pinjaman_form_kebutuhan_kredit.dart';
import 'pinang_maxima_ritel/widgets/informasi_pinjaman_form_kebutuhan_lainnya.dart';
import 'pinang_maxima_ritel/widgets/informasi_pinjaman_form_ritel.dart';

class InformasiPinjamanViewRitel
    extends ViewModelBuilderWidget<InformasiPinjamanViewModel> {
  final RitelInformasiPinjaman ritelInformasiPinjaman;
  final String pipelinesId;
  final int loanTypesId;
  final String prakarsaId;
  final int codeTable;

  const InformasiPinjamanViewRitel({
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
      onBackButtonPressed: () => Navigator.pop(context),
      isBusy: false,
      mainButtonTitle: 'Submit Info Pinjaman',
      onMainButtonPressed: viewModel.validateInputs,
      child: Form(
        key: viewModel.formKey,
        autovalidateMode: viewModel.autoValidateMode,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
          child: Column(
            children: [
              const InformasiPinjamanFormRitel(),
              const ThickLightGreyDivider(),
              const InformasiPinjamanFormKebutuhanKreditRitel(),
              const ThickLightGreyDivider(),
              const InformasiPinjamanFormBiayaLainnyaRitel(),
              if (codeTable == 2 || codeTable == 3) ...[
                const ThickLightGreyDivider(),
                const InformasiPinjamanDocSection(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

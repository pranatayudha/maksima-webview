import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../../../application/models/ritel_prakarsa_agunan_pokok_detail.dart';
import '../../../../../../../../../shared/custom_button.dart';
import '../../../../../../../../../shared/form_layout.dart';
import '../../../../../../../../../shared/thick_light_grey_divider.dart';
import '../informasi_agunan_pokok_viewmodel.dart';
import 'informasi_agunan_pokok_form_body_1.dart';
import 'informasi_agunan_pokok_form_body_2.dart';

class InformasiAgunanPokokForm
    extends ViewModelBuilderWidget<InformasiAgunanPokokViewModel> {
  final String prakarsaId;
  final RitelPrakarsaAgunanPokokDetail? agunanPokokDetail;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;

  const InformasiAgunanPokokForm({
    Key? key,
    required this.prakarsaId,
    this.agunanPokokDetail,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  void onViewModelReady(InformasiAgunanPokokViewModel viewModel) =>
      viewModel.initialize();

  @override
  InformasiAgunanPokokViewModel viewModelBuilder(BuildContext context) {
    return InformasiAgunanPokokViewModel(
      prakarsaId: prakarsaId,
      agunanPokokDetail: agunanPokokDetail,
      pipelineId: pipelineId,
      loanTypesId: loanTypesId,
      status: status,
      codeTable: codeTable,
    );
  }

  @override
  Widget builder(
    BuildContext context,
    InformasiAgunanPokokViewModel viewModel,
    Widget? child,
  ) {
    // ignore: prefer-conditional-expressions
    if (viewModel.jenisAgunanPokokController.text.isEmpty) {
      return _layoutBeforeChooseJenisAgunan(viewModel);
    } else {
      return _layoutAfterChooseJenisAgunan(context, viewModel);
    }
  }

  // Ini kondisi dipakai ketika user belum memilih jenis agunan pokok
  Widget _layoutBeforeChooseJenisAgunan(
    InformasiAgunanPokokViewModel viewModel,
  ) {
    return WillPopScope(
      onWillPop: () async {
        viewModel.navigateToInformasiAgunanView();
        // ignore: newline-before-return
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Form Agunan Pokok',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: GestureDetector(
            onTap: () => locator<NavigationService>().navigateTo(
              Routes.informasiAgunanViewRitel,
              arguments: InformasiAgunanViewRitelArguments(
                loanTypesId: loanTypesId,
                prakarsaId: prakarsaId,
                pipelineId: pipelineId,
                status: status,
                codeTable: codeTable,
              ),
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24.sp,
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 8.h),
                    child: Text(
                      'Lengkapi semua informasi di bawah untuk melanjutkan prakarsa. Pastikan seluruh data terisi dengan benar',
                      style: TextStyle(
                        color: const Color(0xff03213E),
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  const ThickLightGreyDivider(),
                  InformasiAgunanPokokFormBodyOne(
                    agunanPokokDetail: viewModel.ritelPrakarsaAgunanPokokDetail,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(top: 18),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(40, 41, 61, 0.08),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(96, 97, 112, 0.24),
                      blurRadius: 32,
                      offset: Offset(0, 20),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomButton(
                        label: 'Tambah',
                        // ignore: no-empty-block
                        onPressed: () {},
                        color: const Color(0xff9CBAD7),
                        isBusy: false,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Ini kondisi dipakai ketika user sudah memilih jenis agunan pokok
  FormLayout<ChangeNotifier> _layoutAfterChooseJenisAgunan(
    BuildContext context,
    InformasiAgunanPokokViewModel viewModel,
  ) {
    return FormLayout(
      title: 'Form Agunan Pokok',
      description:
          'Lengkapi semua informasi dibawah untuk melanjutkan prakarsa. Pastikan seluruh data terisi dengan benar.',
      onBackButtonPressed: viewModel.navigateToInformasiAgunanView,
      isBusy: viewModel
          .busy(InformasiAgunanPokokViewModel.agunanPokokFormBusyObject),
      mainButtonTitle: 'Simpan',
      onMainButtonPressed: () async {
        if (viewModel.ritelPrakarsaAgunanPokokDetail != null &&
            viewModel.formKey.currentState!.validate()) {
          await viewModel.saveAgunanPokok(
            viewModel.ritelPrakarsaAgunanPokokDetail!,
            Navigator.of(context),
          );
        }
      },
      child: Form(
        key: viewModel.formKey,
        child: Column(
          children: [
            InformasiAgunanPokokFormBodyOne(
              agunanPokokDetail: viewModel.ritelPrakarsaAgunanPokokDetail,
            ),
            if (viewModel.uploadedDokumenFileName != null) ...[
              const ThickLightGreyDivider(),
              const InformasiAgunanPokokFormBodyTwo(),
            ],
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../application/enums/agunan_tambahan_api_method.dart';
import '../../../../../../../../shared/custom_button.dart';
import '../../../../../../../../shared/custom_textfield.dart';
import '../../../../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_agunan_tambahan_form_viewmodel.dart';
import 'widgets/informasi_agunan_tambahan_form_body_cashcoll.dart';
import 'widgets/informasi_agunan_tambahan_form_body_kb.dart';
import 'widgets/informasi_agunan_tambahan_form_body_mesin.dart';
import 'widgets/informasi_agunan_tambahan_form_body_tdb.dart';
import 'widgets/informasi_agunan_tambahan_form_body_ttb.dart';

class InformasiAgunanTambahanForm
    extends ViewModelBuilderWidget<InformasiAgunanTambahanFormViewModel> {
  String prakarsaId;
  String pipelineId;
  int loanTypesId;
  int status;
  int codeTable;

  InformasiAgunanTambahanForm({
    Key? key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  void onViewModelReady(InformasiAgunanTambahanFormViewModel viewModel) =>
      viewModel.initialize();

  @override
  InformasiAgunanTambahanFormViewModel viewModelBuilder(BuildContext context) =>
      InformasiAgunanTambahanFormViewModel(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        status: status,
        codeTable: codeTable,
      );

  @override
  // ignore: long-method
  Widget builder(
    BuildContext context,
    InformasiAgunanTambahanFormViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () async {
        viewModel.navigateBack();
        // ignore: newline-before-return
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Form Agunan Tambahan',
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
            onTap: viewModel.navigateBack,
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
                ],
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Form(
                      key: viewModel.formKey,
                      autovalidateMode: viewModel.autoValidateMode,
                      child: Container(
                        padding: EdgeInsets.all(16.w),
                        child: Column(
                          children: [
                            _buildJenisAgunan(viewModel),
                            if (viewModel.jenisAgunanTambahanController.text
                                    .isNotEmpty &&
                                viewModel.jenisAgunanTambahanController.text ==
                                    'Tanah')
                              const InformasiAgunanTambahanFormBodyTtb(),
                            if (viewModel.jenisAgunanTambahanController.text
                                    .isNotEmpty &&
                                viewModel.jenisAgunanTambahanController.text ==
                                    'Tanah dan Bangunan')
                              const InformasiAgunanTambahanFormBodyTdb(),
                            if (viewModel.jenisAgunanTambahanController.text
                                    .isNotEmpty &&
                                viewModel.jenisAgunanTambahanController.text ==
                                    'Kendaraan Bermotor')
                              const InformasiAgunanTambahanFormBodyKb(),
                            if (viewModel.jenisAgunanTambahanController.text
                                    .isNotEmpty &&
                                viewModel.jenisAgunanTambahanController.text ==
                                    'Cash Collateral')
                              const InformasiAgunanTambahanFormBodyCashColl(),
                            if (viewModel.jenisAgunanTambahanController.text
                                    .isNotEmpty &&
                                viewModel.jenisAgunanTambahanController.text ==
                                    'Mesin')
                              const InformasiAgunanTambahanFormBodyMesin(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // ),
                // ],
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
                child: CustomButton(
                  label: 'Tambah',
                  onPressed: () {
                    viewModel.validateInputs(AgunanTambahanAPIMethod.add);
                  },
                  isBusy: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PopupMenuButton<String> _buildJenisAgunan(
    InformasiAgunanTambahanFormViewModel vm,
  ) {
    return PopupMenuButton(
      offset: Offset(0, 60.h),
      itemBuilder: (BuildContext context) {
        return [
          'Tanah',
          'Tanah dan Bangunan',
          'Kendaraan Bermotor',
          'Cash Collateral',
          'Mesin',
        ].map<PopupMenuItem<String>>((value) {
          return PopupMenuItem(value: value, child: Text(value));
        }).toList();
      },
      onSelected: (String val) => vm.updateJenisAgunanTambahanController(val),
      child: CustomTextField(
        textEditingController: vm.jenisAgunanTambahanController,
        label: 'Jenis Agunan Tambahan',
        hintText: 'Pilih Jenis Agunan',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        fillColor: Colors.white,
        validator: null,
      ),
    );
  }
}

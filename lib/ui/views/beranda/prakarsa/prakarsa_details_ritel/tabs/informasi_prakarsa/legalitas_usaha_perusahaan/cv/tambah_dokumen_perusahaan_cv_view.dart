import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../application/enums/legalitas_usaha_api_method.dart';
import '../../../../../../../../../application/helpers/input_validators.dart';
import '../../../../../../../../shared/custom_button.dart';
import '../../../../../../../../shared/custom_textfield.dart';
import '../../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../../shared/styles.dart';
import 'tambah_dokumen_perusahaan_cv_viewmodel.dart';

class TambahDokumenPerusahaanCvView
    extends ViewModelBuilderWidget<TambahDokumenPerusahaanCvViewModel> {
  final String prakarsaId;
  // final int uploadDocFrom;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;
  const TambahDokumenPerusahaanCvView({
    Key? key,
    required this.prakarsaId,
    // required this.uploadDocFrom,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  TambahDokumenPerusahaanCvViewModel viewModelBuilder(BuildContext context) =>
      TambahDokumenPerusahaanCvViewModel(
        prakarsaId: prakarsaId,
        // uploadDocFrom: uploadDocFrom,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        codeTable: codeTable,
      );

  @override
  // ignore: long-method
  Widget builder(
    BuildContext context,
    TambahDokumenPerusahaanCvViewModel viewModel,
    Widget? child,
  ) {
    return NetworkSensitive(
      child: WillPopScope(
        onWillPop: () async {
          viewModel.navigateToLegalitasUsaha();
          // ignore: newline-before-return
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            title: Text(
              'Detail Dokumen',
              style: tsHeading6,
            ),
            centerTitle: true,
            leading: GestureDetector(
              onTap: viewModel.navigateToLegalitasUsaha,
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 24.sp,
              ),
            ),
          ),
          body: SafeArea(
            top: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Form(
                        key: viewModel.formKey,
                        autovalidateMode: viewModel.autoValidateMode,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 0.h),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  GestureDetector(
                                    /*onTap: uploadDocFrom == 1
                                        ? viewModel.pickFromGallery
                                        : uploadDocFrom == 2
                                            ? viewModel.pickFromCamera
                                            : viewModel.pickFile,*/
                                    onTap: () => viewModel.pickFile(),
                                    child: Center(
                                      child: viewModel.fileLegalitas == null
                                          ? Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey[400],
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                              height: 237.h,
                                              width: double.infinity,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    IconConstants.upload,
                                                    color: Colors.grey[300],
                                                    scale: 1.5,
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  AutoSizeText(
                                                    'Klik untuk mengupload file',
                                                    style: TextStyle(
                                                      color: Colors.grey[300],
                                                      fontSize: 20.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : (viewModel.fileLegalitas!
                                                          .extension ==
                                                      'jpg' ||
                                                  viewModel.fileLegalitas!
                                                          .extension ==
                                                      'png' ||
                                                  viewModel.fileLegalitas!
                                                          .extension ==
                                                      'jpeg')
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    8.r,
                                                  ),
                                                  child: SizedBox(
                                                    child: Image.memory(
                                                        viewModel.fileLegalitas!
                                                            .bytes!),
                                                  ),
                                                )
                                              : SizedBox(
                                                  height: 237.h,
                                                  width: double.infinity,
                                                  child: Image.asset(
                                                    IconConstants.pdf,
                                                  ),
                                                ),
                                    ),
                                  ),
                                  if (viewModel.fileLegalitas != null)
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          0.w,
                                          5.h,
                                          5.w,
                                          0.h,
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: CustomColor.orange,
                                          foregroundColor: Colors.white,
                                          child: InkWell(
                                            onTap: viewModel.clearFile,
                                            child: const Icon(
                                              Icons.close,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              _buildJenisDokumen(context, viewModel),
                              if (viewModel.jenisDokumenController.text ==
                                  'Dokumen Utama')
                                Column(
                                  children: [
                                    SizedBox(height: 8.h),
                                    _buildNamaDokumen(context, viewModel),
                                    if (viewModel
                                        .namaDokumenController.text.isNotEmpty)
                                      Column(
                                        children: [
                                          SizedBox(height: 8.h),
                                          _buildNoDokumen(viewModel),
                                          SizedBox(height: 8.h),
                                          _buildTanggalDokumen(
                                            context,
                                            viewModel,
                                          ),
                                        ],
                                      ),
                                  ],
                                )
                              else if (viewModel.jenisDokumenController.text ==
                                  'Dokumen Lainnya')
                                Column(
                                  children: [
                                    SizedBox(height: 8.h),
                                    _buildNamaDokumenLainnya(viewModel),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 20.h),
                  child: _buildSaveBtn(viewModel),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

PopupMenuButton<String> _buildJenisDokumen(
  BuildContext context,
  TambahDokumenPerusahaanCvViewModel vm,
) {
  return PopupMenuButton(
    offset: Offset(0, 65.h),
    itemBuilder: (BuildContext context) {
      return ['Dokumen Utama', 'Dokumen Lainnya']
          .map<PopupMenuItem<String>>((value) {
        return PopupMenuItem(value: value, child: Text(value));
      }).toList();
    },
    onSelected: (String val) => vm.updateJenisDokumen(val),
    child: CustomTextField(
      textEditingController: vm.jenisDokumenController,
      label: 'Jenis Dokumen',
      hintText: 'Pilih Jenis Dokumen',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.chevronDown,
      enabled: false,
      fillColor: Colors.white,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Jenis Dokumen',
      ),
    ),
  );
}

PopupMenuButton<String> _buildNamaDokumen(
  BuildContext context,
  TambahDokumenPerusahaanCvViewModel vm,
) {
  return PopupMenuButton(
    offset: Offset(0, 65.h),
    itemBuilder: (BuildContext context) {
      return ['NIB', 'SIUP', 'SITU', 'SKDP', 'TDP', 'Akta Lain']
          .map<PopupMenuItem<String>>((value) {
        return PopupMenuItem(value: value, child: Text(value));
      }).toList();
    },
    onSelected: (String val) => vm.updateNamaDokumen(val),
    child: CustomTextField(
      textEditingController: vm.namaDokumenController,
      label: 'Nama Dokumen',
      hintText: 'Pilih Nama Dokumen',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.chevronDown,
      enabled: false,
      fillColor: Colors.white,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Nama Dokumen',
      ),
    ),
  );
}

CustomTextField _buildNoDokumen(TambahDokumenPerusahaanCvViewModel vm) {
  return CustomTextField(
    textEditingController: vm.noDokumenController,
    label: 'No. ${vm.namaDokumenController.text}',
    hintText: 'Nomor ${vm.namaDokumenController.text}',
    keyboardType: TextInputType.number,
    onTap: vm.updateNoDokumen,
    onSave: vm.updateNoDokumen,
    onChanged: vm.updateNoDokumen,
    validator: (value) =>
        InputValidators.validateRequiredField(value, fieldType: 'No Dokumen'),
  );
}

CustomTextField _buildTanggalDokumen(
  BuildContext context,
  TambahDokumenPerusahaanCvViewModel vm,
) {
  return CustomTextField(
    textEditingController: vm.tanggalDokumenController,
    label: 'Tanggal Dokumen',
    hintText: 'DD/MM/YYYY',
    withSuffixIcon: true,
    suffixIconImagePath: IconConstants.calendar,
    onTap: () => vm.selectTanggalDokumen(context),
    enabled: false,
    fillColor: Colors.white,
    onSave: vm.updateTanggalDokumen,
    validator: (value) => InputValidators.validateRequiredField(
      value,
      fieldType: 'Tanggal Dokumen',
    ),
  );
}

CustomTextField _buildNamaDokumenLainnya(
  TambahDokumenPerusahaanCvViewModel vm,
) {
  return CustomTextField(
    textEditingController: vm.namaDokumenLainnyaController,
    label: 'Nama Dokumen',
    hintText: 'Masukkan Nama Dokumen',
    textCapitalization: TextCapitalization.words,
    onTap: vm.updateNamaDokumenLainnya,
    onSave: vm.updateNamaDokumenLainnya,
    onChanged: vm.updateNamaDokumenLainnya,
    validator: (value) =>
        InputValidators.validateRequiredField(value, fieldType: 'Nama Dokumen'),
  );
}

CustomButton _buildSaveBtn(TambahDokumenPerusahaanCvViewModel vm) {
  return CustomButton(
    label: 'SIMPAN',
    radius: 8.r,
    isBusy: false,
    color: vm.fileLegalitasUrl == null || vm.fileLegalitasUrl == ''
        ? Colors.grey
        : null,
    onPressed: vm.fileLegalitasUrl == null || vm.fileLegalitasUrl == ''
        ? null
        : () => vm.validateInputs(LegalitasUsahaAPIMethod.addDocument),
  );
}

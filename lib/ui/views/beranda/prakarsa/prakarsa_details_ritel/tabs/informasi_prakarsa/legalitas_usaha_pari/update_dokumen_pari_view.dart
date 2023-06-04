import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../application/enums/legalitas_usaha_api_method.dart';
import '../../../../../../../../application/helpers/date_time_picker.dart';
import '../../../../../../../../application/helpers/input_validators.dart';
import '../../../../../../../../application/models/ritel_legalitas_usaha_lainnya.dart';
import '../../../../../../../../application/models/ritel_legalitas_usaha_utama.dart';
import '../../../../../../../../application/models/ritel_prakarsa_perorangan.dart';
import '../../../../../../../shared/custom_button.dart';
import '../../../../../../../shared/custom_textfield.dart';
import '../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../shared/processing_indicator.dart';
import '../../../../../../../shared/styles.dart';
import 'update_dokumen_pari_viewmodel.dart';

class UpdateDokumenPariView
    extends ViewModelBuilderWidget<UpdateDokumenPariViewModel> {
  final String prakarsaId;
  final int uploadDocFrom;
  final RitelLegalitasUsahaUtama? ritelLegalitasUsahaUtama;
  final RitelLegalitasUsahaLainnya? ritelLegalitasUsahaLainnya;
  final RitelPrakarsaPerorangan ritelPrakarsaPerorangan;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;
  final int status;

  const UpdateDokumenPariView({
    Key? key,
    required this.prakarsaId,
    required this.uploadDocFrom,
    this.ritelLegalitasUsahaUtama,
    this.ritelLegalitasUsahaLainnya,
    required this.ritelPrakarsaPerorangan,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
    required this.status,
  }) : super(key: key);

  @override
  void onViewModelReady(UpdateDokumenPariViewModel viewModel) =>
      viewModel.initialize();

  @override
  UpdateDokumenPariViewModel viewModelBuilder(BuildContext context) =>
      UpdateDokumenPariViewModel(
        prakarsaId: prakarsaId,
        uploadDocFrom: uploadDocFrom,
        ritelLegalitasUsahaUtama: ritelLegalitasUsahaUtama,
        ritelLegalitasUsahaLainnya: ritelLegalitasUsahaLainnya,
        ritelPrakarsaPerorangan: ritelPrakarsaPerorangan,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        codeTable: codeTable,
        status: status,
      );

  @override
  // ignore: long-method
  Widget builder(
    BuildContext context,
    UpdateDokumenPariViewModel viewModel,
    Widget? child,
  ) {
    return NetworkSensitive(
      child: WillPopScope(
        onWillPop: () async => false,
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
            child: (viewModel.isBusy)
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
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Form(
                              key: viewModel.formKey,
                              autovalidateMode: viewModel.autoValidateMode,
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 0.h),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        GestureDetector(
                                          onTap: () => viewModel.pickFile(),
                                          child: Center(
                                            child: viewModel
                                                        .fileLegalitasUrlPublic ==
                                                    null
                                                ? Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[400],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        8.r,
                                                      ),
                                                    ),
                                                    height: 237.h,
                                                    width: double.infinity,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        viewModel.isUploading
                                                            ? CircularProgressIndicator(
                                                                color: Colors
                                                                    .grey[300],
                                                              )
                                                            : Image.asset(
                                                                IconConstants
                                                                    .upload,
                                                                color: Colors
                                                                    .grey[300],
                                                                scale: 1.5,
                                                              ),
                                                        SizedBox(height: 10.h),
                                                        viewModel.isUploading
                                                            ? AutoSizeText(
                                                                'Sedang mengupload file...',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      300],
                                                                  fontSize:
                                                                      20.sp,
                                                                ),
                                                              )
                                                            : AutoSizeText(
                                                                'Klik untuk mengupload file',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      300],
                                                                  fontSize:
                                                                      20.sp,
                                                                ),
                                                              ),
                                                      ],
                                                    ),
                                                  )
                                                : !(viewModel
                                                        .fileLegalitasUrlPublic!
                                                        .toLowerCase()
                                                        .contains('pdf'))
                                                    ? ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          8.r,
                                                        ),
                                                        child: SizedBox(
                                                          child: Image.network(
                                                            viewModel
                                                                .fileLegalitasUrlPublic!,
                                                          ),
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
                                        if (viewModel.fileLegalitasUrlPublic !=
                                                null &&
                                            !viewModel.isUploading)
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
                                                backgroundColor:
                                                    CustomColor.orange,
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
                                    _buildJenisDokumen(viewModel),
                                    if (viewModel.jenisDokumenController.text ==
                                        'Dokumen Utama')
                                      Column(
                                        children: [
                                          SizedBox(height: 8.h),
                                          _buildNamaDokumen(viewModel),
                                          if (viewModel.namaDokumenController
                                              .text.isNotEmpty)
                                            Column(
                                              children: [
                                                SizedBox(height: 8.h),
                                                _buildNoDokumen(
                                                  viewModel,
                                                  status,
                                                ),
                                                SizedBox(height: 8.h),
                                                _buildTanggalDokumen(
                                                  context,
                                                  viewModel,
                                                  status,
                                                ),
                                              ],
                                            ),
                                        ],
                                      )
                                    else if (viewModel
                                            .jenisDokumenController.text ==
                                        'Dokumen Lainnya')
                                      Column(
                                        children: [
                                          SizedBox(height: 8.h),
                                          _buildNamaDokumenLainnya(
                                            viewModel,
                                            status,
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (status <= 2)
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

// PopupMenuButton<String> _buildJenisDokumen(
//     BuildContext context, UpdateDokumenPariViewModel vm) {
//   return PopupMenuButton(
//     offset: Offset(0, 65.h),
//     itemBuilder: (BuildContext context) {
//       return ['Dokumen Utama', 'Dokumen Lainnya']
//           .map<PopupMenuItem<String>>((value) {
//         return PopupMenuItem(value: value, child: Text(value));
//       }).toList();
//     },
//     onSelected: (String val) => vm.updateJenisDokumen(val),
//     child: CustomTextField(
//       textEditingController: vm.jenisDokumenController,
//       label: 'Jenis Dokumen',
//       hintText: 'Pilih Jenis Dokumen',
//       withSuffixIcon: true,
//       suffixIconImagePath: IconConstants.chevronDown,
//       enabled: false,
//       validator: (value) => InputValidators.validateRequiredField(value,
//           fieldType: 'Jenis Dokumen'),
//     ),
//   );
// }

CustomTextField _buildJenisDokumen(UpdateDokumenPariViewModel vm) {
  return CustomTextField(
    textEditingController: vm.jenisDokumenController,
    label: 'Jenis Dokumen',
    hintText: 'Pilih Jenis Dokumen',
    enabled: false,
    fillColor: Colors.grey.shade100,
  );
}

// PopupMenuButton<String> _buildNamaDokumen(
//     BuildContext context, UpdateDokumenPariViewModel vm) {
//   return PopupMenuButton(
//     offset: Offset(0, 65.h),
//     itemBuilder: (BuildContext context) {
//       return ['NIB', 'SIUP', 'SITU', 'SKDP', 'TDP', 'Akta Lain']
//           .map<PopupMenuItem<String>>((value) {
//         return PopupMenuItem(value: value, child: Text(value));
//       }).toList();
//     },
//     onSelected: (String val) => vm.updateNamaDokumen(val),
//     child: CustomTextField(
//       textEditingController: vm.namaDokumenController,
//       label: 'Nama Dokumen',
//       hintText: 'Pilih Nama Dokumen',
//       withSuffixIcon: true,
//       suffixIconImagePath: IconConstants.chevronDown,
//       enabled: false,
//       validator: (value) => InputValidators.validateRequiredField(value,
//           fieldType: 'Nama Dokumen'),
//     ),
//   );
// }

CustomTextField _buildNamaDokumen(UpdateDokumenPariViewModel vm) {
  return CustomTextField(
    textEditingController: vm.namaDokumenController,
    label: 'Nama Dokumen',
    hintText: 'Pilih Nama Dokumen',
    enabled: false,
    fillColor: Colors.grey.shade100,
  );
}

CustomTextField _buildNoDokumen(UpdateDokumenPariViewModel vm, int status) {
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
    enabled: status == 1,
    fillColor: status == 1 ? Colors.white : Colors.grey.shade100,
  );
}

CustomTextField _buildTanggalDokumen(
  BuildContext context,
  UpdateDokumenPariViewModel vm,
  int status,
) {
  return CustomTextField(
    textEditingController: vm.tanggalDokumenController,
    label: 'Tanggal Dokumen',
    hintText: 'DD/MM/YYYY',
    withSuffixIcon: true,
    suffixIconImagePath: IconConstants.calendar,
    onTap: () async {
      if (status <= 2) {
        String date = await DateTimePicker.showingDatePicker(context);
        vm.updateTanggalDokumen(date);
      }
    },
    onSave: vm.updateTanggalDokumen,
    validator: (value) => InputValidators.validateRequiredField(
      value,
      fieldType: 'Tanggal Dokumen',
    ),
    enabled: status == 1,
    fillColor: status == 1 ? Colors.white : Colors.grey.shade100,
  );
}

CustomTextField _buildNamaDokumenLainnya(
  UpdateDokumenPariViewModel vm,
  int status,
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
    enabled: status == 1,
    fillColor: status == 1 ? Colors.white : Colors.grey.shade100,
  );
}

CustomButton _buildSaveBtn(UpdateDokumenPariViewModel vm) {
  return CustomButton(
    label: 'SIMPAN',
    radius: 8.r,
    isBusy: false,
    color: (vm.fileLegalitasUrl != null && !vm.isUploading)
        ? null
        : CustomColor.darkGrey,
    onPressed: () => (vm.fileLegalitasUrl != null && !vm.isUploading)
        ? vm.validateInputs(LegalitasUsahaAPIMethod.updateDocument)
        : null,
  );
}

/*void _buildModalTambahDokumen(
  BuildContext context,
  UpdateDokumenPariViewModel vm,
) {
  showModalBottomSheet(
    enableDrag: false,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    builder: (context) {
      return Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tambah Dokumen Kredit',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: CustomColor.primaryBlack80,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.close,
                        color: CustomColor.primaryBlack80,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                LegalitasUsahaButtonPari(
                  icon: Icons.image,
                  label: 'Galeri',
                  onPressed: vm.pickFromGallery,
                ),
                LegalitasUsahaButtonPari(
                  icon: Icons.camera_alt,
                  label: 'Kamera',
                  onPressed: vm.pickFromCamera,
                ),
                LegalitasUsahaButtonPari(
                  icon: Icons.folder,
                  label: 'File Manager',
                  isLast: true,
                  onPressed: vm.pickFile,
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}*/

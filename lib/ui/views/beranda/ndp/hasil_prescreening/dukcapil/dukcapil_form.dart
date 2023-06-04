import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../application/helpers/date_time_picker.dart';
import '../../../../../shared/custom_textfield.dart';
import '../../../../../shared/form_layout.dart';
import '../../../../../shared/styles.dart';
import '../hasil_prescreening_viewmodel_ritel.dart';

class DukcapilForm
    extends ViewModelBuilderWidget<HasilPrescreeningViewModelRitel> {
  final String? id;
  final dynamic nik;
  final dynamic name;
  final dynamic tempatLahir;
  final dynamic tanggalLahir;
  final bool? isDebitur;
  final int? codeTable;
  final int? mgmt;

  // ignore: use_key_in_widget_constructors
  const DukcapilForm({
    Key? key,
    this.id,
    this.nik,
    this.name,
    this.tempatLahir,
    this.tanggalLahir,
    this.isDebitur,
    this.codeTable,
    this.mgmt,
  });

  @override
  HasilPrescreeningViewModelRitel viewModelBuilder(BuildContext context) =>
      HasilPrescreeningViewModelRitel(
        pipelineflagId: id,
        name: name['fieldName'].toString(),
        ktpNum: nik['fieldName'].toString(),
        tanggalLahir: tanggalLahir['fieldName'].toString(),
        tempatLahir: tempatLahir['fieldName'].toString(),
        isDebitur: isDebitur,
        codeTable: codeTable,
        mgmt: mgmt,
      );

  @override
  Widget builder(
    BuildContext context,
    HasilPrescreeningViewModelRitel viewModel,
    Widget? child,
  ) {
    return FormLayout(
      title: 'Detail Informasi Dukcapil',
      description: 'Mohon konfirmasi semua informasi dibawah yang belum sesuai',
      onBackButtonPressed: () => Navigator.pop(context),
      isBusy: false,
      mainButtonTitle: 'SIMPAN',
      color: const Color(0xff027DEF),
      onMainButtonPressed: () async {
        _buildButtonKonfirmasiDukcapil(
          viewModel,
          context,
        );
      },
      child: Column(
        children: [
          Form(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    children: [
                      _buildNIK(viewModel),
                      Container(
                        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                        child: Row(
                          children: [
                            if (!viewModel.isChangeNik)
                              Text(
                                nik['result'],
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: nik['result'] == 'Ditemukan'
                                      ? const Color(0xff38BAA7)
                                      : const Color(0xffD70C24),
                                  fontSize: 12.sp,
                                ),
                              ),
                          ],
                        ),
                      ),
                      _buildNama(viewModel),
                      Container(
                        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                        child: Row(
                          children: [
                            if (!viewModel.isChangeName)
                              Text(
                                name['result'] == 'Tidak Sesuai'
                                    ? 'Belum sesuai, perlu dikoreksi'
                                    : 'Sesuai',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: name['result'] == 'Sesuai'
                                      ? const Color(0xff38BAA7)
                                      : const Color(0xffD70C24),
                                  fontSize: 12.sp,
                                ),
                              ),
                          ],
                        ),
                      ),
                      _buildTempatLahir(viewModel),
                      Container(
                        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                        child: Row(
                          children: [
                            if (!viewModel.isChangePlaceOfBirth)
                              Text(
                                tempatLahir['result'] == 'Sesuai'
                                    ? 'Sesuai'
                                    : 'Belum sesuai, perlu dikoreksi',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: tempatLahir['result'] == 'Sesuai'
                                      ? const Color(0xff38BAA7)
                                      : const Color(0xffD70C24),
                                  fontSize: 12.sp,
                                ),
                              ),
                          ],
                        ),
                      ),
                      _buildTanggalLahir(
                        viewModel,
                        context,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                        child: Row(
                          children: [
                            if (!viewModel.isChangeBirthDate)
                              Text(
                                tanggalLahir['result'] == 'Tidak Sesuai'
                                    ? 'Belum sesuai, perlu dikoreksi'
                                    : 'Sesuai',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: tanggalLahir['result'] == 'Sesuai'
                                      ? const Color(0xff38BAA7)
                                      : const Color(0xffD70C24),
                                  fontSize: 12.sp,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CustomTextField _buildNIK(HasilPrescreeningViewModelRitel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.nomorNIKController,
      label: 'NIK',
      hintText: nik['fieldName'],
      keyboardType: TextInputType.text,
      onSave: viewModel.updateNomorNIKController,
      onChanged: viewModel.updateNomorNIKController,
      matchWithDukcapil: nik['result'] == 'Ditemukan' && !viewModel.isChangeNik
          ? true
          : !viewModel.isChangeNik && nik['result'] == 'Tidak Ditemukan'
              ? false
              : true,
      enabled: nik['result'] == 'Ditemukan' ? false : true,
      withMaxLength: true,
      maxLength: 16,
      marginField: 8,
    );
  }

  CustomTextField _buildNama(HasilPrescreeningViewModelRitel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.nameController,
      label: 'Nama Lengkap Sesuai KTP',
      hintText: name['fieldName'],
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateNameController,
      onChanged: viewModel.updateNameController,
      marginField: 8,
      matchWithDukcapil: name['result'] == 'Sesuai' && !viewModel.isChangeName
          ? true
          : name['result'] == 'Tidak Sesuai' && !viewModel.isChangeName
              ? false
              : true,
      enabled: name['result'] == 'Sesuai' ? false : true,
    );
  }

  CustomTextField _buildTempatLahir(HasilPrescreeningViewModelRitel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.tempatLahirController,
      label: 'Tempat Lahir',
      hintText: tempatLahir['fieldName'],
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateTempatLahirController,
      onChanged: viewModel.updateTempatLahirController,
      marginField: 8,
      matchWithDukcapil:
          tempatLahir['result'] == 'Sesuai' && !viewModel.isChangePlaceOfBirth
              ? true
              : tempatLahir['result'] == 'Tidak Sesuai' &&
                      !viewModel.isChangePlaceOfBirth
                  ? false
                  : true,
      enabled: tempatLahir['result'] == 'Sesuai' ? false : true,
    );
  }

  CustomTextField _buildTanggalLahir(
    HasilPrescreeningViewModelRitel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tanggalLahirController,
      label: 'Tanggal Lahir',
      hintText: 'Masukkan tanggal lahir anda',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () async {
        String date = await DateTimePicker.showingDatePicker(context);
        viewModel.updateTanggalLahirController(date);
      },
      enabled: tanggalLahir['result'] == 'Sesuai' ? false : true,
      onSave: viewModel.updateTanggalLahirController,
      marginField: 8,
      matchWithDukcapil:
          tanggalLahir['result'] == 'Sesuai' && !viewModel.isChangeBirthDate
              ? true
              : tanggalLahir['result'] == 'Tidak Sesuai' &&
                      !viewModel.isChangeBirthDate
                  ? false
                  : true,
    );
  }

  // ignore: long-method
  void _buildButtonKonfirmasiDukcapil(
    HasilPrescreeningViewModelRitel vm,
    BuildContext context,
  ) {
    showModalBottomSheet(
      barrierColor: const Color(0xff03213E),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: MediaQuery.of(context).size.width > 1800
              ? EdgeInsets.fromLTRB(10.w, 0, 10.w, 20.h)
              : EdgeInsets.fromLTRB(12.5.w, 0, 12.5.w, 30.h),
          color: const Color(0xff03213E),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -70,
                left: 0,
                right: 0,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.white, spreadRadius: 6),
                    ],
                    image: DecorationImage(
                      image: AssetImage(IconConstants.x),
                      // fit: BoxFit.contain,
                      scale: 3.0,
                    ),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Container(
                height: 257,
                margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 22.h),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric().copyWith(top: 16),
                padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                height: 253.h,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 33.h),
                      child: AutoSizeText(
                        'Konfirmasi Perbaikan Data Dukcapil',
                        style: tsHeading5,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 12.h, bottom: 48.h),
                      child: AutoSizeText(
                        'Pastikan data yang anda perbaiki sudah benar.',
                        style: TextStyle(
                          color: const Color(0xff162B3A),
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color(0xff027DEF),
                                  backgroundColor: Colors.white,
                                  padding: EdgeInsets.fromLTRB(
                                      19.w, 12.w, 19.h, 12.w),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  side: BorderSide(
                                    color: const Color(0xff027DEF),
                                    width: 0.5.w,
                                  ),
                                ),
                                child: Text(
                                  'Batal'.toUpperCase(),
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width > 1800
                                            ? 12.sp
                                            : 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width > 1800
                                  ? 6.w
                                  : 16.w),
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () =>
                                    vm.putScreeningDukcapil(context),
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  padding:
                                      EdgeInsets.fromLTRB(
                                      19.w, 12.h, 19.w, 12.h),
                                ),
                                child: Text(
                                  'Yakin'.toUpperCase(),
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width > 1800
                                            ? 12.sp
                                            : 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../application/app/constants/custom_color.dart';
import '../../../../../application/app/constants/icon_constants.dart';
import '../../../../../application/helpers/date_time_picker.dart';
import '../../../../../application/helpers/input_validators.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/custom_textfield.dart';
import '../../../../shared/styles.dart';
import '../tambah_pencairan/widgets/tambah_pencairan_upload_button.dart';
import 'tambah_pencairan_viewmodel.dart';

class TambahPencairanFormSection
    extends HookViewModelWidget<TambahPencairanViewModel> {
  const TambahPencairanFormSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    TambahPencairanViewModel viewModel,
  ) {
    return Expanded(
      child: Column(
        children: [
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
                        _buildNamaPartnership(viewModel),
                        _buildNamaPIC(viewModel),
                        _buildJabatanPIC(viewModel),
                        _buildNomorHp(viewModel),
                        _buildEmail(viewModel),
                        _buildTanggalKonfirmasi(viewModel, context),
                        _buildJenisDokumen(viewModel),
                        _buildNamaDokumenUnderlying(viewModel),
                        _buildNomorDokumenUnderlying(viewModel),
                        _buildTanggalDokumenUnderlying(viewModel, context),
                        _buildNominalUnderlying(viewModel),
                        _buildTanggalJatuhTempiDokumenUnderlying(
                          viewModel,
                          context,
                        ),
                        _buildJenisKonfirmasi(viewModel),
                        _buildHasilKonfirmasiPartnership(viewModel),
                        _buildUploadBuktiKonfirmasi(viewModel),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                  color: CustomColor.primaryBlack.withOpacity(0.1),
                ),
              ],
            ),
            child: CustomButton(
              label: 'Selanjutnya',
              onPressed: viewModel.anyKonfirmasiPartnershipFormCompleted() &&
                      viewModel.hasilKonfirmasiPartnership.text == 'Sesuai'
                  ? viewModel.navigateToPencairanStepTwo
                  : null,
              isBusy: false,
            ),
          ),
        ],
      ),
    );
  }

  CustomTextField _buildNamaPartnership(TambahPencairanViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.namaPartnershipController,
      label: 'Nama Partnership',
      hintText: 'Masukan Nama Partnership',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.chevronDown,
      onTap: viewModel.getPartnership,
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Nama Partnership',
      ),
      enabled: false,
      fillColor: Colors.white,
    );
  }

  CustomTextField _buildNamaPIC(TambahPencairanViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.namaPICPartnership,
      label: 'Nama PIC Partnership yang Dihubungi',
      hintText: 'Masukan Nama PIC Partnership',
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Nama PIC',
      ),
      enabled: false,
    );
  }

  CustomTextField _buildJabatanPIC(TambahPencairanViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.jabatanPicController,
      label: 'Jabatan PIC',
      hintText: 'Masukan Jabatan PIC',
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Jabatan PIC',
      ),
      enabled: false,
    );
  }

  CustomTextField _buildNomorHp(TambahPencairanViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.nomorHPController,
      label: 'No. Handphone PIC',
      hintText: 'Masukan No. Handphone PIC',
      prefixText: '+62',
      keyboardType: TextInputType.number,
      validator: (value) => InputValidators.validateMobileNumber(value),
      enabled: false,
    );
  }

  CustomTextField _buildEmail(TambahPencairanViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.emailPicController,
      label: 'Email PIC',
      hintText: 'Masukan Email PIC',
      keyboardType: TextInputType.emailAddress,
      validator: (value) => InputValidators.validateEmail(value),
      enabled: false,
    );
  }

  CustomTextField _buildTanggalKonfirmasi(
    TambahPencairanViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tanggalKonfirmasiController,
      label: 'Tanggal Konfirmasi',
      hintText: 'Masukan Tanggal Konfirmasi',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () async {
        String date = await DateTimePicker.showingDatePicker(context);
        viewModel.updateTanggalKonfirmasi(date);
      },
      onSave: viewModel.updateTanggalKonfirmasi,
      enabled: false,
      fillColor: Colors.white,
      validator: (value) => InputValidators.validateConfirmationDate(
        value,
        fieldType: 'Tanggal Konfirmasi',
      ),
    );
  }

  PopupMenuButton<String> _buildJenisDokumen(
    TambahPencairanViewModel viewModel,
  ) {
    return PopupMenuButton(
      offset: Offset(double.maxFinite, 65.h),
      itemBuilder: (BuildContext context) {
        return [
          'DO',
          'Invoice',
        ].map<PopupMenuItem<String>>((value) {
          return PopupMenuItem(value: value, child: Text(value));
        }).toList();
      },
      onSelected: (String val) => viewModel.updateJenisDokumen(val),
      child: CustomTextField(
        textEditingController: viewModel.jenisDokumenUnderlyingController,
        label: 'Jenis Dokumen Underlying',
        hintText: 'Pilih Jenis Dokumen Underlying',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        fillColor: Colors.white,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Jenis Dokumen Underlying',
        ),
      ),
    );
  }

  CustomTextField _buildNamaDokumenUnderlying(
    TambahPencairanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.namaDokumenUnderlyingController,
      label: 'Nama Dokumen Underlying',
      hintText: 'Masukan Nama Dokumen Underlying',
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidators.validateName(
        value,
        fieldType: 'Dokumen Underlying',
      ),
      onChanged: viewModel.updateNamaDokumenUnderlying,
      onSave: viewModel.updateNamaDokumenUnderlying,
    );
  }

  CustomTextField _buildNomorDokumenUnderlying(
    TambahPencairanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorDokumenUnderlying,
      label: 'No. Dokumen Underlying',
      hintText: 'Masukan No. Dokumen Underlying',
      keyboardType: TextInputType.text,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'No. Dokumen Underlying',
      ),
      onChanged: viewModel.updateNoDokumenUnderlying,
      onSave: viewModel.updateNoDokumenUnderlying,
    );
  }

  CustomTextField _buildTanggalDokumenUnderlying(
    TambahPencairanViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tanggalDokumenUnderlyingController,
      label: 'Tanggal Dokumen Underlying',
      hintText: 'Masukan Tanggal Dokumen Underlying',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () async {
        String date = await DateTimePicker.showingDatePicker(context);
        viewModel.updateTanggalDokumenUnderlying(date);
      },
      onSave: viewModel.updateTanggalDokumenUnderlying,
      enabled: false,
      fillColor: Colors.white,
      validator: (value) => InputValidators.validateConfirmationDate(
        value,
        fieldType: 'Tanggal Dokumen Underlying',
      ),
    );
  }

  CustomTextField _buildNominalUnderlying(TambahPencairanViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.nominalUnderlyingController,
      label: 'Nominal Underlying',
      hintText: 'Masukan Nominal Underlying',
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      keyboardType: TextInputType.number,
      withThousandsSeparator: true,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Nominal Underlying',
      ),
      onChanged: viewModel.updateNominalUnderlying,
      onSave: viewModel.updateNominalUnderlying,
    );
  }

  CustomTextField _buildTanggalJatuhTempiDokumenUnderlying(
    TambahPencairanViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tanggalJatuhTempoDokumenUnderlying,
      label: 'Tanggal Jatuh Tempo Dokumen Underlying',
      hintText: 'Masukan Tanggal jatuh Tempo Dokumen Underlying',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () async {
        String date = await DateTimePicker.showingDatePicker(context);
        viewModel.updateTanggalJatuhTempoDokumenUnderlying(date);
      },
      onSave: viewModel.updateTanggalJatuhTempoDokumenUnderlying,
      validator: (value) => InputValidators.validateConfirmationDate(
        value,
        fieldType: 'Tanggal Jatuh Tempo Dokumen Underlying',
      ),
      enabled: false,
      fillColor: Colors.white,
    );
  }

  PopupMenuButton<String> _buildJenisKonfirmasi(
    TambahPencairanViewModel viewModel,
  ) {
    return PopupMenuButton(
      offset: Offset(double.maxFinite, 65.h),
      itemBuilder: (BuildContext context) {
        return [
          'Kunjungan Lapangan',
          'Video Call',
          'Email',
          'Whatsapp',
        ].map<PopupMenuItem<String>>((value) {
          return PopupMenuItem(value: value, child: Text(value));
        }).toList();
      },
      onSelected: (String val) => viewModel.updateJenisKonfirmasi(val),
      child: CustomTextField(
        textEditingController: viewModel.jenisKonfirmasi,
        label: 'Pilih Jenis Konfirmasi',
        hintText: 'Pilih Jenis Konfirmasi',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        fillColor: Colors.white,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Jenis Konfirmasi',
        ),
      ),
    );
  }

  PopupMenuButton<String> _buildHasilKonfirmasiPartnership(
    TambahPencairanViewModel viewModel,
  ) {
    return PopupMenuButton(
      offset: Offset(double.maxFinite, 65.h),
      itemBuilder: (BuildContext context) {
        return [
          'Sesuai',
          'Tidak Sesuai',
        ].map<PopupMenuItem<String>>((value) {
          return PopupMenuItem(value: value, child: Text(value));
        }).toList();
      },
      onSelected: (String val) => viewModel.updateHasilKonfirmasi(val),
      child: CustomTextField(
        textEditingController: viewModel.hasilKonfirmasiPartnership,
        label: 'Hasil konfirmasi Partnership',
        hintText: 'Apakah Sudah Sesuai Dengan konfirmasi',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        fillColor: Colors.white,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Hasil Konfirmasi Partnership',
        ),
      ),
    );
  }

  Column _buildUploadBuktiKonfirmasi(TambahPencairanViewModel viewModel) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Lampiran Bukti Konfirmasi',
              style: tsCaption1,
              textAlign: TextAlign.left,
            ),
          ],
        ),
        SizedBox(height: 8.h),
        TambahPencairanUploadButton(
          urlPrivate: viewModel.uploadBuktiKonfirmasiUrl,
          urlPublic: viewModel.uploadBuktiKonfirmasiPublicUrl,
          label: 'Lampiran Bukti Konfirmasi',
          onPressed: viewModel.uploadBuktiKonfirmasiFile == null
              ? viewModel.captureBuktiKonfirmasi
              : viewModel.clearBuktiKonfirmasi,
          errorText: viewModel.uploadBuktiKonfirmasiErrorText,
        ),
      ],
    );
  }
}

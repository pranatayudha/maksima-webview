import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../application/app/constants/common.dart';
import '../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../application/helpers/date_time_picker.dart';
import '../../../../../../application/helpers/input_validators.dart';
import '../../../../../shared/custom_textfield.dart';
import '../../../../../shared/custom_type_ahead_form_field.dart';
import 'informasi_data_diri_viewmodel.dart';

class InformasiDataDiriFormSection
    extends HookViewModelWidget<InformasiDataDiriViewModel> {
  const InformasiDataDiriFormSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiDataDiriViewModel viewModel,
  ) {
    viewModel.jenisDebiturController.text = 'Perorangan';

    return Form(
      key: viewModel.formKey,
      autovalidateMode: viewModel.autoValidateMode,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                _buildJenisDebitur(viewModel),
                _buildNamaLengkapDebitur(viewModel),
                _buildNomorKTPDebitur(viewModel),
                _buildTanggalKTPTerbit(viewModel, context),
                _buildAgama(viewModel),
                _buildPendidikanTerakhir(viewModel),
                _buildNomorNPWP(viewModel),
                _buildTempatLahirDebitur(viewModel),
                _buildTanggalLahirDebitur(viewModel, context),
                _buildJenisKelamin(viewModel),
                _buildNamaGadisIbuKandungDebitur(viewModel),
                _buildStatusPerkawinan(viewModel),
                _buildNomorKK(viewModel),
                _buildJumlahTanggungan(viewModel),
                _buildAlamatTinggal(viewModel),
                _buildDetailAlamatTinggal(viewModel),
                _buildKodePos(viewModel),
                _buildProvinsi(viewModel),
                _buildKota(viewModel),
                Row(
                  children: [
                    Expanded(
                      child: _buildKecamatan(viewModel),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: _buildKelurahan(viewModel),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _buildRT(viewModel),
                    SizedBox(width: 15.w),
                    _buildRW(viewModel),
                  ],
                ),
                _buildNomorHandphone(viewModel),
                _buildEmail(viewModel),
                if (viewModel.statusPerkawinanController.text == Common.kawin)
                  Column(
                    children: [
                      _buildNomorKTPPasangan(viewModel),
                      _buildNamaLengkapPasangan(viewModel),
                      _buildTempatLahirPasangan(viewModel),
                      _buildTanggalLahirPasangan(viewModel, context),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuButton<String> _buildAgama(InformasiDataDiriViewModel viewModel) {
    return PopupMenuButton(
      offset: Offset(0, 65.h),
      itemBuilder: (BuildContext context) {
        return [
          'Buddha',
          'Hindu',
          'Katolik',
          'Konghucu',
          'Islam',
          'Protestan',
          'Kepercayaan',
        ].map<PopupMenuItem<String>>((value) {
          return PopupMenuItem(value: value, child: Text(value));
        }).toList();
      },
      onSelected: (String val) => viewModel.updateAgama(val),
      child: CustomTextField(
        textEditingController: viewModel.agamaController,
        label: 'Agama *',
        hintText: 'Pilih Agama',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        fillColor: Colors.white,
        validator: (value) =>
            InputValidators.validateRequiredField(value, fieldType: 'Agama'),
      ),
    );
  }

  CustomTextField _buildAlamatTinggal(InformasiDataDiriViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.alamatTinggalController,
      label: 'Tag Location Alamat Tempat Tinggal *',
      hintText: 'Tag Location',
      textCapitalization: TextCapitalization.words,
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.location,
      onTap: viewModel.navigateToAddressSelectionViewDataDiri,
      onSave: viewModel.updateAlamatTinggal,
      onChanged: viewModel.updateAlamatTinggal,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Tag Location',
      ),
    );
  }

  CustomTextField _buildDetailAlamatTinggal(
    InformasiDataDiriViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.detailAlamatTinggalController,
      label: 'Detail Alamat Tempat Tinggal *',
      hintText: 'Masukkan Detail Alamat Tempat Tinggal',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateDetailAlamatTinggal,
      onChanged: viewModel.updateDetailAlamatTinggal,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Detail Alamat Tempat Tinggal',
      ),
    );
  }

  CustomTextField _buildEmail(InformasiDataDiriViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.emailDebiturController,
      label: 'Email',
      hintText: 'Masukkan Email Debitur',
      keyboardType: TextInputType.emailAddress,
      onSave: viewModel.updateEmailDebitur,
      onChanged: viewModel.updateEmailDebitur,
      // validator: (value) => InputValidators.validateEmail(value),
    );
  }

  CustomTextField _buildJenisDebitur(InformasiDataDiriViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.jenisDebiturController,
      label: 'Jenis Debitur *',
      hintText: 'Masukkan Jenis Debitur',
      textCapitalization: TextCapitalization.words,
      enabled: false,
    );
  }

  PopupMenuButton<String> _buildJenisKelamin(
    InformasiDataDiriViewModel viewModel,
  ) {
    return PopupMenuButton(
      offset: Offset(0, 65.h),
      itemBuilder: (BuildContext context) {
        return [
          'Laki-laki',
          'Perempuan',
        ].map<PopupMenuItem<String>>((value) {
          return PopupMenuItem(value: value, child: Text(value));
        }).toList();
      },
      onSelected: (String val) => viewModel.updateJenisKelamin(val),
      child: CustomTextField(
        textEditingController: viewModel.jenisKelaminController,
        label: 'Jenis Kelamin *',
        hintText: 'Pilih Jenis Kelamin',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        fillColor: Colors.white,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Jenis Kelamin',
        ),
      ),
    );
  }

  CustomTextField _buildJumlahTanggungan(InformasiDataDiriViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.jumlahTanggunganController,
      label: 'Jumlah Tanggungan',
      hintText: 'Masukkan Jumlah Tanggungan',
      onSave: viewModel.updateJumlahTanggungan,
      onChanged: viewModel.updateJumlahTanggungan,
      keyboardType: TextInputType.number,
    );
  }

  //  CustomTextField _buildKecamatan(InformasiDataDiriViewModel viewModel) {
  //   return CustomTextField(
  //     label: 'Kecamatan *',
  //     textEditingController: viewModel.districtAlamatTinggalController,
  //     hintText: 'Pilih Kecamatan',
  //     enabled: false,
  //     fillColor: const Color(0xffF6F6F8),
  //   );
  // }

  CustomTypeAheadFormField _buildKecamatan(
    InformasiDataDiriViewModel viewModel,
  ) {
    return CustomTypeAheadFormField(
      label: 'Kecamatan *',
      controller: viewModel.districtAlamatTinggalController,
      onClear: viewModel.clearDistrict,
      onFilter: viewModel.filterDistrict,
      onSuggestionSelected: viewModel.updateDistrict,
      itemBuilder: (context, suggestion) {
        return ListTile(title: Text(suggestion.district));
      },
      validator: (value) =>
          InputValidators.validateRequiredField(value, fieldType: 'Kecamatan'),
    );
  }

  CustomTypeAheadFormField _buildKelurahan(
    InformasiDataDiriViewModel viewModel,
  ) {
    return CustomTypeAheadFormField(
      label: 'Kelurahan *',
      controller: viewModel.villageAlamatTinggalController,
      onClear: viewModel.clearVillage,
      onFilter: viewModel.filterVillage,
      onSuggestionSelected: viewModel.updateVillage,
      itemBuilder: (context, suggestion) {
        return ListTile(title: Text(suggestion.village));
      },
      validator: (value) =>
          InputValidators.validateRequiredField(value, fieldType: 'Kelurahan'),
    );
  }

  CustomTextField _buildKodePos(InformasiDataDiriViewModel viewModel) {
    return CustomTextField(
      label: 'Kode Pos *',
      textEditingController: viewModel.postalCodeAlamatTinggalController,
      hintText: 'Masukkan Kode Pos',
      onSave: viewModel.updatePostalCodeAlamatTinggal,
      onChanged: viewModel.updatePostalCodeAlamatTinggal,
      keyboardType: TextInputType.number,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Postal Code',
      ),
    );
  }

  CustomTextField _buildKota(InformasiDataDiriViewModel viewModel) {
    return CustomTextField(
      label: 'Kota *',
      textEditingController: viewModel.cityAlamatTinggalController,
      hintText: 'Masukkan Nama Kota',
      enabled: false,
      fillColor: const Color(0xffF6F6F8),
    );
  }

  CustomTextField _buildNamaGadisIbuKandungDebitur(
    InformasiDataDiriViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.namaGadisIbuKandungDebiturController,
      label: 'Nama Lengkap Gadis Ibu Kandung Debitur',
      hintText: 'Masukkan Nama Gadis Ibu Kandung',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateNamaGadisIbuKandungDebitur,
      onChanged: viewModel.updateNamaGadisIbuKandungDebitur,
    );
  }

  CustomTextField _buildNamaLengkapDebitur(
    InformasiDataDiriViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.namaLengkapDebiturController,
      label: 'Nama Lengkap Debitur Sesuai KTP *',
      hintText: 'Masukkan Nama Debitur',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateNamaLengkapDebitur,
      onChanged: viewModel.updateNamaLengkapDebitur,
      validator: (value) =>
          InputValidators.validateName(value, fieldType: 'Nama Debitur'),
    );
  }

  CustomTextField _buildNamaLengkapPasangan(
    InformasiDataDiriViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.namaLengkapPasanganController,
      label: 'Nama Lengkap Pasangan *',
      hintText: 'Masukkan Nama Pasangan',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateNamaLengkapPasangan,
      onChanged: viewModel.updateNamaLengkapPasangan,
      validator: (value) =>
          InputValidators.validateName(value, fieldType: 'Nama Pasangan'),
    );
  }

  CustomTextField _buildNomorHandphone(InformasiDataDiriViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.noHpDebiturController,
      label: 'No. Handphone *',
      hintText: 'Masukkan No. Handphone Debitur',
      prefixText: '+62 ',
      onSave: viewModel.updateNoHpDebitur,
      onChanged: viewModel.updateNoHpDebitur,
      keyboardType: TextInputType.number,
      validator: (value) => InputValidators.validateMobileNumber(value),
      withMaxLength: true,
      maxLength: 12,
    );
  }

  CustomTextField _buildNomorKK(InformasiDataDiriViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.nomorKKController,
      label: 'Nomor KK Debitur',
      hintText: 'Masukkan Nomor KK Debitur',
      onSave: viewModel.updateNomorKK,
      onChanged: viewModel.updateNomorKK,
      keyboardType: TextInputType.number,
      withMaxLength: true,
      maxLength: 16,
    );
  }

  CustomTextField _buildNomorKTPDebitur(InformasiDataDiriViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.nomorKtpDebiturController,
      label: 'Nomor KTP Debitur *',
      hintText: 'Masukkan Nomor KTP Debitur',
      onSave: viewModel.updateNomorKTP,
      onChanged: viewModel.updateNomorKTP,
      keyboardType: TextInputType.number,
      validator: (value) => InputValidators.validateKTPNumber(
        value,
        fieldType: 'Nomor KTP Debitur',
      ),
      withMaxLength: true,
      maxLength: 16,
    );
  }

  CustomTextField _buildNomorKTPPasangan(InformasiDataDiriViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.nomorKtpPasanganController,
      label: 'Nomor KTP Pasangan *',
      hintText: 'Masukkan Nomor KTP Pasangan',
      onSave: viewModel.updateNomorKtpPasangan,
      onChanged: viewModel.updateNomorKtpPasangan,
      keyboardType: TextInputType.number,
      validator: (value) => InputValidators.validateKTPNumber(
        value,
        fieldType: 'Nomor KTP Pasangan',
      ),
      withMaxLength: true,
      maxLength: 16,
    );
  }

  CustomTextField _buildNomorNPWP(InformasiDataDiriViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.nomorNpwpDebiturController,
      label: 'Nomor NPWP Debitur',
      hintText: 'Masukkan Nomor NPWP Debitur',
      onSave: viewModel.updateNomorNpwp,
      onChanged: viewModel.updateNomorNpwp,
      keyboardType: TextInputType.number,
      // validator: (value) => InputValidators.ritelValidateNPWP(value),
      withMaxLength: true,
      maxLength: 15,
    );
  }

  PopupMenuButton<String> _buildPendidikanTerakhir(
    InformasiDataDiriViewModel viewModel,
  ) {
    return PopupMenuButton(
      offset: Offset(0, 65.h),
      itemBuilder: (BuildContext context) {
        return [
          'Belum Tamat',
          'D1',
          'D2',
          'D3',
          'S1',
          'S2',
          'S3',
          'SD',
          'SMP',
          'SMU',
          'Madrasah',
        ].map<PopupMenuItem<String>>((value) {
          return PopupMenuItem(value: value, child: Text(value));
        }).toList();
      },
      onSelected: (String val) => viewModel.updatePendidikanTerakhir(val),
      child: CustomTextField(
        textEditingController: viewModel.pendidikanTerakhirController,
        label: 'Pendidikan Terakhir *',
        hintText: 'Pilih Pendidikan Terakhir',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        fillColor: Colors.white,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Pendidikan Terakhir',
        ),
      ),
    );
  }

  CustomTextField _buildProvinsi(InformasiDataDiriViewModel viewModel) {
    return CustomTextField(
      label: 'Provinsi *',
      textEditingController: viewModel.provinceAlamatTinggalController,
      hintText: 'Masukkan Nama Provinsi',
      enabled: false,
      fillColor: const Color(0xffF6F6F8),
    );
  }

  Expanded _buildRT(InformasiDataDiriViewModel viewModel) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.rtAlamatTinggalController,
        label: 'RT',
        hintText: 'cth. 005',
        onSave: viewModel.updateRtAlamatTinggal,
        onChanged: viewModel.updateRtAlamatTinggal,
        keyboardType: TextInputType.number,
        withMaxLength: true,
        maxLength: 3,
        validator: (value) =>
            InputValidators.validateRTRW(value, fieldType: 'RT'),
      ),
    );
  }

  Expanded _buildRW(InformasiDataDiriViewModel viewModel) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.rwAlamatTinggalController,
        label: 'RW',
        hintText: 'cth. 006',
        onSave: viewModel.updateRwAlamatTinggal,
        onChanged: viewModel.updateRwAlamatTinggal,
        keyboardType: TextInputType.number,
        withMaxLength: true,
        maxLength: 3,
        validator: (value) =>
            InputValidators.validateRTRW(value, fieldType: 'RW'),
      ),
    );
  }

  PopupMenuButton<String> _buildStatusPerkawinan(
    InformasiDataDiriViewModel viewModel,
  ) {
    return PopupMenuButton(
      offset: Offset(0, 65.h),
      itemBuilder: (BuildContext context) {
        return [
          Common.kawin,
          Common.belumKawin,
          Common.ceraiHidup,
          Common.ceraiMati,
        ].map<PopupMenuItem<String>>((value) {
          return PopupMenuItem(value: value, child: Text(value));
        }).toList();
      },
      onSelected: (String val) => viewModel.updateMaritalStatus(val),
      child: CustomTextField(
        textEditingController: viewModel.statusPerkawinanController,
        label: 'Status Perkawinan *',
        hintText: 'Pilih Status Perkawinan',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        fillColor: Colors.white,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Status Perkawinan',
        ),
      ),
    );
  }

  CustomTextField _buildTanggalKTPTerbit(
    InformasiDataDiriViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglKtpTerbitController,
      label: 'Tanggal KTP Terbit *',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () async {
        String date = await DateTimePicker.showingDatePicker(context);
        viewModel.updateTglKtpTerbit(date);
      },
      enabled: false,
      fillColor: Colors.white,
      onSave: viewModel.updateTglKtpTerbit,
      validator: (value) => InputValidators.validateKtpDate(value),
    );
  }

  CustomTextField _buildTanggalLahirDebitur(
    InformasiDataDiriViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglLahirDebiturController,
      label: 'Tanggal Lahir Debitur *',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () async {
        String date = await DateTimePicker.showingDatePicker(context);
        viewModel.updateTglLahirDebitur(date);
      },
      enabled: false,
      fillColor: Colors.white,
      onSave: viewModel.updateTglLahirDebitur,
      validator: (value) => InputValidators.ritelValidateBirthDate(
        value,
        fieldType: 'Tanggal Lahir Debitur',
      ),
    );
  }

  CustomTextField _buildTanggalLahirPasangan(
    InformasiDataDiriViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglLahirPasanganController,
      label: 'Tanggal Lahir Pasangan *',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () async {
        String date = await DateTimePicker.showingDatePicker(context);
        viewModel.updateTglLahirPasangan(date);
      },
      enabled: false,
      fillColor: Colors.white,
      onSave: viewModel.updateTglLahirPasangan,
      validator: (value) => InputValidators.ritelValidateBirthDate(
        value,
        fieldType: 'Tanggal Lahir Pasangan',
      ),
    );
  }

  CustomTextField _buildTempatLahirDebitur(
    InformasiDataDiriViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tempatLahirDebiturController,
      label: 'Tempat Lahir Debitur *',
      hintText: 'Masukkan Tempat Lahir Debitur',
      onSave: viewModel.updateTempatLahirDebitur,
      onChanged: viewModel.updateTempatLahirDebitur,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Tempat Lahir Debitur',
      ),
    );
  }

  // CustomTypeAheadFormField _buildTempatLahirDebitur(
  //   InformasiDataDiriViewModel viewModel,
  // ) {
  //   return CustomTypeAheadFormField(
  //     label: 'Tempat Lahir Debitur *',
  //     controller: viewModel.tempatLahirDebiturController,
  //     onClear: viewModel.clearPlaceOfBirth,
  //     onFilter: viewModel.filterPlaceOfBirth,
  //     onSuggestionSelected: viewModel.updatePlaceOfBirth,
  //     itemBuilder: (context, suggestion) {
  //       return ListTile(title: Text(suggestion.city!));
  //     },
  //     validator: (value) => InputValidators.validateRequiredField(
  //       value,
  //       fieldType: 'Tempat Lahir Debitur',
  //     ),
  //   );
  // }

  CustomTextField _buildTempatLahirPasangan(
    InformasiDataDiriViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tempatLahirPasanganController,
      label: 'Tempat Lahir Pasangan *',
      hintText: 'Masukkan Tempat Lahir Pasangan',
      onSave: viewModel.updateTempatLahirPasangan,
      onChanged: viewModel.updateTempatLahirPasangan,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Tempat Lahir Pasangan',
      ),
    );
  }

  // CustomTypeAheadFormField _buildTempatLahirPasangan(
  //   InformasiDataDiriViewModel viewModel,
  // ) {
  //   return CustomTypeAheadFormField(
  //     controller: viewModel.tempatLahirPasanganController,
  //     label: 'Tempat Lahir Pasangan *',
  //     onClear: viewModel.clearPlaceOfBirthSuppouse,
  //     onFilter: viewModel.filterPlaceOfBirthSuppouse,
  //     onSuggestionSelected: viewModel.updatePlaceOfBirthSuppouse,
  //     itemBuilder: (context, suggestion) {
  //       return ListTile(title: Text(suggestion.city!));
  //     },
  //     validator: (value) => InputValidators.validateName(
  //       value,
  //       fieldType: 'Tempat Lahir Pasangan',
  //     ),
  //   );
  // }
}

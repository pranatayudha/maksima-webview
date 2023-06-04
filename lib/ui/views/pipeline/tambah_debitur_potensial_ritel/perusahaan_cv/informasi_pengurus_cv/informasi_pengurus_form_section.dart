import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../application/app/constants/common.dart';
import '../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../application/helpers/input_validators.dart';
import '../../../../../shared/custom_textfield.dart';
import '../../../../../shared/custom_type_ahead_form_field.dart';
import 'informasi_pengurus_cv_viewmodel.dart';

class InformasiPengurusCvFormSection
    extends HookViewModelWidget<InformasiPengurusCvViewModel> {
  const InformasiPengurusCvFormSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPengurusCvViewModel viewModel,
  ) {
    return Form(
      key: viewModel.formKey,
      autovalidateMode: viewModel.autoValidateMode,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                _buildNamaPengurus(viewModel),
                _buildPosisiPengurus(viewModel),
                _buildNomorKTPPengurus(viewModel),
                _buildNPWPPengurus(viewModel),
                _buildJenisKelaminPengurusCv(viewModel),
                _buildTempatLahirPengurusCv(viewModel),
                _buildTanggalLahirPengurus(viewModel, context),
                _buildStatusPerkawinan(viewModel),
                _buildTagAlamatPengurus(viewModel),
                _buildAlamatKtpPengurus(viewModel),
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
                // Row(
                //   children: [
                //     _buildKecamatan(viewModel),
                //     SizedBox(width: 15.w),
                //     _buildKelurahan(viewModel),
                //   ],
                // ),
                Row(
                  children: [
                    _buildRT(viewModel),
                    SizedBox(width: 15.w),
                    _buildRW(viewModel),
                  ],
                ),
                _buildNoHandphonePengurus(viewModel),
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

  CustomTextField _buildNamaPengurus(InformasiPengurusCvViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.namaPengurusCvController,
      label: 'Nama Pengurus Sesuai KTP *',
      hintText: 'Masukkan Nama Pengurus',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateNamaPengurusCv,
      onChanged: viewModel.updateNamaPengurusCv,
      validator: (value) =>
          InputValidators.validateName(value, fieldType: 'Nama Pengurus'),
    );
  }

  PopupMenuButton<String> _buildPosisiPengurus(
    InformasiPengurusCvViewModel viewModel,
  ) {
    return PopupMenuButton(
      offset: Offset(0, 65.h),
      itemBuilder: (BuildContext context) {
        return [
          'Pemilik, Direktur',
          'Pemilik, Direktur',
          'Pemilik, Komisaris Utama/Presiden Kom.',
          'Pemilik, Komisaris',
          'Pemilik, Kuasa Direksi',
          'Pemilik, Bukan Pengurus',
          'Pemilik, Grup',
          'Pemilik, Masyarakat',
          'Pemilik, Ketua Umum',
          'Pemilik, Ketua',
          'Pemilik, Sekretaris',
          'Pemilik, Bendahara',
          'Pengurus, Direktur Utama/Presiden Dir.',
          'Pengurus, Direktur',
          'Pengurus, Komisaris Utama/Presiden Kom',
          'Pengurus, Komisaris',
          'Pengurus, Kuasa Direksi',
          'Pengurus, Grup',
          'Pengurus, Ketua Umum',
          'Pengurus, Ketua',
          'Pengurus, Sekretaris',
          'Pengurus, Bendahara',
          'Pengurus, Lainnya',
        ].map<PopupMenuItem<String>>((value) {
          return PopupMenuItem(value: value, child: Text(value));
        }).toList();
      },
      onSelected: (String val) => viewModel.updatePosisiPengurusCv(val),
      child: CustomTextField(
        textEditingController: viewModel.posisiPengurusCvController,
        label: 'Posisi Pengurus *',
        hintText: 'Pilih Posisi Pengurus',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        fillColor: Colors.white,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Posisi Pengurus',
        ),
      ),
    );
  }

  CustomTextField _buildNomorKTPPengurus(
    InformasiPengurusCvViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorKtpPengurusCvController,
      label: 'Nomor KTP Pengurus *',
      hintText: 'Masukkan Nomor KTP Pengurus',
      keyboardType: TextInputType.number,
      onSave: viewModel.updateNomorKTPpengurusCv,
      onChanged: viewModel.updateNomorKTPpengurusCv,
      validator: (value) => InputValidators.validateKTPNumber(
        value,
        fieldType: 'Nomor KTP Pengurus',
      ),
      withMaxLength: true,
      maxLength: 16,
    );
  }

  CustomTextField _buildNPWPPengurus(InformasiPengurusCvViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.nomorNpwpPengurusCvController,
      // label: 'Nomor NPWP Pengurus *',
      label: 'Nomor NPWP Pengurus',
      hintText: 'Masukkan Nomor NPWP Pengurus',
      keyboardType: TextInputType.number,
      onSave: viewModel.updateNomorNpwpPengurusCv,
      onChanged: viewModel.updateNomorNpwpPengurusCv,
      // validator: (value) => InputValidators.ritelValidateNPWP(value),
      withMaxLength: true,
      maxLength: 15,
    );
  }

  PopupMenuButton<String> _buildJenisKelaminPengurusCv(
    InformasiPengurusCvViewModel viewModel,
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
      onSelected: (String val) => viewModel.updateJenisKelaminPengurusCv(val),
      child: CustomTextField(
        textEditingController: viewModel.jenisKelaminPengurusCvController,
        label: 'Jenis Kelamin *',
        hintText: 'Jenis Kelamin Pengurus',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        fillColor: Colors.white,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Jenis Kelamin Pengurus',
        ),
      ),
    );
  }

  CustomTextField _buildTempatLahirPengurusCv(
    InformasiPengurusCvViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tempatLahirPengurusCvController,
      label: 'Tempat Lahir *',
      hintText: 'Masukan Tempat Lahir',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateTempatLahirPengurusCv,
      onChanged: viewModel.updateTempatLahirPengurusCv,
      validator: (value) => InputValidators.validateName(
        value,
        fieldType: 'Tempat Lahir Pengurus',
      ),
    );
  }

  CustomTextField _buildTanggalLahirPengurus(
    InformasiPengurusCvViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglLahirPengurusCvController,
      label: 'Tanggal Lahir *',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () => viewModel.selecttglLahirPengurusCv(context),
      fillColor: Colors.white,
      enabled: false,
      onSave: viewModel.updateTglLahirPengurusCv,
      validator: (value) => InputValidators.ritelValidateBirthDate(
        value,
        fieldType: 'Tanggal Lahir',
      ),
    );
  }

  PopupMenuButton<String> _buildStatusPerkawinan(
    InformasiPengurusCvViewModel viewModel,
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

  // CustomTextField _buildTempatLahir() {
  //   return CustomTextField(
  //     textEditingController: viewModel.tempatLahirPengurusController,
  //     label: 'Tempat Lahir *',
  //     hintText: 'Masukkan Tempat Lahir',
  //     textCapitalization: TextCapitalization.words,
  //     onSave: viewModel.updateTempatLahirPengurus,
  //     onChanged: viewModel.updateTempatLahirPengurus,
  //   );
  // }

  CustomTextField _buildTagAlamatPengurus(
    InformasiPengurusCvViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.alamatPengurusCvController,
      label: 'Tag Location Alamat Pengurus',
      hintText: 'Tag Location',
      textCapitalization: TextCapitalization.words,
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.location,
      onTap: viewModel.navigateToAddressSelectionViewPengurusCv,
      onSave: viewModel.updateAlamatPengurusCv,
      onChanged: viewModel.updateAlamatPengurusCv,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Tag Location',
      ),
    );
  }

  CustomTextField _buildAlamatKtpPengurus(
    InformasiPengurusCvViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.detailAlamatPengurusCvController,
      label: 'Alamat KTP *',
      hintText: 'Masukan Alamat KTP',
      keyboardType: TextInputType.text,
      onSave: viewModel.updateDetailAlamatPengurusCv,
      onChanged: viewModel.updateDetailAlamatPengurusCv,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Alamat KTP',
      ),
    );
  }

  CustomTextField _buildKodePos(InformasiPengurusCvViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.postalCodeAlamatPengurusController,
      label: 'Kode Pos *',
      hintText: 'Masukkan Kode Pos',
      keyboardType: TextInputType.number,
      onSave: viewModel.updatePostalCodeAlamatPengurus,
      onChanged: viewModel.updatePostalCodeAlamatPengurus,
      validator: (value) => InputValidators.validatePostalCode(value),
      withMaxLength: true,
      maxLength: 5,
    );
  }

  CustomTextField _buildProvinsi(InformasiPengurusCvViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.provinceAlamatPengurusCvController,
      label: 'Provinsi *',
      hintText: 'Masukkan Provinsi',
      enabled: false,
      fillColor: const Color(0xffF6F6F8),
      // textCapitalization: TextCapitalization.words,
      // onSave: viewModel.updateProvinceAlamatPengurusCv,
      // onChanged: viewModel.updateProvinceAlamatPengurusCv,
      // validator: (value) =>
      //     InputValidators.validateName(value, fieldType: 'Provinsi'),
    );
  }

  CustomTextField _buildKota(InformasiPengurusCvViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.cityAlamatPengurusCvController,
      label: 'Kota *',
      hintText: 'Masukkan Kota',
      enabled: false,
      fillColor: const Color(0xffF6F6F8),
      // textCapitalization: TextCapitalization.words,
      // onSave: viewModel.updateCityAlamatPengurusCv,
      // onChanged: viewModel.updateCityAlamatPengurusCv,
      validator: (value) =>
          InputValidators.validateName(value, fieldType: 'Kota'),
    );
  }

  // CustomTextField _buildKecamatan(InformasiPengurusCvViewModel vm) {
  //   return CustomTextField(
  //     textEditingController: vm.districtAlamatPengurusCvController,
  //     label: 'Kecamatan *',
  //     hintText: 'Kecamatan',
  //     enabled: false,
  //     fillColor: const Color(0xffF6F6F8),
  //   );
  // }

  // Expanded _buildKecamatan(InformasiPengurusCvViewModel viewModel) {
  //   return Expanded(
  //     child: CustomTextField(
  //       textEditingController: viewModel.districtAlamatPengurusCvController,
  //       label: 'Kecamatan *',
  //       hintText: 'Kecamatan',
  //       onSave: viewModel.updateDistrictAlamatPengurusCv,
  //       onChanged: viewModel.updateDistrictAlamatPengurusCv,
  //       textCapitalization: TextCapitalization.words,
  //       validator: (value) =>
  //           InputValidators.validateName(value, fieldType: 'Kecamatan'),
  //     ),
  //   );
  // }

  CustomTypeAheadFormField _buildKecamatan(InformasiPengurusCvViewModel vm) {
    return CustomTypeAheadFormField(
      controller: vm.districtAlamatPengurusCvController,
      label: 'Kecamatan *',
      onClear: vm.clearKecamatan,
      onFilter: vm.filterKecamatan,
      onSuggestionSelected: vm.updateKecamatan,
      itemBuilder: (context, suggestion) {
        return ListTile(title: Text(suggestion.district));
      },
      validator: (value) =>
          InputValidators.validateRequiredField(value, fieldType: 'Kecamatan'),
    );
  }

  CustomTypeAheadFormField _buildKelurahan(InformasiPengurusCvViewModel vm) {
    return CustomTypeAheadFormField(
      controller: vm.villageAlamatPengurusCvController,
      label: 'Kelurahan *',
      onClear: vm.clearKelurahan,
      onFilter: vm.filterKelurahan,
      onSuggestionSelected: vm.updateKelurahan,
      itemBuilder: (context, suggestion) {
        return ListTile(title: Text(suggestion.village));
      },
      validator: (value) =>
          InputValidators.validateRequiredField(value, fieldType: 'Kelurahan'),
    );
  }

  // Expanded _buildKelurahan(InformasiPengurusCvViewModel viewModel) {
  //   return Expanded(
  //     child: CustomTextField(
  //       textEditingController: viewModel.villageAlamatPengurusCvController,
  //       label: 'Kelurahan *',
  //       hintText: 'Kelurahan',
  //       onSave: viewModel.updateVillageAlamatPengurusCv,
  //       onChanged: viewModel.updateVillageAlamatPengurusCv,
  //       textCapitalization: TextCapitalization.words,
  //       validator: (value) =>
  //           InputValidators.validateName(value, fieldType: 'Kelurahan'),
  //     ),
  //   );
  // }

  Expanded _buildRT(InformasiPengurusCvViewModel viewModel) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.rtAlamatPengurusCvController,
        label: 'RT *',
        hintText: 'cth. 005',
        onSave: viewModel.updateRtAlamatPengurusCv,
        onChanged: viewModel.updateRtAlamatPengurusCv,
        keyboardType: TextInputType.number,
        withMaxLength: true,
        maxLength: 3,
        validator: (value) => InputValidators.validateRTRW(
          value,
          fieldType: 'RT',
        ),
      ),
    );
  }

  Expanded _buildRW(InformasiPengurusCvViewModel viewModel) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.rwAlamatPengurusCvController,
        label: 'RW *',
        hintText: 'cth. 006',
        onSave: viewModel.updateRwAlamatPengurusCv,
        onChanged: viewModel.updateRwAlamatPengurusCv,
        keyboardType: TextInputType.number,
        withMaxLength: true,
        maxLength: 3,
        validator: (value) => InputValidators.validateRTRW(
          value,
          fieldType: 'RW',
        ),
      ),
    );
  }

  CustomTextField _buildNoHandphonePengurus(
    InformasiPengurusCvViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.noHpPengurusCvController,
      label: 'Nomor Handphone *',
      hintText: 'Masukkan Nomor Handphone',
      prefixText: '+62 ',
      keyboardType: TextInputType.number,
      onSave: viewModel.updateNoHpPengurusCv,
      onChanged: viewModel.updateNoHpPengurusCv,
      ////
      validator: (value) => InputValidators.validateMobileNumber(value),
      /////
      withMaxLength: true,
      maxLength: 12,
    );
  }

  CustomTextField _buildEmail(InformasiPengurusCvViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.emailPengurusCvController,
      label: 'Email',
      hintText: 'Masukkan Email Debitur',
      keyboardType: TextInputType.emailAddress,
      onSave: viewModel.updateEmailPengurusCv,
      onChanged: viewModel.updateEmailPengurusCv,
      // validator: (value) => InputValidators.validateEmail(value),
    );
  }

  CustomTextField _buildNomorKTPPasangan(
    InformasiPengurusCvViewModel viewModel,
  ) {
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

  CustomTextField _buildNamaLengkapPasangan(
    InformasiPengurusCvViewModel viewModel,
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

  CustomTextField _buildTempatLahirPasangan(
    InformasiPengurusCvViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tempatLahirPasanganController,
      label: 'Tempat Lahir Pasangan *',
      hintText: 'Masukkan Tempat Lahir Pasangan',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateTempatLahirPasangan,
      onChanged: viewModel.updateTempatLahirPasangan,
      validator: (value) => InputValidators.validateName(
        value,
        fieldType: 'Tempat Lahir Pasangan',
      ),
    );
  }

  CustomTextField _buildTanggalLahirPasangan(
    InformasiPengurusCvViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglLahirPasanganController,
      label: 'Tanggal Lahir Pasangan *',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () => viewModel.selecttglLahirPasangan(context),
      enabled: false,
      fillColor: Colors.white,
      onSave: viewModel.updateTglLahirPasangan,
      validator: (value) => InputValidators.ritelValidateBirthDate(
        value,
        fieldType: 'Tanggal Lahir Pasangan',
      ),
    );
  }
}

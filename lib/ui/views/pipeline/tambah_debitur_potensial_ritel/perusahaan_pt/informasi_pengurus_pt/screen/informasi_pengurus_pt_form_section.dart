import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../application/helpers/input_validators.dart';
import '../../../../../../shared/custom_textfield.dart';
import '../../../../../../shared/custom_type_ahead_form_field.dart';
import '../informasi_pengurus_pt_viewmodel.dart';

class InformasiPengurusPtFormSection
    extends HookViewModelWidget<InformasiPengurusPtViewModel> {
  const InformasiPengurusPtFormSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPengurusPtViewModel viewModel,
  ) {
    return Form(
      key: viewModel.formKey,
      autovalidateMode: viewModel.autoValidateMode,
      child: Column(
        children: [
          // SizedBox(height: 8.h),
          // Text(
          //   'Pengurus 1',
          //   style: TextStyle(
          //     fontSize: 16.sp,
          //     fontWeight: FontWeight.w700,
          //     color: Colors.black,
          //   ),
          // ),
          Container(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                _buildNamaPengurusPt(viewModel),
                _buildPosisiPengurusPt(viewModel),
                _buildNomorKTPPengurusPt(viewModel),
                _buildNPWPPengurusPt(viewModel),
                _buildJenisKelaminPengurusPt(viewModel),
                _buildTempatLahirPengurusPt(viewModel),
                _buildTanggalLahirPengurusPt(viewModel, context),
                _buildNoHandphonePengurusPt(viewModel),
                _buildEmail(viewModel),
                _buildTagAlamatPengurus(viewModel),
                _buildAlamatKtpPengurus(viewModel),
                _buildKodePos(viewModel),
                _buildProvinsi(viewModel),
                _buildCity(viewModel),
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
                _buildShares(viewModel),
                _buildSharePercentage(viewModel),
                _builNominal(viewModel),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CustomTextField _buildNamaPengurusPt(InformasiPengurusPtViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.namaPengurusPtController,
      label: 'Nama Pengurus Sesuai KTP *',
      hintText: 'Masukan Nama Pengurus',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateNamaPengurusPt,
      onChanged: viewModel.updateNamaPengurusPt,
      validator: (value) =>
          InputValidators.validateName(value, fieldType: 'Nama Pengurus'),
    );
  }

  PopupMenuButton<String> _buildPosisiPengurusPt(
    InformasiPengurusPtViewModel viewModel,
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
      onSelected: (String val) => viewModel.updatePosisiPengurusPt(val),
      child: CustomTextField(
        textEditingController: viewModel.posisiPengurusPtController,
        label: 'Posisi Pengurus *',
        hintText: 'Pilih Posisi Pengurus',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Posisi Pengurus',
        ),
      ),
    );
  }

  CustomTextField _buildNomorKTPPengurusPt(
    InformasiPengurusPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorKtpPengurusPtController,
      label: 'Nomor KTP Pengurus *',
      hintText: 'Masukan Nomor KTP Pengurus',
      keyboardType: TextInputType.number,
      onSave: viewModel.updateNomorKTPpengurusPt,
      onChanged: viewModel.updateNomorKTPpengurusPt,
      validator: (value) => InputValidators.validateKTPNumber(
        value,
        fieldType: 'Nomor KTP Pengurus',
      ),
      withMaxLength: true,
      maxLength: 16,
    );
  }

  CustomTextField _buildNPWPPengurusPt(InformasiPengurusPtViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.nomorNpwpPengurusPtController,
      // label: 'Nomor NPWP *',
      label: 'Nomor NPWP',
      hintText: 'Masukkan Nomor NPWP Pengurus',
      keyboardType: TextInputType.number,
      onSave: viewModel.updateNomorNpwpPengurusPt,
      onChanged: viewModel.updateNomorNpwpPengurusPt,
      // validator: (value) => InputValidators.ritelValidateNPWP(value),
      withMaxLength: true,
      maxLength: 15,
    );
  }

  PopupMenuButton<String> _buildJenisKelaminPengurusPt(
    InformasiPengurusPtViewModel viewModel,
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
      onSelected: (String val) => viewModel.updateJenisKelaminPengurusPt(val),
      child: CustomTextField(
        textEditingController: viewModel.jenisKelaminPengurusPtController,
        label: 'Jenis Kelamin *',
        hintText: 'Pilih Jenis Kelamin',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Jenis Kelamin',
        ),
      ),
    );
  }

  // CustomTypeAheadFormField _buildTempatLahirPengurusPt(
  //   InformasiPengurusPtViewModel viewModel,
  // ) {
  //   return CustomTypeAheadFormField(
  //     label: 'Tempat Lahir *',
  //     controller: viewModel.tempatLahirPengurusPtController,
  //     onClear: viewModel.clearPlaceOfBirth,
  //     onFilter: viewModel.filterPlaceOfBirth,
  //     onSuggestionSelected: viewModel.updatePlaceOfBirth,
  //     itemBuilder: (context, suggestion) {
  //       return ListTile(title: Text(suggestion.city!));
  //     },
  //     validator: (value) => InputValidators.validateRequiredField(
  //       value,
  //       fieldType: 'Tempat Lahir',
  //     ),
  //   );
  // }

  CustomTextField _buildTempatLahirPengurusPt(
    InformasiPengurusPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tempatLahirPengurusPtController,
      label: 'Tempat Lahir *',
      hintText: 'Masukan Tempat Lahir',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateTempatLahirPengurusPt,
      onChanged: viewModel.updateTempatLahirPengurusPt,
      validator: (value) => InputValidators.validateName(
        value,
        fieldType: 'Tempat Lahir Pengurus',
      ),
    );
  }

  CustomTextField _buildTanggalLahirPengurusPt(
    InformasiPengurusPtViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglLahirPengurusPtController,
      label: 'Tanggal Lahir *',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () => viewModel.selecttglLahirPengurusPt(context),
      fillColor: Colors.white,
      enabled: false,
      onSave: viewModel.updateTglLahirPengurusPt,
      validator: (value) => InputValidators.ritelValidateBirthDate(
        value,
        fieldType: 'Tanggal Lahir Pengurus',
      ),
    );
  }

  CustomTextField _buildNoHandphonePengurusPt(
    InformasiPengurusPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.noHpPengurusPtController,
      label: 'No. Handphone *',
      hintText: 'Masukkan No. Handphone',
      prefixText: '+62 ',
      keyboardType: TextInputType.number,
      onSave: viewModel.updateNoHpPengurusPt,
      onChanged: viewModel.updateNoHpPengurusPt,
      validator: (value) => InputValidators.validateMobileNumber(value),
      withMaxLength: true,
      maxLength: 12,
    );
  }

  CustomTextField _buildEmail(InformasiPengurusPtViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.emailPengurusPtController,
      label: 'Email',
      hintText: 'Masukkan Email Pengurus',
      keyboardType: TextInputType.emailAddress,
      onSave: viewModel.updateEmailPengurusPt,
      onChanged: viewModel.updateEmailPengurusPt,
      //validator: (value) => InputValidators.validateEmail(value),
    );
  }

  CustomTextField _buildTagAlamatPengurus(
    InformasiPengurusPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.alamatPengurusPtController,
      label: 'Tag Location Alamat Pengurus *',
      hintText: 'Tag Location',
      textCapitalization: TextCapitalization.words,
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.location,
      onTap: viewModel.navigateToAddressSelectionViewPengurusPt,
      onSave: viewModel.updateAlamatPengurusPt,
      onChanged: viewModel.updateAlamatPengurusPt,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Tag Location',
      ),
    );
  }

  CustomTextField _buildAlamatKtpPengurus(
    InformasiPengurusPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.detailAlamatPengurusPtController,
      label: 'Alamat KTP *',
      hintText: 'Masukan Alamat KTP',
      keyboardType: TextInputType.text,
      onSave: viewModel.updateDetailAlamatPengurusPt,
      onChanged: viewModel.updateDetailAlamatPengurusPt,
    );
  }

  CustomTextField _buildProvinsi(InformasiPengurusPtViewModel viewModel) {
    return CustomTextField(
      label: 'Provinsi *',
      textEditingController: viewModel.provinceAlamatPengurusPtController,
      hintText: 'Masukkan Nama Provinsi',
      enabled: false,
      fillColor: const Color(0xffF6F6F8),
    );
  }

  CustomTextField _buildCity(InformasiPengurusPtViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.cityAlamatPengurusPtController,
      label: 'Kota *',
      hintText: 'Masukkan Kota',
      enabled: false,
      fillColor: const Color(0xffF6F6F8),
      // textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateCityAlamatPengurusPt,
      onChanged: viewModel.updateCityAlamatPengurusPt,
      validator: (value) =>
          InputValidators.validateRequiredField(value, fieldType: 'Kota'),
    );
  }

  CustomTextField _buildKodePos(InformasiPengurusPtViewModel viewModel) {
    return CustomTextField(
      label: 'Kode Pos *',
      textEditingController: viewModel.postalCodeAlamatPengurusController,
      hintText: 'Masukkan Kode Pos',
      keyboardType: TextInputType.number,
      onSave: viewModel.updatePostalCodeAlamatPengurus,
      onChanged: viewModel.updatePostalCodeAlamatPengurus,
      withMaxLength: true,
      maxLength: 5,
      validator: (value) =>
          InputValidators.validateRequiredField(value, fieldType: 'Kode Pos'),
    );
  }

  // CustomTextField _buildKecamatan(InformasiPengurusPtViewModel viewModel) {
  //   return CustomTextField(
  //     label: 'Kecamatan *',
  //     textEditingController: viewModel.districtAlamatPengurusPtController,
  //     hintText: 'Kecamatan',
  //     enabled: false,
  //     fillColor: const Color(0xffF6F6F8),
  //   );
  // }

  CustomTypeAheadFormField _buildKecamatan(
    InformasiPengurusPtViewModel viewModel,
  ) {
    return CustomTypeAheadFormField(
      label: 'Kecamatan *',
      controller: viewModel.districtAlamatPengurusPtController,
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
    InformasiPengurusPtViewModel viewModel,
  ) {
    return CustomTypeAheadFormField(
      label: 'Kelurahan *',
      controller: viewModel.villageAlamatPengurusPtController,
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

  // Expanded _buildKelurahan(InformasiPengurusPtViewModel viewModel) {
  //   return Expanded(
  //     child: CustomTextField(
  //       textEditingController: viewModel.villageAlamatPengurusPtController,
  //       label: 'Kelurahan *',
  //       hintText: 'Kelurahan',
  //       onSave: viewModel.updateVillageAlamatPengurusPt,
  //       onChanged: viewModel.updateVillageAlamatPengurusPt,
  //       textCapitalization: TextCapitalization.words,
  //       validator: (value) =>
  //           InputValidators.validateName(value, fieldType: 'Kelurahan'),
  //     ),
  //   );
  // }

  Expanded _buildRT(InformasiPengurusPtViewModel viewModel) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.rtAlamatPengurusPtController,
        label: 'RT *',
        hintText: 'cth. 005',
        onSave: viewModel.updateRtAlamatPengurusPt,
        onChanged: viewModel.updateRtAlamatPengurusPt,
        keyboardType: TextInputType.number,
        withMaxLength: true,
        maxLength: 3,
        validator: (value) =>
            InputValidators.validateRTRW(value, fieldType: 'RT'),
      ),
    );
  }

  Expanded _buildRW(InformasiPengurusPtViewModel viewModel) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.rwAlamatPengurusPtController,
        label: 'RW *',
        hintText: 'cth. 006',
        onSave: viewModel.updateRwAlamatPengurusPt,
        onChanged: viewModel.updateRwAlamatPengurusPt,
        keyboardType: TextInputType.number,
        withMaxLength: true,
        maxLength: 3,
        validator: (value) =>
            InputValidators.validateRTRW(value, fieldType: 'RW'),
      ),
    );
  }

  CustomTextField _buildSharePercentage(
    InformasiPengurusPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.sharePercentageController,
      label: 'Persentase Saham',
      hintText: 'Masukan Persentase Saham',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.percentage,
      keyboardType: TextInputType.number,
      onSave: viewModel.updateSharePercentage,
      onChanged: viewModel.updateSharePercentage,
      // validator: (value) => InputValidators.ritelValidateNPWP(value),
    );
  }

  CustomTextField _buildShares(InformasiPengurusPtViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.sharesController,
      label: 'Lembar Saham',
      hintText: 'Masukan Lembar Saham',
      keyboardType: TextInputType.number,
      onSave: viewModel.updateShares,
      onChanged: viewModel.updateShares,
      // validator: (value) => InputValidators.ritelValidateNPWP(value),
    );
  }

  CustomTextField _builNominal(InformasiPengurusPtViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.shareNominalController,
      label: 'Nominal',
      hintText: '0.00',
      keyboardType: TextInputType.number,
      onSave: viewModel.updateShareNominal,
      onChanged: viewModel.updateShareNominal,
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      withThousandsSeparator: true,
    );
  }
}

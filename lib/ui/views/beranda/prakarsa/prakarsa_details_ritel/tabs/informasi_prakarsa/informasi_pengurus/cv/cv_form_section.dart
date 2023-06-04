import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../../../../application/app/constants/common.dart';
import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../application/helpers/input_validators.dart';
import '../../../../../../../../shared/custom_textfield.dart';
import '../informasi_pengurus_viewmodel.dart';

class InformasiPengurusPemilikCVFormSection
    extends HookViewModelWidget<InformasiPengurusViewModel> {
  const InformasiPengurusPemilikCVFormSection({Key? key}) : super(key: key);

  @override
  // ignore: long-method
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                buildNamaPengurus(context, viewModel),
                buildPosisiPengurus(context, viewModel),
                buildNomorKTPPengurus(context, viewModel),
                buildNPWPPengurus(context, viewModel),
                buildJenisKelamin(context, viewModel),
                buildTempatLahir(context, viewModel),
                buildTanggalLahirPengurus(context, viewModel),
                buildStatusPerkawinan(context, viewModel),
                buildTagLocationAlamatPengurus(context, viewModel),
                buildAlamatKtpPengurus(context, viewModel),
                buildPostalKode(context, viewModel),
                buildProvinsi(context, viewModel),
                buildKota(context, viewModel),
                Row(
                  children: [
                    buildKecamatan(context, viewModel),
                    SizedBox(
                      width: 16.w,
                    ),
                    buildKelurahan(context, viewModel),
                  ],
                ),
                Row(
                  children: [
                    buildRT(context, viewModel),
                    SizedBox(
                      width: 16.w,
                    ),
                    buildRW(context, viewModel),
                  ],
                ),
                buildNomorHandphoneDebitur(context, viewModel),
                buildEmail(context, viewModel),
                if (viewModel.statusPerkawinanController.text.trim() ==
                    Common.kawin) ...[
                  buildNomorKTPPasangan(context, viewModel),
                  buildNamaLengkapPasangan(context, viewModel),
                  buildTempatLahirPasangan(context, viewModel),
                  buildTanggalLahirPasangan(context, viewModel),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  CustomTextField buildNamaPengurus(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.namaPengurusCvController,
      label: 'Nama Pengurus Sesuai KTP *',
      textCapitalization: TextCapitalization.words,
      enabled: false,
    );
  }

  CustomTextField buildPosisiPengurus(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.posisiPengurusCvController,
      label: 'Posisi Pengurus *',
      keyboardType: TextInputType.number,
      suffixIconImagePath: IconConstants.chevronDown,
      withSuffixIcon: true,
      enabled: false,
    );
  }

  CustomTextField buildNomorKTPPengurus(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorKtpPengurusCvController,
      label: 'Nomor KTP Pengurus *',
      textCapitalization: TextCapitalization.words,
      enabled: false,
    );
  }

  CustomTextField buildNPWPPengurus(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorNpwpPengurusCvController,
      label: 'Nomor NPWP Pengurus/Pemilik *',
      hintText: 'Masukkan Nomor NPWP',
      keyboardType: TextInputType.number,
      maxLength: 15,
      withMaxLength: true,
      validator: (val) => InputValidators.ritelValidateNPWP(val),
    );
  }

  CustomTextField buildJenisKelamin(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.jenisKelaminPengurusCvController,
      label: 'Jenis Kelamin *',
      keyboardType: TextInputType.number,
      suffixIconImagePath: IconConstants.chevronDown,
      withSuffixIcon: true,
      enabled: false,
    );
  }

  CustomTextField buildTempatLahir(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tempatLahirPengurusCvController,
      label: 'Tempat Lahir *',
      keyboardType: TextInputType.number,
      enabled: false,
    );
  }

  CustomTextField buildTanggalLahirPengurus(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglLahirPengurusCvController,
      label: 'Tanggal Lahir *',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      enabled: false,
    );
  }

  CustomTextField buildStatusPerkawinan(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.statusPerkawinanController,
      label: 'Status Perkawinan *',
      textCapitalization: TextCapitalization.words,
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.chevronDown,
      enabled: false,
    );
  }

  CustomTextField buildTagLocationAlamatPengurus(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.alamatPengurusCvController,
      label: 'Tag Location Alamat *',
      hintText: 'Tag Location',
      textCapitalization: TextCapitalization.words,
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.location,
      enabled: false,
      onTap: (
        BuildContext context,
        InformasiPengurusViewModel viewModel,
      ) =>
          {},
    );
  }

  CustomTextField buildAlamatKtpPengurus(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.detailAlamatPengurusCvController,
      label: 'Alamat KTP *',
      hintText: 'Masukan Alamat KTP',
      keyboardType: TextInputType.text,
      enabled: false,
    );
  }

  CustomTextField buildPostalKode(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.postalCodeAlamatPengurusController,
      label: 'Kode Pos *',
      hintText: 'Masukkan Kode Pos',
      enabled: false,
    );
  }

  CustomTextField buildProvinsi(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.provinceAlamatPengurusCvController,
      label: 'Provinsi *',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.chevronDown,
      enabled: false,
    );
  }

  CustomTextField buildKota(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.cityAlamatPengurusCvController,
      label: 'Kota *',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.chevronDown,
      enabled: false,
    );
  }

  Expanded buildKecamatan(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.districtAlamatPengurusCvController,
        label: 'Kecamatan *',
        hintText: 'Kecamatan',
        keyboardType: TextInputType.number,
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
      ),
    );
  }

  Expanded buildKelurahan(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.villageAlamatPengurusCvController,
        label: 'Kelurahan *',
        hintText: 'Kelurahan',
        keyboardType: TextInputType.number,
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
      ),
    );
  }

  Expanded buildRT(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.rtAlamatPengurusCvController,
        label: 'RT',
        hintText: 'cth. 005',
        keyboardType: TextInputType.number,
        enabled: false,
      ),
    );
  }

  Expanded buildRW(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.rwAlamatPengurusCvController,
        label: 'RW',
        hintText: 'cth. 006',
        keyboardType: TextInputType.number,
        enabled: false,
      ),
    );
  }

  CustomTextField buildNomorHandphoneDebitur(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.noHpPengurusCvController,
      label: 'No. Handphone',
      prefixText: '+62',
      hintText: 'Masukkan Nomor Handphone',
      enabled: false,
    );
  }

  CustomTextField buildEmail(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.emailPengurusCvController,
      label: 'Email',
      hintText: 'Masukkan Email',
      enabled: true,
      validator: (value) => InputValidators.validateEmail(value),
    );
  }

  CustomTextField buildNomorKTPPasangan(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorKtpPasanganController,
      label: 'Nomor KTP Pasangan *',
      hintText: 'Masukkan Nomor KTP Pasangan',
      enabled: false,
      // validator: (value) => InputValidators.validateKTPNumber(
      //   value,
      //   fieldType: 'Nomor KTP Pasangan',
      // ),
    );
  }

  CustomTextField buildNamaLengkapPasangan(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.namaLengkapPasanganController,
      label: 'Nama Lengkap Pasangan *',
      hintText: 'Masukkan Nama Pasangan',
      enabled: false,
      // validator: (value) => InputValidators.validateName(
      //   value,
      //   fieldType: 'Nama Lengkap Pasangan',
      // ),
    );
  }

  CustomTextField buildTempatLahirPasangan(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tempatLahirPasanganController,
      label: 'Tempat Lahir Pasangan *',
      hintText: 'Masukkan Tempat Lahir Pasangan',
      enabled: false,
      // validator: (value) => InputValidators.validateRequiredField(
      //   value,
      //   fieldType: 'Tempat Lahir Pasangan',
      // ),
    );
  }

  CustomTextField buildTanggalLahirPasangan(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglLahirPengurusCvController,
      label: 'Tanggal Lahir Pasangan *',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      // onTap: (
      //   BuildContext context,
      //   InformasiPengurusViewModel viewModel,
      // ) {
      //   DatePicker.showDatePicker(
      //     context,
      //     onConfirm: (date) => viewModel.tglLahirPengurusCvController.text =
      //         (DateFormat('dd/MM/yyyy').format(date)),
      //     currentTime: DateTime.now(),
      //     minTime: DateTime.now().subtract(const Duration(days: 21900)),
      //     maxTime: DateTime.now(),
      //     locale: LocaleType.id,
      //   );
      // },
      enabled: false,
      // fillColor: Colors.white,
    );
  }
}

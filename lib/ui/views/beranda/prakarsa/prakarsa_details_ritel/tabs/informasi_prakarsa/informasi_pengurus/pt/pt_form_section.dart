import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../application/helpers/input_validators.dart';
import '../../../../../../../../shared/custom_textfield.dart';
import '../informasi_pengurus_viewmodel.dart';

class InformasiPengurusPemilikPTFormSection
    extends HookViewModelWidget<InformasiPengurusViewModel> {
  const InformasiPengurusPemilikPTFormSection({Key? key}) : super(key: key);

  @override
  // ignore: long-method
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    CustomTextField buildNamaPengurus() {
      return CustomTextField(
        textEditingController: viewModel.namaPengurusPtController,
        label: 'Nama Pengurus *',
        hintText: 'Masukkan Nama Pengurus',
        textCapitalization: TextCapitalization.words,
        enabled: false,
      );
    }

    Widget buildPosisiPengurus() {
      return CustomTextField(
        textEditingController: viewModel.posisiPengurusPtController,
        label: 'Posisi Pengurus/Pemilik *',
        hintText: 'Pilih Posisi',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        validator: null,
      );
    }

    CustomTextField buildKTPPengurus() {
      return CustomTextField(
        textEditingController: viewModel.nomorKtpPengurusPtController,
        label: 'Nomor KTP Pengurus/Pemilik *',
        hintText: 'Masukkan Nomor KTP',
        enabled: false,
      );
    }

    CustomTextField buildNPWPPengurus() {
      return CustomTextField(
        textEditingController: viewModel.nomorNpwpPengurusPtController,
        label: 'Nomor NPWP Pengurus/Pemilik *',
        hintText: 'Masukkan Nomor NPWP',
        keyboardType: TextInputType.number,
        enabled: true,
        maxLength: 15,
        withMaxLength: true,
        validator: (value) => InputValidators.ritelValidateNPWP(value),
      );
    }

    Widget buildJenisKelaminPengurus() {
      return CustomTextField(
        textEditingController: viewModel.jenisKelaminPengurusPtController,
        label: 'Jenis Kelamin *',
        hintText: 'Pilih Jenis Kelamin',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        validator: null,
      );
    }

    CustomTextField buildTempatLahir() {
      return CustomTextField(
        textEditingController: viewModel.tempatLahirPengurusPtController,
        label: 'Tempat Lahir *',
        hintText: 'Masukkan Tempat Lahir',
        textCapitalization: TextCapitalization.words,
        enabled: false,
      );
    }

    CustomTextField buildTanggalLahirPengurus() {
      return CustomTextField(
        textEditingController: viewModel.tglLahirPengurusPtController,
        label: 'Tanggal Lahir *',
        hintText: 'DD/MM/YYYY',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.calendar,
        // ignore: no-empty-block
        onTap: () {},
        enabled: false,
      );
    }

    CustomTextField buildNoTelpPengurus() {
      return CustomTextField(
        textEditingController: viewModel.noTelpPengurusPtController,
        label: 'Nomor Handphone *',
        hintText: 'Masukkan Nomor Handphone',
        prefixText: '+62 ',
        maxLength: 12,
        withMaxLength: true,
        validator: (value) => InputValidators.validateMobileNumber(value),
      );
    }

    CustomTextField buildEmail() {
      return CustomTextField(
        textEditingController: viewModel.emailPengurusPtController,
        label: 'Email *',
        hintText: 'Masukkan Email PIC',
        keyboardType: TextInputType.emailAddress,
        validator: (value) => InputValidators.validateEmail(value),
      );
    }

    CustomTextField buildTagAlamatPengurus() {
      return CustomTextField(
        textEditingController: viewModel.tagAlamatPengurusPtController,
        label: 'Tag Location Alamat Pengurus *',
        hintText: 'Tag Location',
        textCapitalization: TextCapitalization.words,
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.location,
        enabled: true,
        onTap: () => viewModel.navigateToAddressSelectionViewPengurusPt(),
      );
    }

    CustomTextField buildAlamatKtpPengurus() {
      return CustomTextField(
        textEditingController: viewModel.alamatKtpPengurusPtController,
        label: 'Alamat KTP Pengurus *',
        hintText: 'Masukan Alamat KTP',
        keyboardType: TextInputType.text,
        enabled: false,
      );
    }

    Widget buildKodePos() {
      return CustomTextField(
        label: 'Kode Pos *',
        hintText: 'Masukkan Kode Pos',
        textEditingController: viewModel.postalCodePengurusPtController,
        enabled: false,
      );
    }

    Widget buildProvinsi() {
      return CustomTextField(
        textEditingController: viewModel.provincePengurusPtController,
        label: 'Provinsi *',
        hintText: 'Provinsi',
        enabled: false,
        suffixIconImagePath: IconConstants.chevronDown,
        withSuffixIcon: true,
      );
    }

    Widget buildKota() {
      return CustomTextField(
        textEditingController: viewModel.cityPengurusPtController,
        label: 'Kota *',
        hintText: 'Kota',
        enabled: false,
        suffixIconImagePath: IconConstants.chevronDown,
        withSuffixIcon: true,
      );
    }

    Expanded buildKecamatan() {
      return Expanded(
        child: CustomTextField(
          textEditingController: viewModel.districtPengurusPtController,
          label: 'Kecamatan *',
          hintText: 'Kecamatan',
          enabled: false,
          suffixIconImagePath: IconConstants.chevronDown,
          withSuffixIcon: true,
        ),
      );
    }

    Expanded buildKelurahan() {
      return Expanded(
        child: CustomTextField(
          textEditingController: viewModel.villagePengurusPtController,
          label: 'Kelurahan *',
          hintText: 'Kelurahan',
          enabled: false,
          suffixIconImagePath: IconConstants.chevronDown,
          withSuffixIcon: true,
        ),
      );
    }

    Expanded buildRT() {
      return Expanded(
        child: CustomTextField(
          textEditingController: viewModel.rtPengurusPtController,
          label: 'RT',
          hintText: 'cth. 005',
          enabled: false,
        ),
      );
    }

    Expanded buildRW() {
      return Expanded(
        child: CustomTextField(
          textEditingController: viewModel.rwPengurusPtController,
          label: 'RW',
          hintText: 'cth. 006',
          enabled: false,
        ),
      );
    }

    CustomTextField buildPersentaseSaham() {
      return CustomTextField(
        textEditingController: viewModel.persentaseSahamPtController,
        label: 'Persentase Saham',
        hintText: 'Masukkan Persentase Saham',
        maxLength: 3,
        withMaxLength: true,
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.percentage,
        keyboardType:
            const TextInputType.numberWithOptions(signed: true, decimal: false),
      );
    }

    CustomTextField buildLembarSaham() {
      return CustomTextField(
        textEditingController: viewModel.lembarSahamPtController,
        label: 'Lembar Saham',
        hintText: 'Masukkan Lembar Saham',
        keyboardType:
            const TextInputType.numberWithOptions(signed: true, decimal: false),
      );
    }

    CustomTextField buildNominal() {
      return CustomTextField(
        textEditingController: viewModel.nominalSahamPtController,
        label: 'Nominal',
        hintText: '0.00',
        withPrefixIcon: true,
        prefixIconImagePath: IconConstants.rupiah,
        keyboardType: TextInputType.number,
        withThousandsSeparator: true,
      );
    }

    return Form(
      key: viewModel.formKey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                buildNamaPengurus(),
                buildPosisiPengurus(),
                buildKTPPengurus(),
                buildNPWPPengurus(),
                buildJenisKelaminPengurus(),
                buildTempatLahir(),
                buildTanggalLahirPengurus(),
                buildNoTelpPengurus(),
                buildEmail(),
                buildTagAlamatPengurus(),
                buildAlamatKtpPengurus(),
                buildKodePos(),
                buildProvinsi(),
                buildKota(),
                Row(
                  children: [
                    buildKecamatan(),
                    SizedBox(width: 15.w),
                    buildKelurahan(),
                  ],
                ),
                Row(
                  children: [
                    buildRT(),
                    SizedBox(width: 15.w),
                    buildRW(),
                  ],
                ),
                buildPersentaseSaham(),
                buildLembarSaham(),
                buildNominal(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

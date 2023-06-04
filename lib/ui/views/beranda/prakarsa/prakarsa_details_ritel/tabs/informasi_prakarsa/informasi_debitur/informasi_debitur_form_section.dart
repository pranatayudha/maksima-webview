// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../application/app/constants/common.dart';
import '../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../application/helpers/input_validators.dart';
import '../../../../../../../../application/models/ritel_prakarsa_perorangan_data_diri.dart';
import '../../../../../../../../application/models/ritel_prakarsa_perorangan_data_usaha.dart';
import '../../../../../../../shared/custom_button.dart';
import '../../../../../../../shared/custom_textfield.dart';
import '../../../../../../../shared/custom_type_ahead_form_field.dart';
import '../../../../../../../shared/thick_light_grey_divider.dart';
import '../../../../../../../shared/upload_item_button_ritel.dart';
import 'informasi_debitur_viewmodel.dart';

class InformasiDebiturFormSection
    extends ViewModelBuilderWidget<InformasiDebiturViewModelRitel> {
  final String pipelinesId;
  final String prakarsaId;
  RitelPrakarsaPeroranganDataDiri dataDiri;
  RitelPrakarsaPeroranganDataUsaha dataUsaha;
  final int status;

  InformasiDebiturFormSection({
    Key? key,
    required this.pipelinesId,
    required this.prakarsaId,
    required this.dataDiri,
    required this.dataUsaha,
    required this.status,
  }) : super(key: key);

  @override
  InformasiDebiturViewModelRitel viewModelBuilder(BuildContext context) =>
      InformasiDebiturViewModelRitel(
        prakarsaId: prakarsaId,
        pipelineId: pipelinesId,
        dataDiri: dataDiri,
        dataUsaha: dataUsaha,
        status: status,
      );

  @override
  // ignore: long-method
  Widget builder(
    BuildContext context,
    InformasiDebiturViewModelRitel viewModel,
    Widget? child,
  ) {
    return Form(
      autovalidateMode: viewModel.autoValidateMode,
      key: viewModel.formKey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                _buildJenisDebitur(viewModel),
                _buildNamaDebitur(viewModel),
                _buildNomorKTPDebitur(viewModel),
                _buildKTPTerbit(viewModel),
                _buildAgama(viewModel),
                _buildEducation(viewModel),
                _buildNomorNPWPDebitur(viewModel),
                _buildTanggalLahirDebitur(viewModel),
                _buildJenisKelaminDebitur(viewModel),
                _buildNamaGadisIbuKandungDebitur(viewModel),
                _buildStatusPerkawinanDebitur(viewModel),
                _buildNomorKKDebitur(viewModel),
                _buildJumlahTanggunganDebitur(viewModel),
                _buildTagLocationAlamatDebitur(viewModel),
                _buildDetailAlamatTempatTinggalDebitur(viewModel),
                _buildPostalCodeDebitur(viewModel),
                Row(
                  children: [
                    _buildKecamatanDebitur(viewModel),
                    SizedBox(
                      width: 15.w,
                    ),
                    _buildKelurahan(viewModel),
                  ],
                ),
                Row(
                  children: [
                    _buildRT(viewModel),
                    SizedBox(
                      width: 15.w,
                    ),
                    _buildRW(viewModel),
                  ],
                ),
                _buildNomorHandphoneDebitur(viewModel),
                _buildEmail(viewModel),
                if (dataDiri.maritalStatus == Common.kawin)
                  Column(
                    children: [
                      _buildNomorKTPPasangan(viewModel),
                      _buildNamaLengkapPasangan(viewModel),
                      _buildTempatLahirPasangan(viewModel),
                      _buildTanggalLahirPasangan(viewModel),
                    ],
                  ),
              ],
            ),
          ),
          const ThickLightGreyDivider(),
          Container(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                _buildNamaUsaha(viewModel),
                _buildSektorEkonomi(viewModel),
                _buildSubSektorEkonomi(viewModel),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 5,
                        child: Text(
                          'Tekan Tombol di samping jika Alamat Usaha sama dengan Alamat Rumah',
                          style: TextStyle(
                            fontSize: 12,
                            color: CustomColor.darkGrey,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                            activeColor: CustomColor.secondaryBlue,
                            value: viewModel.valueLocation,
                            onChanged: (bool value) {
                              viewModel.updateFunction(value);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (!viewModel.valueLocation)
                  _buildLocationAlamatUsaha(viewModel),
                if (!viewModel.valueLocation)
                  _buildDetailAlamatUsaha(viewModel),
                if (!viewModel.valueLocation) _buildPostalCodeUsaha(viewModel),
                if (!viewModel.valueLocation) _buildProvinsi(viewModel),
                if (!viewModel.valueLocation) _buildKota(viewModel),
                if (!viewModel.valueLocation)
                  Row(
                    children: [
                      Expanded(
                        child: _buildKecamatanUsaha(viewModel),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Expanded(child: _buildKelurahanUsaha(viewModel)),
                    ],
                  ),
                if (!viewModel.valueLocation)
                  Row(
                    children: [
                      _buildRTUsaha(viewModel),
                      SizedBox(
                        width: 15.w,
                      ),
                      _buildRWUsaha(viewModel),
                    ],
                  ),
                // PilihPartnershipButton(
                //   onPressed: () => {},
                //   choice: 'Belum Memilih Partnership',
                // )
              ],
            ),
          ),
          const ThickLightGreyDivider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 24.h, top: 25.h),
                  child: Text(
                    'UPLOAD FILE',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5.w,
                    ),
                  ),
                ),
                if (viewModel.dataDiri!.maritalStatus! == Common.belumKawin)
                  Column(
                    children: [
                      UploadItemButtonRitel(
                        imageUrl: viewModel.ktpFileDbtrControllerPublicUrl,
                        label: 'Foto E-KTP Debitur',
                        enabled: false,
                        // ignore: no-empty-block
                        onPressed: () {},
                        errorText: viewModel.ktpDbtrErrorText,
                      ),
                      UploadItemButtonRitel(
                        imageUrl: viewModel.fotoSelfieDbtrControllerPublicUrl,
                        label: 'Foto Debitur Bersama E-KTP *',
                        onPressed: viewModel.captureFotoSelfieDbtrController,
                        errorText: viewModel.fotoSelfieDbtrErrorText,
                      ),
                      UploadItemButtonRitel(
                        imageUrl: viewModel.npwpDbtrControllerPublicUrl,
                        label: 'NPWP Debitur *',
                        onPressed: viewModel.capturNpwpDbtrController,
                        errorText: viewModel.npwpDbtrControllerErrorText,
                      ),
                      UploadItemButtonRitel(
                        imageUrl: viewModel.kkDbtrControllerPublicUrl,
                        label: 'Kartu Keluarga *',
                        onPressed: viewModel.capturKkDbtrController,
                        errorText: viewModel.kkDbtrControllerErrorText,
                      ),
                    ],
                  ),
                if (viewModel.dataDiri!.maritalStatus! == Common.kawin)
                  Column(
                    children: [
                      UploadItemButtonRitel(
                        imageUrl: viewModel.ktpFileDbtrControllerPublicUrl,
                        label: 'Foto E-KTP Debitur',
                        enabled: false,
                        // ignore: no-empty-block
                        onPressed: () {},
                        errorText: viewModel.ktpDbtrErrorText,
                      ),
                      UploadItemButtonRitel(
                        imageUrl: viewModel.fotoSelfieDbtrControllerPublicUrl,
                        label: 'Foto Debitur Bersama E-KTP *',
                        onPressed: viewModel.captureFotoSelfieDbtrController,
                        errorText: viewModel.fotoSelfieDbtrErrorText,
                      ),
                      UploadItemButtonRitel(
                        imageUrl: viewModel.npwpDbtrControllerPublicUrl,
                        label: 'NPWP Debitur *',
                        onPressed: viewModel.capturNpwpDbtrController,
                        errorText: viewModel.npwpDbtrControllerErrorText,
                      ),
                      UploadItemButtonRitel(
                        imageUrl: viewModel.ktpPsgnPathDbtrControllerPublicUrl,
                        label: 'Foto E-KTP Pasangan',
                        // ignore: no-empty-block
                        onPressed: () {},
                        enabled: false,
                        errorText: viewModel.ktpPsgnPathDbtrControllerErrorText,
                      ),
                      UploadItemButtonRitel(
                        imageUrl: viewModel.kkDbtrControllerPublicUrl,
                        label: 'Kartu Keluarga *',
                        onPressed: viewModel.capturKkDbtrController,
                        errorText: viewModel.kkDbtrControllerErrorText,
                      ),
                      UploadItemButtonRitel(
                        imageUrl: viewModel.aktaNikahControllerPublicUrl,
                        label: 'Akta Nikah *',
                        onPressed: viewModel.capturAktaNikahController,
                        errorText: viewModel.aktaNikahControllerErrorText,
                      ),
                    ],
                  ),
                if (viewModel.dataDiri!.maritalStatus! == Common.ceraiHidup)
                  Column(
                    children: [
                      UploadItemButtonRitel(
                        imageUrl: viewModel.ktpFileDbtrControllerPublicUrl,
                        label: 'Foto E-KTP Debitur',
                        enabled: false,
                        // ignore: no-empty-block
                        onPressed: () {},
                        errorText: viewModel.ktpDbtrErrorText,
                      ),
                      UploadItemButtonRitel(
                        imageUrl: viewModel.fotoSelfieDbtrControllerPublicUrl,
                        label: 'Foto Debitur Bersama E-KTP *',
                        onPressed: viewModel.captureFotoSelfieDbtrController,
                        errorText: viewModel.fotoSelfieDbtrErrorText,
                      ),
                      UploadItemButtonRitel(
                        imageUrl: viewModel.npwpDbtrControllerPublicUrl,
                        label: 'NPWP Debitur *',
                        onPressed: viewModel.capturNpwpDbtrController,
                        errorText: viewModel.npwpDbtrControllerErrorText,
                      ),
                      UploadItemButtonRitel(
                        imageUrl: viewModel.kkDbtrControllerPublicUrl,
                        label: 'Kartu Keluarga *',
                        onPressed: viewModel.capturKkDbtrController,
                        errorText: viewModel.kkDbtrControllerErrorText,
                      ),
                      UploadItemButtonRitel(
                        imageUrl: viewModel.aktaCeraiControllerPublicUrl,
                        label: 'Akta Cerai *',
                        onPressed: viewModel.capturAktaCeraiController,
                        errorText: viewModel.aktaCeraiControllerErrorText,
                      ),
                    ],
                  ),
                if (viewModel.dataDiri!.maritalStatus! == Common.ceraiMati)
                  Column(
                    children: [
                      UploadItemButtonRitel(
                        imageUrl: viewModel.ktpFileDbtrControllerPublicUrl,
                        label: 'Foto E-KTP Debitur',
                        enabled: false,
                        // ignore: no-empty-block
                        onPressed: () {},
                        errorText: viewModel.ktpDbtrErrorText,
                      ),
                      UploadItemButtonRitel(
                        imageUrl: viewModel.fotoSelfieDbtrControllerPublicUrl,
                        label: 'Foto Debitur Bersama E-KTP *',
                        onPressed: viewModel.captureFotoSelfieDbtrController,
                        errorText: viewModel.fotoSelfieDbtrErrorText,
                      ),
                      UploadItemButtonRitel(
                        imageUrl: viewModel.npwpDbtrControllerPublicUrl,
                        label: 'NPWP Debitur *',
                        onPressed: viewModel.capturNpwpDbtrController,
                        errorText: viewModel.npwpDbtrControllerErrorText,
                      ),
                      UploadItemButtonRitel(
                        imageUrl: viewModel.kkDbtrControllerPublicUrl,
                        label: 'Kartu Keluarga *',
                        onPressed: viewModel.capturKkDbtrController,
                        errorText: viewModel.kkDbtrControllerErrorText,
                      ),
                      UploadItemButtonRitel(
                        imageUrl:
                            viewModel.sertifikatKematianControllerPublicUrl,
                        label: 'Sertifikat Kematian *',
                        onPressed: viewModel.capturSertifikatKematianController,
                        errorText:
                            viewModel.sertifikatKematianControllerErrorText,
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            margin: EdgeInsets.symmetric(vertical: 22.h),
            child: CustomButton(
              label: 'SIMPAN',
              onPressed:
                  // ignore: no-empty-block
                  viewModel.isDone() ? viewModel.updatePrakarsaById : () {},
              isBusy: false,
              color: viewModel.isDone()
                  ? const Color(0xff027DEF)
                  : const Color(0xff99A0AF),
            ),
          ),
        ],
      ),
    );
  }

  CustomTextField _buildJenisDebitur(InformasiDebiturViewModelRitel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.jenisDbtrController,
      label: 'Jenis Debitur',
      hintText: 'Masukkan Jenis Debitur',
      textCapitalization: TextCapitalization.words,
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildNomorKTPDebitur(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorKtpDbtrController,
      label: 'Nomor KTP Debitur',
      hintText: 'Masukkan Nomor KTP Debitur',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildKTPTerbit(InformasiDebiturViewModelRitel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.ktpTerbitDbtrController,
      label: 'Tanggal KTP Terbit',
      hintText: 'Masukkan Tanggal KTP Terbit Debitur',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildAgama(InformasiDebiturViewModelRitel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.agamaDbtrController,
      label: 'Agama',
      hintText: 'Masukkan Agama Debitur',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildEducation(InformasiDebiturViewModelRitel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.educationDbtrController,
      label: 'Pendidikan Terakhir',
      hintText: 'Masukkan Pendidikan Terakhir Debitur',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildNomorNPWPDebitur(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorNpwpDbtrController,
      label: 'Nomor NPWP *',
      hintText: 'Masukkan Nomor NPWP Debitur',
      keyboardType: TextInputType.number,
      enabled: true,
      onSave: viewModel.updateNomorNpwpDbtrController,
      onChanged: viewModel.updateNomorNpwpDbtrController,
      withMaxLength: true,
      maxLength: 15,
      validator: (value) =>
          InputValidators.validateRequiredField(value, fieldType: 'Nomor NPWP'),
    );
  }

  CustomTextField _buildNamaDebitur(InformasiDebiturViewModelRitel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.namaDbtrController,
      label: 'Nama Lengkap Debitur Sesuai KTP',
      hintText: 'Masukkan Nama Lengkap Debitur',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildTanggalLahirDebitur(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglLahirDbtrController,
      label: 'Tanggal Lahir Debitur',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildJenisKelaminDebitur(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.genderDbtrController,
      label: 'Jenis Kelamin',
      hintText: 'Masukkan Jenis Kelamin',
      textCapitalization: TextCapitalization.words,
      enabled: false,
      fillColor: Colors.grey.shade100,
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.chevronDown,
    );
  }

  CustomTextField _buildNamaGadisIbuKandungDebitur(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.namaIbuKandungDbtrController,
      label: 'Nama Gadis Ibu Kandung Debitur *',
      hintText: 'Masukkan Nama Gadis Ibu Kandung',
      textCapitalization: TextCapitalization.words,
      enabled: true,
      onSave: viewModel.updateNamaIbuKandungDbtrController,
      onChanged: viewModel.updateNamaIbuKandungDbtrController,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Nama Gadis Ibu Kandung',
      ),
    );
  }

  CustomTextField _buildStatusPerkawinanDebitur(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.stsPerkawinanDbtrController,
      label: 'Status Perkawinan',
      hintText: 'Masukkan Status Perkawinan',
      textCapitalization: TextCapitalization.words,
      enabled: false,
      fillColor: Colors.grey.shade100,
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.chevronDown,
    );
  }

  CustomTextField _buildNomorKKDebitur(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorKKDbtrController,
      label: 'Nomor KK *',
      hintText: 'Masukkan Nomor KK Debitur',
      keyboardType: TextInputType.number,
      enabled: true,
      withMaxLength: true,
      maxLength: 16,
      onSave: viewModel.updateNomorKKDbtrController,
      onChanged: viewModel.updateNomorKKDbtrController,
      validator: (value) =>
          InputValidators.validateRequiredField(value, fieldType: 'Nomor KK'),
    );
  }

  CustomTextField _buildJumlahTanggunganDebitur(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.jmlhTanggunganController,
      label: 'Nomor Jumlah Tanggungan *',
      hintText: 'Masukkan Jumlah Tanggungan',
      keyboardType: TextInputType.number,
      onSave: viewModel.updateJumlahTanggunanController,
      onChanged: viewModel.updateJumlahTanggunanController,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Jumlah Tanggungan',
      ),
    );
  }

  CustomTextField _buildTagLocationAlamatDebitur(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tagLocationNameDbtrController,
      label: 'Tag Location Alamat',
      hintText: 'Masukkan Tag Location Alamat',
      textCapitalization: TextCapitalization.words,
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.location,
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildDetailAlamatTempatTinggalDebitur(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.detailTmptTinggalDbtrController,
      label: 'Detail Alamat Tempat Tinggal',
      hintText: 'Masukkan Detail Alamat Tempat Tinggal',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildPostalCodeDebitur(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.kodePosDbtrController,
      label: 'Kode Pos',
      hintText: 'Masukkan Kode Pos',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  Expanded _buildKecamatanDebitur(InformasiDebiturViewModelRitel viewModel) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.kecamatanDbtrController,
        label: 'Kecamatan',
        hintText: 'Kecamatan',
        enabled: false,
        fillColor: Colors.grey.shade100,
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
      ),
    );
  }

  Expanded _buildKelurahan(InformasiDebiturViewModelRitel viewModel) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.kelurahanDbtrController,
        label: 'Kelurahan',
        hintText: 'Kelurahan',
        enabled: false,
        fillColor: Colors.grey.shade100,
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
      ),
    );
  }

  Expanded _buildRT(InformasiDebiturViewModelRitel viewModel) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.rtDbtrController,
        label: 'RT',
        hintText: 'cth. 005',
        keyboardType: TextInputType.number,
        enabled: false,
      ),
    );
  }

  Expanded _buildRW(InformasiDebiturViewModelRitel viewModel) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.rwDbtrController,
        label: 'RW',
        hintText: 'cth. 006',
        keyboardType: TextInputType.number,
        enabled: false,
      ),
    );
  }

  CustomTextField _buildNomorHandphoneDebitur(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.noHpDbtrController,
      label: 'No. Handphone',
      hintText: 'Masukkan Nomor Handphone',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildEmail(InformasiDebiturViewModelRitel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.emailDbtrController,
      label: 'Email *',
      hintText: 'Masukkan Email',
      onChanged: viewModel.updateEmailDbtrController,
      onSave: viewModel.updateEmailDbtrController,
      enabled: true,
      validator: (value) => InputValidators.validateEmail(value),
    );
  }

  CustomTextField _buildNomorKTPPasangan(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorKtpPsgController,
      label: 'Nomor KTP Pasangan',
      hintText: 'Masukkan Nomor KTP Pasangan',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildNamaLengkapPasangan(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.namaPsgController,
      label: 'Nama Lengkap Pasangan',
      hintText: 'Masukkan Nama Pasangan',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildTempatLahirPasangan(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tmptLahirPsgController,
      label: 'Tempat Lahir Pasangan',
      hintText: 'Masukkan Tempat Lahir Pasangan',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildTanggalLahirPasangan(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglLahirPsgController,
      label: 'Tanggal Lahir Pasangan',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildNamaUsaha(InformasiDebiturViewModelRitel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.namaUsahaDbtrController,
      label: 'Nama Usaha *',
      hintText: 'Masukkan Nama Usaha',
      onChanged: viewModel.updateNamaUsahaController,
      onSave: viewModel.updateNamaUsahaController,
      enabled: true,
      validator: (value) =>
          InputValidators.validateRequiredField(value, fieldType: 'Nama Usaha'),
    );
  }

  CustomTextField _buildSektorEkonomi(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.strEkoDbtrController,
      label: 'Sektor Ekonomi',
      hintText: 'Masukkan Sektor Ekonomi',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildSubSektorEkonomi(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.subStrEkorDbtrController,
      label: 'Sub Sektor Ekonomi',
      hintText: 'Masukkan Sub Sektor Ekonomi',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  // Radio Button Don't forget

  CustomTextField _buildLocationAlamatUsaha(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tagLocUsahaDbtrController,
      label: 'Tag Location Alamat Usaha *',
      hintText: 'Tag Location Usaha',
      textCapitalization: TextCapitalization.words,
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.location,
      onTap: viewModel.navigateToAddressSelectionView,
      onSave: viewModel.updateTagLocUsaha,
      onChanged: viewModel.updateTagLocUsaha,
      enabled: true,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Tag Location Usaha',
      ),
    );
  }

  CustomTextField _buildDetailAlamatUsaha(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.alamatUsahaDbtrController,
      label: 'Alamat Usaha *',
      hintText: 'Masukkan Alamat Usaha',
      keyboardType: TextInputType.text,
      enabled: true,
      onSave: viewModel.updatAlamatUsahaController,
      onChanged: viewModel.updatAlamatUsahaController,
    );
  }

  CustomTextField _buildPostalCodeUsaha(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.kodePostUsahaDbtrController,
      label: 'Kode Pos *',
      hintText: 'Masukkan Kode Pos',
      enabled: true,
      keyboardType: TextInputType.number,
      onSave: viewModel.updateKodePosUsahaController,
      onChanged: viewModel.updateKodePosUsahaController,
    );
  }

  CustomTextField _buildProvinsi(InformasiDebiturViewModelRitel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.provinsiUsahaDbtrController,
      label: 'Provinsi *',
      hintText: 'Masukkan Provinsi',
      enabled: false,
      fillColor: const Color(0xffF6F6F8),
    );
  }

  CustomTextField _buildKota(InformasiDebiturViewModelRitel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.cityUsahaDbtrController,
      label: 'Kota *',
      hintText: 'Masukkan Kota',
      enabled: false,
      fillColor: const Color(0xffF6F6F8),
    );
  }

  CustomTypeAheadFormField _buildKecamatanUsaha(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTypeAheadFormField(
      controller: viewModel.kecamatanUsahaDbtrController,
      label: 'Kecamatan *',
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

  // CustomTextField _buildKecamatanUsaha(
  //   InformasiDebiturViewModelRitel viewModel,
  // ) {
  //   return CustomTextField(
  //     textEditingController: viewModel.kecamatanUsahaDbtrController,
  //     label: 'Kecamatan *',
  //     hintText: 'Kecamatan',
  //     onSave: viewModel.updateKecamatanUsahaController,
  //     onChanged: viewModel.updateKecamatanUsahaController,
  //     keyboardType: TextInputType.text,
  //     enabled: false,
  //     fillColor: Colors.grey.shade100,
  //   );
  // }

  // Expanded _buildKelurahanUsaha(InformasiDebiturViewModelRitel viewModel) {
  //   return Expanded(
  //       child: CustomTextField(
  //     textEditingController: viewModel.kelurahanUsahaDbtrController,
  //     label: 'Kelurahan *',
  //     hintText: 'Kelurahan',
  //     onSave: viewModel.updateKelurahanUsahaController,
  //     onChanged: viewModel.updateKelurahanUsahaController,
  //     keyboardType: TextInputType.text,
  //     enabled: true,
  //   ));
  // }

  CustomTypeAheadFormField _buildKelurahanUsaha(
    InformasiDebiturViewModelRitel viewModel,
  ) {
    return CustomTypeAheadFormField(
      controller: viewModel.kelurahanUsahaDbtrController,
      label: 'Kelurahan *',
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

  Expanded _buildRTUsaha(InformasiDebiturViewModelRitel viewModel) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.rtUsahaDbtrController,
        label: 'RT *',
        hintText: 'cth. 005',
        onSave: viewModel.updateRtUsahaController,
        onChanged: viewModel.updateRtUsahaController,
        keyboardType: TextInputType.number,
        enabled: true,
        validator: (value) =>
            InputValidators.validateRTRW(value, fieldType: 'RT'),
      ),
    );
  }

  Expanded _buildRWUsaha(InformasiDebiturViewModelRitel viewModel) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.rwUsahaDbtrController,
        label: 'RW *',
        hintText: 'cth. 006',
        onSave: viewModel.updateRwUsahaController,
        onChanged: viewModel.updateRwUsahaController,
        keyboardType: TextInputType.number,
        enabled: true,
        validator: (value) =>
            InputValidators.validateRTRW(value, fieldType: 'RW'),
      ),
    );
  }
}

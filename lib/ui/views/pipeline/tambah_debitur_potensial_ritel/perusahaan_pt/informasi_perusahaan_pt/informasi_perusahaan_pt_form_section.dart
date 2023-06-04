import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../application/helpers/input_validators.dart';
import '../../../../../../application/models/economy_sector_ritel.dart';
import '../../../../../../application/models/economy_sub_sector_ritel.dart';
import '../../../../../shared/custom_textfield.dart';
import '../../../../../shared/custom_type_ahead_form_field.dart';
import 'informasi_perusahaan_pt_viewmodel.dart';

class InformasiPerusahaanPtFormSection
    extends HookViewModelWidget<InformasiPerusahaanPtViewModel> {
  const InformasiPerusahaanPtFormSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPerusahaanPtViewModel viewModel,
  ) {
    viewModel.jenisDebiturController.text = 'Perusahaan - PT';

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
                _buildNamaPerusahaan(viewModel),
                _buildNomorNPWPPerusahaan(viewModel),
                _buildSektorEkonomi(viewModel),
                if (viewModel.sektorController.text.isNotEmpty)
                  _buildSubSektorEkonomi(viewModel),
                _buildAlamatPerusahaanPt(viewModel),
                _buildDetailAlamatPerusahaanPt(viewModel),
                _buildKodePos(viewModel),
                _buildProvinsi(viewModel),
                _buildCity(viewModel),
                Row(
                  children: [
                    // _buildKecamatan(viewModel),
                    Expanded(child: _buildKecamatan(viewModel)),
                    SizedBox(width: 15.w),
                    Expanded(child: _buildKelurahan(viewModel)),
                  ],
                ),
                Row(
                  children: [
                    _buildRT(viewModel),
                    SizedBox(width: 15.w),
                    _buildRW(viewModel),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CustomTextField _buildJenisDebitur(InformasiPerusahaanPtViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.jenisDebiturController,
      label: 'Jenis Debitur *',
      hintText: 'Masukkan Jenis Debitur',
      textCapitalization: TextCapitalization.words,
      enabled: false,
    );
  }

  CustomTextField _buildNamaPerusahaan(
    InformasiPerusahaanPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.namaPerusahaanPtController,
      label: 'Nama Perusahaan *',
      hintText: 'Masukkan Nama Perusahaan',
      prefixText: 'PT. ',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateNamaPerusahaanPt,
      onChanged: viewModel.updateNamaPerusahaanPt,
      validator: (value) =>
          InputValidators.validateName(value, fieldType: 'Nama Perusahaan'),
    );
  }

  CustomTextField _buildNomorNPWPPerusahaan(
    InformasiPerusahaanPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorNpwpPerusahaanPtController,
      label: 'NPWP Perusahaan *',
      hintText: 'Masukkan Nomor NPWP Perusahaan',
      onSave: viewModel.updateNomorNpwpPerusahaanPt,
      onChanged: viewModel.updateNomorNpwpPerusahaanPt,
      keyboardType: TextInputType.number,
      validator: (value) => InputValidators.ritelValidateNPWP(value),
      withMaxLength: true,
      maxLength: 15,
    );
  }

  Widget _buildSektorEkonomi(InformasiPerusahaanPtViewModel viewModel) {
    return CustomTypeAheadFormField<EconomySectorRitel>(
      label: 'Sektor Ekonomi *',
      controller: viewModel.sektorController,
      onClear: viewModel.clearEconomySector,
      onFilter: viewModel.filterEconomySector,
      onSuggestionSelected: viewModel.updateEconomySector,
      itemBuilder: (context, suggestion) {
        return ListTile(title: Text(suggestion.name!));
      },
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Pilih Sektor Ekonomi',
      ),
    );
  }

  Widget _buildSubSektorEkonomi(InformasiPerusahaanPtViewModel viewModel) {
    return CustomTypeAheadFormField<EconomySubSectorRitel>(
      label: 'Sub Sektor Ekonomi *',
      controller: viewModel.subSektorController,
      onClear: viewModel.clearEconomySubSector,
      onFilter: viewModel.filterEconomySubSector,
      onSuggestionSelected: viewModel.updateEconomySubSector,
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(
            '${suggestion.code!} - ${suggestion.economySubSectorsName!}',
          ),
        );
      },
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'PilihSub Sektor Ekonomi',
      ),
    );
  }

  CustomTextField _buildAlamatPerusahaanPt(
    InformasiPerusahaanPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.alamatPerushaanPtController,
      label: 'Tag Location Alamat Perusahaan *',
      hintText: 'Tag Location',
      textCapitalization: TextCapitalization.words,
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.location,
      onTap: viewModel.navigateToAddressSelectionViewPerusahaanPt,
      onSave: viewModel.updateAlamatPerusahaanPt,
      onChanged: viewModel.updateAlamatPerusahaanPt,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Tag Location',
      ),
    );
  }

  CustomTextField _buildDetailAlamatPerusahaanPt(
    InformasiPerusahaanPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.detailAlamatPerusahaanController,
      label: 'Alamat Usaha *',
      hintText: 'Masukkan Alamat Usaha',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateDetailAlamatPerusahaanPt,
      onChanged: viewModel.updateDetailAlamatPerusahaanPt,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Detail Alamat Usaha',
      ),
    );
  }

  CustomTextField _buildKodePos(InformasiPerusahaanPtViewModel viewModel) {
    return CustomTextField(
      label: 'Kode Pos *',
      textEditingController: viewModel.postalCodeAlamatPerusahaanPtController,
      hintText: 'Masukkan Kode Pos',
      keyboardType: TextInputType.number,
      onSave: viewModel.updatePostalCodePerusahaanPtTinggal,
      onChanged: viewModel.updatePostalCodePerusahaanPtTinggal,
      validator: (value) =>
          InputValidators.validateRequiredField(value, fieldType: 'Kode Pos'),
    );
  }

  CustomTextField _buildProvinsi(InformasiPerusahaanPtViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.provinceAlamatPerusahaanController,
      label: 'Provinsi *',
      hintText: 'Masukkan Provinsi',
      enabled: false,
      fillColor: const Color(0xffF6F6F8),
      validator: (value) =>
          InputValidators.validateRequiredField(value, fieldType: 'Provinsi'),
    );
  }

  CustomTextField _buildCity(InformasiPerusahaanPtViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.cityAlamatPerusahaanController,
      label: 'Kota *',
      hintText: 'Masukkan Kota',
      // textCapitalization: TextCapitalization.words,
      // onSave: viewModel.updateCityAlamatPerusahaan,
      // onChanged: viewModel.updateCityAlamatPerusahaan,
      // validator: (value) =>
      //     InputValidators.validateRequiredField(value, fieldType: 'Kota'),
      enabled: false,
      fillColor: const Color(0xffF6F6F8),
      validator: (value) =>
          InputValidators.validateRequiredField(value, fieldType: 'Kota'),
    );
  }

  // CustomTextField _buildKecamatan(InformasiPerusahaanPtViewModel viewModel) {
  //   return CustomTextField(
  //     label: 'Kecamatan *',
  //     textEditingController: viewModel.districtAlamatPerusahaanPtController,
  //     hintText: 'Kecamatan',
  //     enabled: false,
  //     fillColor: const Color(0xffF6F6F8),
  //   );
  // }

  CustomTypeAheadFormField _buildKecamatan(
    InformasiPerusahaanPtViewModel viewModel,
  ) {
    return CustomTypeAheadFormField(
      label: 'Kecamatan *',
      controller: viewModel.districtAlamatPerusahaanPtController,
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
    InformasiPerusahaanPtViewModel viewModel,
  ) {
    return CustomTypeAheadFormField(
      label: 'Kelurahan *',
      controller: viewModel.villageAlamatPerusahaanPtController,
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

  // Expanded _buildKelurahan(InformasiPerusahaanPtViewModel viewModel) {
  //   return Expanded(
  //     child: CustomTextField(
  //       textEditingController: viewModel.villageAlamatPerusahaanPtController,
  //       label: 'Kelurahan *',
  //       hintText: 'Kelurahan',
  //       onSave: viewModel.updateVillageAlamatPerusahaanPt,
  //       onChanged: viewModel.updateVillageAlamatPerusahaanPt,
  //       textCapitalization: TextCapitalization.words,
  //       validator: (value) =>
  //           InputValidators.validateName(value, fieldType: 'Kelurahan'),
  //     ),
  //   );
  // }

  Expanded _buildRT(InformasiPerusahaanPtViewModel viewModel) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.rtAlamatPerusahaanPtController,
        label: 'RT *',
        hintText: 'cth. 005',
        onSave: viewModel.updateRtAlamatPerusahaanPt,
        onChanged: viewModel.updateRtAlamatPerusahaanPt,
        keyboardType: TextInputType.number,
        withMaxLength: true,
        maxLength: 3,
        validator: (value) =>
            InputValidators.validateRTRW(value, fieldType: 'RT'),
      ),
    );
  }

  Expanded _buildRW(InformasiPerusahaanPtViewModel viewModel) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.rwAlamatPerusahaanPtController,
        label: 'RW *',
        hintText: 'cth. 006',
        onSave: viewModel.updateRwAlamatPerusahaan,
        onChanged: viewModel.updateRwAlamatPerusahaan,
        keyboardType: TextInputType.number,
        withMaxLength: true,
        maxLength: 3,
        validator: (value) =>
            InputValidators.validateRTRW(value, fieldType: 'RW'),
      ),
    );
  }
}

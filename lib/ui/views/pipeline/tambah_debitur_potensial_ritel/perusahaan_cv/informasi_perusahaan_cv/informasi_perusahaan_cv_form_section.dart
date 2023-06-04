import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../application/helpers/input_validators.dart';
import '../../../../../../application/models/economy_sector_ritel.dart';
import '../../../../../../application/models/economy_sub_sector_ritel.dart';
import '../../../../../shared/custom_textfield.dart';
import '../../../../../shared/custom_type_ahead_form_field.dart';
import 'informasi_perusahaan_cv_viewmodel.dart';

class InformasiPerusahaanCvFormSection
    extends HookViewModelWidget<InformasiPerusahaanCvViewModel> {
  const InformasiPerusahaanCvFormSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPerusahaanCvViewModel viewModel,
  ) {
    viewModel.jenisDebiturController.text = 'Perusahaan - CV';
    // viewModel.namaPerusahaanCvController.text = 'CV';

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              _buildJenisDebitur(viewModel),
              _buildNamaPerusahaan(viewModel),
              _buildNomorNPWPPerusahaan(viewModel),
              _buildSektorEkonomi(viewModel),
              _buildSubSektorEkonomi(viewModel),
              _buildAlamatPerusahaanCv(viewModel),
              _buildDetailAlamatPerusahaanCv(viewModel),
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
            ],
          ),
        ),
      ],
    );
  }

  CustomTextField _buildJenisDebitur(InformasiPerusahaanCvViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.jenisDebiturController,
      label: 'Jenis Debitur *',
      hintText: 'Masukkan Jenis Debitur',
      textCapitalization: TextCapitalization.words,
      enabled: false,
    );
  }

  CustomTextField _buildNamaPerusahaan(
    InformasiPerusahaanCvViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.namaPerusahaanCvController,
      label: 'Nama Perusahaan *',
      hintText: 'Masukkan Nama Perusahaan',
      prefixText: 'CV. ',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateNamaPerusahaanCv,
      onChanged: viewModel.updateNamaPerusahaanCv,
      validator: (value) =>
          InputValidators.validateName(value, fieldType: 'Nama Perusahaan'),
    );
  }

  CustomTextField _buildNomorNPWPPerusahaan(
    InformasiPerusahaanCvViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorNpwpPerusahaanCvController,
      label: 'NPWP Perusahaan *',
      hintText: 'Masukkan Nomor NPWP Perusahaan',
      onSave: viewModel.updateNomorNpwpPerusahaanCv,
      onChanged: viewModel.updateNomorNpwpPerusahaanCv,
      keyboardType: TextInputType.number,
      validator: (value) => InputValidators.ritelValidateNPWP(value),
      withMaxLength: true,
      maxLength: 15,
    );
  }

  Widget _buildSektorEkonomi(InformasiPerusahaanCvViewModel viewModel) {
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
        fieldType: 'Sektor Ekonomi',
      ),
    );
  }

  Widget _buildSubSektorEkonomi(InformasiPerusahaanCvViewModel viewModel) {
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
        fieldType: 'Sub Sektor Ekonomi',
      ),
    );
  }

  CustomTextField _buildAlamatPerusahaanCv(
    InformasiPerusahaanCvViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.alamatPerushaanCvController,
      label: 'Tag Location Alamat Perusahaan *',
      hintText: 'Masukkan Tag Location',
      textCapitalization: TextCapitalization.words,
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.location,
      onTap: viewModel.navigateToAddressSelectionViewPerusahaanCv,
      onSave: viewModel.updateAlamatPerusahaanCv,
      onChanged: viewModel.updateAlamatPerusahaanCv,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Tag Location',
      ),
    );
  }

  CustomTextField _buildDetailAlamatPerusahaanCv(
    InformasiPerusahaanCvViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.detailAlamatPerusahaanController,
      label: 'Alamat Usaha *',
      hintText: 'Masukkan Alamat Usaha',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateDetailAlamatPerusahaanCv,
      onChanged: viewModel.updateDetailAlamatPerusahaanCv,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Detail Alamat Usaha',
      ),
    );
  }

  CustomTextField _buildKodePos(InformasiPerusahaanCvViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.postalCodeAlamatPerusahaanCvController,
      label: 'Kode Pos *',
      hintText: 'Masukkan Kode Pos',
      keyboardType: TextInputType.number,
      onSave: viewModel.updatePostalCodePerusahaanCvTinggal,
      onChanged: viewModel.updatePostalCodePerusahaanCvTinggal,
      validator: (value) => InputValidators.validatePostalCode(value),
      withMaxLength: true,
      maxLength: 5,
    );
  }

  CustomTextField _buildProvinsi(InformasiPerusahaanCvViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.provinceAlamatPerusahaanController,
      label: 'Provinsi *',
      hintText: 'Masukkan Provinsi',
      enabled: false,
      fillColor: const Color(0xffF6F6F8),

      // textCapitalization: TextCapitalization.words,
      // onSave: viewModel.updateProvinceAlamatPerusahaan,
      // onChanged: viewModel.updateProvinceAlamatPerusahaan,
      validator: (value) =>
          InputValidators.validateRequiredField(value, fieldType: 'Provinsi'),
    );
  }

  CustomTextField _buildCity(InformasiPerusahaanCvViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.cityAlamatPerusahaanController,
      label: 'Kota *',
      hintText: 'Masukkan Kota',
      enabled: false,
      fillColor: const Color(0xffF6F6F8),
      validator: (value) =>
          InputValidators.validateRequiredField(value, fieldType: 'Kota'),
    );
  }

  // CustomTextField _buildKecamatan(InformasiPerusahaanCvViewModel vm) {
  //   return CustomTextField(
  //     textEditingController: vm.districtAlamatPerusahaanCvController,
  //     label: 'Kecamatan *',
  //     hintText: 'Kecamatan',
  //     enabled: false,
  //     fillColor: const Color(0xffF6F6F8),
  //   );
  // }

  CustomTypeAheadFormField _buildKecamatan(InformasiPerusahaanCvViewModel vm) {
    return CustomTypeAheadFormField(
      controller: vm.districtAlamatPerusahaanCvController,
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

  CustomTypeAheadFormField _buildKelurahan(InformasiPerusahaanCvViewModel vm) {
    return CustomTypeAheadFormField(
      controller: vm.villageAlamatPerusahaanCvController,
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

  Expanded _buildRT(InformasiPerusahaanCvViewModel viewModel) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.rtAlamatPerusahaanCvController,
        label: 'RT *',
        hintText: 'cth. 005',
        onSave: viewModel.updateRtAlamatPerusahaanCv,
        onChanged: viewModel.updateRtAlamatPerusahaanCv,
        keyboardType: TextInputType.number,
        withMaxLength: true,
        maxLength: 3,
        // validator: (value) =>
        //     InputValidators.validateName(value, fieldType: 'RT'),
      ),
    );
  }

  Expanded _buildRW(InformasiPerusahaanCvViewModel viewModel) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.rwAlamatPerusahaanCvController,
        label: 'RW *',
        hintText: 'cth. 006',
        onSave: viewModel.updateRwAlamatPerusahaan,
        onChanged: viewModel.updateRwAlamatPerusahaan,
        keyboardType: TextInputType.number,
        withMaxLength: true,
        maxLength: 3,
        // validator: (value) =>
        //     InputValidators.validateName(value, fieldType: 'RW'),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../application/helpers/input_validators.dart';
import '../../../../../../application/models/economy_sector_ritel.dart';
import '../../../../../../application/models/economy_sub_sector_ritel.dart';
import '../../../../../shared/custom_textfield.dart';
import '../../../../../shared/custom_type_ahead_form_field.dart';
import 'informasi_usaha_debitur_viewmodel.dart';

class InformasiUsahaDebiturFormSection
    extends HookViewModelWidget<InformasiUsahaDebiturViewModel> {
  const InformasiUsahaDebiturFormSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiUsahaDebiturViewModel viewModel,
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
                _buildNamaUsaha(viewModel),
                _buildSektorEkonomi(viewModel),
                if (viewModel.economySubSectors.isNotEmpty)
                  _buildSubSektorEkonomi(viewModel),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 5,
                        child: Text(
                          'Tekan tombol di bawah jika sama dengan Alamat Tinggal',
                          style: TextStyle(
                            fontSize: 14,
                            color: CustomColor.darkGrey,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                            activeColor: CustomColor.secondaryBlue,
                            value: viewModel.sameAddress,
                            onChanged: (bool value) =>
                                viewModel.updateRadioBtn(value),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildAlamatUsaha(viewModel),
                _buildDetailAlamatUsaha(viewModel),
                _buildKodePos(viewModel),
                _buildProvinsi(viewModel),
                _buildKota(viewModel),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildKecamatanForm(viewModel),
                    SizedBox(width: 15.w),
                    _buildKelurahanForm(viewModel),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRT(viewModel),
                    SizedBox(width: 15.w),
                    _buildRW(viewModel),
                  ],
                ),
                // PilihPartnershipButton(
                //   onPressed: () => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const PartnershipView(),
                //     ),
                //   ),
                //   choice: 'Belum Memilih Partnership',
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CustomTextField _buildNamaUsaha(InformasiUsahaDebiturViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.namaUsahaController,
      label: 'Nama Usaha',
      hintText: 'Masukan Nama Usaha',
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateNamaUsaha,
      onChanged: viewModel.updateNamaUsaha,
    );
  }

  Widget _buildSektorEkonomi(InformasiUsahaDebiturViewModel viewModel) {
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

  Widget _buildSubSektorEkonomi(InformasiUsahaDebiturViewModel viewModel) {
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

  CustomTextField _buildAlamatUsaha(InformasiUsahaDebiturViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.addressController,
      label: 'Tag Location Alamat Usaha',
      hintText: 'Tag Location',
      textCapitalization: TextCapitalization.words,
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.location,
      onTap: () => !viewModel.sameAddress
          ? viewModel.navigateToAddressSelectionViewUsaha()
          : {},
      onSave: viewModel.updateAddress,
      onChanged: viewModel.updateAddress,
      enabled: !viewModel.sameAddress,
    );
  }

  CustomTextField _buildDetailAlamatUsaha(
    InformasiUsahaDebiturViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.detailAddressController,
      label: 'Detail Alamat Usaha ',
      hintText: 'Masukkan Detail Alamat Usaha',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateDetailAddress,
      onChanged: viewModel.updateDetailAddress,
      enabled: !viewModel.sameAddress,
    );
  }

  CustomTextField _buildKodePos(InformasiUsahaDebiturViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.postalCodeController,
      label: 'Kode Pos',
      hintText: 'Masukkan Kode Pos',
      keyboardType: TextInputType.number,
      onSave: viewModel.updatePostalCode,
      onChanged: viewModel.updatePostalCode,
      enabled: !viewModel.sameAddress,
    );
  }

  CustomTextField _buildProvinsi(InformasiUsahaDebiturViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.provinceController,
      label: 'Provinsi',
      hintText: 'Masukkan Provinsi',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateProvince,
      onChanged: viewModel.updateProvince,
      enabled: false,
    );
  }

  CustomTextField _buildKota(InformasiUsahaDebiturViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.cityController,
      label: 'Kota',
      hintText: 'Masukkan Kota',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateCity,
      onChanged: viewModel.updateCity,
      enabled: false,
    );
  }

  // CustomTextField _buildKecamatan(InformasiUsahaDebiturViewModel viewModel) {
  //   return CustomTextField(
  //     textEditingController: viewModel.districtController,
  //     label: 'Kecamatan',
  //     hintText: 'Kecamatan',
  //     onSave: viewModel.updateDistrict,
  //     onChanged: viewModel.updateDistrict,
  //     textCapitalization: TextCapitalization.words,
  //     enabled: false,
  //   );
  // }

  CustomTypeAheadFormField _buildKecamatan(
    InformasiUsahaDebiturViewModel viewModel,
  ) {
    return CustomTypeAheadFormField(
      controller: viewModel.districtController,
      label: 'Kecamatan',
      onClear: viewModel.clearDistrict,
      onFilter: viewModel.filterDistrict,
      onSuggestionSelected: viewModel.updateDistrict,
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion.district),
        );
      },
      // validator: (value) =>
      //     InputValidators.validateRequiredField(value, fieldType: 'Kecamatan'),
    );
  }

  // Expanded _buildKelurahan(InformasiUsahaDebiturViewModel viewModel) {
  //   return Expanded(
  //     child: CustomTextField(
  //       textEditingController: viewModel.villageController,
  //       label: 'Kelurahan',
  //       hintText: 'Kelurahan',
  //       onSave: viewModel.updateVillage,
  //       onChanged: viewModel.updateVillage,
  //       textCapitalization: TextCapitalization.words,
  //       enabled: !viewModel.sameAddress,
  //     ),
  //   );
  // }

  CustomTypeAheadFormField _buildKelurahan(
    InformasiUsahaDebiturViewModel viewModel,
  ) {
    return CustomTypeAheadFormField(
      controller: viewModel.villageController,
      label: 'Kelurahan',
      onClear: viewModel.clearVillage,
      onFilter: viewModel.filterVillage,
      onSuggestionSelected: viewModel.updateVillage,
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion.village),
        );
      },
      // validator: (value) =>
      //     InputValidators.validateRequiredField(value, fieldType: 'Kelurahan'),
    );
  }

  Expanded _buildRT(InformasiUsahaDebiturViewModel viewModel) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.rtController,
        label: 'RT',
        hintText: 'cth. 005',
        onSave: viewModel.updateRt,
        onChanged: viewModel.updateRt,
        keyboardType: TextInputType.number,
        enabled: !viewModel.sameAddress,
      ),
    );
  }

  Expanded _buildRW(InformasiUsahaDebiturViewModel viewModel) {
    return Expanded(
      child: CustomTextField(
        textEditingController: viewModel.rwController,
        label: 'RW',
        hintText: 'cth. 006',
        onSave: viewModel.updateRw,
        onChanged: viewModel.updateRw,
        keyboardType: TextInputType.number,
        enabled: !viewModel.sameAddress,
      ),
    );
  }

  Expanded _buildKelurahanForm(InformasiUsahaDebiturViewModel viewModel) {
    // ignore: prefer-conditional-expressions
    if (viewModel.isValidPostalCode && viewModel.sameAddress ||
        !viewModel.isValidPostalCode && !viewModel.sameAddress) {
      return Expanded(
        child: CustomTextField(
          textEditingController: viewModel.villageController,
          label: 'Kelurahan',
          hintText: 'Pilih Kelurahan',
          // ignore: no-empty-block
          onSave: (val) {},
          // ignore: no-empty-block
          onChanged: (val) {},
          keyboardType: TextInputType.number,
          enabled: false,
        ),
      );
    } else {
      return Expanded(
        child: _buildKelurahan(viewModel),
      );
    }
  }

  Expanded _buildKecamatanForm(InformasiUsahaDebiturViewModel viewModel) {
    // ignore: prefer-conditional-expressions
    if (viewModel.isValidPostalCode && viewModel.sameAddress ||
        !viewModel.isValidPostalCode && !viewModel.sameAddress) {
      return Expanded(
        child: CustomTextField(
          textEditingController: viewModel.districtController,
          label: 'Kecamatan',
          hintText: 'Pilih Kecamatan',
          // ignore: no-empty-block
          onSave: (val) {},
          // ignore: no-empty-block
          onChanged: (val) {},
          keyboardType: TextInputType.number,
          enabled: false,
        ),
      );
    } else {
      return Expanded(
        child: _buildKecamatan(viewModel),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../application/helpers/date_time_picker.dart';
import '../../../../../../application/helpers/input_validators.dart';
import '../../../../../../application/models/community_branch_ritel.dart';
import '../../../../../shared/custom_textfield.dart';
import '../../../../../shared/custom_type_ahead_form_field.dart';
import 'informasi_lainnya_viewmodel.dart';

class InformasiLainnyaFormSection
    extends HookViewModelWidget<InformasiLainnyaViewModel> {
  const InformasiLainnyaFormSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiLainnyaViewModel viewModel,
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
                _buildCbTerdekat(viewModel),
                _buildWaktuTempuh(viewModel),
                _buildJenisProdukPinjaman(viewModel),
                _buildEstimasiNominalPinjaman(viewModel),
                _buildTujuanKunjunganDebitur(viewModel),
                _buildTagLocationKunjungan(viewModel),
                _buildTanggalKunjunganDebitur(viewModel, context),
                _buildHasilKunjunganDebitur(viewModel),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCbTerdekat(InformasiLainnyaViewModel viewModel) {
    return CustomTypeAheadFormField<CommunityBranchRitel>(
      label: 'CB Terdekat *',
      controller: viewModel.cbTerdekatController,
      onClear: viewModel.clearCommunityBranch,
      onFilter: viewModel.filterCommunityBranch,
      onSuggestionSelected: viewModel.updateCommunityBranch,
      itemBuilder: (context, suggestion) {
        return ListTile(title: Text(suggestion.name!));
      },
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'CB Terdekat',
      ),
    );
  }

  CustomTextField _buildWaktuTempuh(InformasiLainnyaViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.waktuTempuhController,
      label: 'Waktu Tempuh Lokasi Usaha ke Community Branch',
      hintText: 'Masukkan Waktu Tempuh',
      suffixText: 'Menit',
      keyboardType: TextInputType.number,
      onSave: viewModel.updateWaktuTempuh,
      onChanged: viewModel.updateWaktuTempuh,
    );
  }

  CustomTextField _buildJenisProdukPinjaman(
    InformasiLainnyaViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.jenisProdukPinjamanController,
      label: 'Jenis Produk Pinjaman',
      hintText: 'Pilih Jenis Produk Pinjaman',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildEstimasiNominalPinjaman(
    InformasiLainnyaViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.estimasiNominalPinjamanController,
      label: 'Nominal Pengajuan Awal *',
      hintText: 'Masukkan Nominal Pengajuan Awal',
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      keyboardType: TextInputType.number,
      onSave: viewModel.updateEstimasiNominalPinjaman,
      onChanged: viewModel.updateEstimasiNominalPinjaman,
      withThousandsSeparator: true,
      withMaxLength: true,
      maxLength: 10,
      validator: (value) =>
          InputValidators.ritelValidateNominalPinjaman(value, 10000000000),
    );
  }

  CustomTextField _buildTagLocationKunjungan(
    InformasiLainnyaViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.isLoadingGetAddress
          ? TextEditingController(text: 'Memuat data alamat...')
          : viewModel.tagLocationKunjunganController,
      label: 'Tag Location Kunjungan',
      hintText: 'Tag Location',
      textCapitalization: TextCapitalization.words,
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.location,
      onTap: viewModel.navigateToAddressSelectionViewLainnya,
      onSave: viewModel.updateTagLocation,
      onChanged: viewModel.updateTagLocation,
      enabled: false,
    );
  }

  CustomTextField _buildTanggalKunjunganDebitur(
    InformasiLainnyaViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglKunjunganDebiturController,
      label: 'Tanggal Kunjungan Debitur',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () async {
        String date = await DateTimePicker.showingDatePicker(context);
        viewModel.updateTglKunjunganDebitur(date);
      },
      enabled: false,
      fillColor: Colors.white,
      onSave: viewModel.updateTglKunjunganDebitur,
    );
  }

  CustomTextField _buildHasilKunjunganDebitur(
    InformasiLainnyaViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.hasilKunjunganDebiturController,
      label: 'Hasil Kunjungan Debitur',
      hintText: 'Ceritakan Hasil Kunjungan Debitur',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateHasilKunjunganDebitur,
      onChanged: viewModel.updateHasilKunjunganDebitur,
    );
  }

  CustomTextField _buildTujuanKunjunganDebitur(
    InformasiLainnyaViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tujuanKunjunganDebiturController,
      label: 'Tujuan Kunjungan Debitur',
      textCapitalization: TextCapitalization.words,
      enabled: false,
    );
  }

  // PopupMenuButton<String> _buildTujuanKunjunganDebitur(
  //   InformasiLainnyaViewModel viewModel,
  // ) {
  //   return PopupMenuButton(
  //     offset: Offset(0, 65.h),
  //     itemBuilder: (BuildContext context) {
  //       return [
  //         'Prakarsa Kredit',
  //       ].map<PopupMenuItem<String>>((value) {
  //         return PopupMenuItem(value: value, child: Text(value));
  //       }).toList();
  //     },
  //     onSelected: (String val) =>
  //         viewModel.updatetujuanKunjunganDebiturController(val),
  //     child: CustomTextField(
  //       textEditingController: viewModel.tujuanKunjunganDebiturController,
  //       label: 'Tujuan Kunjungan Debitur',
  //       hintText: 'Pilih Tujuan Kunjungan Debitur',
  //       withSuffixIcon: true,
  //       suffixIconImagePath: IconConstants.chevronDown,
  //       enabled: false,
  //       fillColor: Colors.white,
  //       validator: (value) => InputValidators.validateRequiredField(
  //         value,
  //         fieldType: 'Tujuan Kunjungan Debitur',
  //       ),
  //     ),
  //   );
  // }
}

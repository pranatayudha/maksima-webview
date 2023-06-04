import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../application/helpers/input_validators.dart';
import '../../../../../../application/models/community_branch_ritel.dart';
import '../../../../../shared/custom_textfield.dart';
import '../../../../../shared/custom_type_ahead_form_field.dart';
import '../../../../../shared/upload_item_button_ritel.dart';
import 'informasi_lainnya_pt_viewmodel.dart';

class InformasiLainnyaPtFormSection
    extends HookViewModelWidget<InformasiLainnyaPtViewModel> {
  const InformasiLainnyaPtFormSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiLainnyaPtViewModel viewModel,
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
                _buildFotoKunjungan(viewModel),
                _buildHasilKunjunganDebitur(viewModel),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _buildFotoKunjungan(InformasiLainnyaPtViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(
        viewModel.listUrlFotoKunjungan.length + 1,
        (index) {
          // ignore: prefer-conditional-expressions
          if (index == 0) {
            return Container(
              padding: EdgeInsets.only(
                bottom: 8.h,
                top: 16.0,
              ),
              child: Text(
                'Foto Kunjungan (minimal 3)',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          } else {
            return UploadItemButtonRitel(
              imageUrl: viewModel.listUrlPublicFotoKunjungan[index - 1],
              label: 'Foto Kunjungan $index',
              onPressed: viewModel.listUrlPublicFotoKunjungan[index - 1] == null
                  ? () {
                      viewModel.captureFotoKunjungan(
                        index - 1,
                      );
                    }
                  : () {
                      viewModel.clearFotoKunjungan(
                        index - 1,
                      );
                    },
              errorText: viewModel.listUrlPublicFotoKunjungan[index - 1] == null
                  ? viewModel.fotoKunjunganDuaErrorText
                  : null,
            );
          }
        },
      ),
    );
  }

  Widget _buildCbTerdekat(InformasiLainnyaPtViewModel viewModel) {
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
        fieldType: 'CB Terdekat *',
      ),
    );
  }

  CustomTextField _buildWaktuTempuh(InformasiLainnyaPtViewModel viewModel) {
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
    InformasiLainnyaPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.jenisProdukPinjamanController,
      label: 'Jenis Produk Pinjaman *',
      hintText: 'Pilih Jenis Produk Pinjaman',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildEstimasiNominalPinjaman(
    InformasiLainnyaPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.estimasiNominalPinjamanController,
      label: 'Pengajuan Plafond Pinjaman *',
      hintText: 'Pengajuan Plafond Pinjaman',
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
    InformasiLainnyaPtViewModel viewModel,
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
    InformasiLainnyaPtViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglKunjunganDebiturController,
      label: 'Tanggal Kunjungan Nasabah',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () => viewModel.selecttglKunjunganDebitur(context),
      fillColor: Colors.white,
      enabled: false,
      onSave: viewModel.updateTglKunjunganDebitur,
    );
  }

  CustomTextField _buildHasilKunjunganDebitur(
    InformasiLainnyaPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.hasilKunjunganDebiturController,
      label: 'Hasil Kunjungan Nasabah',
      hintText: 'Ceritakan Hasil Kunjungan Debitur',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateHasilKunjunganDebitur,
      onChanged: viewModel.updateHasilKunjunganDebitur,
    );
  }

  CustomTextField _buildTujuanKunjunganDebitur(
    InformasiLainnyaPtViewModel viewModel,
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

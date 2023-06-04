import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../application/helpers/date_time_picker.dart';
import '../../../../../../application/helpers/input_validators.dart';
import '../../../../../shared/custom_textfield.dart';
import 'informasi_lainnya_viewmodel.dart';

class InformasiLainnyaFormSection
    extends HookViewModelWidget<InformasiLainnyaPariViewModel> {
  const InformasiLainnyaFormSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiLainnyaPariViewModel viewModel,
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
                _buildRatingPari(viewModel),
                _buildFrekuensiTransaksi(viewModel),
                _buildJenisProdukPinjaman(viewModel),
                _buildNominalPengajuanAwal(viewModel),
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

  CustomTextField _buildCbTerdekat(InformasiLainnyaPariViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.cbTerdekatController,
      label: 'CB Terdekat *',
      enabled: false,
    );
  }

  CustomTextField _buildWaktuTempuh(InformasiLainnyaPariViewModel viewModel) {
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

  CustomTextField _buildRatingPari(
    InformasiLainnyaPariViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.ratingPariController,
      label: 'Rating Pari *',
      hintText: 'Pilih Rating Pari',
      keyboardType: TextInputType.number,
      enabled: false,
    );
  }

  CustomTextField _buildFrekuensiTransaksi(
    InformasiLainnyaPariViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.frekuensiTransaksiController,
      label: 'Frekuensi Transaksi di PARI *',
      hintText: 'Masukkan Frekuensi Transaksi',
      keyboardType: TextInputType.number,
      enabled: false,
    );
  }

  Widget _buildJenisProdukPinjaman(InformasiLainnyaPariViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.jenisProdukPinjamanController,
      label: 'Jenis Produk Pinjaman *',
      hintText: 'Pilih Jenis Produk Pinjaman',
      fillColor: Colors.grey.shade100,
      enabled: false,
    );
  }

  CustomTextField _buildNominalPengajuanAwal(
    InformasiLainnyaPariViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nominalPengajuanAwalController,
      label: 'Nominal Pengajuan Awal *',
      hintText: 'Masukkan Nominal Pengajuan Awal',
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      keyboardType: TextInputType.number,
      onSave: viewModel.updateNominalPengajuanAwal,
      onChanged: viewModel.updateNominalPengajuanAwal,
      withThousandsSeparator: true,
      withMaxLength: true,
      maxLength: 9,
      validator: (value) =>
          InputValidators.ritelValidateNominalPinjamanPARI(value, 1000000000),
    );
  }

  // PopupMenuButton<String> _buildTujuanKunjunganDebitur(
  //   InformasiLainnyaPariViewModel viewModel,
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

  CustomTextField _buildTujuanKunjunganDebitur(
    InformasiLainnyaPariViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tujuanKunjunganDebiturController,
      label: 'Tujuan Kunjungan Debitur',
      textCapitalization: TextCapitalization.words,
      enabled: false,
    );
  }

  CustomTextField _buildTagLocationKunjungan(
    InformasiLainnyaPariViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tagLocationKunjunganController,
      label: 'Tag Location Foto Kunjungan',
      hintText: 'Tag Location',
      textCapitalization: TextCapitalization.words,
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.location,
      onTap: viewModel.navigateToAddressSelectionViewLainnya,
      onSave: viewModel.updateTagLocation,
      onChanged: viewModel.updateTagLocation,
    );
  }

  CustomTextField _buildTanggalKunjunganDebitur(
    InformasiLainnyaPariViewModel viewModel,
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
    InformasiLainnyaPariViewModel viewModel,
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
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../../application/helpers/input_validators.dart';
import '../../../../../../../../../shared/custom_textfield.dart';
import '../../informasi_pinjaman_viewmodel_ritel.dart';

class InformasiPinjamanFormRitel
    extends HookViewModelWidget<InformasiPinjamanViewModel> {
  const InformasiPinjamanFormRitel({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPinjamanViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildJenisKreditRitel(viewModel),
        _buildJenisFasilitasRitel(viewModel),
        _buildTujuanPenggunaanRitel(viewModel),
        _buildSifatKreditRitel(viewModel),
        _buildBungaPinjamanRitel(viewModel),
        _buildJangkaWaktuFasilitasRitel(viewModel),
        _buildNominalPengajuanAwalRitel(viewModel),
      ],
    );
  }

  CustomTextField _buildJenisKreditRitel(InformasiPinjamanViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.jenisKreditRitelController,
      label: 'Jenis Kredit',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildJenisFasilitasRitel(
    InformasiPinjamanViewModel viewModel,
  ) {
    return CustomTextField(
      label: 'Jenis Fasilitas',
      textEditingController: viewModel.jenisFasilitasRitelController,
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildTujuanPenggunaanRitel(
    InformasiPinjamanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tujuanPenggunaanRitelController,
      keyboardType: TextInputType.multiline,
      textCapitalization: TextCapitalization.words,
      label: 'Tujuan Penggunaan',
      hintText: 'Masukkan Tujuan Penggunaan',
      onChanged: viewModel.updatetujuanPenggunaanRitelController,
      validator: (val) => InputValidators.validateRequiredField(
        val,
        fieldType: 'Tujuan Penggunaan',
      ),
    );
  }

  CustomTextField _buildSifatKreditRitel(InformasiPinjamanViewModel viewModel) {
    return CustomTextField(
      label: 'Sifat Kredit',
      textEditingController: viewModel.sifatKreditRitelController,
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  PopupMenuButton<String> _buildBungaPinjamanRitel(
    InformasiPinjamanViewModel viewModel,
  ) {
    return PopupMenuButton(
      offset: Offset(0, 65.h),
      itemBuilder: (BuildContext context) {
        return [
          '12.5 %',
          '12.75 %',
          '13 %',
          '14 %',
          '15 %',
          '16 %',
          '17 %',
          '18 %',
          '22.5 %',
        ].map<PopupMenuItem<String>>((value) {
          return PopupMenuItem(value: value, child: Text(value));
        }).toList();
      },
      onSelected: (String val) =>
          viewModel.updatebungaPinjamanRitelController(val),
      child: CustomTextField(
        textEditingController: viewModel.bungaPinjamanRitelController,
        // buat viewmodel khusus agunan
        label: 'Bunga Pinjaman',
        hintText: 'Pilih Bunga Pinjaman',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        fillColor: Colors.white,
        validator: (val) => InputValidators.validateRequiredField(
          val,
          fieldType: 'Bunga Pinjaman',
        ),
      ),
    );
  }

  PopupMenuButton<String> _buildJangkaWaktuFasilitasRitel(
    InformasiPinjamanViewModel viewModel,
  ) {
    return PopupMenuButton(
      offset: Offset(0, 65.h),
      itemBuilder: (BuildContext context) {
        return [
          '12 Bulan',
        ].map<PopupMenuItem<String>>((value) {
          return PopupMenuItem(value: value, child: Text(value));
        }).toList();
      },
      onSelected: (String val) =>
          viewModel.updatejangkaWaktuFasilitasRitelController(val),
      child: CustomTextField(
        textEditingController: viewModel.jangkaWaktuFasilitasRitelController,
        label: 'Jangka Waktu Fasilitas',
        hintText: 'Pilih Jangka Waktu Fasilitas',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        fillColor: Colors.white,
        validator: (val) => InputValidators.validateRequiredField(
          val,
          fieldType: 'Jangka Waktu Fasilitas',
        ),
      ),
    );
  }

  CustomTextField _buildNominalPengajuanAwalRitel(
    InformasiPinjamanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nominalPengajuanAwalRitelController,
      label: 'Nominal Pengajuan Awal',
      enabled: false,
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      fillColor: Colors.grey.shade100,
      withThousandsSeparator: true,
    );
  }
}

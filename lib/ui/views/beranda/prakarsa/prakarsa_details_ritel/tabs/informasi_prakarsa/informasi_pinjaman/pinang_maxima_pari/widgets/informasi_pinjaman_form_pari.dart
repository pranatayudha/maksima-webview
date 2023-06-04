import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../../application/helpers/input_validators.dart';
import '../../../../../../../../../shared/custom_textfield.dart';
import '../../informasi_pinjaman_viewmodel_ritel.dart';

class InformasiPinjamanFormPari
    extends HookViewModelWidget<InformasiPinjamanViewModel> {
  const InformasiPinjamanFormPari({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPinjamanViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildJenisKreditPari(viewModel),
        _buildJenisFasilitasPari(viewModel),
        _buildTujuanPenggunaanPari(viewModel),
        _buildSifatKreditPari(viewModel),
        _buildBungaPinjamanPari(viewModel),
        _buildJangkaWaktuFasilitasPari(viewModel),
        _buildNominalPengajuanAwalPari(viewModel),
      ],
    );
  }

  CustomTextField _buildJenisKreditPari(InformasiPinjamanViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.jenisKreditPariController,
      label: 'Jenis Kredit',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildJenisFasilitasPari(
    InformasiPinjamanViewModel viewModel,
  ) {
    return CustomTextField(
      label: 'Jenis Fasilitas',
      textEditingController: viewModel.jenisFasilitasPariController,
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildTujuanPenggunaanPari(
    InformasiPinjamanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tujuanPenggunaanPariController,
      label: 'Tujuan Penggunaan',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildSifatKreditPari(InformasiPinjamanViewModel viewModel) {
    return CustomTextField(
      label: 'Sifat Kredit',
      textEditingController: viewModel.sifatKreditPariController,
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildBungaPinjamanPari(
    InformasiPinjamanViewModel viewModel,
  ) {
    return CustomTextField(
      label: 'Bunga Pinjaman (dalam persen)',
      textEditingController: viewModel.bungaPinjamanPariController,
      enabled: true,
      withThousandsSeparator: true,
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.percentage,
      keyboardType: TextInputType.number,
      validator: (val) => InputValidators.validateRequiredField(
        val,
        fieldType: 'Bunga Pinjaman',
      ),
    );
  }

  PopupMenuButton<String> _buildJangkaWaktuFasilitasPari(
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
          viewModel.updatejangkaWaktuFasilitasPariController(val),
      child: CustomTextField(
        textEditingController: viewModel.jangkaWaktuFasilitasPariController,
        label: 'Jangka Waktu Fasilitas',
        hintText: 'Pilih Jangka Waktu Fasilitas',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        fillColor: Colors.white,
        validator: null,
      ),
    );
  }

  CustomTextField _buildNominalPengajuanAwalPari(
    InformasiPinjamanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nominalPengajuanAwalPariController,
      label: 'Nominal Pengajuan Awal',
      enabled: false,
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      fillColor: Colors.grey.shade100,
      withThousandsSeparator: true,
    );
  }
}

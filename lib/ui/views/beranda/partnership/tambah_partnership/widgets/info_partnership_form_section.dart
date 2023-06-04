import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../application/helpers/input_validators.dart';
import '../../../../../shared/custom_textfield.dart';
import '../tambah_partnership_viewmodel_ritel.dart';

class InfoPartnershipFormSectionRitel
    extends HookViewModelWidget<TambahPartnershipViewModelRitel> {
  const InfoPartnershipFormSectionRitel({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    TambahPartnershipViewModelRitel viewModel,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildNamaPartnership(viewModel),
          _buildNamaPIC(viewModel),
          _buildJabatanPIC(viewModel),
          _buildNomorHandphonePIC(viewModel),
          _buildEmailPIC(viewModel),
          _buildJenisKerjasama(viewModel),
          _buildLamaKerjasama(viewModel),
          if (viewModel.jenisKerjasamaController.text == 'PKS')
            _buildNomorPKS(viewModel),
        ],
      ),
    );
  }

  CustomTextField _buildNamaPartnership(TambahPartnershipViewModelRitel vm) {
    return CustomTextField(
      textEditingController: vm.namaPartnershipController,
      label: 'Nama Partner',
      hintText: 'Masukkan Nama Partner',
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.name,
      onSave: vm.updateNamaPartnership,
      onChanged: vm.updateNamaPartnership,
      validator: (value) =>
          InputValidators.validateName(value, fieldType: 'Nama Partnership'),
    );
  }

  CustomTextField _buildNamaPIC(TambahPartnershipViewModelRitel vm) {
    return CustomTextField(
      textEditingController: vm.namaPicController,
      label: 'Nama PIC Partner yang dihubungi',
      hintText: 'Masukkan Nama PIC Partner',
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.name,
      onSave: vm.updateNamaPIC,
      onChanged: vm.updateNamaPIC,
      validator: (value) =>
          InputValidators.validateName(value, fieldType: 'Nama PIC'),
    );
  }

  CustomTextField _buildJabatanPIC(TambahPartnershipViewModelRitel vm) {
    return CustomTextField(
      textEditingController: vm.jabatanPicController,
      label: 'Jabatan PIC',
      hintText: 'Masukan Jabatan PIC',
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Jabatan PIC',
      ),
    );
  }

  CustomTextField _buildEmailPIC(TambahPartnershipViewModelRitel vm) {
    return CustomTextField(
      textEditingController: vm.emailController,
      label: 'Email PIC',
      hintText: 'Masukkan Email PIC',
      keyboardType: TextInputType.emailAddress,
      onSave: vm.updateEmail,
      onChanged: vm.updateEmail,
      validator: (value) => InputValidators.validateEmail(value),
    );
  }

  CustomTextField _buildNomorHandphonePIC(TambahPartnershipViewModelRitel vm) {
    return CustomTextField(
      textEditingController: vm.nomorHpPicController,
      label: 'Nomor Handphone PIC',
      prefixText: '+62 ',
      onSave: vm.updateNomorHpPIC,
      onChanged: vm.updateNomorHpPIC,
      keyboardType: TextInputType.number,
      validator: (value) => InputValidators.validateMobileNumber(value),
    );
  }

  PopupMenuButton<String> _buildJenisKerjasama(
    TambahPartnershipViewModelRitel vm,
  ) {
    return PopupMenuButton(
      offset: Offset(0, 65.h),
      itemBuilder: (BuildContext context) {
        return [
          'PKS',
          'Non PKS',
        ].map<PopupMenuItem<String>>((value) {
          return PopupMenuItem(value: value, child: Text(value));
        }).toList();
      },
      onSelected: (String val) => vm.updateJenisKerjasamaController(val),
      child: CustomTextField(
        textEditingController: vm.jenisKerjasamaController,
        label: 'Jenis Kerjasama',
        hintText: 'Pilih Jenis Kerjasama',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        fillColor: Colors.white,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Jenis Kerjasama',
        ),
      ),
    );
  }

  PopupMenuButton<String> _buildLamaKerjasama(
    TambahPartnershipViewModelRitel vm,
  ) {
    return PopupMenuButton(
      offset: Offset(0, 65.h),
      itemBuilder: (BuildContext context) {
        return [
          '0 - 1 Thn',
          '> 1 - 2 Thn',
          '> 2 Thn',
        ].map<PopupMenuItem<String>>((value) {
          return PopupMenuItem(value: value, child: Text(value));
        }).toList();
      },
      onSelected: (String val) => vm.updateLamaKerjasamaController(val),
      child: CustomTextField(
        textEditingController: vm.lamaKerjasamaController,
        label: 'Lama Kerjasama',
        hintText: 'Pilih Lama Kerjasama',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        fillColor: Colors.white,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Lama Kerjasama',
        ),
      ),
    );
  }

  CustomTextField _buildNomorPKS(TambahPartnershipViewModelRitel vm) {
    return CustomTextField(
      textEditingController: vm.nomorPKSController,
      label: 'Nomor Perjanjian Kerjasama (PKS)',
      hintText: 'Masukkan Nomor PKS',
      onSave: vm.updateNomorPKS,
      onChanged: vm.updateNomorPKS,
      validator: (value) => InputValidators.validateRequiredField(value),
    );
  }
}

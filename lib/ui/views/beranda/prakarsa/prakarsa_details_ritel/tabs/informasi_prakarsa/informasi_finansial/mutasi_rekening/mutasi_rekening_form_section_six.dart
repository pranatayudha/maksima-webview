import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../application/helpers/date_time_picker.dart';
import '../../../../../../../../../application/helpers/input_validators.dart';
import '../../../../../../../../shared/custom_textfield.dart';
import '../../../../../../../../shared/styles.dart';
import '../../../../../../../../shared/upload_item_button_url.dart';
import 'mutasi_rekening_form_viewmodel.dart';

class MutasiRekeningFormSectionSix
    extends HookViewModelWidget<MutasiRekeningFormViewModel> {
  const MutasiRekeningFormSectionSix({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    MutasiRekeningFormViewModel viewModel,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mutasi 6', style: tsHeading10),
              if (viewModel.count == 6)
                GestureDetector(
                  onTap: () => viewModel.deleteMutasi(5),
                  child: Text(
                    'Hapus mutasi',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.lightBlue,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              _buildPeriodeAwal(context, viewModel),
              SizedBox(
                width: 15.w,
              ),
              _buildPeriodeAkhir(context, viewModel),
            ],
          ),
          _buildSaldoAwal(viewModel),
          _buildTotalMutasiDebet(viewModel),
          _buildTotalMutasiKredit(viewModel),
          _buildTotalAkhirTiapBulan(viewModel),
          _buildUploadBukti(viewModel),
        ],
      ),
    );
  }

  Expanded _buildPeriodeAwal(
    BuildContext context,
    MutasiRekeningFormViewModel vm,
  ) {
    return Expanded(
      child: CustomTextField(
        textEditingController: vm.periodeAwalSixController,
        label: 'Periode Awal',
        hintText: 'Pilih Tanggal',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.calendar,
        onTap: () async {
          String date = await DateTimePicker.showingDatePicker(context);
          vm.updatePeriodeAwalSix(date);
        },
        enabled: false,
        fillColor: Colors.white,
        onSave: vm.updatePeriodeAwalSix,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Periode Awal',
        ),
      ),
    );
  }

  Expanded _buildPeriodeAkhir(
    BuildContext context,
    MutasiRekeningFormViewModel vm,
  ) {
    return Expanded(
      child: CustomTextField(
        textEditingController: vm.periodeAkhirSixController,
        label: 'Periode Akhir',
        hintText: 'Pilih Tanggal',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.calendar,
        onTap: () async {
          String date = await DateTimePicker.showingDatePicker(context);
          vm.updatePeriodeAkhirSix(date);
        },
        enabled: false,
        fillColor: Colors.white,
        onSave: vm.updatePeriodeAkhirSix,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Periode Akhir',
        ),
      ),
    );
  }

  CustomTextField _buildTotalMutasiDebet(MutasiRekeningFormViewModel vm) {
    return CustomTextField(
      textEditingController: vm.totalMutasiDebetSixController,
      label: 'Total Mutasi Debet',
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      withThousandsSeparator: true,
      keyboardType: TextInputType.number,
      onSave: vm.updateTotalMutasiDebetSix,
      onChanged: vm.updateTotalMutasiDebetSix,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Total Mutasi Debet',
      ),
    );
  }

  UploadItemButtonUrl _buildUploadBukti(
      MutasiRekeningFormViewModel vm,) {
    return UploadItemButtonUrl(
      url: vm.fileBuktiMutasiSixUrlPublic,
      path: 'Bukti Mutasi 6',
      label: 'Bukti Mutasi',
      onPressed:
          vm.fileBuktiMutasiSixUrlPublic == ''
          ? vm.pickFileSix
          : vm.clearFileSix,
      errorText: vm.fileBuktiMutasiSixErrorText,
    );
  }

  CustomTextField _buildTotalMutasiKredit(MutasiRekeningFormViewModel vm) {
    return CustomTextField(
      textEditingController: vm.totalMutasiKreditSixController,
      label: 'Total Mutasi Kredit',
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      withThousandsSeparator: true,
      keyboardType: TextInputType.number,
      onSave: vm.updateTotalMutasiKreditSix,
      onChanged: vm.updateTotalMutasiKreditSix,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Total Mutasi Kredit',
      ),
    );
  }

  CustomTextField _buildTotalAkhirTiapBulan(MutasiRekeningFormViewModel vm) {
    return CustomTextField(
      textEditingController: vm.totalAkhirTiapBulanSixController,
      label: 'Total Akhir Tiap Bulan',
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      withThousandsSeparator: true,
      enabled: false,
    );
  }

  CustomTextField _buildSaldoAwal(MutasiRekeningFormViewModel vm) {
    return CustomTextField(
      textEditingController: vm.saldoAwalSixController,
      label: 'Saldo Awal',
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      withThousandsSeparator: true,
      keyboardType: TextInputType.number,
      onSave: vm.updateSaldoAwalSix,
      onChanged: vm.updateSaldoAwalSix,
      validator: (value) =>
          InputValidators.validateRequiredField(value, fieldType: 'Saldo Awal'),
    );
  }
}

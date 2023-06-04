import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../application/helpers/date_time_picker.dart';
import '../../../../../../../../../application/helpers/input_validators.dart';
import '../../../../../../../../shared/custom_textfield.dart';
import '../../../../../../../../shared/styles.dart';
import '../../../../../../../../shared/upload_item_button_with_container.dart';
import 'mutasi_rekening_pari_form_viewmodel.dart';

class MutasiRekeningPariFormSection
    extends HookViewModelWidget<MutasiRekeningPariFormViewModel> {
  const MutasiRekeningPariFormSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    MutasiRekeningPariFormViewModel viewModel,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mutasi 1', style: tsHeading10),
              // GestureDetector(
              //   onTap: () {},
              //   child: Text(
              //     'Hapus mutasi',
              //     style: TextStyle(
              //       fontSize: 14.sp,
              //       fontWeight: FontWeight.bold,
              //       color: CustomColor.lightBlue,
              //     ),
              //   ),
              // ),
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
          viewModel.loadUploadMutasiOne == 0
              ? _buildUploadBukti(viewModel)
              : viewModel.loadUploadMutasiOne == 1
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _buildUploadBukti(viewModel),
        ],
      ),
    );
  }

  Expanded _buildPeriodeAwal(
    BuildContext context,
    MutasiRekeningPariFormViewModel vm,
  ) {
    return Expanded(
      child: CustomTextField(
        textEditingController: vm.periodeAwalController,
        label: 'Periode Awal',
        hintText: 'Pilih Tanggal',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.calendar,
        onTap: () async {
          String date = await DateTimePicker.showingDatePicker(context);
          vm.updatePeriodeAwal(date);
        },
        enabled: false,
        fillColor: Colors.white,
        onSave: vm.updatePeriodeAwal,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Periode Awal',
        ),
      ),
    );
  }

  Expanded _buildPeriodeAkhir(
    BuildContext context,
    MutasiRekeningPariFormViewModel vm,
  ) {
    return Expanded(
      child: CustomTextField(
        textEditingController: vm.periodeAkhirController,
        label: 'Periode Akhir',
        hintText: 'Pilih Tanggal',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.calendar,
        onTap: () async {
          String date = await DateTimePicker.showingDatePicker(context);
          vm.updatePeriodeAkhir(date);
        },
        enabled: false,
        fillColor: Colors.white,
        onSave: vm.updatePeriodeAkhir,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Periode Akhir',
        ),
      ),
    );
  }

  CustomTextField _buildTotalMutasiDebet(MutasiRekeningPariFormViewModel vm) {
    return CustomTextField(
      textEditingController: vm.totalMutasiDebetController,
      label: 'Total Mutasi Debet',
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      withThousandsSeparator: true,
      keyboardType: TextInputType.number,
      onSave: vm.updateTotalMutasiDebet,
      onChanged: vm.updateTotalMutasiDebet,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Total Mutasi Debet',
      ),
    );
  }

  UploadItemButtonWithContainer _buildUploadBukti(
    MutasiRekeningPariFormViewModel vm,
  ) {
    return UploadItemButtonWithContainer(
      file: vm.fileBuktiMutasi,
      path: 'Bukti Mutasi 1',
      label: 'Bukti Mutasi',
      onPressed: vm.fileBuktiMutasi == null ? vm.pickFile : vm.clearFile,
      errorText: vm.fileBuktiMutasiErrorText,
    );
  }

  CustomTextField _buildTotalMutasiKredit(MutasiRekeningPariFormViewModel vm) {
    return CustomTextField(
      textEditingController: vm.totalMutasiKreditController,
      label: 'Total Mutasi Kredit',
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      withThousandsSeparator: true,
      keyboardType: TextInputType.number,
      onSave: vm.updateTotalMutasiKredit,
      onChanged: vm.updateTotalMutasiKredit,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Total Mutasi Kredit',
      ),
    );
  }

  CustomTextField _buildTotalAkhirTiapBulan(
    MutasiRekeningPariFormViewModel vm,
  ) {
    return CustomTextField(
      textEditingController: vm.totalAkhirTiapBulanController,
      label: 'Total Akhir Tiap Bulan',
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      withThousandsSeparator: true,
      enabled: false,
    );
  }

  CustomTextField _buildSaldoAwal(MutasiRekeningPariFormViewModel vm) {
    return CustomTextField(
      textEditingController: vm.saldoAwalController,
      label: 'Saldo Awal',
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      withThousandsSeparator: true,
      keyboardType: TextInputType.number,
      onSave: vm.updateSaldoAwal,
      onChanged: vm.updateSaldoAwal,
      validator: (value) =>
          InputValidators.validateRequiredField(value, fieldType: 'Saldo Awal'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../application/helpers/date_time_picker.dart';
import '../../../../../../../../../application/helpers/input_validators.dart';
import '../../../../../../../../shared/custom_textfield.dart';
import '../informasi_agunan_tambahan/widgets/informasi_agunan_tambahan_upload_button.dart';
import 'informasi_agunan_lkn_form_viewmodel.dart';

class InformasiAgunanLKNFormSection
    extends HookViewModelWidget<InformasiAgunanLknFormViewModel> {
  const InformasiAgunanLKNFormSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiAgunanLknFormViewModel viewModel,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      margin: EdgeInsets.only(bottom: 24.h),
      child: Form(
        key: viewModel.formKey,
        autovalidateMode: viewModel.autoValidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.h),
            _buildListCbTerdekat(viewModel),
            _buildWaktuTempuhLokasiNasabah(viewModel),
            _buildListJesnisProdukPinjaman(viewModel),
            _buildEstimasiNominalPlafond(viewModel),
            _buildTujuanKunjunganNasabah(viewModel),
            _buildMasukkanTanggalKunjunganNasabah(viewModel, context),
            _buildTagLocationKunjungan(viewModel),

            _buildUploadFotoKunjungan(viewModel),
            // _buildUploadFotoKunjungan1(viewModel),
            // _buildUploadFotoKunjungan2(viewModel),
            _buildHasilKunjunganNasabah(viewModel),
          ],
        ),
      ),
    );
  }

  Column _buildUploadFotoKunjungan(InformasiAgunanLknFormViewModel vm) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(
        vm.listFotoKunjunganFilePublicUrl.length + 1,
        (index) {
          // ignore: prefer-conditional-expressions
          if (index == 0) {
            return Container(
              padding: EdgeInsets.only(
                bottom: 8.h,
                top: 16.0,
              ),
              child: Text(
                'Foto Kunjungan * (minimal 3)',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          } else {
            return InformasiAgunanTambahanUploadButton(
              urlPrivate: vm.listFotoKunjunganFileUrl[index - 1],
              urlPublic: vm.listFotoKunjunganFilePublicUrl[index - 1],
              label: 'Foto Kunjungan $index',
              onPressed: vm.listFotoKunjunganFilePublicUrl[index - 1] == null
                  ? () {
                      vm.captureFotoKunjungan(
                        index - 1,
                      );
                    }
                  : () {
                      vm.clearFotoKunjungan(
                        index - 1,
                      );
                    },
              errorText: null,
            );
          }
        },
      ),
    );
  }

  // Widget _buildListCbTerdekat(InformasiAgunanLknFormViewModel viewModel) {
  //   return CustomTypeAheadFormField<CommunityBranchRitel>(
  //     label: 'CB Terdekat *',
  //     controller: viewModel.cbTerdekatController,
  //     onClear: viewModel.clearCommunityBranch,
  //     onFilter: viewModel.filterCommunityBranch,
  //     onSuggestionSelected: viewModel.updateCommunityBranch,
  //     itemBuilder: (context, suggestion) {
  //       return ListTile(title: Text(suggestion.name!));
  //     },
  //     validator: (value) => InputValidators.validateRequiredField(
  //       value,
  //       fieldType: 'CB Terdekat',
  //     ),
  //   );
  // }

  PopupMenuButton<String> _buildListCbTerdekat(
    InformasiAgunanLknFormViewModel viewModel,
  ) {
    return PopupMenuButton(
      offset: Offset(0, 65.h),
      itemBuilder: (BuildContext context) {
        return [].map<PopupMenuItem<String>>((value) {
          return PopupMenuItem(value: value, child: Text(value.name));
        }).toList();
      },
      onSelected: (String val) => {},
      child: CustomTextField(
        fillColor: Colors.grey.shade100,
        textEditingController: viewModel.cbTerdekatController,
        label: 'CB Terdekat *',
        // hintText: 'Pilih Sub Sektor Ekonomi',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        validator: null,
      ),
    );
  }

  CustomTextField _buildWaktuTempuhLokasiNasabah(
    InformasiAgunanLknFormViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.waktuTempuhLokasiController,
      label: 'Waktu Tempuh Lokasi Usaha dari Community Branch *',
      hintText: 'Masukkan Waktu Tempuh',
      suffixText: 'menit',
      onSave: viewModel.updatewaktuTempuhLokasiController,
      onChanged: viewModel.updatewaktuTempuhLokasiController,
      keyboardType: TextInputType.number,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Waktu Tempuh',
      ),
    );
  }

  CustomTextField _buildListJesnisProdukPinjaman(
    InformasiAgunanLknFormViewModel vm,
  ) {
    return CustomTextField(
      textEditingController: vm.jenisProdukPinjamanController,
      label: 'Jenis Produk Pinjaman *',
      enabled: false,
      fillColor: Colors.grey.shade100,
    );
  }

  CustomTextField _buildEstimasiNominalPlafond(
    InformasiAgunanLknFormViewModel vm,
  ) {
    return CustomTextField(
      textEditingController: vm.estiMasiNominalPinjamanController,
      label: vm.codeTable == 2
          ? 'Estimasi Nominal Plafond Pinjaman *'
          : 'Nominal Pengajuan Awal *',
      hintText: vm.codeTable == 2
          ? 'Masukkan NominalPlafond Pinjaman'
          : 'Masukkan Nominal Pengajuan Awal',
      prefixText: 'Rp. ',
      withThousandsSeparator: true,
      keyboardType: TextInputType.number,
      onSave: vm.ritelLaporanKunjunganNasabah == null
          ? vm.updateeestiMasiNominalPinjamanController
          : null,
      onChanged: vm.ritelLaporanKunjunganNasabah == null
          ? vm.updateeestiMasiNominalPinjamanController
          : null,
      validator: (value) => vm.ritelLaporanKunjunganNasabah == null
          ? InputValidators.validateRequiredField(
              value,
              fieldType: 'Nominal Pengajuan Awal',
            )
          : null,
      enabled: vm.ritelLaporanKunjunganNasabah == null ? true : false,
      fillColor: vm.ritelLaporanKunjunganNasabah == null
          ? Colors.white
          : Colors.grey.shade100,
    );
  }

  CustomTextField _buildTujuanKunjunganNasabah(
    InformasiAgunanLknFormViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tujuanKunjunganNasabahController,
      label: 'Tujuan Kunjungan Nasabah *',
      textCapitalization: TextCapitalization.words,
      enabled: false,
    );
  }

  // PopupMenuButton<String> _buildTujuanKunjunganNasabah(
  //   InformasiAgunanLknFormViewModel viewModel,
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
  //         viewModel.updatetujuanKunjunganNasabahController(val),
  //     child: CustomTextField(
  //       textEditingController: viewModel.tujuanKunjunganNasabahController,
  //       label: 'Tujuan Kunjungan Nasabah *',
  //       hintText: 'Pilih Tujuan Kunjungan Nasabah',
  //       withSuffixIcon: true,
  //       suffixIconImagePath: IconConstants.chevronDown,
  //       enabled: false,
  //       // enabled: viewModel.codeTable == 2 ? true : false,
  //       fillColor:
  //           viewModel.codeTable == 2 ? Colors.white : Colors.grey.shade100,
  //       validator: (value) => InputValidators.validateRequiredField(
  //         value,
  //         fieldType: 'Tujuan Kunjungan Nasabah',
  //       ),
  //     ),
  //   );
  // }

  Widget _buildMasukkanTanggalKunjunganNasabah(
    InformasiAgunanLknFormViewModel vm,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          textEditingController: vm.tanggalKunjunganNasabahController,
          label: 'Tanggal Kunjungan Nasabah *',
          // labelSize: 12.sp,
          hintText: 'Masukkan Tgl. Kunjungan Nasabah',
          withSuffixIcon: true,
          suffixIconImagePath: IconConstants.calendar,
          onTap: () async {
            String date = await DateTimePicker.showingDatePicker(context);
            vm.updatettanggalKunjunganNasabahController(date);
          },
          enabled: vm.codeTable == 2 ? true : false,
          fillColor: Colors.white,
          onSave: vm.updatettanggalKunjunganNasabahController,
          validator: (value) => InputValidators.validateRequiredField(
            value,
            fieldType: 'Tanggal Kunjungan Nasabah',
          ),
        ),
      ],
    );
  }

  CustomTextField _buildTagLocationKunjungan(
    InformasiAgunanLknFormViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.isLoadingGetAddress
          ? TextEditingController(text: 'Memuat data alamat...')
          : viewModel.tagLocationKunjunganController,
      label: 'Tag Location Foto Kunjungan *',
      hintText: 'Tag Location',
      textCapitalization: TextCapitalization.words,
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.location,
      onTap: viewModel.navigateToAddressSelectionViewKunjungan,
      onSave: viewModel.updateAlamatKunjungan,
      onChanged: viewModel.updateAlamatKunjungan,
      enabled: viewModel.isLoadingGetAddress ? false : true,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Tag Location',
      ),
    );
  }

  CustomTextField _buildHasilKunjunganNasabah(
    InformasiAgunanLknFormViewModel viewModel,
  ) {
    return CustomTextField(
      withObscureIcon: false,
      keyboardType: TextInputType.multiline,
      textEditingController: viewModel.hasilKunjunganNasabahController,
      label: 'Hasil Kunjungan Nasabah *',
      hintText: 'Ceritakan Hasil Kunjungan Nasabah',
      textCapitalization: TextCapitalization.words,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Hasil Kunjungan Nasabah',
      ),
    );
  }
}

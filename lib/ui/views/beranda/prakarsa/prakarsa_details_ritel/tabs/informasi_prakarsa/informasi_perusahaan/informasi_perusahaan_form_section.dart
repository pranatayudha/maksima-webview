import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../../../application/app/constants/common.dart';
import '../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../application/helpers/date_time_picker.dart';
import '../../../../../../../../application/helpers/input_validators.dart';
import '../../../../../../../shared/custom_textfield.dart';
import '../../../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_perusahaan_viewmodel.dart';

class InformasiPerusahaanFormSection
    extends HookViewModelWidget<InformasiPerusahaanViewModelRitel> {
  final int codeTable;

  const InformasiPerusahaanFormSection(this.codeTable, {Key? key})
      : super(key: key);

  @override
  // ignore: long-method
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPerusahaanViewModelRitel viewModel,
  ) {
    viewModel.jenisDebiturController.text =
        'Perusahaan - ${Common.CodeTable.names[codeTable]}';

    CustomTextField buildJenisDebitur() {
      return CustomTextField(
        fillColor: Colors.grey.shade100,
        textEditingController: viewModel.jenisDebiturController,
        label: 'Jenis Debitur *',
        hintText: 'Masukkan Jenis Debitur',
        textCapitalization: TextCapitalization.words,
        enabled: false,
      );
    }

    CustomTextField buildNamaPerusahaan() {
      return CustomTextField(
        fillColor: Colors.grey.shade100,
        textEditingController: viewModel.namaPerusahaanController,
        label: 'Nama Perusahaan *',
        hintText: 'Masukkan Nama Perusahaan',
        textCapitalization: TextCapitalization.words,
        enabled: false,
      );
    }

    CustomTextField buildNPWPPerusahaan() {
      return CustomTextField(
        fillColor: Colors.grey.shade100,
        textEditingController: viewModel.nomorNpwpPerusahaanController,
        label: 'NPWP Perusahaan *',
        hintText: 'Masukkan Nomor NPWP Perusahaan',
        keyboardType: TextInputType.number,
        enabled: false,
      );
    }

    PopupMenuButton<String> buildSektorEkonomi() {
      return PopupMenuButton(
        offset: Offset(0, 65.h),
        itemBuilder: (BuildContext context) {
          return [].map<PopupMenuItem<String>>((value) {
            return PopupMenuItem(value: value.name, child: Text(value.name));
          }).toList();
        },
        onSelected: (String val) => {},
        child: CustomTextField(
          fillColor: Colors.grey.shade100,
          textEditingController: viewModel.sektorController,
          label: 'Sektor Ekonomi *',
          hintText: 'Pilih Sektor Ekonomi',
          withSuffixIcon: true,
          suffixIconImagePath: IconConstants.chevronDown,
          enabled: false,
          validator: null,
        ),
      );
    }

    PopupMenuButton<String> buildSubSektorEkonomi() {
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
          textEditingController: viewModel.subSektorController,
          label: 'Sub Sektor Ekonomi *',
          hintText: 'Pilih Sub Sektor Ekonomi',
          withSuffixIcon: true,
          suffixIconImagePath: IconConstants.chevronDown,
          enabled: false,
          validator: null,
        ),
      );
    }

    CustomTextField buildAlamatUsaha() {
      return CustomTextField(
        textEditingController: viewModel.alamatPerushaanController,
        label: 'Tag Location Alamat Perusahaan *',
        hintText: 'Tag Location Usaha',
        textCapitalization: TextCapitalization.words,
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.location,
        enabled: false,
        fillColor: Colors.grey.shade100,
      );
    }

    CustomTextField buildDetailAlamatUsaha() {
      return CustomTextField(
        textEditingController: viewModel.detailAlamatPerusahaanController,
        label: 'Alamat Usaha *',
        hintText: 'Masukan Alamat Usaha',
        keyboardType: TextInputType.text,
        enabled: false,
        fillColor: Colors.grey.shade100,
      );
    }

    CustomTextField buildTempatAktapendirian() {
      return CustomTextField(
        textEditingController: viewModel.detailTempatAktaPendirianController,
        label: 'Tempat Akta Pendirian *',
        hintText: 'Masukan Tempat Akta Pendirian',
        keyboardType: TextInputType.text,
        enabled: false,
        fillColor: Colors.grey.shade100,
      );
    }

    CustomTextField buildTempatAktaperubahan() {
      return CustomTextField(
        textEditingController: viewModel.detailTempatAktaPerubahaanController,
        label: 'Tempat Akta Perubahan Terakhir *',
        hintText: 'Masukan Tempat Akta Perubahan Terakhir ',
        keyboardType: TextInputType.text,
        enabled: false,
        fillColor: Colors.grey.shade100,
      );
    }

    Widget buildKodePos() {
      return CustomTextField(
        textEditingController: viewModel.postalCodeAlamatPerusahaanController,
        label: 'Kode Pos *',
        hintText: 'Masukan Kode Pos',
        keyboardType: TextInputType.number,
        enabled: false,
        fillColor: Colors.grey.shade100,
      );
    }

    Expanded buildKecamatan() {
      return Expanded(
        child: CustomTextField(
          textEditingController: viewModel.districtAlamatPerusahaanController,
          label: 'Kecamatan * ',
          hintText: 'Kecamatan',
          keyboardType: TextInputType.text,
          enabled: false,
          fillColor: Colors.grey.shade100,
        ),
      );
    }

    Expanded buildKelurahan() {
      return Expanded(
        child: CustomTextField(
          textEditingController: viewModel.villageAlamatPerusahaanController,
          label: 'Kelurahan *',
          hintText: 'Kelurahan',
          keyboardType: TextInputType.text,
          enabled: false,
          fillColor: Colors.grey.shade100,
        ),
      );
    }

    Expanded buildRT() {
      return Expanded(
        child: CustomTextField(
          textEditingController: viewModel.rtAlamatPerusahaanController,
          label: 'RT',
          hintText: 'cth. 005',
          keyboardType: TextInputType.number,
          enabled: false,
          fillColor: Colors.grey.shade100,
        ),
      );
    }

    Expanded buildRW() {
      return Expanded(
        child: CustomTextField(
          textEditingController: viewModel.rwAlamatPerusahaanController,
          label: 'RW',
          hintText: 'cth. 006',
          keyboardType: TextInputType.number,
          enabled: false,
          fillColor: Colors.grey.shade100,
        ),
      );
    }

    CustomTextField buildTanggalAktaPendirian() {
      return CustomTextField(
        textEditingController: viewModel.tglAktaPendirianController,
        label: 'Tanggal Akta Pendirian *',
        hintText: 'DD/MM/YYYY',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.calendar,
        enabled: false,
        fillColor: Colors.grey.shade100,
      );
    }

    CustomTextField buildNoAktaPendirian() {
      return CustomTextField(
        textEditingController: viewModel.nomorAktaPendirianController,
        label: 'No. Akta Pendirian *',
        hintText: 'Masukkan No. Akta Pendirian',
        keyboardType: TextInputType.number,
        enabled: false,
        fillColor: Colors.grey.shade100,
      );
    }

    CustomTextField buildTanggalSKKumham() {
      return CustomTextField(
        textEditingController: viewModel.tglSKkumhamPendirianController,
        label: 'Tanggal SK Kumham Pendirian *',
        hintText: 'DD/MM/YYYY',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.calendar,
        enabled: true,
        validator: (val) => InputValidators.validateRequiredField(
          val,
          fieldType: 'Tanggal SK Kumham Pendirian',
        ),
        onTap: () async {
          String date = await DateTimePicker.showingDatePicker(context);
          viewModel.tglSKkumhamPendirianController.text = date.trim();
        },
      );
    }

    CustomTextField buildNoSKKumham() {
      return CustomTextField(
        textEditingController: viewModel.nomorSKkumhamPendirianController,
        label: 'No. SK Kumham Pendirian *',
        hintText: 'Masukkan No. SK Kumham',
        keyboardType: TextInputType.text,
        validator: (val) => InputValidators.validateRequiredField(
          val,
          fieldType: 'No. SK Kumham Pendirian',
        ),
      );
    }

    CustomTextField buildTanggalAktaPerubahan() {
      return CustomTextField(
        textEditingController: viewModel.tglAktaPerubahanTerakhirController,
        label: 'Tanggal Akta Perubahan Terakhir *',
        hintText: 'DD/MM/YYYY',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.calendar,
        enabled: false,
        fillColor: Colors.grey.shade100,
      );
    }

    CustomTextField buildNoAktaPerubahan() {
      return CustomTextField(
        textEditingController: viewModel.nomorAktaPerubahanTerakhirController,
        label: 'No. Akta Perubahan Terakhir *',
        hintText: 'Masukkan No. Akta Perubahan',
        keyboardType: TextInputType.text,
        enabled: false,
        fillColor: Colors.grey.shade100,
      );
    }

    CustomTextField buildTanggalSKKumhamPerubahan() {
      return CustomTextField(
        textEditingController: viewModel.tglSKkumhamPerubahanTerakhirController,
        label: 'Tanggal SK Kumham Perubahan Terakhir *',
        hintText: 'DD/MM/YYYY',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.calendar,
        validator: (val) => InputValidators.validateRequiredField(
          val,
          fieldType: 'Tanggal SK Kumham Perubahan Terakhir',
        ),
        onTap: () async {
          String date = await DateTimePicker.showingDatePicker(context);
          viewModel.tglSKkumhamPerubahanTerakhirController.text = date.trim();
        },
      );
    }

    CustomTextField buildNoSKKumhamPerubahan() {
      return CustomTextField(
        textEditingController:
            viewModel.nomorSKkumhamPerubahanTerakhirController,
        label: 'No. SK Kumham Perubahan Terakhir *',
        hintText: 'Masukkan No. SK Kumham',
        keyboardType: TextInputType.text,
        validator: (val) => InputValidators.validateRequiredField(
          val,
          fieldType: 'No. SK Kumham Perubahan Terakhir',
        ),
      );
    }

    CustomTextField buildNamaLengkapPIC() {
      return CustomTextField(
        textEditingController: viewModel.namaLengkapPicController,
        label: 'Nama Lengkap PIC *',
        hintText: 'Masukkan Nama Lengkap PIC',
        textCapitalization: TextCapitalization.words,
        enabled: false,
        fillColor: Colors.grey.shade100,
      );
    }

    CustomTextField buildNomorHandphone() {
      return CustomTextField(
        textEditingController: viewModel.noHpPicController,
        label: 'Nomor Handphone PIC *',
        prefixText: '+62 ',
        hintText: 'Masukkan Nomor Handphone PIC',
        keyboardType: TextInputType.number,
        enabled: false,
        fillColor: Colors.grey.shade100,
      );
    }

    CustomTextField buildEmail() {
      return CustomTextField(
        enabled: true,
        textEditingController: viewModel.emailPicController,
        label: 'Email *',
        hintText: 'Masukkan Email PIC',
        keyboardType: TextInputType.emailAddress,
        validator: (value) => InputValidators.validateEmail(value),
      );
    }

    return Form(
      key: viewModel.formKey,
      autovalidateMode: viewModel.autoValidateMode,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                buildJenisDebitur(),
                buildNamaPerusahaan(),
                buildNPWPPerusahaan(),
                buildSektorEkonomi(),
                buildSubSektorEkonomi(),
                buildAlamatUsaha(),
                buildDetailAlamatUsaha(),
                buildKodePos(),
                Row(
                  children: [
                    buildKecamatan(),
                    SizedBox(width: 15.w),
                    buildKelurahan(),
                  ],
                ),
                Row(
                  children: [
                    buildRT(),
                    SizedBox(width: 15.w),
                    buildRW(),
                  ],
                ),
              ],
            ),
          ),
          const ThickLightGreyDivider(),
          Container(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                buildTanggalAktaPendirian(),
                buildNoAktaPendirian(),
                buildTempatAktapendirian(),
                buildTanggalSKKumham(),
                buildNoSKKumham(),
                buildTanggalAktaPerubahan(),
                buildNoAktaPerubahan(),
                buildTempatAktaperubahan(),
                buildTanggalSKKumhamPerubahan(),
                buildNoSKKumhamPerubahan(),
                buildNamaLengkapPIC(),
                buildNomorHandphone(),
                buildEmail(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../application/helpers/input_validators.dart';
import '../../../../../shared/custom_textfield.dart';
import 'informasi_perusahaan_pt_viewmodel.dart';

class InformasiPerusahaanPtFormSection1
    extends HookViewModelWidget<InformasiPerusahaanPtViewModel> {
  const InformasiPerusahaanPtFormSection1({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPerusahaanPtViewModel viewModel,
  ) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                _buildTanggalAktaPendirian(viewModel, context),
                _buildNomorAktaPendirian(viewModel),
                _buildDetailTempatAktaPendirianPerusahaanPt(viewModel),
                _buildTanggalSKkumhamPendirian(viewModel, context),
                _buildNomorSKkumhamPendirian(viewModel),
                _buildSwitchAkta(viewModel),
                _buildTanggalAktaPerubahaanTerakhir(viewModel, context),
                _buildNomorAktaPerubahaanTerakhir(viewModel),
                _buildDetailTempatAktaPerubahaanTerakhir(viewModel),
                _buildTanggalSKkumhamPerubahaanTerakhir(viewModel, context),
                _buildNomorSKkumhamPerubahaan(viewModel),
                _buildNamaLengkapPic(viewModel),
                _buildNomorHandphone(viewModel),
                _buildEmailPic(viewModel),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildSwitchAkta(InformasiPerusahaanPtViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          const Expanded(
            flex: 5,
            child: Text(
              'Akta Perubahan Sama Dengan Akta Pendirian',
              style: TextStyle(
                fontSize: 14,
                color: CustomColor.darkGrey,
              ),
            ),
          ),
          Expanded(
            child: Transform.scale(
              scale: 0.8,
              child: CupertinoSwitch(
                activeColor: CustomColor.secondaryBlue,
                value: viewModel.valueAktaPerubahaan,
                onChanged: (bool value) {
                  viewModel.updateFunction(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  CustomTextField _buildTanggalAktaPendirian(
    InformasiPerusahaanPtViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglAktaPendirianPtController,
      label: 'Tanggal Akta Pendirian *',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () => viewModel.selecttglAktaPendirianPt(context),
      enabled: false,
      onSave: viewModel.updateTglAktaPendirianPt,
      fillColor: Colors.white,
      validator: (value) => InputValidators.validateAktaPendirianDate(value),
    );
  }

  CustomTextField _buildNomorAktaPendirian(
    InformasiPerusahaanPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorAktaPendirianController,
      label: 'No. Akta Pendirian *',
      hintText: 'Masukkan No. Akta Pendirian',
      onSave: viewModel.updateNomorAktaPendirian,
      onChanged: viewModel.updateNomorAktaPendirian,
      withMaxLength: true,
      maxLength: 16,
      validator: (value) =>
          InputValidators.validateName(value, fieldType: 'No. Akta Pendirian'),
    );
  }

  CustomTextField _buildDetailTempatAktaPendirianPerusahaanPt(
    InformasiPerusahaanPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController:
          viewModel.detailTempatAktaPendirianPerusahaanController,
      label: 'Tempat Akta Pendirian *',
      hintText: 'Masukkan Tempat Akta Pendirian',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateDetailTempatAktaPendirianPerusahaan,
      onChanged: viewModel.updateDetailTempatAktaPendirianPerusahaan,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Tempat Akta Pendirian',
      ),
    );
  }

  CustomTextField _buildTanggalSKkumhamPendirian(
    InformasiPerusahaanPtViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglSKkumhamPendirianPtController,
      label: 'Tanggal SK Kumham Pendirian',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () => viewModel.selecttglSKKumhamPendirianPt(context),
      enabled: false,
      fillColor: Colors.white,
      onSave: viewModel.updateTglSKkumhamPendirianPt,
    );
  }

  CustomTextField _buildNomorSKkumhamPendirian(
    InformasiPerusahaanPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorSKkumhamPendirianController,
      label: 'No. SK Kumham Pendirian',
      hintText: 'Masukkan No. SK Kumham Pendirian',
      onSave: viewModel.updateNomorSKkumhamPendirian,
      onChanged: viewModel.updateNomorSKkumhamPendirian,
      // validator: (value) => InputValidators.validateKTPNumber(value,
      //     fieldType: 'Nomor KTP Debitur'),
      withMaxLength: true,
      maxLength: 16,
      validator: (value) => InputValidators.validateName(
        value,
        fieldType: 'No. SK Kumham Pendirian',
      ),
    );
  }

  CustomTextField _buildTanggalAktaPerubahaanTerakhir(
    InformasiPerusahaanPtViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglAktaPerubahanTerakhirController,
      label: 'Tanggal Akta Perubahan Terakhir *',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () => viewModel.selecttglAktaPerubahanTerakhir(context),
      enabled: false,
      onSave: viewModel.updatetglAktaPerubahanTerakhir,
      validator: (value) => InputValidators.validateAktaPendirianDate(value),
    );
  }

  CustomTextField _buildNomorAktaPerubahaanTerakhir(
    InformasiPerusahaanPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorAktaPerubahanTerakhirController,
      label: 'No. Akta Perubahaan Terakhir *',
      hintText: 'Masukkan No. Akta Perubahaan Terakhir',
      onSave: viewModel.updateNomorAktaPerubahanTerakhir,
      onChanged: viewModel.updateNomorAktaPerubahanTerakhir,

      // validator: (value) => InputValidators.validateKTPNumber(value,
      //     fieldType: 'Nomor KTP Debitur'),
      withMaxLength: true,
      maxLength: 16,
      validator: (value) => InputValidators.validateName(
        value,
        fieldType: 'No. Akta Perubahaan Terakhir',
      ),
    );
  }

  CustomTextField _buildDetailTempatAktaPerubahaanTerakhir(
    InformasiPerusahaanPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController:
          viewModel.detailTempatAktaPerubahanTerakhirController,
      label: 'Tempat Akta Perubahaan Terakhir *',
      hintText: 'Masukkan Tempat Akta Perubahaan',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateDetailTempatAktaPerubahanTerakhir,
      onChanged: viewModel.updateDetailTempatAktaPerubahanTerakhir,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Tempat Akta Perubahaan',
      ),
    );
  }

  CustomTextField _buildTanggalSKkumhamPerubahaanTerakhir(
    InformasiPerusahaanPtViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglSKkumhamPerubahanTerakhirController,
      label: 'Tanggal SK Kumham Perubahaan Terakhir',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () => viewModel.selecttglSKkumhamPerubahanTerakhir(context),
      enabled: false,
      onSave: viewModel.updateTglSKkumhamPerubahanTerakhir,
      // validator: (value) => InputValidators.validateAktaPendirianDate(value),
    );
  }

  CustomTextField _buildNomorSKkumhamPerubahaan(
    InformasiPerusahaanPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorSKkumhamPerubahanTerakhirController,
      label: 'No. SK Kumham Perubahaan Terakhir',
      hintText: 'Masukkan No. SK Kumham',
      onSave: viewModel.updateNomorSKkumhamPerubahanTerakhir,
      onChanged: viewModel.updateNomorSKkumhamPerubahanTerakhir,
      // validator: (value) => InputValidators.validateKTPNumber(value,
      //     fieldType: 'Nomor KTP Debitur'),
      withMaxLength: true,
      maxLength: 16,
      validator: (value) =>
          InputValidators.validateName(value, fieldType: 'No. SK Kumham'),
    );
  }

  CustomTextField _buildNamaLengkapPic(
    InformasiPerusahaanPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.namaLengkapPicController,
      label: 'Nama Lengkap PIC *',
      hintText: 'Masukkan Nama Lengkap PIC',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateNamaLengkapPic,
      onChanged: viewModel.updateNamaLengkapPic,
      validator: (value) =>
          InputValidators.validateName(value, fieldType: 'Nama Lengkap PIC'),
    );
  }

  CustomTextField _buildNomorHandphone(
    InformasiPerusahaanPtViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.noHpPicController,
      label: 'No. Handphone *',
      hintText: 'Masukkan No. Handphone PIC',
      prefixText: '+62 ',
      onSave: viewModel.updateNoHpPic,
      onChanged: viewModel.updateNoHpPic,
      keyboardType: TextInputType.number,
      validator: (value) => InputValidators.validateMobileNumber(value),
      withMaxLength: true,
      maxLength: 12,
    );
  }

  CustomTextField _buildEmailPic(InformasiPerusahaanPtViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.emailPicController,
      label: 'Email',
      hintText: 'Masukkan Email PIC',
      keyboardType: TextInputType.emailAddress,
      onSave: viewModel.updateEmailPic,
      onChanged: viewModel.updateEmailPic,
      validator: (value) => InputValidators.validateEmail(value),
    );
  }
}

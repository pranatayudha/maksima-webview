import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../application/helpers/input_validators.dart';
import '../../../../../shared/custom_textfield.dart';
import 'informasi_perusahaan_cv_viewmodel.dart';

class InformasiPerusahaanCvFormSection1
    extends HookViewModelWidget<InformasiPerusahaanCvViewModel> {
  const InformasiPerusahaanCvFormSection1({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPerusahaanCvViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              _buildTanggalAktaPendirian(viewModel, context),
              _buildNomorAktaPendirian(viewModel),
              _buildDetailTempatAktaPendirianPerusahaanCv(viewModel),
              _buildTanggalSKkumhamPendirian(viewModel, context),
              _buildNomorSKkumhamPendirian(viewModel),
              Padding(
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
              ),
              // if (!viewModel.valueAktaPerubahaan)
              _buildTanggalAktaPerubahanTerakhir(viewModel, context),
              _buildNomorAktaPerubahanTerakhir(viewModel),
              _buildDetailTempatAktaPerubahanTerakhir(viewModel),
              // if (!viewModel.valueAktaPerubahaan)
              //   Column(
              //     children: [
              //       _buildTanggalAktaPerubahanTerakhir(viewModel, context),
              //       _buildNomorAktaPerubahanTerakhir(viewModel),
              //       _buildDetailTempatAktaPerubahanTerakhir(viewModel),
              //     ],
              //   ),
              _buildTanggalSKkumhamPerubahanTerakhir(viewModel, context),
              _buildNomorSKkumhamPerubahan(viewModel),
              _buildNamaLengkapPic(viewModel),
              _buildNomorHandphone(viewModel),
              _buildEmailPic(viewModel),
            ],
          ),
        ),
      ],
    );
  }

  CustomTextField _buildTanggalAktaPendirian(
    InformasiPerusahaanCvViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglAktaPendirianCvController,
      label: 'Tanggal Akta Pendirian *',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () => viewModel.selecttglAktaPendirianCv(context),
      enabled: false,
      fillColor: Colors.white,
      onSave: viewModel.updateTglAktaPendirianCv,
      validator: (value) => InputValidators.validateAktaPendirianDate(value),
    );
  }
  // CustomTextField _buildTanggalAktaPendirian(
  //   InformasiPerusahaanCvViewModel viewModel,
  //   BuildContext context,
  // ) {
  //   return CustomTextField(
  //     textEditingController: viewModel.tglAktaPendirianCvController,
  //     label: 'Tanggal Akta Pendirian *',
  //     hintText: 'DD/MM/YYYY',
  //     withSuffixIcon: true,
  //     suffixIconImagePath: IconConstants.calendar,
  //     onTap: () {
  //       DatePicker.showDatePicker(
  //         context,
  //         onConfirm: (date) => viewModel
  //             .updateAktaPendirianCv(DateFormat('dd/MM/yyyy').format(date)),
  //         currentTime: DateTime.now(),
  //         minTime: DateTime.now().subtract(const Duration(days: 27375)),
  //         maxTime: DateTime.now(),
  //         locale: LocaleType.id,
  //       );
  //     },
  //     enabled: false,
  //     onSave: viewModel.updateAktaPendirianCv,
  //     validator: (value) => InputValidators.validateAktaPendirianDate(value),
  //   );
  // }

  CustomTextField _buildNomorAktaPendirian(
    InformasiPerusahaanCvViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorAktaPendirianController,
      label: 'No. Akta Pendirian *',
      hintText: 'Masukkan No. Akta Pendirian',
      onSave: viewModel.updateNomorAktaPendirian,
      onChanged: viewModel.updateNomorAktaPendirian,
      // validator: (value) => InputValidators.validateKTPNumber(value,
      //     fieldType: 'Nomor KTP Debitur'),
      withMaxLength: true,
      maxLength: 16,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'No. Akta Pendirian',
      ),
    );
  }

  CustomTextField _buildDetailTempatAktaPendirianPerusahaanCv(
    InformasiPerusahaanCvViewModel viewModel,
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
    InformasiPerusahaanCvViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglSKkumhamPendirianCvController,
      label: 'Tanggal SK Kumham Pendirian',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () => viewModel.selecttglSKkumhamPendirianCv(context),
      enabled: false,
      fillColor: Colors.white,
      onSave: viewModel.updateTglSKkumhamPendirianCv,
      // validator: (value) => InputValidators.validateAktaPendirianDate(value),
      // validator: (value) => InputValidators.validateAktaPendirianDate(value),
    );
  }

  CustomTextField _buildNomorSKkumhamPendirian(
    InformasiPerusahaanCvViewModel viewModel,
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
      // validator: (value) => InputValidators.validateRequiredField(value,
      //     fieldType: 'No. SK Kumham Pendirian'),
    );
  }

  CustomTextField _buildTanggalAktaPerubahanTerakhir(
    InformasiPerusahaanCvViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      // enabled: !viewModel.valueAktaPerubahaan,
      textEditingController: viewModel.tglAktaPerubahanTerakhirController,
      label: 'Tanggal Akta Perubahan Terakhir *',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () => viewModel.selecttglAktaPerubahanTerakhir(context),
      enabled: true,
      onSave: viewModel.updatetglAktaPerubahanTerakhir,
      validator: (value) => InputValidators.validateAktaPendirianDate(value),
    );
  }

  // CustomTextField _buildTanggalAktaPerubahanTerakhir(
  //     InformasiPerusahaanCvViewModel viewModel, BuildContext context) {
  //   return CustomTextField(
  //     textEditingController: viewModel.valueAktaPerubahaan == false
  //         ? viewModel.tglAktaPerubahanTerakhirController
  //         : viewModel.tglAktaPendirianCvController,
  //     label: 'Tanggal Akta Perubahan Terakhir *',
  //     hintText: 'DD/MM/YYYY',
  //     withSuffixIcon: true,
  //     suffixIconImagePath: IconConstants.calendar,
  //     onTap: () {
  //       DatePicker.showDatePicker(
  //         context,
  //         onConfirm: (date) => viewModel.updateAktaPerubahanTerakhir(
  //             DateFormat('dd/MM/yyyy').format(date)),
  //         currentTime: DateTime.now(),
  //         minTime: DateTime.now().subtract(const Duration(days: 27375)),
  //         maxTime: DateTime.now(),
  //         locale: LocaleType.id,
  //       );
  //     },
  //     enabled: false,
  //     onSave: viewModel.updateAktaPerubahanTerakhir,
  //     validator: (value) => InputValidators.validateAktaPendirianDate(value),
  //   );
  // }
  CustomTextField _buildNomorAktaPerubahanTerakhir(
    InformasiPerusahaanCvViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorAktaPerubahanTerakhirController,
      label: 'No. Akta Perubahan Terakhir *',
      hintText: 'Masukkan No. Akta Perubahan Terakhir',
      onSave: viewModel.updateNomorAktaPerubahanTerakhir,
      onChanged: viewModel.updateNomorAktaPerubahanTerakhir,
      // validator: (value) => InputValidators.validateKTPNumber(value,
      //     fieldType: 'Nomor KTP Debitur'),
      enabled: !viewModel.valueAktaPerubahaan,
      withMaxLength: true,
      maxLength: 16,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'No. Akta Perubahan Terakhir',
      ),
      // validator: (value) => InputValidators.validateName(value,
      //     fieldType: 'No. Akta Perubahaan Terakhir'),
    );
  }

  // CustomTextField _buildNomorAktaPerubahanTerakhir(
  //     InformasiPerusahaanCvViewModel viewModel) {
  //   return CustomTextField(
  //     textEditingController: viewModel.valueAktaPerubahaan == false
  //         ? viewModel.nomorAktaPerubahanTerakhirController
  //         : viewModel.nomorAktaPendirianController,
  //     // viewModel.nomorAktaPerubahanTerakhirController,
  //     label: 'No. Akta Perubahan Terakhir *',
  //     hintText: 'Masukkan No. Akta Perubahan Terakhir',
  //     onSave: viewModel.updateNomorAktaPerubahanTerakhir,
  //     onChanged: viewModel.updateNomorAktaPerubahanTerakhir,
  //     keyboardType: TextInputType.number,
  //     // validator: (value) => InputValidators.validateKTPNumber(value,
  //     //     fieldType: 'Nomor KTP Debitur'),
  //     withMaxLength: true,
  //     maxLength: 16,
  //     validator: (value) => InputValidators.validateRequiredField(value,
  //         fieldType: 'No. Akta Perubahaan Terakhir'),
  //     // validator: (value) => InputValidators.validateName(value,
  //     //     fieldType: 'No. Akta Perubahaan Terakhir'),
  //   );
  // }

  CustomTextField _buildDetailTempatAktaPerubahanTerakhir(
    InformasiPerusahaanCvViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController:
          viewModel.detailTempatAktaPerubahanTerakhirController,
      label: 'Tempat Akta Perubahan *',
      hintText: 'Masukkan Tempat Akta Perubahan',
      textCapitalization: TextCapitalization.words,
      onSave: viewModel.updateDetailTempatAktaPerubahanTerakhir,
      onChanged: viewModel.updateDetailTempatAktaPerubahanTerakhir,
      enabled: !viewModel.valueAktaPerubahaan,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Tempat Akta Perubahan',
      ),
    );
  }

  // CustomTextField _buildDetailTempatAktaPerubahanTerakhir(
  //     InformasiPerusahaanCvViewModel viewModel) {
  //   return CustomTextField(
  //     // textEditingController:
  //     textEditingController: viewModel.valueAktaPerubahaan == false
  //         ? viewModel.detailTempatAktaPerubahanTerakhirController
  //         : viewModel.detailTempatAktaPendirianPerusahaanController,
  //     // viewModel.detailTempatAktaPerubahanTerakhirController,
  //     label: 'Tempat Akta Perubahan *',
  //     hintText: 'Masukkan Tempat Akta Perubahan',
  //     textCapitalization: TextCapitalization.words,
  //     onSave: viewModel.updateDetailTempatAktaPerubahanTerakhir,
  //     onChanged: viewModel.updateDetailTempatAktaPerubahanTerakhir,
  //     validator: viewModel.valueAktaPerubahaan == false
  //         ? (value) => InputValidators.validateRequiredField(value,
  //             fieldType: 'Tempat Akta Perubahan')
  //         : null,
  //   );
  // }

  CustomTextField _buildTanggalSKkumhamPerubahanTerakhir(
    InformasiPerusahaanCvViewModel viewModel,
    BuildContext context,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tglSKkumhamPerubahanTerakhirController,
      label: 'Tanggal SK Kumham Perubahan Terakhir',
      hintText: 'DD/MM/YYYY',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      onTap: () => viewModel.selecttglSKkumhamPerubahanTerakhir(context),
      enabled: true,
      onSave: viewModel.updateTglSKkumhamPerubahanTerakhir,
      // validator: (value) => InputValidators.validateAktaPendirianDate(value),
    );
  }

  CustomTextField _buildNomorSKkumhamPerubahan(
    InformasiPerusahaanCvViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorSKkumhamPerubahanTerakhirController,
      label: 'No. SK Kumham Perubahan Terakhir',
      hintText: 'Masukkan No. SK Kumham',
      onSave: viewModel.updateNomorSKkumhamPerubahanTerakhir,
      onChanged: viewModel.updateNomorSKkumhamPerubahanTerakhir,
      // validator: (value) => InputValidators.validateKTPNumber(value,
      //     fieldType: 'Nomor KTP Debitur'),
      withMaxLength: true,
      maxLength: 16,
      // validator: (value) =>
      //     InputValidators.validateName(value, fieldType: 'No. SK Kumham'),
    );
  }

  CustomTextField _buildNamaLengkapPic(
    InformasiPerusahaanCvViewModel viewModel,
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
    InformasiPerusahaanCvViewModel viewModel,
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

  CustomTextField _buildEmailPic(InformasiPerusahaanCvViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.emailPicController,
      label: 'Email *',
      hintText: 'Masukkan Email PIC',
      keyboardType: TextInputType.emailAddress,
      onSave: viewModel.updateEmailPic,
      onChanged: viewModel.updateEmailPic,
      validator: (value) => InputValidators.validateEmail(value),
    );
  }
}

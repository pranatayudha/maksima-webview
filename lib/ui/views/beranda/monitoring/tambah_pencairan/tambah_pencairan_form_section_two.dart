// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../application/app/constants/custom_color.dart';
import '../../../../../application/app/constants/icon_constants.dart';
import '../../../../../application/helpers/input_validators.dart';
import '../../../../shared/amount_box.dart';
import '../../../../shared/custom_textfield.dart';
import '../../../../shared/detil_pencairan_box.dart';
import '../../../../shared/rekening_box.dart';
import '../../../../shared/upload_item_button_ritel.dart';
import 'tambah_pencairan_viewmodel.dart';
import 'widgets/tambah_pencairan_button.dart';

class TambahPencairanFormSectionTwo
    extends HookViewModelWidget<TambahPencairanViewModel> {
  const TambahPencairanFormSectionTwo({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    TambahPencairanViewModel viewModel,
  ) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Form(
                  key: viewModel.formKey,
                  autovalidateMode: viewModel.autoValidateMode,
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      children: [
                        AmountBox(
                          label: 'Kelonggaran Tarik',
                          amount: viewModel.kelonggaranTarik ?? 0,
                        ),
                        SizedBox(height: 16.h),
                        _buildNomorDokumenUnderlying(viewModel),
                        _buildNominalUnderlying(viewModel),
                        _buildPPN(viewModel),
                        _buildTanggalJatuhTempoDokumenUnderlying(viewModel),
                        _buildBungaPinjaman(viewModel),
                        _buildTempoCadanganBunga(viewModel),
                        _buildSharingDanaSendiri(viewModel),
                        DetilPencairanBox(
                          nominalPencairan: viewModel.nominalPencairan ?? 0,
                          cadanganBunga: viewModel.cadanganBunga ?? 0,
                          tglJatuhTempo:
                              viewModel.tanggalJatuhTempoCadanganBunga ?? '-',
                          jmlHariPinjaman: viewModel.jumlahHariPinjaman != null
                              ? '${viewModel.jumlahHariPinjaman} Hari'
                              : '-',
                        ),
                        RekeningBox(
                          type: 1,
                          namaDebitur: viewModel.namaDebitur ?? '',
                          noRekening: viewModel.noRekSimpanan ?? '',
                        ),
                        AmountBox(
                          label: 'Saldo Rekening Pencairan/Operasional',
                          subtitle:
                              'Pastikan debitur memiliki saldo yang cukup untuk hold cadangan bunga',
                          amount: viewModel.saldoOperasional,
                        ),
                        SizedBox(height: 16.h),
                        RekeningBox(
                          type: 2,
                          namaDebitur: viewModel.namaDebitur ?? '',
                          noRekening: viewModel.noRekEscrow ?? '',
                        ),
                        _buildRadioButton(viewModel),
                        if (viewModel.isNotRayaAccount)
                          _buildAnotherAccountSection(viewModel)
                        else
                          _buildRayaAccountSection(viewModel),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          TambahPencairanButton(
            step: 2,
            onPressedSebelumnya: viewModel.navigateToPencairanStepOne,
            onPressedSelanjutnya: () => viewModel.validateInputs(context),
          ),
        ],
      ),
    );
  }

  CustomTextField _buildNomorDokumenUnderlying(
    TambahPencairanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nomorDokumenUnderlying,
      label: 'No. Dokumen Underlying',
      keyboardType: TextInputType.number,
      enabled: false,
    );
  }

  CustomTextField _buildNominalUnderlying(TambahPencairanViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.nominalUnderlyingController,
      label: 'Nominal Underlying',
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      keyboardType: TextInputType.number,
      withThousandsSeparator: true,
      enabled: false,
    );
  }

  CustomTextField _buildPPN(TambahPencairanViewModel viewModel) {
    return CustomTextField(
      textEditingController: viewModel.ppnController,
      label: 'PPN',
      hintText: '0.00',
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      keyboardType: TextInputType.number,
      withThousandsSeparator: true,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'PPN',
      ),
      onChanged: viewModel.updatePPN,
      onSave: viewModel.updatePPN,
    );
  }

  CustomTextField _buildTanggalJatuhTempoDokumenUnderlying(
    TambahPencairanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.tanggalJatuhTempoDokumenUnderlying,
      label: 'Tanggal Jatuh Tempo Dokumen Underlying',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.calendar,
      enabled: false,
    );
  }

  CustomTextField _buildBungaPinjaman(
    TambahPencairanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.bungaPinjamanController,
      label: 'Bunga Pinjaman',
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.percentage,
      enabled: false,
    );
  }

  PopupMenuButton<String> _buildTempoCadanganBunga(
    TambahPencairanViewModel viewModel,
  ) {
    return PopupMenuButton(
      offset: Offset(double.maxFinite, 65.h),
      itemBuilder: (BuildContext context) {
        return [
          '31',
          '61',
        ].map<PopupMenuItem<String>>((value) {
          return PopupMenuItem(value: value, child: Text(value));
        }).toList();
      },
      onSelected: (value) => viewModel.updateTempoCadanganBunga(value),
      child: CustomTextField(
        textEditingController: viewModel.tempoCadanganBungaController,
        label: 'Tempo Cadangan Bunga',
        hintText: 'Pilih Tempo Cadangan Bunga',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        fillColor: Colors.white,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Tempo Cadangan Bunga',
        ),
      ),
    );
  }

  CustomTextField _buildSharingDanaSendiri(
    TambahPencairanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.sharingDanaSendiriController,
      label: 'Sharing Dana Sendiri',
      hintText: 'Masukkan Jumlah SDS',
      keyboardType: TextInputType.number,
      withSuffixIcon: true,
      suffixIconImagePath: IconConstants.percentage,
      onChanged: viewModel.updateSDS,
      onSave: viewModel.updateSDS,
      validator: (value) => InputValidators.validateSDS(
        value,
      ),
      withMaxLength: true,
      maxLength: 2,
    );
  }

  Padding _buildRadioButton(
    TambahPencairanViewModel viewModel,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          const Expanded(
            flex: 5,
            child: Text(
              'Rekening Pembayaran bukan ke Bank Raya',
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
                value: viewModel.isNotRayaAccount,
                onChanged: (bool value) => viewModel.updateRadioBtn(value),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildRayaAccountSection(
    TambahPencairanViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 24.h, top: 25.h),
          child: Text(
            'UPLOAD FILE',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5.w,
            ),
          ),
        ),
        UploadItemButtonRitel(
          imageUrl: viewModel.dokumenUnderlyingPublicUrl,
          label: 'Dokumen Underlying *',
          onPressed: viewModel.dokumenUnderlyingPublicUrl == null
              ? viewModel.captureDokumenUnderlying
              : viewModel.clearDokumenUnderlying,
          errorText: viewModel.dokumenUnderlyingErrorText,
        ),
        UploadItemButtonRitel(
          imageUrl: viewModel.suratPermohonanPencairanPublicUrl,
          label: 'Surat Permohonan Pencairan *',
          onPressed: viewModel.suratPermohonanPencairanPublicUrl == null
              ? viewModel.captureSuratPermohonanPencairan
              : viewModel.clearSuratPermohonanPencairan,
          errorText: viewModel.suratPermohonanPencairanErrorText,
        ),
        UploadItemButtonRitel(
          imageUrl: viewModel.suratPernyataanDebiturPublicUrl,
          label: 'Surat Pernyataan Debitur *',
          onPressed: viewModel.suratPernyataanDebiturPublicUrl == null
              ? viewModel.captureSuratPernyataanDebitur
              : viewModel.clearSuratPernyataanDebitur,
          errorText: viewModel.suratPernyataanDebiturErrorText,
        ),
      ],
    );
  }

  Column _buildAnotherAccountSection(
    TambahPencairanViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildBankRekeningPembayaran(viewModel),
        _buildNoRekeningPembayaran(viewModel),
        _buildNamaRekeningPembayaran(viewModel),
        Container(
          padding: EdgeInsets.only(bottom: 24.h, top: 25.h),
          child: Text(
            'UPLOAD FILE',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5.w,
            ),
          ),
        ),
        UploadItemButtonRitel(
          imageUrl: viewModel.dokumenUnderlyingPublicUrl,
          label: 'Dokumen Underlying *',
          onPressed: viewModel.dokumenUnderlyingPublicUrl == null
              ? viewModel.captureDokumenUnderlying
              : viewModel.clearDokumenUnderlying,
          errorText: viewModel.dokumenUnderlyingErrorText,
        ),
        UploadItemButtonRitel(
          imageUrl: viewModel.suratPermohonanPencairanPublicUrl,
          label: 'Surat Permohonan Pencairan *',
          onPressed: viewModel.suratPermohonanPencairanPublicUrl == null
              ? viewModel.captureSuratPermohonanPencairan
              : viewModel.clearSuratPermohonanPencairan,
          errorText: viewModel.suratPermohonanPencairanErrorText,
        ),
        UploadItemButtonRitel(
          imageUrl: viewModel.suratPernyataanDebiturPublicUrl,
          label: 'Surat Pernyataan Debitur *',
          onPressed: viewModel.suratPernyataanDebiturPublicUrl == null
              ? viewModel.captureSuratPernyataanDebitur
              : viewModel.clearSuratPernyataanDebitur,
          errorText: viewModel.suratPernyataanDebiturErrorText,
        ),
        UploadItemButtonRitel(
          imageUrl: viewModel.standingInstructionPublicUrl,
          label: 'Standing Instruction bila pembayaran ke Rekening Bank lain *',
          onPressed: viewModel.standingInstructionPublicUrl == null
              ? viewModel.captureStandingInstruction
              : viewModel.clearStandingInstruction,
          errorText: viewModel.standingInstructionErrorText,
        ),
      ],
    );
  }

  PopupMenuButton<String> _buildBankRekeningPembayaran(
    TambahPencairanViewModel viewModel,
  ) {
    return PopupMenuButton(
      offset: Offset(double.maxFinite, 65.h),
      itemBuilder: (BuildContext context) {
        return [
          'Bank Mandiri',
          'Bank BRI',
          'Bank RAYA',
          'Bank BCA',
          'Bank BNI',
          'Bank BTN',
          'Bank CIMB Niaga',
          'Bank KB Bukopin',
          'Bank Mega',
          'Bank DKI',
          'Bank UOB',
          'Permata Bank',
          'Shinhan Bank',
          'Bank Syariah Indonesia',
          'OCBC NISP',
          'Bank Danamon',
          'DBS',
          'BTPN',
        ].map<PopupMenuItem<String>>((value) {
          return PopupMenuItem(value: value, child: Text(value));
        }).toList();
      },
      onSelected: (String val) => viewModel.updateBankRekeningPembayaran(val),
      child: CustomTextField(
        textEditingController: viewModel.bankRekeningPembayaranController,
        label: 'Bank Rekening Pembayaran',
        hintText: 'Pilih Bank Rekening Pembayaran',
        withSuffixIcon: true,
        suffixIconImagePath: IconConstants.chevronDown,
        enabled: false,
        fillColor: Colors.white,
        validator: (value) => InputValidators.validateRequiredField(
          value,
          fieldType: 'Nama Bank',
        ),
      ),
    );
  }

  CustomTextField _buildNoRekeningPembayaran(
    TambahPencairanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.noRekeningPembayaranController,
      label: 'No. Rekening Pembayaran',
      hintText: 'No. Rekening Pembayaran',
      keyboardType: TextInputType.number,
      onSave: viewModel.updateNoRekeningPembayaran,
      onChanged: viewModel.updateNoRekeningPembayaran,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'No. Rekening Pembayaran',
      ),
      withMaxLength: true,
      maxLength: 15,
    );
  }

  CustomTextField _buildNamaRekeningPembayaran(
    TambahPencairanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.namaRekeningPembayaranController,
      label: 'Nama Rekening Pembayaran',
      hintText: 'Nama Rekening Pembayaran',
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      onSave: viewModel.updateNamaRekeningPembayaran,
      onChanged: viewModel.updateNamaRekeningPembayaran,
      validator: (value) => InputValidators.validateRequiredField(
        value,
        fieldType: 'Nama Rekening Pembayaran',
      ),
    );
  }
}

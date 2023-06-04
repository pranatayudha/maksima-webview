import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../application/app/constants/icon_constants.dart';
import '../../../../../application/helpers/input_validators.dart';
import '../../../../shared/amount_box.dart';
import '../../../../shared/custom_textfield.dart';
import '../../../../shared/styles.dart';
import 'penurunan_pinjaman_viewmodel.dart';

class PenurunanPinjamanFormSection
    extends HookViewModelWidget<PenurunanPinjamanViewModel> {
  const PenurunanPinjamanFormSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PenurunanPinjamanViewModel viewModel,
  ) {
    return Form(
      key: viewModel.formKey,
      autovalidateMode: viewModel.autoValidateMode,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
            child: Column(
              children: [
                AmountBox(
                  label: 'Saldo Rekening Escrow',
                  amount: double.parse(viewModel.disburseData['saldoEscrow']),
                ),
                SizedBox(height: 16.h),
                _buildNoDokumenUnderlying(viewModel),
                _buildNominalUnderlying(viewModel),
                _buildSumberRekeningPenurunan(viewModel),
                _buildSumberRekeningPinjaman(viewModel),
                _buildNominalPembayaranEscrow(viewModel),
                _buildNominalOutstanding(viewModel),
                _buildNominalPembayaranOperasional(viewModel),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CustomTextField _buildNoDokumenUnderlying(
    PenurunanPinjamanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.noDokumenUnderlyingController,
      label: 'No. Dokumen Underlying *',
      enabled: false,
    );
  }

  CustomTextField _buildNominalUnderlying(
    PenurunanPinjamanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nominalUnderlyingController,
      label: 'Nominal Underlying *',
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      withThousandsSeparator: true,
      enabled: false,
    );
  }

  CustomTextField _buildSumberRekeningPenurunan(
    PenurunanPinjamanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.sumberRekeningPenurunanController,
      label: 'Sumber Rekening Penurunan (Escrow) *',
      enabled: false,
    );
  }

  CustomTextField _buildSumberRekeningPinjaman(
    PenurunanPinjamanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.sumberRekeningPinjamanController,
      label: 'Sumber Rekening Pinjaman *',
      enabled: false,
    );
  }

  CustomTextField _buildNominalPembayaranEscrow(
    PenurunanPinjamanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nominalPembayaranEscrowController,
      label: 'Nominal Pembayaran Ke Rek. Escrow *',
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      keyboardType: TextInputType.number,
      withThousandsSeparator: true,
      onSave: viewModel.updateNominalPembayaranEscrow,
      onChanged: viewModel.setDescription,
      description: viewModel.nominalPembayaranBiggerThanOutstanding
          ? _setDescNominalPembayaran(
              viewModel.nominalPembayaranEscrowController.text,
              int.parse(viewModel.disburseData['nominalUnderlying']),
            )
          : Container(),
      validator: (val) => InputValidators.validateNominalPembayaranEscrow(
        val,
        int.parse(viewModel.disburseData['nominalOutstanding']),
      ),
    );
  }

  CustomTextField _buildNominalOutstanding(
    PenurunanPinjamanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nominalOutstandingController,
      label: 'Nominal Outstanding *',
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      withThousandsSeparator: true,
      enabled: false,
      description: Text(
        'Nominal Outstanding akan dicairkan ke Rek. Pinjaman',
        style: tsCaption140,
      ),
    );
  }

  CustomTextField _buildNominalPembayaranOperasional(
    PenurunanPinjamanViewModel viewModel,
  ) {
    return CustomTextField(
      textEditingController: viewModel.nominalPembayaranOperasionalController,
      label: 'Nominal Pembayaran ke Rek. Operasional *',
      withPrefixIcon: true,
      prefixIconImagePath: IconConstants.rupiah,
      withThousandsSeparator: true,
      enabled: false,
    );
  }

  static Widget _setDescNominalPembayaran(
    String? value,
    int maxValue,
  ) {
    // ignore: prefer-conditional-expressions
    if (_removeThousandsSeparator(value!) >= maxValue) {
      return Text(
        'Nominal pembayaran sesuai dengan outstanding✅',
        style: tsCaption140.copyWith(
          color: Colors.green,
        ),
      );
    } else {
      return Container();
    }
  }

  static int _removeThousandsSeparator(String text) {
    final removedThousandsSeparator = text.split('.').join();

    return int.parse(removedThousandsSeparator);
  }
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../application/app/constants/custom_color.dart';
import '../../../../../application/app/constants/icon_constants.dart';
import '../../../../shared/styles.dart';
import '../../../../shared/thick_light_grey_divider.dart';
import 'pinjaman_detail_viewmodel.dart';
import 'widgets/catatan_penolakan.dart';
import 'widgets/detail_bouwheer.dart';
import 'widgets/detail_pengajuan.dart';
import 'widgets/dokumen_pencairan.dart';
import 'widgets/informasi_rekening_pembayaran.dart';
import 'widgets/pinjaman_summary.dart';

class PinjamanDetailView
    extends ViewModelBuilderWidget<PinjamanDetailViewModel> {
  final int counter;
  final int disburseId;
  final String status;
  final int loanType;
  final String idKelolaan;

  const PinjamanDetailView({
    Key? key,
    required this.counter,
    required this.disburseId,
    required this.status,
    required this.loanType,
    required this.idKelolaan,
  }) : super(key: key);

  @override
  PinjamanDetailViewModel viewModelBuilder(BuildContext context) =>
      PinjamanDetailViewModel(
        disburseId: disburseId,
        counter: counter,
        status: status,
        loanType: loanType,
        idKelolaan: idKelolaan,
      );

  @override
  Widget builder(
    BuildContext context,
    PinjamanDetailViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () async {
        viewModel.navigateBack();

        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: viewModel.navigateBack,
            icon: Image.asset(
              IconConstants.vector,
              scale: 0.9,
              color: const Color(0xff03213E),
            ),
          ),
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Pinjaman #${counter + 1}',
            style: tsHeading6,
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
        ),
        body: Builder(
          builder: (context) {
            if (viewModel.isBusy) {
              return const Center(
                child: CircularProgressIndicator(
                  color: CustomColor.primaryBlue,
                ),
              );
            }

            if (viewModel.pinjamanDetail == null) {
              return const Center(
                child: Text('Failed to fetch Monitoring Detail'),
              );
            }

            return _buildDetailPinjamanBody(viewModel, context);
          },
        ),
      ),
    );
  }

  Container _buildDetailPinjamanBody(PinjamanDetailViewModel vm, context) {
    final status = vm.pinjamanDetail!.statusDisburse!.toLowerCase();

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                PinjamanSummary(
                  pinjamanCounter: counter,
                  pinjamanDetail: vm.pinjamanDetail!,
                  noDokUnderlying:
                      vm.pinjamanDetail?.disburse?.numDocUnderlying,
                  nominalUnderlying:
                      vm.pinjamanDetail?.disburse?.amountUnderlying,
                ),
                const ThickLightGreyDivider(),
                DetailPengajuan(
                  disburse: vm.pinjamanDetail!.disburse,
                ),
                // if (status == 'aktif' ||
                //     status.startsWith('h-') ||
                //     status == 'jatuh tempo' ||
                //     status.startsWith('telat')) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(height: 2),
                ),
                const InformasiRekeningPembayaran(),
                // ],
                const ThickLightGreyDivider(),
                DetailBouwheer(
                  partnership: vm.pinjamanDetail!.partnership,
                  numBankPencairan: vm.pinjamanDetail!.numBankPencairan,
                ),
                const ThickLightGreyDivider(),
                const DokumenPencairan(),
                const ThickLightGreyDivider(),
                CatatanPenolakan(
                  role: vm.pinjamanDetail!.role,
                  notes: vm.pinjamanDetail!.notes,
                  notesType: vm.pinjamanDetail!.statusDisburse != null
                      ? (status == 'harus revisi' ? 'Revisi' : 'Penolakan')
                      : '-',
                ),
              ],
            ),
          ),
          if (status == 'harus revisi' ||
              status == 'aktif' ||
              status.startsWith('h-') ||
              status == 'jatuh tempo' ||
              status.startsWith('telat'))
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                    color: CustomColor.primaryBlack.withOpacity(0.1),
                  ),
                ],
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: CustomColor.secondaryBlue,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: status == 'harus revisi'
                    ? vm.navigateToTambahPencairan
                    : vm.navigateToPenurunanPinjaman,
                child: Text(
                  status == 'harus revisi'
                      ? 'Revisi Dokumen'
                      : 'Buat Penurunan Pinjaman',
                  style: tsHeading8White,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

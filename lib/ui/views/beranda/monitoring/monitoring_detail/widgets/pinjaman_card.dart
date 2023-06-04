import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../../application/models/monitoring_detail.dart';
import '../../../../../shared/styles.dart';
import 'label_and_value.dart';

class PinjamanCard extends StatelessWidget {
  final formatter = NumberFormat(
    'Rp#,###',
    'id_ID',
  );

  final int pinjamanCounter;
  final Pinjaman pinjaman;
  final VoidCallback onTap;

  PinjamanCard({
    Key? key,
    required this.pinjaman,
    required this.pinjamanCounter,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusDisburse = pinjaman.statusDisburse?.toLowerCase();

    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: const Offset(1, 2.5),
              color: CustomColor.primaryBlack.withOpacity(0.05),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Pinjaman #${pinjamanCounter + 1}',
                  style: tsHeading8,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: _parseStatusToColor(statusDisburse)[0],
                  ),
                  child: Text(
                    pinjaman.statusDisburse ?? '-',
                    style: tsCaption2.copyWith(
                      color: _parseStatusToColor(statusDisburse)[1],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nominal Outstanding',
                      style: tsBody6Black60,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      pinjaman.nominalOutstanding == null
                          ? '-'
                          : formatter.format(
                              double.parse(pinjaman.nominalOutstanding!),
                            ),
                      style: tsBody4,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Tgl Jatuh Tempo Invoice',
                      style: tsBody6Black60,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      pinjaman.tglJatuhTempoInvoice == null
                          ? '-'
                          : DateStringFormatter.forOutputRitelKTPTerbit(
                              pinjaman.tglJatuhTempoInvoice!,
                            ),
                      style: tsBody4,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
            LabelAndValue(
              'No. Dok Underlying',
              pinjaman.noDokUnderlying ?? '-',
            ),
            // LabelAndValue(
            //   'Kolektabilitas',
            //   pinjaman.kolektabilitas ?? '-',
            // ),
            LabelAndValue(
              'Nominal Underlying',
              pinjaman.nominalUnderlying == null
                  ? '-'
                  : formatter.format(double.parse(pinjaman.nominalUnderlying!)),
            ),
            // LabelAndValue(
            //   'Tunggakan Bunga',
            //   pinjaman.tunggakanBunga == null
            //       ? '-'
            //       : formatter.format(double.parse(pinjaman.tunggakanBunga!)),
            // ),
            // LabelAndValue(
            //   'Denda',
            //   pinjaman.denda == null
            //       ? '-'
            //       : formatter.format(double.parse(pinjaman.denda!)),
            // ),
            LabelAndValue(
              'Cadangan Bunga',
              (pinjaman.cadanganBunga ?? '').isEmpty
                  ? '-'
                  : formatter.format(double.parse(pinjaman.cadanganBunga!)),
            ),
            LabelAndValue(
              'Jatuh Tempo Cadangan Bunga',
              pinjaman.jthtempoCadanganBunga == null
                  ? '-'
                  : DateStringFormatter.forOutputRitelKTPTerbit(
                      pinjaman.jthtempoCadanganBunga!,
                    ),
            ),
            LabelAndValue(
              'Tanggal Pengajuan',
              pinjaman.informasiTanggalPengajuan ?? '-',
            ),
            LabelAndValue(
              'Jumlah Hari Pinjaman',
              pinjaman.jumlahHariPinjaman != null
                  ? '${pinjaman.jumlahHariPinjaman} Hari'
                  : '-',
            ),
            // LabelAndValue(
            //   'Total Kewajiban',
            //   pinjaman.totalKewajiban == null
            //       ? '-'
            //       : formatter.format(double.parse(pinjaman.totalKewajiban!)),
            //   isTotal: true,
            // ),
            if (statusDisburse == 'harus revisi' || statusDisburse == 'ditolak')
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: CustomColor.brightCerulean10,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    'Terdapat catatan ${statusDisburse == 'harus revisi' ? 'revisi' : 'penolakan'}',
                    style: tsBody6,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<Color> _parseStatusToColor(String? status) {
    status = status?.toLowerCase();

    if (status != null) {
      if (status == 'aktif' || status == 'lunas') {
        return [
          CustomColor.green.withOpacity(0.1),
          CustomColor.green,
        ];
      }

      if (status == 'approval cbl' || status == 'verifikasi adk' || status == 'konfirmasi cbl') {
        return [
          CustomColor.yellow.withOpacity(0.1),
          CustomColor.orange,
        ];
      }

      if (status.startsWith('h-')) {
        return [
          CustomColor.orange.withOpacity(0.1),
          CustomColor.orange,
        ];
      }

      if (status == 'jatuh tempo' || status.startsWith('telat')) {
        return [
          CustomColor.primaryRed.withOpacity(0.1),
          CustomColor.primaryRed,
        ];
      }

      if (status == 'ditolak') {
        return [
          CustomColor.primaryRed.withOpacity(0.1),
          CustomColor.primaryRed,
        ];
      }

      if (status == 'harus revisi') {
        return [
          CustomColor.primaryBlack.withOpacity(0.1),
          CustomColor.primaryBlack,
        ];
      }
    }

    return [
      CustomColor.primaryBlue10,
      CustomColor.primaryBlue,
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../../application/models/monitoring_pinjaman_detail.dart';
import '../../../../../shared/styles.dart';
import 'label_and_value.dart';

class PinjamanSummary extends StatelessWidget {
  final int pinjamanCounter;
  final MonitoringPinjamanDetail pinjamanDetail;
  final String? noDokUnderlying;
  final String? nominalUnderlying;

  PinjamanSummary({
    Key? key,
    required this.pinjamanCounter,
    required this.pinjamanDetail,
    required this.noDokUnderlying,
    required this.nominalUnderlying,
  }) : super(key: key);

  final formatter = NumberFormat(
    'Rp#,###',
    'id_ID',
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
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
                  color: _parseStatusToColor(pinjamanDetail.statusDisburse)[0],
                ),
                child: Text(
                  pinjamanDetail.statusDisburse ?? '-',
                  style: tsCaption2.copyWith(
                    color:
                        _parseStatusToColor(pinjamanDetail.statusDisburse)[1],
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
                    (pinjamanDetail.nominalOutstanding ?? '').isEmpty
                        ? '-'
                        : formatter.format(
                            double.parse(pinjamanDetail.nominalOutstanding!),
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
                    (pinjamanDetail.tglJatuhTempoInvoice ?? '').isEmpty
                        ? '-'
                        : DateStringFormatter.forOutputRitelKTPTerbit(
                            pinjamanDetail.tglJatuhTempoInvoice!,
                          ),
                    style: tsBody4,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(thickness: 1),
          LabelAndValue(
            'No. Dokumen Underlying',
            noDokUnderlying ?? '-',
          ),
          LabelAndValue(
            'Nominal Underlying',
            (nominalUnderlying ?? '').isEmpty
                ? '-'
                : formatter.format(double.parse(nominalUnderlying!)),
          ),
          LabelAndValue(
            'Cadangan Bunga',
            (pinjamanDetail.cadanganBunga ?? '').isEmpty
                ? '-'
                : formatter.format(double.parse(pinjamanDetail.cadanganBunga!)),
          ),
          LabelAndValue(
            'Jatuh Tempo Cadangan Bunga',
            (pinjamanDetail.jthtempoCadanganBunga ?? '').isEmpty
                ? '-'
                : DateStringFormatter.forOutputRitelKTPTerbit(
                    pinjamanDetail.jthtempoCadanganBunga!,
                  ),
          ),
          LabelAndValue(
            'Tanggal Pengajuan',
            pinjamanDetail.partnership!.dateDocUnderlying == null
                ? '-'
                : DateStringFormatter.forOutputRitelKTPTerbit(
                    pinjamanDetail.partnership!.dateDocUnderlying!,
                  ),
          ),
          LabelAndValue(
            'Jumlah Hari Pinjaman',
            pinjamanDetail.disburse!.jumlahHariPinjaman == null
                ? '-'
                : '${pinjamanDetail.disburse!.jumlahHariPinjaman} Hari',
          ),
        ],
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

      if (status == 'approval cbl' || status == 'verifikasi adk') {
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

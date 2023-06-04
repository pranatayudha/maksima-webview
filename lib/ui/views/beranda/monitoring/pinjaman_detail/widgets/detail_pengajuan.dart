import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../../application/models/monitoring_pinjaman_detail.dart';
import '../../../../../shared/styles.dart';
import 'label_and_value.dart';

class DetailPengajuan extends StatelessWidget {
  final Disburse? disburse;

  DetailPengajuan({Key? key, required this.disburse}) : super(key: key);

  final formatter = NumberFormat(
    'Rp#,###',
    'id_ID',
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Detail Pencairan',
            style: tsHeading8,
          ),
          LabelAndValue(
            'No. Dokumen Underlying',
            disburse?.numDocUnderlying ?? '-',
          ),
          LabelAndValue(
            'Nominal Underlying',
            (disburse?.amountUnderlying ?? '').isEmpty
                ? '-'
                : formatter.format(double.parse(disburse!.amountUnderlying!)),
          ),
          LabelAndValue(
            'PPN',
            (disburse?.ppn ?? '').isEmpty
                ? '-'
                : formatter.format(double.parse(disburse!.ppn!)),
          ),
          LabelAndValue(
            'Bunga Pinjaman',
            (disburse?.bungaPinjaman ?? '').isEmpty
                ? '-'
                : '${double.parse(disburse!.bungaPinjaman!)}%',
          ),
          LabelAndValue(
            'Tempo Cadangan Bunga',
            disburse?.cadanganBungaTempo == null
                ? '-'
                : '${disburse?.cadanganBungaTempo} Hari',
          ),
          LabelAndValue(
            'Sharing Dana Sendiri',
            disburse?.sharingDanaSendiri == null
                ? '-'
                : '${disburse?.sharingDanaSendiri}%',
          ),
          LabelAndValue(
            'Nominal Pencairan',
            (disburse?.amountDisburse ?? '').isEmpty
                ? '-'
                : formatter.format(double.parse(disburse!.amountDisburse!)),
            isHighlight: true,
          ),
          LabelAndValue(
            'Cadangan Bunga',
            (disburse?.cadanganBunga ?? '').isEmpty
                ? '-'
                : formatter.format(double.parse(disburse!.cadanganBunga!)),
            isHighlight: true,
          ),
          LabelAndValue(
            'Tgl. Jatuh Tempo Pembiayaan',
            (disburse?.endDateTempoCadanganBunga ?? '').isEmpty
                ? '-'
                : DateStringFormatter.forOutputRitelKTPTerbit(
                    disburse!.endDateTempoCadanganBunga!,
                  ),
          ),
          LabelAndValue(
            'Jumlah Hari Pinjaman',
            disburse?.jumlahHariPinjaman != null
                ? '${disburse!.jumlahHariPinjaman!} Hari'
                : '-',
          ),
        ],
      ),
    );
  }
}

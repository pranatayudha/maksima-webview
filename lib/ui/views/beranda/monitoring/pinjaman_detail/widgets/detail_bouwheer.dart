import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../../application/helpers/jenis_dokumen_formatter.dart';
import '../../../../../../application/helpers/jenis_konfirmasi_formatter.dart';
import '../../../../../../application/models/monitoring_pinjaman_detail.dart';
import '../../../../../shared/styles.dart';
import 'label_and_value.dart';

class DetailBouwheer extends StatelessWidget {
  final Partnership? partnership;
  final String? numBankPencairan;

  DetailBouwheer({
    Key? key,
    required this.partnership,
    required this.numBankPencairan,
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
          Text(
            'Detail Konfirmasi Bouwheer',
            style: tsHeading10,
          ),
          LabelAndValue(
            'Nama Bouwheer',
            partnership?.parnerName ?? '-',
          ),
          LabelAndValue(
            'Nama PIC Bouwheer',
            partnership?.picName ?? '-',
          ),
          LabelAndValue(
            'Jabatan PIC',
            partnership?.picJabatan ?? '-',
          ),
          LabelAndValue(
            'No. Handphone PIC',
            partnership?.picNum ?? '-',
          ),
          LabelAndValue(
            'Email PIC',
            partnership?.picEmail ?? '-',
          ),
          LabelAndValue(
            'Tanggal Konfirmasi',
            (partnership?.confirmDate ?? '').isEmpty
                ? '-'
                : DateStringFormatter.forOutputRitelKTPTerbit(
                    partnership!.confirmDate!,
                  ),
          ),
          LabelAndValue(
            'Jenis Dokumen Underlying',
            JenisDokumenFormatter.forOutput(
              partnership?.typeDocUnderLying ?? '-',
            ),
          ),
          LabelAndValue(
            'Nama Dokumen Underlying',
            partnership?.nameDocUnderlying ?? '-',
          ),
          LabelAndValue(
            'No. Dokumen Underlying',
            partnership?.noDokUnderlying ?? '-',
          ),
          LabelAndValue(
            'Tgl. Dokumen Underlying',
            (partnership?.dateDocUnderlying ?? '').isEmpty
                ? '-'
                : DateStringFormatter.forOutputRitelKTPTerbit(
                    partnership!.dateDocUnderlying!,
                  ),
          ),
          LabelAndValue(
            'Nominal Underlying',
            (partnership?.nominalUnderlying ?? '').isEmpty
                ? '-'
                : formatter.format(
                    double.parse(partnership!.nominalUnderlying!),
                  ),
          ),
          LabelAndValue(
            'Tgl. Jatuh Tempo Underlying',
            (partnership?.endDateUnderlying ?? '').isEmpty
                ? '-'
                : DateStringFormatter.forOutputRitelKTPTerbit(
                    partnership!.endDateUnderlying!,
                  ),
          ),
          LabelAndValue(
            'No. Rek Bank Raya',
            numBankPencairan ?? '-',
          ),
          LabelAndValue(
            'Jenis Konfirmasi',
            JenisKonfirmasiFormatter.forOutput(
              partnership?.typeConfirm ?? '-',
            ),
          ),
          LabelAndValue(
            'Hasil Konfirmasi',
            partnership?.konfirmBouwheer == null
                ? '-'
                : '${partnership!.konfirmBouwheer! ? 'Sudah' : 'Belum'} Sesuai',
          ),
        ],
      ),
    );
  }
}

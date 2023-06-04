import 'package:flutter/material.dart';

import '../../../../../shared/stripped_label.dart';
import '../widgets/komunitas_label_and_value.dart';

class InfoKomunitasTabView extends StatelessWidget {
  final Map<String, dynamic> komunitas;

  const InfoKomunitasTabView(
    this.komunitas, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.only(top: 10),
        children: [
          KomunitasLabelAndValue(
            label: 'Nama Komunitas',
            value: '${komunitas['nama']}',
          ),
          KomunitasLabelAndValue(
            label: 'Jenis Pertanian/Perkebunan/Peternakan',
            value: '${komunitas['komoditas']}',
          ),
          const KomunitasLabelAndValue(
            label: 'Nama Pemimpin',
            value: '-Belum Terdaftar-',
          ),
          const SizedBox(height: 15),
          const StrippedLabel(label: 'Lokasi Kelompok'),
          const SizedBox(height: 10),
          const KomunitasLabelAndValue(
            label: 'Kota',
            value: 'Nama Kota',
          ),
          const KomunitasLabelAndValue(
            label: 'Kecamatan',
            value: 'Nama Kecamatan',
          ),
          const KomunitasLabelAndValue(
            label: 'Kelurahan',
            value: 'Nama Kelurahan',
          ),
          const KomunitasLabelAndValue(
            label: 'Kode Pos',
            value: 'Nomor Kode Pos',
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../informasi_non_finansial_view_pari.dart';
import 'informasi_non_finansial_page_4_B_pari.dart';

class InformasiNonFinansialPageFourAPari extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinansialPageFourAPari({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  State<InformasiNonFinansialPageFourAPari> createState() =>
      _InformasiNonFinansialPageFourAPariState();
}

class _InformasiNonFinansialPageFourAPariState
    extends State<InformasiNonFinansialPageFourAPari> {
  @override
  Widget build(BuildContext context) {
    return InformasiNonFinansialPari(
      title: '4. Manajemen',
      page: 8,
      subTitle: 'A. Kalifikasi Komersial',
      list_question: const [
        {
          'desc': [
            'Debitur tidak memiliki catatan transaksi keuangan',
            'Pertanyaan masalah finansial dapat tidak dapat dijawab oleh debitur',
          ],
          'value': 1,
        },
        {
          'desc': [
            'Pembukuan/pencatatan transaki keuangan hanya berupa kumpulan nota-nota',
            'Pertanyaan masalah finansial dapat dijawab sebagian saja(kurang dari 50%)',
          ],
          'value': 2,
        },
        {
          'desc': [
            'Pembukuan/pencatatan transaksi keuangan dilakukan secara tertib dan teratur namun debitur belum mampu menyusun laporan keuangan yang baik sesuai dengan ETAP (Entitas Tanpa Akuntabilitas Publik) yang berlaku.',
            'Pertanyaan masalah finansial dapat dijawab secara garis besar(lebih dari 50%) secara garis besar.',
          ],
          'value': 3,
        },
        {
          'desc': [
            'Pembukuan/pencatatan transaksi keuangan dilakukan secara tertib dan debitur mampu menyusun laporan keuangan (neraca, laporan rugi laba dll) sesuai dengan ETAP (Entitas Tanpa Akuntabilitas Publik) yang berlaku.',
            'Pertanyaan masalah finansial dapat dijawab secara detail dan sesuai dengan pemaparan kuantitatif yang telah disampaikan di dalam laporan keuangan.',
          ],
          'value': 4,
        },
      ],
      typeQuestion: 1,
      isListArea: true,
      lastPage: false,
      nextPage: InformasiNonFinansialPageFourBPari(
        prakarsaId: widget.prakarsaId,
        name: widget.name,
        pipelineId: widget.pipelineId,
        loanTypesId: widget.loanTypesId,
        codeTable: widget.codeTable,
      ),
      prakarsaId: widget.prakarsaId,
      name: widget.name,
      pipelineId: widget.pipelineId,
      loanTypesId: widget.loanTypesId,
      codeTable: widget.codeTable,
    );
  }
}

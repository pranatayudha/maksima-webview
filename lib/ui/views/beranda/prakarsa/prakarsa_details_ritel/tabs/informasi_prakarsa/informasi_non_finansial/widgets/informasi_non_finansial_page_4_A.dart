import 'package:flutter/material.dart';

import '../informasi_non_finansial_view.dart';
import 'informasi_non_finansial_page_4_B.dart';

class InformasiNonFinansialPageFourA extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinansialPageFourA({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  State<InformasiNonFinansialPageFourA> createState() =>
      _InformasiNonFinansialPageFourAState();
}

class _InformasiNonFinansialPageFourAState
    extends State<InformasiNonFinansialPageFourA> {
  @override
  Widget build(BuildContext context) {
    return InformasiNonFinansial(
      title: '4. Manajemen',
      page: 8,
      subTitle: 'A. Kualifikasi Komersial',
      list_question: const [
        {
          'desc': [
            'Debitur tidak memiliki catatan transaksi keuangan.',
            'Pertanyaan-pertanyaan masalah finansial tidak dapat dijawab oleh debitur.',
          ],
          'value': 1,
        },
        {
          'desc': [
            'Pembukuan/pencatatan transaksi keuangan hanya berupa kumpulan nota-nota',
            'Pertanyaan masalah finansial dapat dijawab sebagian saja(kurang dari 50%)',
          ],
          'value': 2,
        },
        {
          'desc': [
            'Pembukuan/pencatatan transaksi keuangan dilakukan secara tertib dan teratur namun debitur belum mampu menyusun laporan keuangan yang baik sesuai dengan ETAP (Entitas Tanpa Akuntabilitas Publik) yang berlaku.',
            'Pertanyaan masalah finansial dapat dijawab sebagian besar(lebih dari 50%) secara garis besar.',
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
      nextPage: InformasiNonFinansialPageFourB(
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

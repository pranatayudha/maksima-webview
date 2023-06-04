// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../informasi_non_finansial_view_pari.dart';
import 'informasi_non_finansial_page_1_C_pari.dart';

class InformasiNonFinansialPageOneBPari extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinansialPageOneBPari({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  _InformasiNonFinansialPageOneBPariState createState() =>
      _InformasiNonFinansialPageOneBPariState();
}

class _InformasiNonFinansialPageOneBPariState
    extends State<InformasiNonFinansialPageOneBPari> {
  @override
  Widget build(BuildContext context) {
    return InformasiNonFinansialPari(
      title: '1. Karakter',
      page: 1,
      subTitle: 'B. Pengelolaan Rekening Bank',
      list_question: const [
        {
          'desc': [
            'Janji tidak ditepati (masih terdapat kewajiban yang belum diselesaikan atau pernah terlambat membayar kewajibannya di bank lain atau di BRI Agro minimum 3 kali dalam 1 tahun).',
            'Terdapat dokumen yang belum dipenuhi baik sebagai deposan maupun debitur atau melanggar perjanjian kredit dan tidak ada surat keterangan dari debitur maupun dari bank lain atau BRI Agro.',
            'Selalu menepati janji yang dibuat dengan Bank.',
            'Tidak pernah terlambat membayar.',
          ],
          'value': 1,
        },
        {
          'desc': [
            'Tidak menepati janji (terlambat membayar (tidak lebih daru 2 kali dalam 1 tahun).',
            'Terlambat memnuhi kelengakapan dokumen atau tidak memenuhi kredit, tapi dapat diperbaiki dengan segera.',
            'Informasi terbatas dikarenakan belum menjadi nasabah pada Bank namun telah memenuhi dokumentasi primer (pokok) yang dipersyaratkan sebagai calon nasabah',
          ],
          'value': 2,
        },
        {
          'desc': [
            'Pernah tidak menepati janji (terlambat membayar tidak lebih ari 1 kali dalam 1 tahun.',
            'Terlambat memenuhi kelengkapan dokumen atau tidak memenuhi perjanjian kredit, dengan alasan yang dapat diterima bank.',
            'Nasabah baru (harus take over) dengan bukti-bukti yang diperoleh dari calon debitur dan pihak ketiga, termasuk pemenuhan kelengakapan dokumen.',
          ],
          'value': 3,
        },
        {
          'desc': [
            'Selalu menepati janji yang dibuat dengan bank.',
            'Tidak pernah terlambat membayar.',
            'Memenuhi kelengkapan dokumen dan memenuhi perjanjian kredit.',
          ],
          'value': 4,
        },
      ],
      typeQuestion: 1,
      isListArea: true,
      lastPage: false,
      nextPage: InformasiNonFinansialPageOneCPari(
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

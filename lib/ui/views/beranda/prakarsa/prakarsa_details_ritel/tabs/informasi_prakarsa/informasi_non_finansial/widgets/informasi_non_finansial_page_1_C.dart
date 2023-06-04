// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../informasi_non_finansial_view.dart';
import 'informasi_non_finansial_page_1_D.dart';

class InformasiNonFinansialPageOneC extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinansialPageOneC({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  _InformasiNonFinansialPageOneCState createState() =>
      _InformasiNonFinansialPageOneCState();
}

class _InformasiNonFinansialPageOneCState
    extends State<InformasiNonFinansialPageOneC> {
  @override
  Widget build(BuildContext context) {
    return InformasiNonFinansial(
      title: '1. Karakter',
      page: 2,
      subTitle: 'C. Reputasi Bisnis',
      list_question: const [
        {
          'desc':
              'Terdapat informasi negatif dari supplier/pelanggan/perusahaan sejenis namun tidak dapat dijelaskan oleh nasabah disertai bukti tertulis yang memadai.',
          'value': 1,
        },
        {
          'desc':
              'Terdapat informasi negatif dari supplier/pelanggan/perusahaan sejenis namun dapat dijelaskan oleh nasabah disertai bukti yang memadai, Informasi tentang hubungan bisnis terbatas dikarenakan pelaku usaha baru dibidangnya namun telah memenuhi dokumentasi primer (pokok) yang dipersyaratkan oleh ketentuan yang berlaku dalam menjalankan kegiatan usahanya.',
          'value': 2,
        },
        {
          'desc':
              'Tidak terdapat informasi negatif dari supplier atau konsumen atau perusahaan sejenis mencangkup hubungan bisnis dalam jangka waktu < 2 tahun.',
          'value': 3,
        },
        {
          'desc':
              'Tidak terdapat informasi negatif dari supplier atau konsumen atau perusahaan sejenis mencangkup hubungan bisnis dalam jangka waktu ≥ 2 tahun.',
          'value': 4,
        },
      ],
      typeQuestion: 0,
      isListArea: true,
      lastPage: false,
      nextPage: InformasiNonFinansialPageOneD(
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

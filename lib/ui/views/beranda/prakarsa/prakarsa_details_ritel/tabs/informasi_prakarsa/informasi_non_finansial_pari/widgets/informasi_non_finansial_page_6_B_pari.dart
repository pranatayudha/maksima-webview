// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../informasi_non_finansial_view_pari.dart';
import 'informasi_non_finansial_page_6_C_pari.dart';

class InformasiNonFinansialPageSixBPari extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinansialPageSixBPari({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  _InformasiNonFinansialPageSixBPariState createState() =>
      _InformasiNonFinansialPageSixBPariState();
}

class _InformasiNonFinansialPageSixBPariState
    extends State<InformasiNonFinansialPageSixBPari> {
  @override
  Widget build(BuildContext context) {
    return InformasiNonFinansialPari(
      title: '6. Jaminan',
      page: 13,
      subTitle: 'B. Hubungan Kepemilikan Agunan dengan Debitur',
      list_question: const [
        {
          'desc':
              'Agunan Atas nama anggota keluarga lain atau keluarga dekat pemegang saham, afiliasi',
          'value': 1,
        },
        {
          'desc': 'Agunan Atas nama ipar/mertua/pengurus non pemegang saham',
          'value': 2,
        },
        {
          'desc':
              'Agunan Atas nama pasangan debitur (suami/istri/orang tua/anak/kakak/adik) atau pemegang saham minoritas',
          'value': 3,
        },
        {
          'desc':
              'Agunan Atas nama debitur sendiri atau pemegang saham mayoritas',
          'value': 4,
        },
      ],
      typeQuestion: 0,
      isListArea: false,
      lastPage: false,
      nextPage: InformasiNonFinansialPageSixCPari(
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

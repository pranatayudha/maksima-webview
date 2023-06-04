// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../informasi_non_finansial_view.dart';
import 'informasi_non_finansial_page_6_C.dart';

class InformasiNonFinansialPageSixB extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinansialPageSixB({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  _InformasiNonFinansialPageSixBState createState() =>
      _InformasiNonFinansialPageSixBState();
}

class _InformasiNonFinansialPageSixBState
    extends State<InformasiNonFinansialPageSixB> {
  @override
  Widget build(BuildContext context) {
    return InformasiNonFinansial(
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
      isListArea: true,
      lastPage: false,
      nextPage: InformasiNonFinansialPageSixC(
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

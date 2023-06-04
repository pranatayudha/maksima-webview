// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../informasi_non_finansial_view.dart';
import 'informasi_non_finansial_page_6_B.dart';

class InformasiNonFinansialPageSixA extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinansialPageSixA({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  _InformasiNonFinansialPageSixAState createState() =>
      _InformasiNonFinansialPageSixAState();
}

class _InformasiNonFinansialPageSixAState
    extends State<InformasiNonFinansialPageSixA> {
  @override
  Widget build(BuildContext context) {
    return InformasiNonFinansial(
      title: '6. Jaminan',
      page: 12,
      subTitle: 'A. Coverage Agunan',
      list_question: const [
        {'desc': 'Agunan mengcover ≤ 50%', 'value': 1},
        {'desc': 'Agunan mengcover > 50% s/d 80%', 'value': 2},
        {'desc': 'Agunan mengcover > 80% s/d 100%', 'value': 3},
        {'desc': 'Agunan mengcover > 100%', 'value': 4},
      ],
      typeQuestion: 0,
      isListArea: false,
      lastPage: false,
      nextPage: InformasiNonFinansialPageSixB(
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

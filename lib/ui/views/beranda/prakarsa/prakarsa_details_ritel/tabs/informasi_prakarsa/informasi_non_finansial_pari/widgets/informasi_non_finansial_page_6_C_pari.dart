// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../informasi_non_finansial_view_pari.dart';
import 'summary_non_finansial_pari.dart';

class InformasiNonFinansialPageSixCPari extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinansialPageSixCPari({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  _InformasiNonFinansialPageSixCPariState createState() =>
      _InformasiNonFinansialPageSixCPariState();
}

class _InformasiNonFinansialPageSixCPariState
    extends State<InformasiNonFinansialPageSixCPari> {
  @override
  Widget build(BuildContext context) {
    return InformasiNonFinansialPari(
      title: '6. Jaminan',
      page: 14,
      subTitle: 'C. Marketabilitas Agunan',
      list_question: const [
        {'desc': 'Agunan tidak marketable', 'value': 1},
        {'desc': 'Agunan marketable', 'value': 4},
      ],
      typeQuestion: 0,
      isListArea: false,
      lastPage: true,
      nextPage: SummaryNonFinansialPari(
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

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../informasi_non_finansial_view_pari.dart';
import 'informasi_non_finansial_page_1_B_pari.dart';

class InformasiNonFinasialPageOneAPari extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinasialPageOneAPari({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  _InformasiNonFinasialPageOneAPariState createState() =>
      _InformasiNonFinasialPageOneAPariState();
}

class _InformasiNonFinasialPageOneAPariState
    extends State<InformasiNonFinasialPageOneAPari> {
  @override
  Widget build(BuildContext context) {
    return InformasiNonFinansialPari(
      headerTitle: 'Informasi Non Finansial',
      title: '1. Karakter',
      page: 0,
      subTitle: 'A. Tingkat Kepercayaan',
      list_question: const [
        {
          'desc':
              'Sebagian atau keseluruhan informasi yang diberikan tidak sesuai dengan kondisi sebenarnya.',
          'value': 1,
        },
        {
          'desc':
              'Sebagian atau seluruh informasi yang diberikan tidak sesuai dengan kondisi sebenarnya namun debitur secara aktif menyampaikannya.',
          'value': 2,
        },
        {
          'desc':
              'Informasi yang diberikan debitur sesuai dengan kondisi sebenarnya namun baru diberikan bila diminta.',
          'value': 3,
        },
        {
          'desc':
              'Informasi yang diberikan debitur sesuai dengan kondisi sebenarnya dan debitur secara aktif menyampaikannya.',
          'value': 4,
        },
      ],
      typeQuestion: 0,
      isListArea: true,
      lastPage: false,
      nextPage: InformasiNonFinansialPageOneBPari(
        prakarsaId: widget.prakarsaId,
        name: widget.name,
        pipelineId: widget.pipelineId,
        loanTypesId: widget.loanTypesId,
        codeTable: widget.codeTable,
      ),
      startPage: true,
      prakarsaId: widget.prakarsaId,
      name: widget.name,
      pipelineId: widget.pipelineId,
      loanTypesId: widget.loanTypesId,
      codeTable: widget.codeTable,
    );
  }
}

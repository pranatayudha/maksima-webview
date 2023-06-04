// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../informasi_non_finansial_view.dart';
import 'informasi_non_finansial_page_6_A.dart';

class InformasiNonFinansialPageFive extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinansialPageFive({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  _InformasiNonFinansialPageFiveState createState() =>
      _InformasiNonFinansialPageFiveState();
}

class _InformasiNonFinansialPageFiveState
    extends State<InformasiNonFinansialPageFive> {
  @override
  Widget build(BuildContext context) {
    return InformasiNonFinansial(
      title: '5. Prospek Industri',
      page: 11,
      subTitle: 'Prospek Industri',
      list_question: const [
        {
          'desc':
              'Kondisi makro dimasa depan memberikan pengaruh negatif terhadap prospek industri debitur sehingga lebih buruk dari periode sebelumnya.',
          'value': 1,
        },
        {
          'desc':
              'Kondisi makro dimasa depan cenderung stabil dan mempertahankan prospek indsutri yang digeluti debitur sama dengan periode sebelumnya yang masih buruk.',
          'value': 2,
        },
        {
          'desc':
              'Kondisi makro dimasa depan lebih baik dari periode sebelumnya namun tidak memberikan dampak positif bagi industri yang digeluti debitur.',
          'value': 3,
        },
        {
          'desc':
              'Kondisi makro dimasa depan lebih baik dari periode sebelumnya dan memberikan dampak positif bagi industri yang digeluti debitur.',
          'value': 4,
        },
      ],
      typeQuestion: 0,
      isListArea: true,
      lastPage: false,
      nextPage: InformasiNonFinansialPageSixA(
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

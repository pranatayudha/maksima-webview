// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../informasi_non_finansial_view_pari.dart';
import 'informasi_non_finansial_page_2_A_pari.dart';

class InformasiNonFinansialPageOneDPari extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinansialPageOneDPari({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  _InformasiNonFinansialPageOneDPariState createState() =>
      _InformasiNonFinansialPageOneDPariState();
}

class _InformasiNonFinansialPageOneDPariState
    extends State<InformasiNonFinansialPageOneDPari> {
  @override
  Widget build(BuildContext context) {
    return InformasiNonFinansialPari(
      title: '1. Karakter',
      page: 3,
      subTitle: 'D. Perilaku Dasar',
      list_question: const [
        {
          'desc':
              'Debitur memiliki gaya hidup atau permasalahan pribadi yang dapat mengurangi kemampuan membayar kredit pada saat ini atau masa mendatang.',
          'value': 1,
        },
        {
          'desc':
              'Informasi dan data mengenai gaya hidup dan riwayat pribadi terbatas dikarenakan yang bersangkutan merupakan nasabah baru.',
          'value': 2,
        },
        {
          'desc':
              'Debitur tidak memiliki gaya hidup atau permasalahan pribadi yang dapat mengurangi kemampuan membayar kredit pada saat ini.',
          'value': 3,
        },
        {
          'desc':
              'Debitur tidak memiliki gaya hidup atau permasalahan pribadi yang dapat mengurangi kemampuan membayar kredit pada saat ini dan masa mendatang.',
          'value': 4,
        },
      ],
      typeQuestion: 0,
      isListArea: true,
      lastPage: false,
      nextPage: InformasiNonFinansialPageTwoAPari(
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

import 'package:flutter/material.dart';

import '../informasi_non_finansial_view_pari.dart';
import 'informasi_non_finansial_page_4_A_pari.dart';

class InformasiNonFinansialPageThreePari extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinansialPageThreePari({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  State<InformasiNonFinansialPageThreePari> createState() =>
      _InformasiNonFinansialPageThreePariState();
}

class _InformasiNonFinansialPageThreePariState
    extends State<InformasiNonFinansialPageThreePari> {
  @override
  Widget build(BuildContext context) {
    return InformasiNonFinansialPari(
      title: '3. Perkembangan Pasar dan Situasi Persaingan',
      page: 7,
      subTitle: 'Perkembangan Pasar & Persaingan',
      list_question: const [
        {
          'desc': [
            'Pasar menunjukkan penurunan',
            'Tidak terdapat peluang menghasilkan laba',
            'Jumlah pesaing meningkat dengan tajam',
          ],
          'value': 1,
        },
        {
          'desc': [
            'Pasar tidak berkembang',
            'Peluang mendapatkan laba menurun',
            'jumlah pesaing meningkat',
          ],
          'value': 2,
        },
        {
          'desc': [
            'Perkembangan pasar diperkirakan tetap stabil',
            'Peluang mendapatkan laba stabil',
            'Jumlah pesaing meningkat',
          ],
          'value': 3,
        },
        {
          'desc': [
            'Perkembangan pasar diperkirakan tetap tinggi',
            'Peluang untuk mendapatkan laba tinggi',
            'Jumlah pesaing menurun atau tetap',
          ],
          'value': 4,
        },
      ],
      typeQuestion: 1,
      isListArea: true,
      lastPage: false,
      nextPage: InformasiNonFinansialPageFourAPari(
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

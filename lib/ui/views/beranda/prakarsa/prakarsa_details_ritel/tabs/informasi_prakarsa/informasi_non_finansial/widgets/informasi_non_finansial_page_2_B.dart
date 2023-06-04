import 'package:flutter/material.dart';

import '../informasi_non_finansial_view.dart';
import 'informasi_non_finansial_page_2_C.dart';

class InformasiNonFinansialPageTwoB extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinansialPageTwoB({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  State<InformasiNonFinansialPageTwoB> createState() =>
      _InformasiNonFinansialPageTwoBState();
}

class _InformasiNonFinansialPageTwoBState
    extends State<InformasiNonFinansialPageTwoB> {
  @override
  Widget build(BuildContext context) {
    return InformasiNonFinansial(
      title: '2. Posisi Pasar',
      page: 5,
      subTitle: 'B. Strategi & Ketergantungan Pasar',
      list_question: const [
        {
          'desc': [
            'Nasabah tidak memiliki strategi pemasaran',
            'Sangat tergantung pada supplier/pembeli tertentu',
          ],
          'value': 1,
        },
        {
          'desc': [
            'Nasabah memiliki strategi pemasaran yang kurang tepat',
            'Terdapat ketergantungan pada supplier/pembeli tertentu',
          ],
          'value': 2,
        },
        {
          'desc': [
            'Nasabah memiliki strategi pemasaran yang cukup tepat',
            'Tidak terdapat ketergantungan namun supplier/pembeli terbatas',
          ],
          'value': 3,
        },
        {
          'desc': [
            'Nasabah memiliki strategi pemasaran yang tepat',
            'Tidak terdapat ketergantungan karena supplier/pembeli banyak dan bervariasi',
          ],
          'value': 4,
        },
      ],
      typeQuestion: 1,
      isListArea: true,
      lastPage: false,
      nextPage: InformasiNonFinansialPageTwoC(
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

import 'package:flutter/material.dart';

import '../informasi_non_finansial_view.dart';
import 'informasi_non_finansial_page_4_C.dart';

class InformasiNonFinansialPageFourB extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinansialPageFourB({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  State<InformasiNonFinansialPageFourB> createState() =>
      _InformasiNonFinansialPageFourBState();
}

class _InformasiNonFinansialPageFourBState
    extends State<InformasiNonFinansialPageFourB> {
  @override
  Widget build(BuildContext context) {
    return InformasiNonFinansial(
      title: '4. Manajemen',
      page: 9,
      subTitle: 'B. Kualifikasi Teknis',
      list_question: const [
        {
          'desc': [
            'Kurang memiliki keahlian atau tidak memiliki pengalaman kerja yang relevan dengan usaha yang dikelola.',
            'Tidak memiliki motivasi untuk mengembangkan profesionalisme',
            'Tidak mengerti terhadap perkembangan pasar/industri, khususnya terkait dengan kegiatan usahanya.',
          ],
          'value': 1,
        },
        {
          'desc': [
            'Memiliki dasar keahlian yang kuat tetapi kurang berpengalaman (pengalaman minimal 2 tahun).',
            'Kurang memiliki motivasi untuk mengembangkan profesionalisme',
            'Kurang tanggap terhadap perkembangan pasar/industri, khususnya terkait dengan kegiatan usahanya.',
          ],
          'value': 2,
        },
        {
          'desc': [
            'Memiliki keahlian yang baik dan pengalaman sebagai pengelola yang berkaitan selama < 2 tahun.',
            'Memiliki motivasi untuk mengembangkan profesionalisme',
            'Cukup tanggap terhadap perkembangan pasar/industri',
          ],
          'value': 3,
        },
        {
          'desc': [
            'Memiliki keahlian dan pengalaman sebagai pengelola usaha selama beberapa tahun (≥ 2 tahun) dalam bidang yang berkaitan.',
            'Memiliki motivasi yang tinggi untuk mengembangkan pengetahuan dan keahlian (profesionalisme).',
            'Selalu mengikuti perkembangan pasar/industri, khususnya terkait dengan kegiatan usahanya.',
          ],
          'value': 4,
        },
      ],
      typeQuestion: 1,
      isListArea: true,
      lastPage: false,
      nextPage: InformasiNonFinansialPageFourC(
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

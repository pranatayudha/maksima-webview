import 'package:flutter/material.dart';

import '../informasi_non_finansial_view.dart';
import 'informasi_non_finansial_page_5.dart';

class InformasiNonFinansialPageFourC extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinansialPageFourC({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  State<InformasiNonFinansialPageFourC> createState() =>
      _InformasiNonFinansialPageFourCState();
}

class _InformasiNonFinansialPageFourCState
    extends State<InformasiNonFinansialPageFourC> {
  @override
  Widget build(BuildContext context) {
    return InformasiNonFinansial(
      title: '4. Manajemen',
      page: 10,
      subTitle: 'C. Struktur Internal Perusahaan',
      list_question: const [
        {
          'desc': [
            'Tidak terdapat konsep pergantian pimpinan (kaderisasi)',
            'Organisasi tidak disesuaikan dengan perkembangan/kebutuhan pasar',
            'Tenaga kerja yang digunakan sangat terbatas dan bersifat tenaga kerja lepas.',
          ],
          'value': 1,
        },
        {
          'desc': [
            'Nasabah memiliki konsep pergantian pimpinan tetapi belum menyiapkan kader',
            'Nasabah terlambat dalam menyesuaikan organisasi dengan perkembangan pasar',
            'Tenaga kerja yang digunakan cukup dan sebagian besar merupakan tenaga kerja lepas dengan tingkat turn over karyawan tetap rata-rata > 50% dari total karyawan tetap setiap tahunnya.',
          ],
          'value': 2,
        },
        {
          'desc': [
            'Nasabah memiliki konsep pergantian pimpinan tetapi kader belum siap menggantikan.',
            'Nasabah menyesuaikan organisasi dengan perkembangan pasar (tidak proaktif)',
            'Tenaga kerja yang digunakan cukup dan sebagian masih menggunakan tenaga kerja lepas dengan tingkat turn over karyawan tetap rata-rata > 15 % namun ≤ 50% dari total karyawan tetap setiap tahunnya.',
          ],
          'value': 3,
        },
        {
          'desc': [
            'Nasabah memiliki konsep pergantian pimpinan dan telah memiliki kader yang siap menggantikan.',
            'Nasabah secara proaktif menyesuaikan organisasi dengan perkembangan pasar, khususnya terkait dengan kegiatan usahanya.',
            'Tenaga kerja yang digunakan sudah memadai dan sebagian kecil menggunakan tenaga kerja lepas untuk pekerjaan tertentu dengan tingkat turn over karyawan tetap rata-rata ≤ 15% dari total karyawan tetap setiap tahunnya.',
          ],
          'value': 4,
        },
      ],
      typeQuestion: 1,
      isListArea: true,
      lastPage: false,
      nextPage: InformasiNonFinansialPageFive(
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

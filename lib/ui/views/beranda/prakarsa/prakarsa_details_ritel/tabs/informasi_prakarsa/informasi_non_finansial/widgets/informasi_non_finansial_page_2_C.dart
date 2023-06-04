import 'package:flutter/material.dart';

import '../informasi_non_finansial_view.dart';
import 'informasi_non_finansial_page_3.dart';

class InformasiNonFinansialPageTwoC extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinansialPageTwoC({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  State<InformasiNonFinansialPageTwoC> createState() =>
      _InformasiNonFinansialPageTwoCState();
}

class _InformasiNonFinansialPageTwoCState
    extends State<InformasiNonFinansialPageTwoC> {
  @override
  Widget build(BuildContext context) {
    return InformasiNonFinansial(
      title: '2. Posisi Pasar',
      page: 6,
      subTitle: 'C. Lokasi Usaha',
      list_question: const [
        {
          'desc': [
            'Lokasi usaha sulit dicapai oleh pembeli/pemasok',
            'Sulit untuk mendapatkan tenaga kerja',
            'Telah terdapat pembatasan peruntukan oleh pemerintah/pihak yang berwenang atau lokasi usaha tidak sesuai dengan peruntukan',
          ],
          'value': 1,
        },
        {
          'desc': [
            'Jalan ke lokasi usaha nasabah masih dapat dicapai.',
            'Ketersediaan tenaga kerja memerlukan waktu yang lama atau membutuhkan biaya ekstra.',
            'Diperkirakan akan terdapat perubahan peruntukan oleh pemerintah/pihak yang berwenang',
          ],
          'value': 2,
        },
        {
          'desc': [
            'Tidak terdapat permasalahn bagi pembeli/pemasok untuk mencapai lokasi usaha',
            'Pada umumnya tidak terdapat permasalahan dalam hal ketersediaan tenaga kerja namun untuk kualifikasi tertentu sulit diperoleh.',
            'Tidak terdapat pembatasan/perubahan peruntukan lokasi yang merugikan oleh pemerintah/pihak yang berwenang.',
          ],
          'value': 3,
        },
        {
          'desc': [
            'Lokasi usaha mudah dicapai oleh pembeli/pemasok',
            'Berdasarkan surat resmi dan/atau keputusan dan/atau peraturan dari pemda setempat (instansi terkait), tidak terdapat masalah dalam hal ketersediaan tenaga kerja (baik kualitas maupun kuantitas)',
            'Berdasarkan surat resmi dan/atau keputusan dan/atau peraturan dari pemda setempat (instansi terkait), diperkirakan tidak terdapat perubahan peruntukan lokasi oleh pemerintah/ yang berwenang.',
          ],
          'value': 4,
        },
      ],
      typeQuestion: 1,
      isListArea: true,
      lastPage: false,
      nextPage: InformasiNonFinansialPageThree(
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

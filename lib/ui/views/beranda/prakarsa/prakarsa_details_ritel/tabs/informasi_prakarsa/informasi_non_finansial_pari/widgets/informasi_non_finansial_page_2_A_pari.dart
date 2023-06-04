import 'package:flutter/material.dart';

import '../informasi_non_finansial_view_pari.dart';
import 'informasi_non_finansial_page_2_B_pari.dart';

class InformasiNonFinansialPageTwoAPari extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinansialPageTwoAPari({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  State<InformasiNonFinansialPageTwoAPari> createState() =>
      _InformasiNonFinansialPageTwoAPariState();
}

class _InformasiNonFinansialPageTwoAPariState
    extends State<InformasiNonFinansialPageTwoAPari> {
  @override
  Widget build(BuildContext context) {
    return InformasiNonFinansialPari(
      title: '2. Posisi Pasar',
      page: 4,
      subTitle: 'A. Kualitas Produk & Jasa',
      list_question: const [
        {
          'desc': [
            'Jenis produk/barang dagangan/jasa tidak memenuhi kebutuhan pembeli',
            'Harga jual lebih mahal dibandingkan pesaing',
            'Pemenuhan pesanan lebih lambat dari pesaing dan tidak dapat diterima',
            'Personil tidak trampil dan tidak bersahabat',
          ],
          'value': 1,
        },
        {
          'desc': [
            'Jenis produk/barang  dagana/jasa kurang memenuhi kebutuhan pembeli',
            'Harga jual masih dapat bersaing',
            'Pemenuhan pesanan lebih lambat dari pesan namun masih dapat diterima',
            'Personil bersahabat namun kurang terampil',
          ],
          'value': 2,
        },
        {
          'desc': [
            'Jenis produk/barang dagangan/jasa cukup memenuhi kebutuhan pembeli',
            'Harga jual relatif sama dibanding pesaing',
            'Pemenuhan pesanan sama cepat dengan pesaing',
            'Personil terampil namun kurang bersahabat',
          ],
          'value': 3,
        },
        {
          'desc': [
            'Jenis produk/barang dagangan/kasa memenuhi kebutuhan pebeli',
            'Harga jual lebih murah dibanding pesaing',
            'Pemenuhan pesanan lebih cepat dari pesaing',
            'Personil terampil dan bersahabat',
          ],
          'value': 4,
        },
      ],
      typeQuestion: 1,
      isListArea: true,
      lastPage: false,
      nextPage: InformasiNonFinansialPageTwoBPari(
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

import 'package:flutter/material.dart';

import '../informasi_non_finansial_view.dart';
import 'informasi_non_finansial_page_2_B.dart';

class InformasiNonFinansialPageTwoA extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinansialPageTwoA({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  State<InformasiNonFinansialPageTwoA> createState() =>
      _InformasiNonFinansialPageTwoAState();
}

class _InformasiNonFinansialPageTwoAState
    extends State<InformasiNonFinansialPageTwoA> {
  @override
  Widget build(BuildContext context) {
    return InformasiNonFinansial(
      title: '2. Posisi Pasar',
      page: 4,
      subTitle: 'A. Kualitas Produk & Jasa',
      list_question: const [
        {
          'desc': [
            'Jenis produk/barang dagangan/jasa tidak memenuhi kebutuhan pembeli.',
            'Harga jual lebih mahal dibandingkan pesaing',
            'Pemenuhan pesanan lebih lambat dari pesaing dan tidak dapat diterima',
            'Personil tidak terampil dan tidak bersahabat',
          ],
          'value': 1,
        },
        {
          'desc': [
            'Jenis produk/barang dagangan/jasa kurang memenuhi kebutuhan pembeli.',
            'Harga jual masih dapat bersaing',
            'Pemenuhan pesanan lebih lambat dari pesaing namun masih dapat diterima',
            'Personil bersahabat namun kurang terampil',
          ],
          'value': 2,
        },
        {
          'desc': [
            'Jenis produk/barang dagangan/jasa cukup memenuhi kebutuhan pembeli.',
            'Harga jual relatif sama dibanding pesaing',
            'Pemenuhan pesanan sama cepat dengan pesaing',
            'Personil terampil namun kurang bersahabat',
          ],
          'value': 3,
        },
        {
          'desc': [
            'Jenis produk/barang dagangan/jasa memenuhi kebutuhan pembeli',
            'Harga jual lebih murah dibanding pesaing',
            'Pemenuhan pesanan lebih cepat dari pesanan',
            'Personil terampil dan bersahabat',
          ],
          'value': 4,
        },
      ],
      typeQuestion: 1,
      isListArea: true,
      lastPage: false,
      nextPage: InformasiNonFinansialPageTwoB(
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

import 'package:flutter/material.dart';

import '../anggota_detail/anggota_detail_view.dart';
import 'anggota_card.dart';

class Anggotas extends StatelessWidget {
  final Map<String, dynamic> komunitas;

  const Anggotas(
    this.komunitas, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
        shrinkWrap: true,
        itemCount: (komunitas['anggotas'] as List).length + 1,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnggotaDetailView(
                komunitas['anggotas'][index] as Map<String, dynamic>,
              ),
            ),
          ),
          child: index < (komunitas['anggotas'] as List).length
              ? Stack(
                  children: [
                    AnggotaCard(
                      nama: '${komunitas['anggotas'][index]['nama']}',
                      nilaiPinjaman: 'Rp. 100.000.000,-',
                    ),
                    Container(
                      width: double.infinity,
                      height: 45,
                      color: Colors.transparent,
                    ),
                  ],
                )
              : const SizedBox(height: 75),
        ),
        separatorBuilder: (context, index) => const Divider(
          height: 35,
          thickness: 1.5,
        ),
      ),
    );
  }
}

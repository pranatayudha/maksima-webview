import 'package:flutter/material.dart';

import '../../../../../shared/custom_outlined_button.dart';
import '../../tambah_anggota/tambah_anggota_view.dart';
import '../widgets/anggotas.dart';

class AnggotaTabView extends StatelessWidget {
  final Map<String, dynamic> komunitas;

  const AnggotaTabView(
    this.komunitas, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 10),
              Anggotas(komunitas),
            ],
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: CustomOutlinedButton(
              label: '+ Tambah Anggota',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TambahAnggotaView(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

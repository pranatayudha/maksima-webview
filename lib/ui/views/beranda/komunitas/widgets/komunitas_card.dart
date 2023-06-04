import 'package:flutter/material.dart';

class KomunitasCard extends StatelessWidget {
  final String nama;
  final String komoditas;
  final int dalamRencanaKerja;
  final int jumlahAnggota;

  const KomunitasCard({
    Key? key,
    required this.nama,
    required this.komoditas,
    required this.dalamRencanaKerja,
    required this.jumlahAnggota,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          nama,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.8,
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Komoditas: ',
                      style: TextStyle(
                        color: Colors.black54,
                        letterSpacing: -0.8,
                      ),
                    ),
                    Text(
                      komoditas,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.8,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Text(
                      'Dalam Rencana Kerja: ',
                      style: TextStyle(
                        color: Colors.black54,
                        letterSpacing: -0.8,
                      ),
                    ),
                    Text(
                      dalamRencanaKerja.toString(),
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.8,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  jumlahAnggota.toString(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    letterSpacing: -0.8,
                  ),
                ),
                const SizedBox(height: 3.0),
                const Text(
                  'Anggota',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    letterSpacing: -0.8,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

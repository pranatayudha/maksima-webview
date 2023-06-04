import 'package:flutter/material.dart';

class AnggotaCard extends StatelessWidget {
  final String nama;
  final String nilaiPinjaman;

  const AnggotaCard({
    Key? key,
    required this.nama,
    required this.nilaiPinjaman,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Placeholder(
          fallbackHeight: 40,
          fallbackWidth: 40,
          color: Colors.black26,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
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
              const SizedBox(height: 5.0),
              Text(
                nilaiPinjaman,
                style: const TextStyle(
                  color: Colors.black54,
                  letterSpacing: -0.8,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

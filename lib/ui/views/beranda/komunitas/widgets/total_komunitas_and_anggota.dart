import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../komunitas_viewmodel.dart';

class TotalKomunitasAndAnggota extends HookViewModelWidget<KomunitasViewModel> {
  const TotalKomunitasAndAnggota({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    KomunitasViewModel viewModel,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Text('Total Komunitas'),
              const SizedBox(height: 10),
              Text(
                '${viewModel.communities.length}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.8,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Text('Total Anggota'),
              const SizedBox(height: 10),
              Text(
                '${viewModel.totalAnggota}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

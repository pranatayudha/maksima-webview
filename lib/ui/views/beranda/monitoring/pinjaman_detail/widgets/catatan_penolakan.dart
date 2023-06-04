import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../shared/styles.dart';
import '../pinjaman_detail_viewmodel.dart';

class CatatanPenolakan extends HookViewModelWidget<PinjamanDetailViewModel> {
  final String? role;
  final String? notes;
  final String notesType;

  const CatatanPenolakan({Key? key, required this.role, required this.notes, required this.notesType}) : super(key: key);

  @override
  Widget buildViewModelWidget(BuildContext context, PinjamanDetailViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Catatan $notesType dari ${role ?? '-'}',
            style: tsHeading8,
          ),
          const SizedBox(height: 8),
          Text(
            notes ?? 'Tidak ada notes.',
            style: tsBody3,
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: no-empty-block

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../shared/back_button_and_title.dart';
import '../../../shared/custom_outlined_button.dart';
import '../../../shared/stripped_label.dart';
import 'komunitas_viewmodel.dart';
import 'widgets/communities.dart';
import 'widgets/search_bar.dart';
import 'widgets/total_komunitas_and_anggota.dart';

class KomunitasView extends ViewModelBuilderWidget<KomunitasViewModel> {
  const KomunitasView({Key? key}) : super(key: key);

  @override
  KomunitasViewModel viewModelBuilder(BuildContext context) =>
      KomunitasViewModel();

  @override
  Widget builder(
    BuildContext context,
    KomunitasViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const BackButtonAndTitle('Komunitas', centerTitle: true),
                const TotalKomunitasAndAnggota(),
                const StrippedLabel(label: 'Daftar Komunitas'),
                SearchBar(
                  hintText: 'Cari Komunitas',
                  onChanged: (val) {},
                ),
                const Communities(),
              ],
            ),
            Positioned(
              bottom: 24,
              left: 24,
              right: 24,
              child: CustomOutlinedButton(
                label: '+ Tambah Komunitas',
                onPressed: viewModel.navigateToTambahKomunitasView,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

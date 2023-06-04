import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../komunitas_viewmodel.dart';
import 'komunitas_card.dart';

class Communities extends HookViewModelWidget<KomunitasViewModel> {
  const Communities({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    KomunitasViewModel viewModel,
  ) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        shrinkWrap: true,
        itemCount: viewModel.communities.length + 1,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => viewModel
              .navigateToKomunitasDetailView(viewModel.communities[index]),
          child: index < viewModel.communities.length
              ? Stack(
                  children: [
                    KomunitasCard(
                      nama: viewModel.communities[index]['nama'] as String,
                      komoditas:
                          viewModel.communities[index]['komoditas'] as String,
                      dalamRencanaKerja: viewModel.communities[index]
                          ['dalamRencanaKerja'] as int,
                      jumlahAnggota:
                          viewModel.communities[index]['jumlahAnggota'] as int,
                    ),
                    Container(
                      width: double.infinity,
                      height: 75,
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

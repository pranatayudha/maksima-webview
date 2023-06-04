import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../shared/back_button_and_title.dart';
import 'komunitas_detail_viewmodel.dart';
import 'tab_views/anggota_tab_view.dart';
import 'tab_views/info_komunitas_tab_view.dart';
import 'widgets/tab_item.dart';

class KomunitasDetailView
    extends ViewModelBuilderWidget<KomunitasDetailViewModel> {
  final Map<String, dynamic> komunitas;

  const KomunitasDetailView(this.komunitas, {Key? key}) : super(key: key);

  @override
  KomunitasDetailViewModel viewModelBuilder(BuildContext context) =>
      KomunitasDetailViewModel();

  @override
  Widget builder(
    BuildContext context,
    KomunitasDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                BackButtonAndTitle(
                  '${komunitas['nama']}',
                  centerTitle: true,
                ),
                Stack(
                  children: [
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 2.0,
                        width: double.infinity,
                        color: Colors.black26,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 36, bottom: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: TabItem(
                              label: 'Anggota (${komunitas['jumlahAnggota']})',
                              index: 0,
                              currentIndex: viewModel.currentIndex,
                              onTap: () => viewModel.setIndex(0),
                            ),
                          ),
                          const SizedBox(width: 51.0),
                          Expanded(
                            child: TabItem(
                              label: 'Info Komunitas',
                              index: 1,
                              currentIndex: viewModel.currentIndex,
                              onTap: () => viewModel.setIndex(1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                _getViewForIndex(viewModel),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getViewForIndex(KomunitasDetailViewModel viewModel) {
    switch (viewModel.currentIndex) {
      case 0:
        return AnggotaTabView(komunitas);
      case 1:
        return InfoKomunitasTabView(komunitas);
      default:
        return AnggotaTabView(komunitas);
    }
  }
}

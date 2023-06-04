// ignore_for_file: no-empty-block

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../shared/back_button_and_title.dart';
import '../widgets/tab_item.dart';
import 'anggota_detail_viewmodel.dart';
import 'tab_views/data_crs.dart';
import 'tab_views/data_pipeline.dart';
import 'tab_views/data_prescreening.dart';
import 'widgets/custom_rounded_corner_button.dart';

class AnggotaDetailView extends ViewModelBuilderWidget<AnggotaDetailViewModel> {
  final Map<String, dynamic> anggota;

  const AnggotaDetailView(this.anggota, {Key? key}) : super(key: key);

  @override
  AnggotaDetailViewModel viewModelBuilder(BuildContext context) =>
      AnggotaDetailViewModel();

  @override
  Widget builder(
    BuildContext context,
    AnggotaDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const BackButtonAndTitle(
                  'Informasi Nasabah',
                  centerTitle: true,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 36.0),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Placeholder(color: Colors.black26),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Komunitas: <Nama Komunitas>',
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 10),
                Text(
                  '${anggota['nama']}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.8,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '<No. Handphone>',
                  style: TextStyle(color: Colors.black54),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CustomRoundedCornerButton(
                        label: 'Prakarsai \nNasabah',
                        onTap: () {},
                      ),
                      CustomRoundedCornerButton(
                        label: 'Tambah Ke \nPipeline',
                        onTap: () {},
                      ),
                      CustomRoundedCornerButton(
                        label: 'Hubungi \nNasabah',
                        onTap: () {},
                      ),
                    ],
                  ),
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
                              label: 'Prescreening',
                              index: 0,
                              currentIndex: viewModel.currentIndex,
                              onTap: () => viewModel.setIndex(0),
                            ),
                          ),
                          Expanded(
                            child: TabItem(
                              label: 'CRS',
                              index: 1,
                              currentIndex: viewModel.currentIndex,
                              onTap: () => viewModel.setIndex(1),
                            ),
                          ),
                          Expanded(
                            child: TabItem(
                              label: 'Pipeline',
                              index: 2,
                              currentIndex: viewModel.currentIndex,
                              onTap: () => viewModel.setIndex(2),
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

  Widget _getViewForIndex(AnggotaDetailViewModel viewModel) {
    switch (viewModel.currentIndex) {
      case 0:
        return const DataPrescreening();
      case 1:
        return const DataCRS();
      case 2:
        return const DataPipeline();
      default:
        return const DataPrescreening();
    }
  }
}

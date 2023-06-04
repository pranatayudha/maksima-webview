import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../application/app/constants/common.dart';
import '../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../shared/styles.dart';
import '../../../../../../../shared/thick_light_grey_divider.dart';
import 'cv/informasi_pengurus_cv_view.dart';
import 'informasi_pengurus_viewmodel.dart';
import 'pt/informasi_pengurus_pt_view.dart';
import 'widgets/data_navigator.dart';

class InformasiPengurusView
    extends ViewModelBuilderWidget<InformasiPengurusViewModel> {
  final String prakarsaId;
  final String pipelineId;
  final int status;
  final int codeTable;

  const InformasiPengurusView({
    Key? key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  InformasiPengurusViewModel viewModelBuilder(BuildContext context) =>
      InformasiPengurusViewModel(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        status: status,
        codeTable: codeTable,
      );

  @override
  void onViewModelReady(InformasiPengurusViewModel viewModel) =>
      viewModel.initialize();

  @override
  Widget builder(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () async {
        await viewModel.navigateToInformasiPrakarsa();

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(
              'Informasi Pengurus/Pemilik',
              style: tsHeading6,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                viewModel.navigateToUpdateScreen(context);
              },
              child: Image.asset(IconConstants.edit, scale: 3),
            ),
          ],
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
        ),
        body: Builder(
          builder: (context) {
            if (viewModel.isBusy) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DataNavigator(
                  index: viewModel.informasiPengurusDataNavigatorIndex,
                  prefix: 'Pengurus',
                  length: codeTable == Common.CodeTable.PT
                      ? viewModel.ritelInformasiPengurusPT.length
                      : viewModel.ritelInformasiPengurusCV.length,
                  onChanged:
                      viewModel.changeInformasiPengurusDataNavigatorIndex,
                ),
                const ThickLightGreyDivider(),
                Expanded(
                  child: PageTransitionSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, forwardAnim, backAnim) {
                      return FadeThroughTransition(
                        animation: forwardAnim,
                        secondaryAnimation: backAnim,
                        child: child,
                      );
                    },
                    child: Builder(builder: (context) {
                      // ignore: prefer-conditional-expressions
                      if (codeTable == Common.CodeTable.CV) {
                        return const PrakarsaInformasiPengurusCVView();
                      } else {
                        return PrakarsaInformasiPengurusPTView();
                      }
                    }),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

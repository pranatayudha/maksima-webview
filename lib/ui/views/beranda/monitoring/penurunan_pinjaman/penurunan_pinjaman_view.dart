import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../shared/form_layout_ritel.dart';
import 'penurunan_pinjaman_form_section.dart';
import 'penurunan_pinjaman_upload_section.dart';
import 'penurunan_pinjaman_viewmodel.dart';

class PenurunanPinjamanView
    extends ViewModelBuilderWidget<PenurunanPinjamanViewModel> {
  final Map<String, dynamic> disburseData;
  const PenurunanPinjamanView({
    Key? key,
    required this.disburseData,
  }) : super(key: key);

  @override
  void onViewModelReady(PenurunanPinjamanViewModel viewModel) =>
      viewModel.initialize();

  @override
  PenurunanPinjamanViewModel viewModelBuilder(BuildContext context) =>
      PenurunanPinjamanViewModel(
        disburseData: disburseData,
      );

  @override
  Widget builder(
    BuildContext context,
    PenurunanPinjamanViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () async {
        viewModel.navigateBack();

        return true;
      },
      child: FormLayoutRitel(
        title: 'Form Penurunan Pinjaman',
        onBackButtonPressed: viewModel.navigateBack,
        isBusy: false,
        mainButtonTitle: 'Lakukan Penurunan',
        onMainButtonPressed:
            viewModel.anyFieldCompleted() ? viewModel.validateInputs : null,
        child: Column(
          children: const [
            PenurunanPinjamanFormSection(),
            PenurunanPinjamanUploadSection(),
          ],
        ),
      ),
    );
  }
}

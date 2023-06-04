import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../application/app/constants/custom_color.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_linear_progress_indicator.dart';
import '../../../shared/styles.dart';
import 'prakarsa_viewmodel_ritel.dart';
import 'widgets/prakarsa_empty_ritel.dart';
import 'widgets/prakarsa_list_ritel.dart';
import 'widgets/prakarsa_search_bar_ritel.dart';

class PrakarsaViewRitel extends ViewModelBuilderWidget<PrakarsaViewModelRitel> {
  const PrakarsaViewRitel({Key? key}) : super(key: key);

  @override
  PrakarsaViewModelRitel viewModelBuilder(BuildContext context) =>
      PrakarsaViewModelRitel();

  @override
  Widget builder(
    BuildContext context,
    PrakarsaViewModelRitel viewModel,
    Widget? child,
  ) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            PrakarsaSearchBarRitel(
              onTapFilter: () => _buildModalFilterRitel(
                context: context,
                viewModel: viewModel,
              ),
            ),
            if (viewModel.isBusy)
              const CustomLinearProgressIndicator()
            else if (viewModel.ritelPrakarsa.isEmpty)
              const PrakarsaEmptyRitel()
            else
              const PrakarsaListRitel(),
          ],
        ),
      ),
    );
  }

  // ignore: long-method
  void _buildModalFilterRitel({
    required BuildContext context,
    required PrakarsaViewModelRitel viewModel,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 10,
                width: 100,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                            AutoSizeText(
                              'Jenis Produk Pinjaman',
                              style: tsHeading8,
                            ),
                            SizedBox(height: 6.h),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                viewModel.filterLoanType.length,
                                (index) => InkWell(
                                  onTap: () => setState(
                                    () => viewModel.setFilterLoanType(index),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Radio<int>(
                                        value: viewModel
                                                .filterLoanType[index].value ??
                                            0,
                                        groupValue:
                                            viewModel.selectedFilterLoanType,
                                        onChanged: (flag) {
                                          setState(() {
                                            viewModel
                                                .setFilterLoanType(flag ?? 0);
                                          });
                                        },
                                      ),
                                      Text(
                                        viewModel.filterLoanType[index].name ??
                                            '-',
                                        style: tsHeading11,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            AutoSizeText(
                              'Status Debitur',
                              style: tsHeading8,
                            ),
                            SizedBox(height: 6.h),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                viewModel.filterStatusDebitur.length,
                                (index) => InkWell(
                                  onTap: () => setState(
                                    () => viewModel
                                        .setFilterStatusDebitur(index + 1),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Radio<int>(
                                        value: viewModel
                                                .filterStatusDebitur[index]
                                                .value ??
                                            0,
                                        groupValue: viewModel
                                            .selectedFilterStatusDebitur,
                                        onChanged: (flag) {
                                          setState(() {
                                            viewModel.setFilterStatusDebitur(
                                              flag ?? 0,
                                            );
                                          });
                                        },
                                      ),
                                      Text(
                                        viewModel.filterStatusDebitur[index]
                                                .name ??
                                            '-',
                                        style: tsHeading11,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.h),
                      CustomButton(
                        labelColor: Colors.white,
                        color: CustomColor.secondaryBlue,
                        label: 'Terapkan',
                        onPressed: () async {
                          Navigator.pop(context);
                          await viewModel.fetchPrakarsaWithoutLimit(
                            textSearch: '',
                            status: viewModel.selectedFilterStatusDebitur == 0
                                ? ''
                                : viewModel.selectedFilterStatusDebitur,
                            loanType: viewModel.selectedFilterLoanType == 0
                                ? ''
                                : viewModel.selectedFilterLoanType,
                          );
                        },
                        isBusy: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

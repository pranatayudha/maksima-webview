import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../application/app/constants/custom_color.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/styles.dart';
import '../monitoring_viewmodel.dart';

class ModalFilter extends HookViewModelWidget<MonitoringRitelViewModel> {
  const ModalFilter({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    MonitoringRitelViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildModalIndicator(),
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
                          viewModel.loanTypeFilters.length,
                          (index) {
                            final entry = viewModel.loanTypeFilters.entries
                                .toList()[index];

                            return RadioListTile<LoanTypeFilter>(
                              title: Text(entry.value),
                              value: entry.key,
                              groupValue: viewModel.currentLoanTypeFilter,
                              onChanged: (flag) {
                                viewModel.setLoanTypeFilter = flag;
                              },
                            );
                          },
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
                          viewModel.statusTypeFilters.length,
                          (index) {
                            final entry = viewModel.statusTypeFilters.entries
                                .toList()[index];

                            return RadioListTile<StatusTypeFilter>(
                              title: Text(entry.value),
                              value: entry.key,
                              groupValue: viewModel.currentStatusTypeFilter,
                              onChanged: (flag) {
                                viewModel.setStatusTypeFilter = flag;
                              },
                            );
                          },
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
                    await viewModel.refreshData();
                    /*await viewModel.fetchPipelinesWithoutLimit(
                      page: 1,
                      textSearch: '',
                      status: viewModel.selectedFilterStatusDebitur == 0
                          ? ''
                          : viewModel.selectedFilterStatusDebitur,
                      loanType: viewModel.selectedFilterLoanType == 0
                          ? ''
                          : viewModel.selectedFilterLoanType,
                    );*/
                  },
                  isBusy: false,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildModalIndicator() {
    return Container(
      height: 10,
      width: 100,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        color: Colors.white,
      ),
    );
  }
}

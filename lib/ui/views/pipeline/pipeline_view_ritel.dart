import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../application/app/app.locator.dart';
import '../../../application/app/constants/custom_color.dart';
import '../../../application/enums/dialog_type.dart';
import '../../shared/bordered_list_item_button.dart';
import '../../shared/custom_button.dart';
import '../../shared/custom_linear_progress_indicator.dart';
import '../../shared/dotted_border_button.dart';
import '../../shared/styles.dart';
import 'pipeline_viewmodel_ritel.dart';
import 'tambah_debitur_potensial_ritel/tdp_view_ritel.dart';
import 'widgets/pipeline_empty.dart';
import 'widgets/pipeline_list_ritel.dart';
import 'widgets/pipeline_search_bar_ritel.dart';

Future _showInDevelopmentDialog() => locator<DialogService>()
    .showCustomDialog(variant: DialogType.inDevelopment);

class PipelineViewRitel extends ViewModelBuilderWidget<PipelineViewModelRitel> {
  final double bottomPadding;

  const PipelineViewRitel({Key? key, required this.bottomPadding})
      : super(key: key);

  @override
  PipelineViewModelRitel viewModelBuilder(BuildContext context) =>
      PipelineViewModelRitel();

  @override
  Widget builder(
    BuildContext context,
    PipelineViewModelRitel viewModel,
    Widget? child,
  ) {
    // print('bottomPadding : $bottomPadding');

    return Stack(
      children: [
        Column(
          children: [
            PipelineSearchBarRitel(
              onTapFilter: () => _buildModalFilterRitel(
                context: context,
                viewModel: viewModel,
              ),
            ),
            if (viewModel.isBusy)
              const Expanded(
                child: CustomLinearProgressIndicator(),
              )
            else if (viewModel.ritelPipelines.isEmpty)
              const Expanded(
                child: PipelineEmpty(),
              )
            else
              const Expanded(
                child: PipelineListRitel(),
              ),
            Container(
              padding:
                  EdgeInsets.fromLTRB(27.w, 10.h, 27.w, bottomPadding + 26.h),
              child: DottedBorderButton(
                label: 'Tambah Debitur Potensial',
                onTap: () => _buildModalJenisDebitur(context),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _buildModalJenisDebitur(BuildContext context) {
    showModalBottomSheet(
      enableDrag: false,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  const Text(
                    'Tambah Debitur Potensial Untuk',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  BorderedListItemButton(
                    margin: 0.0,
                    label: 'Tambah Debitur Baru',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TDPViewRitel(),
                      ),
                    ),
                    topAndBottomPadding: 14.h,
                  ),
                  SizedBox(height: 14.h),
                  BorderedListItemButton(
                    margin: 0.0,
                    label: 'Tambah Dari Partnership',
                    onTap: () => _showInDevelopmentDialog(),
                    topAndBottomPadding: 14.h,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  // ignore: long-method
  void _buildModalFilterRitel({
    required BuildContext context,
    required PipelineViewModelRitel viewModel,
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
                          await viewModel.fetchPipelinesWithoutLimit(
                            page: 1,
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

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../shared/creation_aware_list_item.dart';
import '../pipeline_viewmodel_ritel.dart';
import 'pipeline_card_ritel.dart';

class PipelineListRitel extends HookViewModelWidget<PipelineViewModelRitel> {
  const PipelineListRitel({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PipelineViewModelRitel viewModel,
  ) {
    return RefreshIndicator(
      onRefresh: viewModel.refreshData,
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 0.h),
        // shrinkWrap: true,
        itemCount: viewModel.ritelPipelines.length,
        itemBuilder: (context, index) {
          final pipeline = viewModel.ritelPipelines[index];
          // ignore: newline-before-return
          return CreationAwareListItem(
            itemCreated: () => SchedulerBinding.instance.addPostFrameCallback(
              (timeStamp) => viewModel.handleItemCreated(index),
            ),
            child: PipelineCardRitel(
              ritelPipelines: pipeline,
              onPressed: () =>
                  viewModel.navigateToPipelineDetailView(pipeline),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: const Color(0xffC8C8C8).withOpacity(0.4),
          thickness: 1.h,
        ),
      ),
    );
  }
}

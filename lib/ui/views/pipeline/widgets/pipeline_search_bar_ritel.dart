import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/app/constants/icon_constants.dart';
import '../../../shared/custom_search_bar.dart';
import '../pipeline_viewmodel_ritel.dart';

class PipelineSearchBarRitel
    extends HookViewModelWidget<PipelineViewModelRitel> {
  final Function()? onTapFilter;

  const PipelineSearchBarRitel({
    this.onTapFilter,
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PipelineViewModelRitel viewModel,
  ) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 11.h, 16.w, 11.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomSearchBar(
              hintText: 'Cari Debitur',
              onSubmitted: viewModel.search,
            ),
          ),
          SizedBox(width: 8.w),
          InkWell(
            onTap: onTapFilter,
            child: Container(
              height: 32.h,
              width: 32.w,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff99A0AF)),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Image.asset(
                IconConstants.filter,
                scale: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

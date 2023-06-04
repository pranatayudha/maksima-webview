import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../shared/creation_aware_list_item.dart';
import '../prakarsa_viewmodel_ritel.dart';
import 'prakarsa_card_ritel.dart';

class PrakarsaListRitel extends HookViewModelWidget<PrakarsaViewModelRitel> {
  const PrakarsaListRitel({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PrakarsaViewModelRitel viewModel,
  ) {
    return RefreshIndicator(
      onRefresh: viewModel.refreshData,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height / 2,
        ),
        child: ListView.separated(
          padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 0.h),
          shrinkWrap: true,
          itemCount: viewModel.ritelPrakarsa.length,
          itemBuilder: (context, index) {
            final prakarsa = viewModel.ritelPrakarsa[index];
            // ignore: newline-before-return
            return CreationAwareListItem(
              itemCreated: () => SchedulerBinding.instance.addPostFrameCallback(
                (timeStamp) => viewModel.handleItemCreated(index),
              ),
              child: PrakarsaCardRitel(
                ritelPrakarsa: prakarsa,
                onPressed: () =>
                    viewModel.navigateToPrakarsaDetailView(prakarsa),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
            color: const Color(0xffC8C8C8).withOpacity(0.4),
            thickness: 1.h,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../shared/styles.dart';
import '../../../pipeline/widgets/pipeline_card_ritel.dart';
import '../../beranda_viewmodel.dart';

class BerandaNDPListRitel extends HookViewModelWidget<BerandaViewModel> {
  const BerandaNDPListRitel({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    BerandaViewModel viewModel,
  ) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.fromLTRB(16.w, 25.h, 16.w, 50.h),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'DEBITUR DALAM PROSES',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 10.w),
                if (viewModel.isBusy)
                  Row(
                    children: [
                      SizedBox(
                        height: 12.w,
                        width: 12.w,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Memuat data...',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontStyle: FontStyle.italic,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  )
                else
                  GestureDetector(
                    onTap: viewModel.navigateToPipelineView,
                    child: Text(
                      'Lihat Semua',
                      style: tsHeading11SecondaryBlue,
                    ),
                  ),
              ],
            ),
          ),
          if (viewModel.isBusy)
            Container()
          else if (viewModel.ritelPipelines.isEmpty)
            Container(
              margin: EdgeInsets.only(top: 20.h, bottom: 120.h),
              child: Text(
                'Belum ada nasabah dalam proses. Pergi ke Menu Prakarsa untuk memprakarsai nasabah.',
                style: TextStyle(
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
            )
          else
            ListView.separated(
              padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 70.h),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: viewModel.ritelPipelines.length,
              itemBuilder: (context, index) {
                final pipeline = viewModel.ritelPipelines[index];
                // ignore: newline-before-return
                return PipelineCardRitel(
                  ritelPipelines: pipeline,
                  onPressed: () =>
                      viewModel.navigateToPipelineDetailView(pipeline),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: const Color(0xffC8C8C8).withOpacity(0.4),
                thickness: 1.h,
              ),
            ),
        ],
      ),
    );
  }
}

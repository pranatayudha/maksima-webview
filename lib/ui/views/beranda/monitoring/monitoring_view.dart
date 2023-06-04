import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../application/app/constants/custom_color.dart';
import '../../../../application/app/constants/icon_constants.dart';
import '../../../../application/app/constants/image_constants.dart';
import '../../../shared/custom_linear_progress_indicator.dart';
import '../../../shared/custom_search_bar.dart';
import '../../../shared/network_sensitive.dart';
import '../../../shared/styles.dart';
import 'monitoring_viewmodel.dart';
import 'widgets/customers_monitor_list.dart';

class MonitoringRitelView
    extends ViewModelBuilderWidget<MonitoringRitelViewModel> {
  const MonitoringRitelView({Key? key}) : super(key: key);

  @override
  bool get disposeViewModel => false;

  @override
  bool get initialiseSpecialViewModelsOnce => true;

  @override
  MonitoringRitelViewModel viewModelBuilder(BuildContext context) =>
      MonitoringRitelViewModel();

  @override
  void onViewModelReady(MonitoringRitelViewModel viewModel) =>
      viewModel.initialize();

  @override
  Widget builder(
    BuildContext context,
    MonitoringRitelViewModel viewModel,
    Widget? child,
  ) {
    return NetworkSensitive(
      child: WillPopScope(
        onWillPop: () async {
          await viewModel.navigateToHomePage();

          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Color(0xff606060)),
            shadowColor: Colors.transparent,
            title: Text(
              'Monitoring Debitur',
              style: tsHeading6,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.info, color: CustomColor.primaryOrange),
                onPressed: () => viewModel.showModalListGuide(context: context),
              ),
            ],
            leading: GestureDetector(
              onTap: viewModel.navigateToHomePage,
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 24.sp,
              ),
            ),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomSearchBar(
                          controller: viewModel.searchController,
                          hintText: 'Cari Debitur',
                          onSubmitted: (val) => viewModel.refreshData(),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      InkWell(
                        onTap: () =>
                            viewModel.showModalFilter(context: context),
                        child: Container(
                          height: 49.w,
                          width: 49.w,
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
                ),
                if (viewModel.isBusy)
                  const CustomLinearProgressIndicator()
                else if (viewModel.monitoringList.isEmpty)
                  _buildMonitoringListEmpty()
                else
                  const CustomersMonitorList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMonitoringListEmpty() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageConstants.pipelineEmpty, scale: 3),
          const SizedBox(height: 32),
          Text(
            'Data nasabah dalam Monitoring belum tersedia.',
            style: tsBody6,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../application/app/constants/custom_color.dart';
import '../../../application/app/constants/icon_constants.dart';
import '../../shared/network_sensitive.dart';
import '../akun/akun_view.dart';
import '../beranda/beranda_view.dart';
import '../beranda/prakarsa/prakarsa_view.dart';
import '../pipeline/pipeline_view.dart';
import 'main_viewmodel.dart';
import 'widgets/floating_navigation_item.dart';

class MainView extends ViewModelBuilderWidget<MainViewModel> {
  final int? index;
  final int? prakarsaTabsIndex;

  const MainView({
    Key? key,
    this.index = 0,
    this.prakarsaTabsIndex = 0,
  }) : super(key: key);

  @override
  MainViewModel viewModelBuilder(BuildContext context) =>
      MainViewModel(index: index ?? 0, prakarsaTabsIndex: prakarsaTabsIndex);

  @override
  void onViewModelReady(MainViewModel viewModel) => viewModel.init();

  @override
  Widget builder(
    BuildContext context,
    MainViewModel viewModel,
    Widget? child,
  ) {
    final floatingNavigation = _floatingNavigation(viewModel, context);

    return WillPopScope(
      onWillPop: () async => true,
      child: NetworkSensitive(
        child: Scaffold(
          body: Stack(
            children: [
              PageView(
                // allowImplicitScrolling: false,
                controller: viewModel.homeController,
                onPageChanged: (i) => viewModel.onPageChanged(i),
                children: [
                  const BerandaView(),
                  PipelineView(
                    index: viewModel.index,
                    bottomPadding: floatingNavigation.height ?? 0,
                  ),
                  PrakarsaView(
                    index: viewModel.index,
                    prakarsaTabsIndex: viewModel.prakarsaTabsIndex,
                  ),
                  const AkunView(),
                ],
              ),
              floatingNavigation,
            ],
          ),
        ),
      ),
    );
  }

  Positioned _floatingNavigation(
    MainViewModel vm,
    BuildContext context,
  ) {
    return Positioned(
      left: 16.w,
      right: 16.w,
      bottom: 16.h,
      height: 80.h,
      child: SafeArea(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: CustomColor.secondaryBlue,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: FloatingNavigationItem(
                  isSelected: vm.currentIndex == 0,
                  iconPath: vm.currentIndex == 0
                      ? IconConstants.navBeranda
                      : IconConstants.navBerandaOutlined,
                  label: 'Beranda',
                  onTap: () => vm.setIndex(0),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: FloatingNavigationItem(
                  isSelected: vm.currentIndex == 1,
                  iconPath: vm.currentIndex == 1
                      ? IconConstants.navPipeline
                      : IconConstants.navPipelineOutlined,
                  label: 'Pipeline',
                  onTap: () {
                    vm.index = 0;
                    vm.setIndex(1);
                  },
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: FloatingNavigationItem(
                  isSelected: vm.currentIndex == 2,
                  iconPath: vm.currentIndex == 2
                      ? IconConstants.navPrakarsa
                      : IconConstants.navPrakarsaOutlined,
                  label: 'Prakarsa',
                  onTap: () {
                    vm.index = 0;
                    vm.setIndex(2);
                  },
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: FloatingNavigationItem(
                  isSelected: vm.currentIndex == 3,
                  iconPath: vm.currentIndex == 3
                      ? IconConstants.navAkun
                      : IconConstants.navAkunOutlined,
                  label: 'Akun',
                  onTap: () => vm.setIndex(3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

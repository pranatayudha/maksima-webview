import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../application/app/constants/image_constants.dart';
import 'startup_viewmodel.dart';

class StartupView extends ViewModelBuilderWidget<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) =>
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        viewModel.runStartupLogic();
      });

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstants.bgOverlay),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(ImageConstants.pinangMaxima, scale: 3),
              Column(
                children: const [CircularProgressIndicator()],
              ),
              SizedBox(height: 24.h),
              Text(
                'Initializing app...',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

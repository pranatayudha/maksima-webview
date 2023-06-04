import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';

class MainViewModel extends IndexTrackingViewModel {
  int index;
  final int? prakarsaTabsIndex;

  final PageController homeController = PageController();

  MainViewModel({this.index = 0, this.prakarsaTabsIndex});

  void init() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      homeController.jumpToPage(index);
      super.setIndex(index);
    });
  }

  @override
  void dispose() {
    homeController.dispose();
    super.dispose();
  }

  @override
  void setIndex(int value) {
    homeController.animateToPage(
      value,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  void onPageChanged(int value) {
    super.setIndex(value);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../application/app/constants/image_constants.dart';
import '../../shared/glass_status_bar_scroll_aware.dart';
import 'beranda_viewmodel.dart';
import 'widgets/beranda_appbar.dart';
import 'widgets/beranda_ndp_list/beranda_ndp_list_ritel.dart';
import 'widgets/menu_items.dart';

class BerandaView extends ViewModelBuilderWidget<BerandaViewModel> {
  const BerandaView({Key? key}) : super(key: key);

  @override
  BerandaViewModel viewModelBuilder(BuildContext context) => BerandaViewModel();

  @override
  Widget builder(
    BuildContext context,
    BerandaViewModel viewModel,
    Widget? child,
  ) {
    return GlassStatusBarScrollAware(
      onRefresh: viewModel.refreshData,
      children: [
        Stack(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 150.h,
                  width: double.infinity,
                  child: Image.asset(
                    ImageConstants.headerBg,
                    fit: BoxFit.fill,
                  ),
                ),
                BerandaAppBar(onTap: viewModel.navigateToAkunView),
              ],
            ),
          ],
        ),
        const MenuItems(),
        const BerandaNDPListRitel(),
      ],
    );
  }
}

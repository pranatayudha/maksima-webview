import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../application/app/constants/icon_constants.dart';
import '../../../shared/app_bar_widget.dart';
import '../../../shared/network_sensitive.dart';
import '../../../shared/thick_light_grey_divider.dart';
import 'informasi_pribadi_viewmodel.dart';
import 'personal_info_item.dart';

class InformasiPribadiView
    extends ViewModelBuilderWidget<InformasiPribadiViewModel> {
  const InformasiPribadiView({Key? key}) : super(key: key);

  @override
  InformasiPribadiViewModel viewModelBuilder(BuildContext context) =>
      InformasiPribadiViewModel();

  @override
  void onViewModelReady(InformasiPribadiViewModel viewModel) =>
      viewModel.initialize();

  @override
  Widget builder(
    BuildContext context,
    InformasiPribadiViewModel viewModel,
    Widget? child,
  ) {
    return NetworkSensitive(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget.titleWithBackButton(
          title: 'Informasi Pribadi',
          onBackButtonTapped: viewModel.navigateBack,
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            const ThickLightGreyDivider(),
            SizedBox(height: 28.h),
            PersonalInfoItem(
              imagePath: IconConstants.user,
              label: 'ID Karyawan',
              description: viewModel.user!.userId!,
            ),
            PersonalInfoItem(
              imagePath: IconConstants.users,
              label: 'Divisi',
              description: viewModel.user!.organization!,
            ),
            PersonalInfoItem(
              imagePath: IconConstants.briefcase,
              label: 'Jabatan',
              description: viewModel.user!.jabatan!,
            ),
            PersonalInfoItem(
              imagePath: IconConstants.access,
              label: 'Access Level',
              description: viewModel.user!.accessLevel!,
            ),
          ],
        ),
      ),
    );
  }
}

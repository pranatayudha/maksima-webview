// ignore_for_file: unused_element, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../application/app/app.locator.dart';
import '../../../../application/app/constants/icon_constants.dart';
import '../../../../application/enums/dialog_type.dart';
import '../../../shared/app_bar_widget_close.dart';
import '../../../shared/network_sensitive.dart';
import '../../../shared/styles.dart';
import '../../../shared/thick_light_grey_divider.dart';
import 'tdp_viewmodel_ritel.dart';

class TDPViewRitel extends ViewModelBuilderWidget<TDPViewModelRitel> {
  const TDPViewRitel({Key? key}) : super(key: key);

  @override
  TDPViewModelRitel viewModelBuilder(BuildContext context) =>
      TDPViewModelRitel();

  @override
  // ignore: long-method
  Widget builder(
    BuildContext context,
    TDPViewModelRitel viewModel,
    Widget? child,
  ) {
    Future showInDevelopmentDialog() => locator<DialogService>()
        .showCustomDialog(variant: DialogType.inDevelopment);

    Widget buttonListDebiturType(String btnText) {
      return Column(
        children: [
          TextButton(
            onPressed: () => {
              if (btnText == 'Perusahaan - PT')
                // showInDevelopmentDialog()
                viewModel.navigationToTDDPerusahaanPt()
              else if (btnText == 'Perusahaan - CV')
                // showInDevelopmentDialog()
                viewModel.navigateToTDPPerusahaanCv()
              else
                viewModel.navigateToTDPPerorangan(),
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.8, 10.0, 20.8, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(btnText, style: tsBody1),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(IconConstants.arrowRight, scale: 3),
                ],
              ),
            ),
          ),
          Divider(
            color: const Color(0xffC8C8C8).withOpacity(0.4),
            height: 0.0,
            thickness: 1.h,
          ),
        ],
      );
    }

    WillPopScope buildListDebiturType() {
      return WillPopScope(
        child: SafeArea(
          child: GestureDetector(
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 16.h),
                  child: Text(
                    'Pilih Jenis Usaha Debitur',
                    style: tsHeading11,
                  ),
                ),
                const ThickLightGreyDivider(),
                SizedBox(height: 8.h),
                Container(
                  color: const Color(0xffF8F9FA),
                  padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                  child: Text(
                    'Pinang Maksima - KMK PTR',
                    style: tsHeading10,
                  ),
                ),
                Divider(
                  color: const Color(0xffC8C8C8).withOpacity(0.4),
                  height: 0.0,
                  thickness: 1.h,
                ),
                buttonListDebiturType('Perusahaan - PT'),
                // _buttonListDebiturType('Perusahaan - Koperasi'),
                buttonListDebiturType('Perusahaan - CV'),
                buttonListDebiturType('Perorangan'),
              ],
            ),
          ),
        ),
        onWillPop: () async {
          final shouldPop = await showWarning(context, viewModel);

          return shouldPop == null ? true : false;
        },
      );
    }

    return NetworkSensitive(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidgetClose.titleWithBackButton(
          title: 'Tambah Debitur Potensial',
          onBackButtonTapped: viewModel.navigateToMainView,
        ),
        body: buildListDebiturType(),
      ),
    );
  }

  Future<bool?> showWarning(
    BuildContext context,
    TDPViewModelRitel vm,
  ) async {
    vm.navigateToMainView();
  }
}

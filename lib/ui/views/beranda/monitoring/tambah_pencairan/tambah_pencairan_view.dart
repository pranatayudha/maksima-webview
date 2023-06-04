import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'tambah_pencairan_form_section_two.dart';
import 'package:stacked/stacked.dart';

import '../../../../../application/app/constants/custom_color.dart';
import '../../../../../application/models/monitoring_pinjaman_detail.dart';
import '../../../../shared/network_sensitive.dart';
import '../../../../shared/thick_light_grey_divider.dart';
import 'tambah_pencairan_form_section.dart';
import 'tambah_pencairan_viewmodel.dart';

class TambahPencairanView
    extends ViewModelBuilderWidget<TambahPencairanViewModel> {
  final int step;
  final String? idKelolaan;
  final String? idPartner;
  final MonitoringPinjamanDetail? pinjamanDetail;
  final int? counter;
  final String? status;
  final int? loanType;

  const TambahPencairanView({
    Key? key,
    required this.step,
    this.idKelolaan,
    this.idPartner,
    this.pinjamanDetail,
    this.counter,
    this.status,
    this.loanType,
  }) : super(key: key);

  @override
  TambahPencairanViewModel viewModelBuilder(BuildContext context) =>
      TambahPencairanViewModel(
        step: step,
        idKelolaan: idKelolaan,
        idPartner: idPartner,
        pinjamanDetail: pinjamanDetail,
        counter: counter,
        status: status,
        loanType: loanType,
      );

  @override
  void onViewModelReady(TambahPencairanViewModel viewModel) =>
      viewModel.initialize();

  @override
  Widget builder(
    BuildContext context,
    TambahPencairanViewModel viewModel,
    Widget? child,
  ) {
    return NetworkSensitive(
      child: WillPopScope(
        onWillPop: () async {
          if (step == 1) {
            viewModel.navigateToMonitoringDetail();

            return true;
          } else {
            viewModel.navigateToPencairanStepOne();

            return true;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            shadowColor: const Color.fromARGB(255, 125, 131, 137),
            title: const Text(
              'Tambah Pencairan',
              style: TextStyle(
                color: Colors.black,
                // fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: GestureDetector(
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 24.sp,
              ),
              onTap: () {
                if (step == 1) {
                  viewModel.navigateToMonitoringDetail();
                } else {
                  viewModel.navigateToPencairanStepOne();
                }
              },
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          body: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'INFORMASI PENCAIRAN',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: CustomColor.primaryOrange,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Text(
                            '$step/2',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: CustomColor.primaryOrange,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        step == 1 ? 'Konfirmasi Partner' : 'Detil Pencairan',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: CustomColor.primaryBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                const ThickLightGreyDivider(),
                Builder(
                  builder: (context) {
                    return step == 1
                        ? const TambahPencairanFormSection()
                        : const TambahPencairanFormSectionTwo();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../application/app/constants/icon_constants.dart';
import '../../../../../application/app/constants/image_constants.dart';
import '../pipeline_details_viewmodel_pari.dart';

class PipelineDetailsHeaderPariPerorangan
    extends HookViewModelWidget<PipelineDetailsViewModelPari> {
  final int status;

  const PipelineDetailsHeaderPariPerorangan(
    this.status, {
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PipelineDetailsViewModelPari viewModel,
  ) {
    final _headerHeight = 180.h;
    final _statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      height: _headerHeight,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(5.w, _statusBarHeight, 5.w, 0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstants.headerBg2),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          _buildAvatar(viewModel),
          const SizedBox(height: 22),
          if (status == 1)
            _buildStatusNotCompleteBar()
          else if (status == 2)
            _buildStatusNotPreScreenedBar()
          else if (status == 3)
            _buildStatusProcessPreScreeningBar()
          else
            _buildStatusFinishedPreScreeningBar(viewModel),
        ],
      ),
    );
  }

  Padding _buildAvatar(PipelineDetailsViewModelPari vm) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: 56.w,
                height: 56.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: const Color(0xffE6EEF5),
                ),
                transform: Matrix4.translationValues(0.0, 15.0, 15.0),
                child: Center(
                  child: Text(
                    vm.informasiDataDiri != null
                        ? vm.informasiDataDiri!.initial!
                        : '-',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff07539A),
                    ),
                  ),
                ),
              ),
              Container(
                width: 44.w,
                height: 20.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Colors.white,
                ),
                child: const Center(
                  child: Text(
                    'PARI',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff03213E),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text(
                vm.informasiDataDiri != null
                    ? vm.informasiDataDiri!.fullName!
                    : '-',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                vm.informasiDataDiri != null
                    ? vm.informasiDataDiri!.phoneNum!
                    : '-',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 6.h),
              const Text(
                'Partnership - Tidak Ada',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffF07126),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusNotCompleteBar() {
    return Container(
      margin: EdgeInsets.fromLTRB(14.w, 0, 14.w, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffF49300),
            spreadRadius: 1.5,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        color: const Color(0xffFFFAE6),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
          child: Row(
            children: [
              const Icon(
                Icons.warning_rounded,
                color: Color(0xfff49300),
                size: 35,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Data Calon Debitur belum lengkap',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                    const AutoSizeText(
                      'Lengkapi data Calon Debitur untuk pre-screening',
                      style: TextStyle(
                        color: Color(0xff66788A),
                      ),
                      maxFontSize: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusNotPreScreenedBar() {
    return Container(
      margin: EdgeInsets.fromLTRB(14.w, 0, 14.w, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffF49300),
            spreadRadius: 1.5,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        color: const Color(0xffFFFAE6),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
          child: Row(
            children: [
              const Icon(
                Icons.warning_rounded,
                color: Color(0xfff49300),
                size: 35,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Debitur belum di pre-screening',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                    const AutoSizeText(
                      'Lakukan pre-screening untuk melakukan prakarsa',
                      style: TextStyle(
                        color: Color(0xff66788A),
                      ),
                      maxFontSize: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusProcessPreScreeningBar() {
    return Container(
      margin: EdgeInsets.fromLTRB(14.w, 0, 14.w, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0xff1BB0DF),
            spreadRadius: 1.5,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        color: const Color(0xffE8F7FC),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
          child: Row(
            children: [
              const Icon(
                Icons.timelapse,
                color: Color(0xff1BB0DF),
                size: 35,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Debitur sedang di pre-screening',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                    const AutoSizeText(
                      'Cek secara berkala untuk hasil pre-screening',
                      style: TextStyle(
                        color: Color(0xff66788A),
                      ),
                      maxFontSize: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusFinishedPreScreeningBar(PipelineDetailsViewModelPari vm) {
    return Container(
      margin: EdgeInsets.fromLTRB(14.w, 0, 14.w, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0xff38BAA7),
            spreadRadius: 1.5,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        color: const Color(0xffEBF8F6),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
          child: Row(
            children: [
              const Icon(
                Icons.timelapse,
                color: Color(0xff38BAA7),
                size: 35,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: vm.navigateToHasilScreeningView,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pre-Screening selesai!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          ),
                          const AutoSizeText(
                            'Klik untuk melihat hasil pre-screening',
                            style: TextStyle(
                              color: Color(0xff66788A),
                            ),
                            maxFontSize: 12,
                          ),
                        ],
                      ),
                      Image.asset(IconConstants.arrowRight, scale: 4),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

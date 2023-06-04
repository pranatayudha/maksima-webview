// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../application/app/app.locator.dart';
import '../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../application/app/constants/image_constants.dart';
import '../../../../../../application/enums/bottom_sheet_type.dart';
import '../../../../../../application/models/ritel_list_informasi_pengurus_pemilik_cv.dart';
import '../../../../../shared/network_sensitive.dart';
import '../../../../../shared/styles.dart';
import '../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_pengurus_cv_view.dart';
import 'informasi_pengurus_cv_viewmodel.dart';

class InformasiPengurusPemilikBoardCvView
    extends ViewModelBuilderWidget<InformasiPengurusCvViewModel> {
  final String? pipelineId;

  const InformasiPengurusPemilikBoardCvView({
    Key? key,
    this.pipelineId,
  }) : super(key: key);

  @override
  void onViewModelReady(InformasiPengurusCvViewModel viewModel) =>
      viewModel.initialize();

  @override
  InformasiPengurusCvViewModel viewModelBuilder(BuildContext context) =>
      InformasiPengurusCvViewModel(
        pipelineId: pipelineId,
      );

  @override
  // ignore: long-method
  Widget builder(
    BuildContext context,
    InformasiPengurusCvViewModel viewModel,
    Widget? child,
  ) {
    return NetworkSensitive(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Container(
            padding: EdgeInsets.zero,
            width: 30.w,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: const Color(0xff606060),
                size: 24.sp,
              ),
              onPressed: viewModel.ritelListPengurusPerusahaanModel.isNotEmpty
                  ? () async {
                      final response =
                          await locator<BottomSheetService>().showCustomSheet(
                        variant: BottomSheetType.confirmation,
                        data: {
                          'title': 'Data yang Anda tambahkan akan disimpan',
                          'firstLine':
                              'Anda masih dapat melengkapi pengurus lainnya, dan simpan data untuk melanjutkan ketahap selanjutnya',
                          'negativeButtonText': 'TIDAK',
                        },
                      );
                      if (response!.confirmed) {
                        viewModel.menuPerusahaanCV();
                      }
                    }
                  : viewModel.menuPerusahaanCVNotUpdate,
              // Munculkan popup jika sudah ada list lebih dari 1
            ),
          ),
          title: Text(
            'Informasi Pengurus Pemilik',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
              color: Color(0xff162B3A),
            ),
          ),
        ),
        body: WillPopScope(
          child: viewModel.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _mainBody(viewModel, context),
          onWillPop: () async => false,
        ),
      ),
    );
  }

  SafeArea _mainBody(
    InformasiPengurusCvViewModel viewModel,
    BuildContext context,
  ) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(24.sp, 0, 24.sp, 16.sp),
                child: Text(
                  'Lengkapi informasi pengurus sesuai Dokumen Legalitas untuk menambah ke Pipeline',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Color(0xff162B3A),
                  ),
                ),
              ),
              const ThickLightGreyDivider(),
              SizedBox(height: 8.sp),
              // Jika ada list pengurus maka munculkan daftar list
              // jika tidak ada list pengurus munculkan function empty
              // emptyList(context),
              // --------------------------------------
              if (viewModel.ritelListPengurusPerusahaanModel.isEmpty)
                _pengurusIsEmpty(context)
              else
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.75,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (var i = 0;
                          i < viewModel.ritelListPengurusPerusahaanModel.length;
                          i++)
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InformasiPengurusCvView(
                                pipelineId: pipelineId,
                                statusPipeline: 1,
                                ritelInformasiPengurusCv: viewModel
                                    .ritelListPengurusPerusahaanModel[i],
                                nomorPengurus: i,
                              ),
                            ),
                          ),
                          child: _componentPengurusPemilik(
                            viewModel.ritelListPengurusPerusahaanModel[i],
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
          Column(
            children: [
              _buttonTambahPengurus(
                context,
                viewModel,
                viewModel.ritelListPengurusPerusahaanModel.length,
              ),
              _buttonSimpan(
                context,
                viewModel.ritelListPengurusPerusahaanModel.length,
                viewModel,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _pengurusIsEmpty(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.05,
      padding: EdgeInsets.fromLTRB(27.w, 21.h, 27.w, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageConstants.pipelineEmpty,
            scale: 3,
          ),
          SizedBox(height: 32.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tambah pengurus sesuai',
                style: tsBody6,
                textAlign: TextAlign.center,
              ),
              Text(
                ' Dokumen Legalitas',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Container _componentPengurusPemilik(
  RitelListInformasiPengurusPemilikCV itemPengurus,
) {
  return Container(
    padding: EdgeInsets.only(top: 16.sp),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16.sp, 0, 24.sp, 15.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(IconConstants.user, scale: 3),
                  SizedBox(width: 16.sp),
                  Text(
                    itemPengurus.fullName!,
                    style: TextStyle(
                      color: Color(0xff03213E),
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              Image.asset(IconConstants.arrowRight, scale: 3),
            ],
          ),
        ),
        Divider(
          color: Color(0xffEBEDF0),
          // color: Colors.red,
          thickness: 1,
          indent: 55.sp,
          endIndent: 0,
        ),
      ],
    ),
  );
}

GestureDetector _buttonSimpan(
  BuildContext context,
  int lengthPengurus,
  InformasiPengurusCvViewModel vm,
) {
  return GestureDetector(
    onTap: lengthPengurus > 1 ? vm.savePengurusList : null,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 12.sp),
      margin: EdgeInsets.fromLTRB(16.sp, 0, 16.sp, 24.sp),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // is active 027DEF
        // is not active 9CBAD7
        color: lengthPengurus > 1 ? Color(0xff027DEF) : Color(0xff09CBAD7),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: lengthPengurus > 1 ? Color(0xff027DEF) : Color(0xff09CBAD7),
          width: 1,
        ),
      ),
      child: Text(
        'Simpan',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    ),
  );
}

// Jika pengurus sudah 8, maka button tambah pengurus disabled
GestureDetector _buttonTambahPengurus(
  BuildContext context,
  InformasiPengurusCvViewModel viewModel,
  int countPengurus,
) {
  return GestureDetector(
    // Untuk keperluan pre-screening
    onTap: countPengurus == 4 ? null : viewModel.navigateToFormPengurusPT,
    child: Container(
      margin: EdgeInsets.fromLTRB(16.sp, 8.sp, 16.sp, 8.sp),
      padding: EdgeInsets.symmetric(vertical: 12.sp),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: countPengurus == 4 ? Color(0xff09CBAD7) : Color(0xff027DEF),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        '+ Tambah Pengurus',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: countPengurus == 4 ? Color(0xff09CBAD7) : Color(0xff07539A),
          fontWeight: FontWeight.w700,
          fontSize: 16.sp,
        ),
      ),
    ),
  );
}

Container emptyList(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 2.05,
    padding: EdgeInsets.fromLTRB(27.w, 21.h, 27.w, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageConstants.pipelineEmpty, scale: 2.5),
        SizedBox(height: 32.h),
        Text(
          'Tambah pengurus sesuai Dokumen Legalitas',
          style: tsBody6,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

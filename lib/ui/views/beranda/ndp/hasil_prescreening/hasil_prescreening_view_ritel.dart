// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unused_element

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../application/app/constants/custom_color.dart';
import '../../../../../application/app/constants/image_constants.dart';
import '../../../../shared/app_bar_widget_close.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/styles.dart';
import '../../../../shared/thick_light_grey_divider.dart';
import 'detail_prescreening_button.dart';
import 'dhn_dhib/dhn_view_ritel.dart';
import 'dukcapil/dukcapil_view_ritel.dart';
import 'hasil_prescreening_viewmodel_ritel.dart';
import 'lpg_ritel/lpg_view_ritel.dart';
import 'slik/slik_view_ritel.dart';

class HasilPrescreeningViewRitel
    extends ViewModelBuilderWidget<HasilPrescreeningViewModelRitel> {
  final String? pipelineflagId;
  final String? name;
  final String? ktpNum;
  final bool? fromPrakarsaDetails;

  const HasilPrescreeningViewRitel({
    Key? key,
    this.pipelineflagId,
    this.name,
    this.ktpNum,
    this.fromPrakarsaDetails,
  }) : super(key: key);

  @override
  HasilPrescreeningViewModelRitel viewModelBuilder(BuildContext context) =>
      HasilPrescreeningViewModelRitel(
        pipelineflagId: pipelineflagId,
        name: name,
        ktpNum: ktpNum,
      );

  @override
  // ignore: long-method
  Widget builder(
    BuildContext context,
    HasilPrescreeningViewModelRitel viewModel,
    Widget? child,
  ) {
    Future<bool> getFutureBool() {
      return Future.delayed(const Duration(seconds: 2)).then((onValue) => true);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidgetClose.titleWithBackButton(
        title: 'Hasil Pre-Screening',
        onBackButtonTapped: () => Navigator.pop(context),
      ),
      body: FutureBuilder(
        future: getFutureBool(),
        builder: (context, snap) {
          return snap.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : snap.hasError
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : viewModel.isLoadingHeaderData &&
                          viewModel.isLoadingDebiturData &&
                          viewModel.isLoadingSpouseData
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                              child: Text(
                                'Berikut adalah hasil dari Pre-Screening yang telah dilakukan untuk nasabah.',
                                style: tsDescription,
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 11.h),
                              color: Colors.grey.shade200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 14.h),
                                    margin: EdgeInsets.only(bottom: 12.h),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12.r),
                                      boxShadow: const [subtleBoxShadows],
                                    ),
                                    child: Column(
                                      children: [
                                        Text(name!, style: tsHeading8),
                                        SizedBox(height: 4.h),
                                        Text(
                                          'Nomor KTP: $ktpNum',
                                          style: tsCaption1,
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Jika status warning atau ditolak akan masuk ke kondisi card khusus
                                  if (viewModel.ritelScreeningHeader
                                          .resultScreening! ==
                                      'Pre-Screening Ditolak')
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
                                      height: 32.h,
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                          242,
                                          63,
                                          63,
                                          0.4,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12.r),
                                          topRight: Radius.circular(12.r),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Pre-Screening Ditolak',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromRGBO(
                                                218,
                                                23,
                                                23,
                                                0.8,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (viewModel.ritelScreeningHeader
                                          .resultScreening! ==
                                      'Pre-Screening Ditolak')
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                        16.w,
                                        18.h,
                                        16.w,
                                        20.h,
                                      ),
                                      margin: const EdgeInsets.only(bottom: 0),
                                      height: 93.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12.r),
                                          bottomRight: Radius.circular(12.r),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Debitur yang diajukan belum memenuhi syarat prakarsa pinjaman. Anda dapat memprakarsai kembali dalam waktu 1 minggu.',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.normal,
                                              color: const Color.fromRGBO(
                                                22,
                                                43,
                                                58,
                                                0.6,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  if (viewModel.ritelScreeningHeader
                                          .resultScreening! ==
                                      'LOLOS')
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                        16.w,
                                        18.h,
                                        16.w,
                                        20.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        boxShadow: const [subtleBoxShadows],
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Hasil Pre-Screening'.toUpperCase(),
                                            style: tsCaption1,
                                          ),
                                          SizedBox(height: 4.h),
                                          Text(
                                            'Lolos'.toUpperCase(),
                                            style: tsHeading5SecondaryGreen,
                                          ),
                                          if (!fromPrakarsaDetails!)
                                            Column(
                                              children: [
                                                SizedBox(height: 16.h),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 16.w,
                                                  ),
                                                  child: CustomButton(
                                                    label: 'LANJUT PRAKARSA',
                                                    onPressed: () =>
                                                        _buildLanjutPrakarsa(
                                                      context,
                                                      viewModel,
                                                    ),
                                                    isBusy: false,
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),

                                  if (viewModel.ritelScreeningHeader
                                          .resultScreening! ==
                                      'N/A')
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                        16.w,
                                        18.h,
                                        16.w,
                                        20.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        boxShadow: const [subtleBoxShadows],
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Hasil Pre-Screening'.toUpperCase(),
                                            style: tsCaption1,
                                          ),
                                          SizedBox(height: 4.h),
                                          Text(
                                            'N/A'.toUpperCase(),
                                            style: TextStyle(
                                              color: const Color(0xffF49300),
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 16.h),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16.w,
                                            ),
                                            child: CustomButton(
                                              label:
                                                  'Kirim Kembali Prescreening',
                                              onPressed:
                                                  viewModel.runPrescreening,
                                              isBusy: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
                              child: Text(
                                'DETAIL PRE-SCREENING',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5.w,
                                  color:
                                      CustomColor.primaryBlack.withOpacity(0.9),
                                ),
                              ),
                            ),
                            // Mengirim hasil prescreening berupa parameter ke function
                            _buildListSection1(context, viewModel),
                            if (viewModel
                                    .ritelScreeningIsHaveSpouse.isHaveSpouse !=
                                false)
                              Column(
                                children: [
                                  const ThickLightGreyDivider(),
                                  _buildListSection2(context, viewModel),
                                ],
                              ),

                            if (viewModel
                                    .ritelScreeningHeader.resultScreening! ==
                                'Pre-Screening Ditolak')
                              _buildButtonProcessDitolak(context, viewModel),
                          ],
                        );
        },
      ),
    );
  }

  // section 1 adalah debitur sendiri
  Container _buildListSection1(
    BuildContext context,
    HasilPrescreeningViewModelRitel viewModel,
  ) {
    // final summary = viewModel.ritelScreeningResult.summaryScreening!;
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name!,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5.w,
              color: CustomColor.primaryBlack.withOpacity(0.9),
            ),
          ),
          SizedBox(height: 16.h),
          DetailPrescreeningButton(
            label: 'LPG',
            description: viewModel.ritelScreeningDebitur.lpg!.status!,
            color: viewModel.ritelScreeningDebitur.lpg!.status! == 'Lolos'
                ? Colors.green
                : CustomColor.secondaryRed80,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) => LPGViewRitel(
                  prescreening: viewModel.ritelScreeningDebitur.lpg!.status!,
                  name: name,
                ),
              ),
            ),
          ),
          // Akan dipakai nanti ketika ada SLIK
          DetailPrescreeningButton(
            label: 'SLIK',
            description: viewModel.ritelScreeningDebitur.slik!.status!,
            color: viewModel.ritelScreeningDebitur.slik!.status! == 'Lolos'
                ? Colors.green
                : CustomColor.secondaryRed80,
            // onPressed: () {},
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) => SlikViewRitel(
                  name: name,
                  prescreening: viewModel.ritelScreeningDebitur.slik!.status!,
                  url: viewModel.ritelScreeningDebitur.slik!.path != null
                      ? viewModel.ritelScreeningDebitur.slik!.path!
                      : '',
                ),
              ),
            ),
          ),
          DetailPrescreeningButton(
            label: 'Dukcapil',
            description: viewModel.ritelScreeningDebitur.dukcapil!.status!,
            color: viewModel.ritelScreeningDebitur.dukcapil!.status! == 'Lolos'
                ? Colors.green
                : CustomColor.secondaryRed80,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) => DukcapilViewRitel(
                  id: pipelineflagId,
                  prescreening:
                      viewModel.ritelScreeningDebitur.dukcapil!.status!,
                  summaryDebiturKtpNumber:
                      viewModel.ritelScreeningDebitur.dukcapil!.reason![0],
                  summaryDebiturName:
                      viewModel.ritelScreeningDebitur.dukcapil!.reason![1],
                  summaryDebiturPlaceOfBirth:
                      viewModel.ritelScreeningDebitur.dukcapil!.reason![2],
                  summaryDebiturBirthDate:
                      viewModel.ritelScreeningDebitur.dukcapil!.reason![3],
                  summaryDebiturKtpPhoto:
                      viewModel.ritelScreeningDebitur.dukcapil!.reason![4],
                ),
              ),
            ),
          ),
          DetailPrescreeningButton(
            label: 'DHN',
            description: viewModel.ritelScreeningDebitur.dhn!.status!,
            color: viewModel.ritelScreeningDebitur.dhn!.status! == 'Lolos'
                ? Colors.green
                : CustomColor.secondaryRed80,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) => DHNViewRitel(
                  prescreening: viewModel.ritelScreeningDebitur.dhn!.status!,
                  name: name,
                ),
              ),
            ),
            endSection: true,
          ),
        ],
      ),
    );
  }

  // Section 2 adalah adalah pasangan jika punya pasangan
  Container _buildListSection2(
    BuildContext context,
    HasilPrescreeningViewModelRitel viewModel,
  ) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            viewModel.ritelScreeningSpouse.dukcapil!.reason![1]!['fieldName']!,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5.w,
              color: CustomColor.primaryBlack.withOpacity(0.9),
            ),
          ),
          SizedBox(height: 16.h),
          DetailPrescreeningButton(
            label: 'Dukcapil',
            description: viewModel.ritelScreeningSpouse.dukcapil!.status!,
            color: viewModel.ritelScreeningSpouse.dukcapil!.status == 'Lolos'
                ? Colors.green
                : CustomColor.secondaryRed80,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) => DukcapilViewRitel(
                  id: pipelineflagId,
                  prescreening:
                      viewModel.ritelScreeningSpouse.dukcapil!.status!,
                  summarySpouseKtpNumber:
                      viewModel.ritelScreeningSpouse.dukcapil!.reason![0],
                  summarySpouseName:
                      viewModel.ritelScreeningSpouse.dukcapil!.reason![1],
                  summarySpousePlaceOfBirth:
                      viewModel.ritelScreeningSpouse.dukcapil!.reason![2],
                  summarySpouseBirthDate:
                      viewModel.ritelScreeningSpouse.dukcapil!.reason![3],
                  summarySpouseKtpPhoto:
                      viewModel.ritelScreeningSpouse.dukcapil!.reason![4],
                ),
              ),
            ),
          ),
          DetailPrescreeningButton(
            label: 'SLIK',
            description: viewModel.ritelScreeningSpouse.slik!.status!,
            color: viewModel.ritelScreeningSpouse.slik!.status! == 'Lolos'
                ? Colors.green
                : CustomColor.secondaryRed80,
            // onPressed: () {},
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) => SlikViewRitel(
                  name: viewModel
                      .ritelScreeningSpouse.dukcapil!.reason![1]!['fieldName']!,
                  prescreening: viewModel.ritelScreeningSpouse.slik!.status!,
                  url: viewModel.ritelScreeningSpouse.slik!.path != null
                      ? viewModel.ritelScreeningSpouse.slik!.path!
                      : '',
                ),
              ),
            ),
          ),
          DetailPrescreeningButton(
            label: 'DHN',
            description: viewModel.ritelScreeningSpouse.dhn!.status!,
            color: viewModel.ritelScreeningSpouse.dhn!.status! == 'Lolos'
                ? Colors.green
                : CustomColor.secondaryRed80,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) => DHNViewRitel(
                  prescreening: viewModel.ritelScreeningSpouse.dhn!.status!,
                  name: viewModel
                      .ritelScreeningSpouse.dukcapil!.reason![1]!['fieldName']!
                      .toString(),
                ),
              ),
            ),
            endSection: true,
          ),
        ],
      ),
    );
  }

  void _buildLanjutPrakarsa(
    BuildContext context,
    HasilPrescreeningViewModelRitel viewModel,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageConstants.dokumenProcess,
                    scale: 3,
                  ),
                  SizedBox(height: 16.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Data $name akan dikirim ke menu Prakarsa',
                        style: tsHeading8,
                      ),
                      SizedBox(height: 8.h),
                      AutoSizeText(
                        'Bila dilanjutkan proses tidak dapat dibatalkan',
                        style: tsCaption1,
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomButton(
                              labelColor: CustomColor.darkGrey,
                              color: CustomColor.lightGrey,
                              label: 'Batalkan',
                              onPressed: () => Navigator.of(context).pop(),
                              isBusy: false,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: CustomButton(
                              label: 'Lanjut',
                              onPressed: () => {
                                Navigator.of(context).pop(),
                                viewModel.sendToPrakarsa(),
                              },
                              isBusy: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Container _buildButtonProcessDitolak(
    BuildContext context,
    HasilPrescreeningViewModelRitel viewModel,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 18),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(40, 41, 61, 0.08),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
          BoxShadow(
            color: Color.fromRGBO(96, 97, 112, 0.24),
            blurRadius: 32,
            offset: Offset(0, 20),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomButton(
              label: 'Hapus Data',
              color: const Color(0xffD70C24),
              onPressed: () async {
                _buildTopUpHapusData(context, viewModel);
              },
              isBusy: false,
            ),
          ),
        ],
      ),
    );
  }

  void _buildTopUpHapusData(
    BuildContext context,
    HasilPrescreeningViewModelRitel vm,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageConstants.trash, // Dicari kembali non finansialnya
                      scale: 3,
                    ),
                    SizedBox(height: 16.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'Hapus data $name',
                          style: tsHeading8,
                        ),
                        SizedBox(height: 8.h),
                        AutoSizeText(
                          'Data akan dihapus dari pipeline dan diarsipkan',
                          style: tsCaption1,
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomButton(
                                labelColor: CustomColor.darkGrey,
                                color: CustomColor.lightGrey,
                                label: 'Batalkan',
                                onPressed: () => Navigator.of(context).pop(),
                                isBusy: false,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: CustomButton(
                                label: 'Hapus Data',
                                color: Color(0xffD70C24),
                                onPressed: () => vm.deleteScreening(context),
                                isBusy: false,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _buildTopUpPemutus(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageConstants.dokumenProcess,
                    scale: 3,
                  ),
                  SizedBox(height: 16.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Meminta konfirmasi Pemutus untuk $name',
                        style: tsHeading8,
                      ),
                      SizedBox(height: 8.h),
                      AutoSizeText(
                        'Bila dilanjutkan proses tidak dapat dibatalkan',
                        style: tsCaption1,
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomButton(
                              labelColor: CustomColor.darkGrey,
                              color: CustomColor.lightGrey,
                              label: 'Batalkan',
                              onPressed: () => Navigator.of(context).pop(),
                              isBusy: false,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: CustomButton(
                              label: 'Konfirmasi Pemutus',
                              labelSize: 13.sp,
                              // onPressed: () => Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (builder) =>
                              //         const PrakarsaDetailsViewRitel(
                              //       status: 0,
                              //       debiturType: 'PT',
                              //     ),
                              //   ),
                              // ),
                              // ignore: no-empty-block
                              onPressed: () {},
                              isBusy: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

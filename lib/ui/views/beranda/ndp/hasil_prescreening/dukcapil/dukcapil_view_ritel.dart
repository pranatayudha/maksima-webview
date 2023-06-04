// ignore_for_file: prefer_if_null_operators, library_private_types_in_public_api, unused_element, prefer_single_quotes

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../application/app/app.locator.dart';
import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../application/app/constants/image_constants.dart';
import '../../../../../../application/enums/dialog_type.dart';
import '../../../../../shared/custom_button.dart';
import '../../../../../shared/network_sensitive.dart';
import '../../../../../shared/ritel_custom_pdf_viewer.dart';
import '../../../../../shared/styles.dart';
import '../../../../../shared/thick_light_grey_divider.dart';
import '../hasil_prescreening_viewmodel_ritel.dart';
import 'dukcapil_form.dart';

class DukcapilViewRitel extends StatefulWidget {
  final String? id;
  final String? prescreening;
  final int? mgmt;
  final dynamic summaryDebiturKtpNumber;
  final dynamic summaryDebiturName;
  final dynamic summaryDebiturPlaceOfBirth;
  final dynamic summaryDebiturBirthDate;
  final dynamic summaryDebiturKtpPhoto;
  final dynamic summarySpouseKtpNumber;
  final dynamic summarySpouseName;
  final dynamic summarySpousePlaceOfBirth;
  final dynamic summarySpouseBirthDate;
  final dynamic summarySpouseKtpPhoto;
  final int? codeTable;

  const DukcapilViewRitel({
    Key? key,
    this.id,
    this.mgmt,
    this.prescreening,
    this.summaryDebiturName,
    this.summaryDebiturKtpNumber,
    this.summaryDebiturPlaceOfBirth,
    this.summaryDebiturBirthDate,
    this.summaryDebiturKtpPhoto,
    this.summarySpouseName,
    this.summarySpouseKtpNumber,
    this.summarySpousePlaceOfBirth,
    this.summarySpouseBirthDate,
    this.summarySpouseKtpPhoto,
    this.codeTable,
  }) : super(key: key);

  @override
  _DukcapilViewRitelState createState() => _DukcapilViewRitelState();
}

class _DukcapilViewRitelState extends State<DukcapilViewRitel> {
  Column _buildDetailDukcapilItem(
    String label,
    String label2,
    String value,
    Color valueColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: tsDarkGrey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label2,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: CustomColor.primaryBlack80,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 14.sp,
                color: valueColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
      ],
    );
  }

  Future _expandImage(File? foto) async {
    await locator<DialogService>().showCustomDialog(
      variant: DialogType.imageFileExpand,
      data: {'imageFile': foto},
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NetworkSensitive(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.3,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Detail Pre-Screening - Dukcapil',
            style: tsHeading8,
          ),
        ),
        body: ViewModelBuilder<HasilPrescreeningViewModelRitel>.reactive(
          viewModelBuilder: () => HasilPrescreeningViewModelRitel(
            pipelineflagId: widget.id.toString(),
            name: widget.summaryDebiturName.toString(),
            ktpNum: widget.summaryDebiturKtpNumber.toString(),
            mgmt: widget.mgmt,
          ),
          onModelReady: (viewModel) async {
            if (widget.summaryDebiturKtpPhoto != null) {
              await viewModel.getPublicFileDebitur(
                widget.summaryDebiturKtpPhoto['path'].toString(),
              );
            }
            if (widget.summarySpouseKtpPhoto != 'null') {
              await viewModel.getPublicFileSpouse(
                widget.summarySpouseKtpPhoto['path'].toString(),
              );
            }
          },
          builder: (ctx, viewModel2, child) {
            // ignore: prefer-conditional-expressions
            if (viewModel2.urlDebitur == null && viewModel2.urlSpouse == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                    child: Column(
                      children: [
                        Text(
                          'Berikut adalah detail informasi Dukcapil yang telah didapatkan dari hasil Pre-Screening:',
                          style: tsDescription14,
                        ),
                        SizedBox(height: 8.h),
                        // Memunculkan status pre-screening jika lolos atau tidak lolos
                        // status warning belum diikutsertakan
                        if (widget.prescreening == 'Lolos')
                          Container(
                            height: 38.h,
                            decoration: BoxDecoration(
                              color: widget.prescreening == 'Ditolak'
                                  ? const Color(0xffFBE7E9)
                                  : const Color(0xffEBF8F6),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: Text(
                                widget.prescreening == "Ditolak"
                                    ? 'TIDAK LOLOS'
                                    : 'LOLOS',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: widget.prescreening == 'Ditolak'
                                      ? const Color(0xffD70C24)
                                      : CustomColor.secondaryGreen,
                                ),
                              ),
                            ),
                          ),
                        // Akan muncul button koreksi data dukcapil jika ktp ditemukan
                        // ketika status pre-screening ditolak
                        if (widget.prescreening == 'Ditolak')
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
                                height: 32.h,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(242, 63, 63, 0.4),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.r),
                                    topRight: Radius.circular(12.r),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Data Dukcapil Belum Sesuai',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromRGBO(
                                        218,
                                        23,
                                        23,
                                        0.8,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 14.h),
                                height: 132.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF6F6F8),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8.r),
                                    bottomRight: Radius.circular(8.r),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Anda memiliki 2 kesempatan tersisa untuk melakukan koresi data dukcapil',
                                      style: TextStyle(
                                        color: const Color.fromRGBO(
                                          22,
                                          43,
                                          58,
                                          0.6,
                                        ),
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14.h,
                                    ),
                                    CustomButton(
                                      label: 'Koreksi Data Dukcapil Nasabah',
                                      onPressed: () =>
                                          Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (builder) => DukcapilForm(
                                            id: widget.id,
                                            mgmt: widget.mgmt,
                                            nik:
                                                widget.summaryDebiturKtpNumber !=
                                                        null
                                                    ? widget
                                                        .summaryDebiturKtpNumber
                                                    : widget
                                                        .summarySpouseKtpNumber,
                                            name: widget.summaryDebiturName !=
                                                    null
                                                ? widget.summaryDebiturName
                                                : widget.summarySpouseName,
                                            tempatLahir: widget
                                                        .summaryDebiturPlaceOfBirth !=
                                                    null
                                                ? widget
                                                    .summaryDebiturPlaceOfBirth
                                                : widget
                                                    .summarySpousePlaceOfBirth,
                                            tanggalLahir:
                                                widget.summaryDebiturBirthDate !=
                                                        null
                                                    ? widget
                                                        .summaryDebiturBirthDate
                                                    : widget
                                                        .summarySpouseBirthDate,
                                            isDebitur:
                                                widget.summaryDebiturBirthDate !=
                                                        null
                                                    ? true
                                                    : false,
                                            codeTable: widget.codeTable,
                                          ),
                                        ),
                                      ),
                                      isBusy: false,
                                      radius: 8.r,
                                      height: 40.h,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        // Akan muncul button koreksi data dukcapil jika ktp ditemukan
                        // ketika status pre-screening ditolak
                      ],
                    ),
                  ),
                  const ThickLightGreyDivider(),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('DETAIL DUKCAPIL', style: tsHeading10Black80),
                        SizedBox(height: 16.h),
                        _buildDetailDukcapilItem(
                          'NIK',
                          widget.summarySpouseKtpNumber != null
                              ? widget.summarySpouseKtpNumber['fieldName']
                              : widget.summaryDebiturKtpNumber['fieldName'],
                          widget.summarySpouseKtpNumber != null
                              ? widget.summarySpouseKtpNumber['result']
                              : widget.summaryDebiturKtpNumber['result'],
                          widget.summarySpouseKtpNumber != null
                              ? widget.summarySpouseKtpNumber['result'] ==
                                      'Tidak Ditemukan'
                                  ? const Color(0xffD70C24)
                                  : CustomColor.secondaryGreen
                              : widget.summaryDebiturKtpNumber['result'] ==
                                      'Tidak Ditemukan'
                                  ? const Color(0xffD70C24)
                                  : CustomColor.secondaryGreen,
                        ),
                        _buildDetailDukcapilItem(
                          'Nama Lengkap Sesuai KTP',
                          widget.summarySpouseName != null
                              ? widget.summarySpouseName['fieldName']
                              : widget.summaryDebiturName['fieldName'],
                          widget.summarySpouseName != null
                              ? widget.summarySpouseName['result']
                              : widget.summaryDebiturName['result'],
                          widget.summarySpouseName != null
                              ? widget.summarySpouseName['result'] ==
                                      'Tidak Sesuai'
                                  ? const Color(0xffD70C24)
                                  : CustomColor.secondaryGreen
                              : widget.summaryDebiturName['result'] ==
                                      'Tidak Sesuai'
                                  ? const Color(0xffD70C24)
                                  : CustomColor.secondaryGreen,
                        ),
                        _buildDetailDukcapilItem(
                          'Tempat Lahir',
                          widget.summaryDebiturPlaceOfBirth != null
                              ? widget.summaryDebiturPlaceOfBirth['fieldName']
                              : widget.summarySpousePlaceOfBirth['fieldName'],
                          widget.summaryDebiturPlaceOfBirth != null
                              ? widget.summaryDebiturPlaceOfBirth['result']
                              : widget.summarySpousePlaceOfBirth['result'],
                          widget.summarySpousePlaceOfBirth != null
                              ? widget.summarySpousePlaceOfBirth['result'] ==
                                      'Tidak Sesuai'
                                  ? const Color(0xffD70C24)
                                  : CustomColor.secondaryGreen
                              : widget.summaryDebiturPlaceOfBirth['result'] ==
                                      'Tidak Sesuai'
                                  ? const Color(0xffD70C24)
                                  : CustomColor.secondaryGreen,
                        ),
                        _buildDetailDukcapilItem(
                          'Tanggal Lahir',
                          widget.summaryDebiturBirthDate != null
                              ? widget.summaryDebiturBirthDate['fieldName']
                              : widget.summarySpouseBirthDate['fieldName'],
                          widget.summaryDebiturBirthDate != null
                              ? widget.summaryDebiturBirthDate['result']
                              : widget.summarySpouseBirthDate['result'],
                          // widget.summaryDebiturBirthDate['result'] ==
                          //             'Tidak Sesuai' ||
                          widget.summarySpouseBirthDate != null
                              ? widget.summarySpouseBirthDate['result'] ==
                                      'Tidak Sesuai'
                                  ? const Color(0xffD70C24)
                                  : CustomColor.secondaryGreen
                              : widget.summaryDebiturBirthDate['result'] ==
                                      'Tidak Sesuai'
                                  ? const Color(0xffD70C24)
                                  : CustomColor.secondaryGreen,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 16.h),
                    child: Center(
                      child: widget.summaryDebiturKtpPhoto != null
                          ? viewModel2.urlDebitur!
                                      .split('?')[0]
                                      .split('.')
                                      .last !=
                                  'pdf'
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    imageUrl: viewModel2.urlDebitur!,
                                    placeholder: (context, url) =>
                                        Transform.scale(
                                      scale: 0.5,
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 6.0,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      ImageConstants.imageNotFound521,
                                      scale: 1,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(top: 20.sp),
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) =>
                                            RitelCustomPDFViewer(
                                          viewModel2.urlDebitur!,
                                        ),
                                      ),
                                    ),
                                    child: Image.asset(
                                      IconConstants.pdf,
                                      scale: 1,
                                    ),
                                  ),
                                )
                          : widget.summarySpouseKtpPhoto != 'null'
                              ? viewModel2.urlSpouse!
                                          .split('?')[0]
                                          .split('.')
                                          .last !=
                                      'pdf'
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        viewModel2.urlSpouse!,
                                      ),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(top: 20.sp),
                                      child: GestureDetector(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (builder) =>
                                                RitelCustomPDFViewer(
                                              viewModel2.urlSpouse!,
                                            ),
                                          ),
                                        ),
                                        child: Image.asset(
                                          IconConstants.pdf,
                                          scale: 1,
                                        ),
                                      ),
                                    )
                              : Container(
                                  width: 300.w,
                                  height: 150.h,
                                  color: const Color(0xff828896),
                                ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

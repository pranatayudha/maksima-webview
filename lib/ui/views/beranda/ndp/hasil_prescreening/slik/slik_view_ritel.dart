// ignore_for_file: dead_code, library_private_types_in_public_api, unused_element

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../application/app/constants/image_constants.dart';
import '../../../../../shared/custom_circular_progress_indicator.dart';
import '../../../../../shared/network_sensitive.dart';
import '../../../../../shared/styles.dart';
import 'slik_viewmodel_ritel.dart';

class SlikViewRitel extends StatefulWidget {
  final String? prescreening;
  final String? name;
  final String? url;

  const SlikViewRitel({
    Key? key,
    this.prescreening,
    this.name,
    this.url,
  }) : super(key: key);

  @override
  _SlikViewRitelState createState() => _SlikViewRitelState();
}

class _SlikViewRitelState extends State<SlikViewRitel> {
  bool isBusy = false;

  Column _buildRingkasanFasilitasItem(String label, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: tsDarkGrey),
            Text(value, style: tsHeading10Black80),
          ],
        ),
        SizedBox(height: 8.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SLIKViewModelRitel>.reactive(
      viewModelBuilder: () => SLIKViewModelRitel(
        name: widget.name,
        url: widget.url,
      ),
      builder: (context, vm, child) {
        return NetworkSensitive(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shadowColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              title: Text(
                'Detail Pre-Screening - SLIK',
                style: tsHeading6,
              ),
            ),
            body: (widget.prescreening == 'Lolos')
                ? Column(
                    children: [
                      Expanded(
                        child: _buildSuccess(),
                      ),
                      _buildButtonDownloadIdeb(vm),
                    ],
                  )
                : (widget.prescreening == 'Gagal')
                    ? Center(
                        child: _buildGagal(),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: _buildDitolak(),
                          ),
                          _buildButtonDownloadIdeb(vm),
                        ],
                      ),
          ),
        );
      },
    );
  }

  Column _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageConstants.slikSuccess, scale: 2.5),
        SizedBox(height: 16.h),
        AutoSizeText(
          'Riwayat Kolektabilitas Debitur',
          style: tsHeading8,
          textAlign: TextAlign.center,
        ),
        AutoSizeText(
          'Sesuai Kriteria',
          style: tsHeading14Green,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Column _buildWarning() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageConstants.slikWarning, scale: 2.5),
        SizedBox(height: 16.h),
        AutoSizeText(
          'Debitur memiliki history',
          style: tsHeading8,
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              'kolektabilitas 2-3 ',
              style: tsHeading8Warning,
              textAlign: TextAlign.center,
            ),
            AutoSizeText(
              'sebanyak ',
              style: tsHeading8,
              textAlign: TextAlign.center,
            ),
            AutoSizeText(
              '3x',
              style: tsHeading8Warning,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        AutoSizeText(
          'dalam 12 bulan ke belakang',
          style: tsHeading8,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Column _buildDitolak() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageConstants.slikDitolak, scale: 2.5),
        SizedBox(height: 16.h),
        AutoSizeText(
          'Debitur memiliki riwayat',
          style: tsHeading8,
          textAlign: TextAlign.center,
        ),
        AutoSizeText(
          'kolektabilitas tidak sesuai dengan',
          style: tsHeading8Ditolak,
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              'kriteria  ',
              style: tsHeading8Ditolak,
              textAlign: TextAlign.center,
            ),
            AutoSizeText(
              'dalam dua belas bulan',
              style: tsHeading8,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        AutoSizeText(
          ' kebelakang',
          style: tsHeading8,
        ),
        SizedBox(height: 8.h),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Download iDeb untuk lebih detil',
            style: TextStyle(
              fontSize: 12.sp,
              color: CustomColor.primaryBlack80,
            ),
          ),
        ),
      ],
    );
  }

  Column _buildGagal() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageConstants.slikDitolak, scale: 2.5),
        SizedBox(height: 16.h),
        AutoSizeText(
          'Riwayat kolektabilitas debitur tidak ditemukan',
          style: tsHeading8,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Container _buildButtonDownloadIdeb(SLIKViewModelRitel vm) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: SizedBox(
                height: 40.h,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return CustomColor.darkGrey;
                      }
                      // ignore: newline-before-return
                      return CustomColor.secondaryBlue;
                    }),
                  ),
                  child: isBusy
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CustomCircularProgressIndicator(),
                            const SizedBox(
                              width: 24,
                            ),
                            Text(
                              'Please Wait...',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          'Download iDeb SLIK',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                  onPressed: () async {
                    setState(() => isBusy = true);
                    await Future.delayed(const Duration(seconds: 3));
                    setState(() => isBusy = false);
                    vm.savePDFToDevice();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

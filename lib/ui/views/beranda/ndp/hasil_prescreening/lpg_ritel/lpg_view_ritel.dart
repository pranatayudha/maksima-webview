// ignore_for_file: library_private_types_in_public_api

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../application/app/constants/image_constants.dart';
import '../../../../../shared/network_sensitive.dart';
import '../../../../../shared/styles.dart';

class LPGViewRitel extends StatefulWidget {
  final String? prescreening;
  final String? name;

  const LPGViewRitel({Key? key, this.prescreening, this.name})
      : super(key: key);

  @override
  _LPGViewRitelState createState() => _LPGViewRitelState();
}

class _LPGViewRitelState extends State<LPGViewRitel> {
  @override
  Widget build(BuildContext context) {
    return NetworkSensitive(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Detail Pre-Screening - LPG',
            style: tsHeading6,
          ),
        ),
        body: SafeArea(
          top: false,
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
                  child: Column(
                    children: [
                      if (widget.prescreening == 'Lolos')
                        Image.asset(ImageConstants.lpgSuccess, scale: 2.5)
                      else
                        Image.asset(ImageConstants.lpgDitolak, scale: 2.5),
                      SizedBox(height: 16.h),
                      AutoSizeText(
                        widget.prescreening == 'Ditolak'
                            ? 'Sektor Ekonomi tidak sesuai dengan target pasar yang ditentukan'
                            : 'Sektor Ekonomi sesuai dengan target pasar yang ditentukan',
                        style: tsHeading8,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8.h),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Lokasi usaha ',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: CustomColor.primaryBlack80,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.name,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: CustomColor.primaryBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ' berada di',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: CustomColor.primaryBlack,
                              ),
                            ),
                            TextSpan(
                              text: widget.prescreening == 'Lolos'
                                  ? ' zona hijau'
                                  : ' zona merah',
                              style: widget.prescreening == 'Lolos'
                                  ? tsHeading15Green
                                  : tsHeading8Ditolak,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

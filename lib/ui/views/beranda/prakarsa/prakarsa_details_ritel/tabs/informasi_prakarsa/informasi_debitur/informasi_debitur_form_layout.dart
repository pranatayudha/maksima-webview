import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../shared/styles.dart';
import '../../../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_debitur_form_section.dart';

class InformasiDebiturLayout extends StatefulWidget {
  final String pipeLinesId;
  final String prakarsaId;
  final dynamic dataDiri;
  final dynamic dataUsaha;
  final int status;

  const InformasiDebiturLayout({
    Key? key,
    required this.pipeLinesId,
    required this.prakarsaId,
    this.dataDiri,
    this.dataUsaha,
    required this.status,
  }) : super(key: key);

  @override
  State<InformasiDebiturLayout> createState() => _InformasiDebiturLayoutState();
}

class _InformasiDebiturLayoutState extends State<InformasiDebiturLayout> {
  @override
  Widget build(BuildContext context) {
    return NetworkSensitive(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Informasi Debitur',
            style: tsHeading6,
          ),
          centerTitle: true,
          leadingWidth: 30.w,
          leading: Container(
            margin: EdgeInsets.only(left: 5.w),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: const Color(0xff606060),
                size: 24.sp,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        body: SafeArea(
          child: WillPopScope(
            onWillPop: () async => false,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 16.h),
                    child: Text(
                      'Lengkapi semua informasi dibawah untuk menambahkan debitur ke Pipeline. Pastikan seluruh data terisi dengan benar',
                      style: tsDescription14,
                    ),
                  ),
                  const ThickLightGreyDivider(),
                  Column(
                    children: [
                      InformasiDebiturFormSection(
                        prakarsaId: widget.prakarsaId,
                        pipelinesId: widget.pipeLinesId,
                        dataDiri: widget.dataDiri,
                        dataUsaha: widget.dataUsaha,
                        status: widget.status,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

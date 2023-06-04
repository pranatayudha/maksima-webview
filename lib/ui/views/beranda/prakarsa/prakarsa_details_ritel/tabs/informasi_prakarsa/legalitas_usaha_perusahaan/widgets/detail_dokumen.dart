// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../shared/custom_textfield.dart';
import '../../../../../../../../shared/form_layout_ritel.dart';

class DetailDokumen extends StatefulWidget {
  const DetailDokumen({Key? key}) : super(key: key);

  @override
  _DetailDokumenState createState() => _DetailDokumenState();
}

class _DetailDokumenState extends State<DetailDokumen> {
  @override
  Widget build(BuildContext context) {
    PopupMenuButton<String> buildJenisDokumen() {
      return PopupMenuButton(
        offset: Offset(0, 65.h),
        itemBuilder: (BuildContext context) {
          return ['Dokumen Utama', 'Dokumen Lainnya']
              .map<PopupMenuItem<String>>((value) {
            return PopupMenuItem(value: value, child: Text(value));
          }).toList();
        },
        onSelected: (String val) => {},
        child: const CustomTextField(
          label: 'Jenis Dokumen',
          hintText: 'Pilih Jenis Dokumen',
          withSuffixIcon: true,
          suffixIconImagePath: IconConstants.chevronDown,
          enabled: false,
          validator: null,
        ),
      );
    }

    PopupMenuButton<String> buildNamaDokumen() {
      return PopupMenuButton(
        offset: Offset(0, 65.h),
        itemBuilder: (BuildContext context) {
          return ['NIB', 'SIUP', 'SITU', 'SKDP', 'TDP']
              .map<PopupMenuItem<String>>((value) {
            return PopupMenuItem(value: value, child: Text(value));
          }).toList();
        },
        onSelected: (String val) => {},
        child: const CustomTextField(
          label: 'Nama Dokumen',
          hintText: 'Pilih Nama Dokumen',
          withSuffixIcon: true,
          suffixIconImagePath: IconConstants.chevronDown,
          enabled: false,
          validator: null,
        ),
      );
    }

    CustomTextField buildNoDokumen() {
      return const CustomTextField(
        label: 'No. NIB',
        hintText: 'Nomor NIB',
        keyboardType: TextInputType.text,
        onSave: null,
        onChanged: null,
      );
    }

    return FormLayoutRitel(
      title: 'Detail Dokumen',
      onBackButtonPressed: () => Navigator.pop(context),
      isBusy: false,
      mainButtonTitle: 'SIMPAN',
      onMainButtonPressed: null,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 20.h),
        child: Column(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                height: 237,
              ),
            ),
            SizedBox(height: 16.h),
            buildJenisDokumen(),
            SizedBox(height: 8.h),
            buildNamaDokumen(),
            SizedBox(height: 8.h),
            buildNoDokumen(),
          ],
        ),
      ),
    );
  }
}

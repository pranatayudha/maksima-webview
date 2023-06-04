import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../../application/models/ritel_laporan_kunjungan_nasabah.dart';
import '../informasi_agunan_lkn_viewmodel.dart';

class InformasiAgunanLKNCard extends StatelessWidget {
  final Function onPressed;
  final RitelLaporanKunjunganNasabah ritelLaporanKunjunganNasabah;

  const InformasiAgunanLKNCard({
    required this.onPressed,
    Key? key,
    required this.ritelLaporanKunjunganNasabah,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? status;
    final splitStatus = ritelLaporanKunjunganNasabah.status!.split(' ').last;
    switch (splitStatus) {
      case 'visitResult':
        status = 'Belum ada Hasil Kunjungan';
        break;
      case 'visitPath':
        status = 'Belum ada Foto Kunjungan';
        break;
      case 'dateOfVisit':
        status = 'Belum ada Tanggal Kunjungan';
        break;
      case 'purposeVisit':
        status = 'Belum ada Tujuan Kunjungan';
        break;
      default:
        status = '';
        break;
    }

    return loadingIndicatorLaporanKunjunganNasabahListItem.name ==
            ritelLaporanKunjunganNasabah.name
        ? const LinearProgressIndicator()
        : GestureDetector(
            onTap: () => onPressed(),
            child: Container(
              padding: EdgeInsets.fromLTRB(19.5.w, 16.h, 24.5.w, 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(IconConstants.paper, scale: 2.5),
                      SizedBox(width: 19.45.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ritelLaporanKunjunganNasabah.name!,
                            style: TextStyle(
                              color: const Color(0xff03213E),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            status,
                            style: TextStyle(
                              color: const Color(0xff66788A),
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(IconConstants.chevronRight, scale: 2.5),
                ],
              ),
            ),
          );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../application/app/constants/custom_color.dart';
import 'styles.dart';

class DetilPencairanBox extends StatelessWidget {
  final double nominalPencairan;
  final double cadanganBunga;
  final String tglJatuhTempo;
  final String jmlHariPinjaman;

  const DetilPencairanBox({
    Key? key,
    required this.nominalPencairan,
    required this.cadanganBunga,
    required this.tglJatuhTempo,
    required this.jmlHariPinjaman,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 16.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F8),
        border: Border.all(color: const Color(0xffE5E5E5)),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        children: [
          _buildItem('Nominal Pencairan', 1, nominalPencairan),
          _buildDivider(),
          _buildItem('Cadangan Bunga', 1, cadanganBunga),
          _buildDivider(),
          _buildItem('Tgl. Jatuh Tempo Cadangan Bunga', 2, tglJatuhTempo),
          _buildDivider(),
          _buildItem('Jumlah Hari Pinjaman', 2, jmlHariPinjaman),
        ],
      ),
    );
  }

  Padding _buildDivider() {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.h,
        bottom: 16.h,
      ),
      child: const Divider(thickness: 1),
    );
  }

  Column _buildItem(
    String title,
    int type,
    dynamic value,
  ) {
    final formatter = NumberFormat('#,###', 'id_ID');

    return Column(
      children: [
        Text(title, style: tsHeading12),
        SizedBox(height: 8.h),
        (type == 1)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Rp.',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      color: CustomColor.primaryBlack40,
                    ),
                  ),
                  Text(
                    formatter.format(value),
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      color: CustomColor.primaryBlack40,
                    ),
                  ),
                ],
              )
            : Text(
                value,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  color: CustomColor.primaryBlack40,
                ),
              ),
      ],
    );
  }
}

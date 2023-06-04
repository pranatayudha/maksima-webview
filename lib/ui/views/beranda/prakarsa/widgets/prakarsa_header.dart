import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/app/constants/image_constants.dart';
import '../../../../../application/helpers/ui_helpers.dart';
import '../../../../shared/styles.dart';

class PrakarsaHeader extends StatelessWidget {
  const PrakarsaHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: prakarsaHeaderHeight,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(39.w, 20, 39.w, 0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstants.headerBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Prakarsa Pinjaman', style: tsHeading4White),
          SizedBox(height: 8.h),
          Text(
            'Pilih calon nasabah dari pipeline di bawah atau masukkan informasi nasabah baru',
            style: tsBody6White80,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

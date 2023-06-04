import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../application/app/app.router.dart';
import '../../../../application/app/constants/icon_constants.dart';
import 'akun_menu_item.dart';

class PengaturanAkun extends StatelessWidget {
  const PengaturanAkun({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'PENGATURAN AKUN',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 18.h),
          const AkunMenuItem(
            iconPath: IconConstants.user,
            label: 'Informasi Pribadi',
            description: 'Lihat Informasi Pribadi Anda',
            route: Routes.informasiPribadiView,
          ),
        ],
      ),
    );
  }
}

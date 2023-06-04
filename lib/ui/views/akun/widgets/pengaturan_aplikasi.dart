import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/app/app.router.dart';
import '../../../../application/app/constants/icon_constants.dart';
import '../akun_viewmodel.dart';
import 'akun_app_version.dart';
import 'akun_menu_item.dart';
import 'logout_button.dart';

class PengaturanAplikasi extends HookViewModelWidget<AkunViewModel> {
  const PengaturanAplikasi({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    AkunViewModel viewModel,
  ) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 132.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'PENGATURAN APLIKASI',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 18.h),
          AkunMenuItem(
            iconPath: IconConstants.bell,
            label: 'Notifikasi',
            description: 'Hidup / Matikan Notifikasi Aplikasi',
            isSwitched: viewModel.isNotificationSwitched,
            onSwitch: (val) => viewModel.updateIsNotificationSwitched(),
            route: null,
          ),
          const AkunMenuItem(
            iconPath: IconConstants.questionCircle,
            label: 'Bantuan',
            description: 'Hubungi Pusat Bantuan',
            route: Routes.bantuanView,
          ),
          const AkunMenuItem(
            iconPath: IconConstants.paper,
            label: 'Syarat & Ketentuan',
            description: 'Lihat Syarat & Ketentuan Aplikasi',
            route: Routes.syaratKetentuanView,
          ),
          const AkunMenuItem(
            iconPath: IconConstants.paperNegative,
            label: 'Kebijakan Privasi',
            description: 'Lihat Kebijakan Privasi Aplikasi',
            route: Routes.kebijakanPrivasiView,
          ),
          const LogoutButton(),
          const AkunAppVersion(),
        ],
      ),
    );
  }
}

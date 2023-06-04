import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../application/app/app.router.dart';
import '../../../../application/app/constants/icon_constants.dart';
import '../../../../ui/views/beranda/widgets/menu_item.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.w, 20.h, 10.w, 20.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              MenuItemRitel(
                label: 'Simulasi',
                iconPath: IconConstants.simulasi,
              ),
              MenuItemRitel(
                label: 'Cek SLIK',
                iconPath: IconConstants.cekNasabah,
              ),
              MenuItemRitel(
                label: 'Partnership',
                iconPath: IconConstants.daftarPartnership,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              MenuItemRitel(
                label: 'Monitoring',
                iconPath: IconConstants.monitoring,
                route: Routes.monitoringRitelView,
              ),
              MenuItemRitel(
                label: 'Beyond \nBanking',
                iconPath: IconConstants.beyondBanking,
              ),
              MenuItemRitel(
                label: 'Sales Kit',
                iconPath: IconConstants.salesKit,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

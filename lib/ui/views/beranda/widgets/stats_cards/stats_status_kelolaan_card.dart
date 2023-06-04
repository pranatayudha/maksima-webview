import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/app/constants/icon_constants.dart';
import '../../../../../application/enums/status_kelolaan_type.dart';
import '../../../../shared/styles.dart';
import 'stats_horiz_card.dart';
import 'widgets/status_kelolaan_item.dart';

class StatsStatusKelolaanCard extends StatelessWidget {
  const StatsStatusKelolaanCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatsHorizCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Image.asset(IconConstants.bankBuilding, scale: 3),
              SizedBox(width: 10.w),
              Text('Status Kelolaan', style: tsHeading8),
            ],
          ),
          Divider(
            color: const Color(0xffC8C8C8),
            height: 23.h,
          ),
          Expanded(
            child: ShaderMask(
              shaderCallback: (Rect rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.white,
                  ],
                  stops: [
                    0.0,
                    0.0,
                    0.75,
                    1.0,
                  ],
                ).createShader(rect);
              },
              blendMode: BlendMode.dstOut,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  const StatusKelolaanItem(
                    statusKelolaanType: StatusKelolaanType.jumlahPartner,
                    value: 50,
                  ),
                  const StatusKelolaanItem(
                    statusKelolaanType: StatusKelolaanType.jumlahPipeline,
                    value: 20,
                  ),
                  const StatusKelolaanItem(
                    statusKelolaanType: StatusKelolaanType.prosesAnalisa,
                    value: 30,
                  ),
                  const StatusKelolaanItem(
                    statusKelolaanType: StatusKelolaanType.prosesPutusan,
                    value: 15,
                  ),
                  const StatusKelolaanItem(
                    statusKelolaanType:
                        StatusKelolaanType.prosesAkadDanPencairan,
                    value: 15,
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

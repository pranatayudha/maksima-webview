import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'stats_cards/stats_kualitas_debitur_card.dart';
import 'stats_cards/stats_pencapaian_kinerja_card.dart';
import 'stats_cards/stats_status_kelolaan_card.dart';

class StatsHorizList extends StatelessWidget {
  const StatsHorizList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final isNeedSafeArea = MediaQuery.of(context).viewPadding.bottom > 0;

    return Container(
      margin: EdgeInsets.only(
        top: statusBarHeight +
            (isNeedSafeArea
                ? 105.h
                : Platform.isIOS
                    ? 125.h
                    : 110.h),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 16.w),
            const StatsPencapaianKinerjaCard(),
            const StatsKualitasDebiturCard(),
            const StatsStatusKelolaanCard(),
          ],
        ),
      ),
    );
  }
}

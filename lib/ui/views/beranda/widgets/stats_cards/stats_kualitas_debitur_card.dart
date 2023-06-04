import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/app/constants/icon_constants.dart';
import '../../../../shared/styles.dart';
import 'stats_horiz_card.dart';
import 'widgets/kualitas_debitur_sub_card.dart';

class StatsKualitasDebiturCard extends StatelessWidget {
  const StatsKualitasDebiturCard({
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
              Image.asset(IconConstants.statistik, scale: 3),
              SizedBox(width: 10.w),
              Text('Kualitas Debitur', style: tsHeading8),
            ],
          ),
          Divider(
            color: const Color(0xffC8C8C8),
            height: 23.h,
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const KualitasDebiturSubCard(
                label: 'DPK',
                value: '179',
                unit: 'Juta',
                percentage: '(3.14%)',
              ),
              SizedBox(width: 15.w),
              const KualitasDebiturSubCard(
                label: 'NPL',
                value: '70',
                unit: 'Juta',
                percentage: '(1.23%)',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

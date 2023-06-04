import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/app/constants/custom_color.dart';
import '../../../../../application/app/constants/icon_constants.dart';
import '../../../../shared/styles.dart';
import 'stats_horiz_card.dart';

class StatsPencapaianKinerjaCard extends StatelessWidget {
  const StatsPencapaianKinerjaCard({
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
              Image.asset(IconConstants.bag, scale: 3),
              SizedBox(width: 10.w),
              Text('Pencapaian Kinerja', style: tsHeading8),
            ],
          ),
          Divider(
            color: const Color(0xffC8C8C8),
            height: 23.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('OutStanding', style: tsHeading11),
              SizedBox(height: 4.h),
              FAProgressBar(
                currentValue: (3.5 / 5) * 100,
                size: 4.sp,
                progressColor: CustomColor.lightGreen80,
                backgroundColor: CustomColor.lightGrey30,
                animatedDuration: const Duration(milliseconds: 500),
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '3.5 ',
                    style: TextStyle(
                      color: CustomColor.lightGreen80,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    '/ 5 Milyar',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('NoA', style: tsHeading11),
              SizedBox(height: 4.h),
              FAProgressBar(
                currentValue: 20,
                size: 4.sp,
                progressColor: CustomColor.primaryRed60,
                backgroundColor: CustomColor.lightGrey30,
                animatedDuration: const Duration(milliseconds: 500),
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '150 ',
                    style: TextStyle(
                      color: CustomColor.primaryRed60,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    'Debitur',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

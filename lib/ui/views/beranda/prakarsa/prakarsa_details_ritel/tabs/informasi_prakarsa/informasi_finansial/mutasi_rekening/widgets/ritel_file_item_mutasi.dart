// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../../application/services/url_launcher_service.dart';
import '../../../../../../../../../shared/styles.dart';

class RitelFileItemMutasi extends StatelessWidget {
  final String file;

  const RitelFileItemMutasi(
    this.file, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Image.asset(
            IconConstants.pdf,
            scale: 1.5,
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bukti Mutasi',
                style: tsHeading10,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.h),
              GestureDetector(
                onTap: () => locator<URLLauncherService>().browse(file),
                child: Text('Lihat', style: tsHeading11SecondaryBlue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

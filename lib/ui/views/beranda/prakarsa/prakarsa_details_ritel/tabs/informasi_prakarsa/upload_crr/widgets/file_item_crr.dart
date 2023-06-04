import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../application/services/url_launcher_service.dart';
import '../../../../../../../../shared/styles.dart';

class FileItemCRR extends StatelessWidget {
  final String file;

  const FileItemCRR(
    this.file, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            IconConstants.pdf,
            scale: 1.5,
          ),
          SizedBox(width: 16.w),
          Column(
            children: [
              Text(
                'CRR',
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/app/constants/image_constants.dart';
import '../../../../shared/styles.dart';

class PartnershipListEmptyRitel extends StatelessWidget {
  const PartnershipListEmptyRitel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 48.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageConstants.pipelineEmpty, scale: 3),
          SizedBox(height: 24.w),
          Text(
            'Belum ada data Partnership. Tambah Partbership untuk melanjutkan proses pencairan',
            style: tsBody6,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

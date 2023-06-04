import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/app/constants/image_constants.dart';
import '../../../../shared/styles.dart';

class PrakarsaEmptyRitel extends StatelessWidget {
  const PrakarsaEmptyRitel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.05,
      padding: EdgeInsets.fromLTRB(27.w, 21.h, 27.w, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageConstants.pipelineEmpty, scale: 3),
          SizedBox(height: 32.h),
          Text(
            'Data nasabah di Prakarsa belum tersedia.',
            style: tsBody6,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application/app/constants/image_constants.dart';
import 'styles.dart';

class RekeningBox extends StatelessWidget {
  final int type;
  final String namaDebitur;
  final String noRekening;
  const RekeningBox({
    Key? key,
    required this.type,
    required this.namaDebitur,
    required this.noRekening,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type == 1 ? 'Rekening Pencairan' : 'Rekening Escrow Pembayaran',
            style: tsCaption1,
          ),
          SizedBox(height: 6.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.r,
              ),
              border: Border.all(
                color: Colors.grey.shade400,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    ImageConstants.raya,
                    scale: 3,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        namaDebitur,
                        style: tsHeading10,
                      ),
                      Text(
                        noRekening,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xff99A0AF),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

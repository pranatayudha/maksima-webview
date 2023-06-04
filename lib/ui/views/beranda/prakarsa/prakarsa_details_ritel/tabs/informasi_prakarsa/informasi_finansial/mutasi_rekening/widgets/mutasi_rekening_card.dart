import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../../application/models/ritel_mutasi_rekening.dart';
import '../mutasi_rekening_viewmodel.dart';

class MutasiRekeningCard extends StatelessWidget {
  final Function onPressed;
  final RitelMutasiRekening ritelMutasiRekening;

  const MutasiRekeningCard({
    required this.onPressed,
    Key? key,
    required this.ritelMutasiRekening,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loadingIndicatorMutasiRekeningListItem.prakarsaId ==
            ritelMutasiRekening.prakarsaId
        ? const LinearProgressIndicator()
        : GestureDetector(
            onTap: () => onPressed(),
            child: Container(
              padding: EdgeInsets.fromLTRB(19.5.w, 16.h, 24.5.w, 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(IconConstants.paper, scale: 2.5),
                      SizedBox(width: 19.45.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ritelMutasiRekening.bank!,
                            style: TextStyle(
                              color: const Color(0xff03213E),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ritelMutasiRekening.periode!,
                            style: TextStyle(
                              color: const Color(0xff66788A),
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    IconConstants.chevronRight,
                    scale: 2.5,
                  ),
                ],
              ),
            ),
          );
  }
}

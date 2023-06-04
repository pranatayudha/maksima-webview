import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/app/constants/custom_color.dart';
import '../../../../../application/models/ritel_partnerships.dart';

class PartnerCardListRitel extends StatelessWidget {
  final RitelPartnerships partner;
  final Function onPressed;

  const PartnerCardListRitel(
    this.partner, {
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Text(''),
                // Text(partner.name ?? '...', style: tsHeading8),
                // TODO(Jeffry): Unhide 'Dibuat oleh:' after API response /partnerships/list updated
                // SizedBox(height: 4.h),
                // Row(
                //   children: [
                //     Text(
                //       'Dibuat oleh: ',
                //       style: TextStyle(
                //         color: CustomColor.darkGrey,
                //         fontSize: 14.sp,
                //       ),
                //     ),
                //     Text(
                //       partner.approvedBy ?? '...',
                //       style: TextStyle(
                //         color: CustomColor.darkGrey,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 14.sp,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Text(
              //   '${partner. ?? '...'}',
              //   style: TextStyle(
              //     fontSize: 24.sp,
              //     fontWeight: FontWeight.w700,
              //     color: CustomColor.secondaryOrange,
              //   ),
              // ),
              Text(
                'Anggota',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: CustomColor.primaryBlack40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

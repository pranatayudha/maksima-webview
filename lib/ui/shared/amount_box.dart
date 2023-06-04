import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../application/app/constants/custom_color.dart';
import 'styles.dart';

class AmountBox extends StatelessWidget {
  final String label;
  final dynamic amount;
  final Color? amountColor;
  final String? subtitle;
  final bool isRupiah;

  const AmountBox({
    required this.label,
    required this.amount,
    this.amountColor,
    this.subtitle,
    this.isRupiah = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###', 'id_ID');

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F8),
        border: Border.all(color: const Color(0xffE5E5E5)),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Text(label, style: tsHeading12),
            SizedBox(height: 8.h),
            if (subtitle != null) ...[
              Text(subtitle!, style: tsCaption2),
              SizedBox(height: 8.h),
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isRupiah ? 'Rp. ' : '',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: amountColor ?? CustomColor.primaryBlack40,
                  ),
                ),
                Text(
                  amount != null ? formatter.format(amount) : '0',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: amountColor ?? CustomColor.primaryBlack40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

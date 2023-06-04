import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../shared/styles.dart';

final formatter = NumberFormat('#,###', 'id_ID');

class StatusKelolaanCustomerCard extends StatelessWidget {
  final String name;
  final double loanAmount;
  final String updatedAt;
  final Uint8List? photoBase64;

  const StatusKelolaanCustomerCard({
    Key? key,
    required this.name,
    required this.loanAmount,
    required this.updatedAt,
    this.photoBase64,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (photoBase64 != null && photoBase64!.isNotEmpty)
          Container(
            clipBehavior: Clip.antiAlias,
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
            child: Image.memory(
              photoBase64!,
              fit: BoxFit.cover,
            ),
          )
        else
          Container(
            clipBehavior: Clip.antiAlias,
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: CustomColor.lightGrey,
            ),
            child: const Icon(
              Icons.person,
              color: CustomColor.secondaryBlue,
            ),
          ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: tsHeading8,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rp. ${formatter.format(loanAmount)}',
                    style: tsHeading10DarkGrey,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    updatedAt,
                    style: tsCaption1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

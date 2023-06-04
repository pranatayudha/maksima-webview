// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../application/app/constants/custom_color.dart';

class PengurusCvCardList extends StatelessWidget {
  final pipelineId;
  final onPressed;

  const PengurusCvCardList(
    this.pipelineId, {
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
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Pengurus/Pemilik',
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

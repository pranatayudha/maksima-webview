import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/styles.dart';

class PersonalInfoItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final String description;

  const PersonalInfoItem({
    required this.imagePath,
    required this.label,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.w),
                child: SizedBox(
                  width: 24.w,
                  height: 24.w,
                  child: Image.asset(imagePath),
                ),
              ),
              SizedBox(width: 22.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label, style: tsBody3),
                    SizedBox(height: 2.h),
                    Text(
                      description.isNotEmpty ? description : '-',
                      style: tsCaption1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(thickness: 1.h, height: 24.h),
        ],
      ),
    );
  }
}

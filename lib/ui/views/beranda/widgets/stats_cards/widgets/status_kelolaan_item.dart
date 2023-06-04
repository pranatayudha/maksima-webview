import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../application/app/app.locator.dart';
import '../../../../../../application/app/app.router.dart';
import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../application/enums/status_kelolaan_type.dart';

class StatusKelolaanItem extends StatelessWidget {
  final StatusKelolaanType statusKelolaanType;
  final int value;

  const StatusKelolaanItem({
    Key? key,
    required this.statusKelolaanType,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            parseStatusKelolaanTypeToString(statusKelolaanType),
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          GestureDetector(
            onTap: () {
              locator<NavigationService>().navigateTo(
                Routes.statusKelolaanItemDetailsView,
                arguments: StatusKelolaanItemDetailsViewArguments(
                  statusKelolaanType: statusKelolaanType,
                  value: value,
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.5.w),
              decoration: BoxDecoration(
                color: CustomColor.primaryBlue10,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$value',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 3.w),
                  SizedBox(
                    width: 15.w,
                    child: const Icon(Icons.chevron_right),
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

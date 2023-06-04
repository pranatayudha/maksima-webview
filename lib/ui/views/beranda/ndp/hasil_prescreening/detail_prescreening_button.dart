import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../application/app/app.locator.dart';
import '../../../../../application/app/constants/icon_constants.dart';
import '../../../../../application/enums/dialog_type.dart';
import '../../../../shared/styles.dart';

class DetailPrescreeningButton extends StatelessWidget {
  final String label;
  final String description;
  final Color color;
  final Function? onPressed;
  final bool? disabled;
  final bool endSection;

  const DetailPrescreeningButton({
    required this.label,
    required this.description,
    required this.color,
    this.disabled = false,
    this.onPressed,
    this.endSection = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return disabled! ? _buildDisabledButton() : _buildEnabledButton();
  }

  Widget _buildDisabledButton() {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: null,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(label, style: tsHeading10DarkGrey)],
              ),
              Opacity(
                opacity: 0.3,
                child: Image.asset(IconConstants.chevronRight, scale: 3),
              ),
            ],
          ),
          Divider(
            color: const Color(0xffC8C8C8).withOpacity(0.4),
            height: 20.h,
            thickness: 1.h,
          ),
        ],
      ),
    );
  }

  Widget _buildEnabledButton() {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () => onPressed != null
          ? onPressed!()
          : locator<DialogService>()
              .showCustomDialog(variant: DialogType.inDevelopment),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: tsHeading10),
                  SizedBox(height: 2.h),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                ],
              ),
              Image.asset(IconConstants.chevronRight, scale: 3),
            ],
          ),
          if (!endSection)
            Divider(
              color: const Color(0xffC8C8C8).withOpacity(0.4),
              height: 20.h,
              thickness: 1.h,
            ),
          if (endSection)
            Divider(
              color: Colors.white,
              height: 20.h,
              thickness: 0,
            ),
        ],
      ),
    );
  }
}

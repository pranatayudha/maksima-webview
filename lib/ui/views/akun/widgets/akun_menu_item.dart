import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../application/app/app.locator.dart';
import '../../../../application/app/constants/custom_color.dart';
import '../../../../application/app/constants/icon_constants.dart';
import '../../../../application/enums/dialog_type.dart';
import '../../../shared/styles.dart';

class AkunMenuItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final String description;
  final String? route;
  final String? productName;
  final Color? productNameColor;
  final Function? onTap;

  final bool? isSwitched;
  final Function(bool)? onSwitch;

  const AkunMenuItem({
    required this.iconPath,
    required this.label,
    required this.description,
    this.route,
    this.productName,
    this.productNameColor,
    this.isSwitched,
    this.onSwitch,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSwitch == null
          ? onTap != null
              ? onTap!()
              : route != null
                  ? locator<NavigationService>().navigateTo(route!)
                  : _showInDevelopmentDialog()
          : null,
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                        height: 24.w,
                        child: Image.asset(iconPath),
                      ),
                      SizedBox(width: 20.8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(label, style: tsBody1),
                          SizedBox(height: 2.h),
                          Row(
                            children: [
                              Text(
                                description,
                                style: tsCaption1,
                              ),
                              Visibility(
                                visible: productName != null,
                                child: Text(
                                  '$productName',
                                  style: tsCaption1.copyWith(
                                    color: productNameColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (onSwitch == null)
                    Image.asset(IconConstants.arrowRight, scale: 3)
                  else
                    CupertinoSwitch(
                      activeColor: CustomColor.secondaryBlue,
                      value: isSwitched!,
                      onChanged: onSwitch,
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
          if (onSwitch == null)
            Container(
              height: 45.h,
              width: double.infinity,
              color: Colors.transparent,
            ),
        ],
      ),
    );
  }

  Future _showInDevelopmentDialog() => locator<DialogService>()
      .showCustomDialog(variant: DialogType.inDevelopment);
}

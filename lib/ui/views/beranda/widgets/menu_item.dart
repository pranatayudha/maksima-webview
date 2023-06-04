import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../application/app/app.locator.dart';
import '../../../../application/enums/dialog_type.dart';
import '../../../shared/styles.dart';
import '../beranda_viewmodel.dart';

class MenuItemRitel extends HookViewModelWidget<BerandaViewModel> {
  final String label;
  final String iconPath;
  final String? route;

  const MenuItemRitel({
    required this.label,
    required this.iconPath,
    this.route,
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    BerandaViewModel viewModel,
  ) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [subtleBoxShadows],
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Material(
            child: Ink(
              child: InkWell(
                onTap: () => route != null
                    ? viewModel.navigateTo(route!)
                    : _showInDevelopmentDialog(),
                child: SizedBox(
                  width: 72.w,
                  height: 72.w,
                  child: Image.asset(
                    iconPath,
                    scale: 3,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          label,
          style: tsHeading12,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Future _showInDevelopmentDialog() => locator<DialogService>()
      .showCustomDialog(variant: DialogType.inDevelopment);
}

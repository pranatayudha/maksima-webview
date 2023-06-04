// ignore_for_file: long-method, newline-before-return, long-parameter-list, prefer-conditional-expressions, unused_element, no_leading_underscores_for_local_identifiers, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../legalitas_usaha_viewmodel.dart';

class LegalitasUsahaHeader
    extends HookViewModelWidget<LegalitasUsahaViewModel> {
  const LegalitasUsahaHeader({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    LegalitasUsahaViewModel viewModel,
  ) {
    final Color _colorOutlineActive =
        CustomColor.primaryOrange.withOpacity(0.2);
    final Color _colorInlineActive = CustomColor.primaryOrange;
    final Color _colorOutline = Colors.white;
    final Color _colorInline = CustomColor.darkGrey;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PopupMenuButton(
            offset: Offset(0, 30.h),
            itemBuilder: (BuildContext context) {
              return ['Alphabetical', 'Created Date']
                  .map<PopupMenuItem<String>>((value) {
                return PopupMenuItem(value: value, child: Text(value));
              }).toList();
            },
            onSelected: (String val) => {},
            child: Row(
              children: [
                const Text(
                  'Alphabetical',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff66788A),
                  ),
                ),
                SizedBox(width: 5.w),
                Image.asset(
                  IconConstants.chevronDown,
                  scale: 5,
                ),
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => viewModel.changeToGridView(),
                child: Container(
                  decoration: BoxDecoration(
                    color: viewModel.isActiveGrid!
                        ? _colorOutlineActive
                        : _colorOutline,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.grid_view_rounded,
                      color: viewModel.isActiveGrid!
                          ? _colorInlineActive
                          : _colorInline,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              GestureDetector(
                onTap: () => viewModel.changeToListView(),
                child: Container(
                  decoration: BoxDecoration(
                    color: viewModel.isActiveList!
                        ? _colorOutlineActive
                        : _colorOutline,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.list,
                      color: viewModel.isActiveList!
                          ? _colorInlineActive
                          : _colorInline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

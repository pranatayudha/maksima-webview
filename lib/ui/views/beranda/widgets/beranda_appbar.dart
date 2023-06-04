import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../application/app/app.locator.dart';
import '../../../../application/app/constants/icon_constants.dart';
import '../../../../application/app/constants/image_constants.dart';
import '../../../../application/enums/dialog_type.dart';
import '../../../../application/models/user.dart';
import '../../../shared/styles.dart';
import '../beranda_viewmodel.dart';

class BerandaAppBar extends HookViewModelWidget<BerandaViewModel> {
  final Function onTap;

  const BerandaAppBar({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    BerandaViewModel viewModel,
  ) {
    final user = viewModel.user!;

    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, statusBarHeight + 17, 16.w, 0),
      child: Column(
        children: [
          Container(
            width: 81.18.w,
            margin: EdgeInsets.only(bottom: 16.w),
            child: Image.asset(ImageConstants.pinangMaximaWhite),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => onTap(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAvatar(viewModel),
                      SizedBox(width: 12.w),
                      _buildNameAndID(context, user),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              Row(
                children: [
                  _buildSearchButton(viewModel),
                  SizedBox(width: 26.w),
                  _buildNotificationButton(viewModel),
                ],
              ),
              SizedBox(width: 5.w),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(BerandaViewModel vm) {
    return Container(
      padding: EdgeInsets.only(top: 5.5.h),
      child: vm.user!.foto != null && vm.user!.foto!.isNotEmpty
          ? CircleAvatar(
              radius: 15.r,
              backgroundImage: MemoryImage(vm.user!.foto!),
            )
          : CircleAvatar(
              radius: 15.r,
              backgroundColor: Colors.transparent,
              child: Image.asset(IconConstants.navAkun),
            ),
    );
  }

  Widget _buildNameAndID(BuildContext context, User user) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                user.userName!,
                style: tsHeading8White,
                overflow: TextOverflow.ellipsis,
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 24.sp,
              ),
            ],
          ),
          Text(
            'ID: ${user.userId}',
            style: tsCaption1White60,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchButton(BerandaViewModel vm) => GestureDetector(
        onTap: () {
          locator<DialogService>()
              .showCustomDialog(variant: DialogType.inDevelopment);
        },
        child: SizedBox(
          width: 17.w,
          height: 17.w,
          child: Image.asset(IconConstants.search),
        ),
      );

  Widget _buildNotificationButton(BerandaViewModel vm) => GestureDetector(
        // ignore: no-empty-block
        onTap: () {},
        child: Stack(
          children: [
            SizedBox(
              width: 18.w,
              height: 18.w,
              child: Image.asset(IconConstants.notification),
            ),
          ],
        ),
      );
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../application/app/constants/image_constants.dart';
import '../../../../../../../../../infrastructure/apis/ritel_master_api.dart';
import '../informasi_pengurus_viewmodel.dart';

class DokumenItem extends HookViewModelWidget<InformasiPengurusViewModel> {
  final String title;
  final String image;
  final bool isLast;

  DokumenItem({
    required this.title,
    required this.image,
    required this.isLast,
    Key? key,
  }) : super(key: key);

  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return FutureBuilder(
      future: _ritelMasterAPI.getPublicFile(image),
      builder: (context, snapshot) {
        String? imageUrl;

        if (image.isNotEmpty) {
          (snapshot.data as Either<String, String>?)?.fold(
            (l) {
              imageUrl = null;
            },
            (r) {
              imageUrl = r;
              if (kDebugMode) print('PUBLIC IMAGE URL : $imageUrl');
            },
          );
        }

        return Column(
          children: [
            SizedBox(height: 12.h),
            Row(
              children: [
                SizedBox(
                  height: 60.h,
                  width: 95.w,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl ?? '',
                    placeholder: (context, url) => Transform.scale(
                      scale: 0.3,
                      child: const CircularProgressIndicator(
                        strokeWidth: 6.0,
                      ),
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      ImageConstants.imageNotFound,
                      scale: 0.8,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: CustomColor.primaryBlack,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    GestureDetector(
                      onTap: imageUrl == null
                          // ignore: no-empty-block
                          ? () {}
                          : () => showDialogImage(context, imageUrl),
                      child: Text(
                        imageUrl == null ? 'Data belum Tersedia ' : 'Lihat',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: imageUrl == null
                              ? const Color(0xffD70C24)
                              : CustomColor.secondaryBlue,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 4.h),
            if (!isLast)
              Divider(
                color: const Color(0xffC8C8C8).withOpacity(0.4),
                thickness: 1.h,
              ),
          ],
        );
      },
    );
  }

  Future showDialogImage(context, image) {
    return showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Center(
            child: Material(
              type: MaterialType.transparency,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  image,
                  scale: 1,
                  errorBuilder: (context, url, error) =>
                      Image.asset(ImageConstants.imageNotFound, scale: 0.2),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

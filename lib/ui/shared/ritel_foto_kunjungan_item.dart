import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../application/app/app.locator.dart';
import '../../application/app/constants/custom_color.dart';
import '../../application/enums/dialog_type.dart';
import 'styles.dart';

class RitelFotoKunjunganItem extends StatelessWidget {
  final String date;
  final String address;
  final String? imageUrl;

  const RitelFotoKunjunganItem(
    this.date,
    this.imageUrl,
    this.address, {
    Key? key,
  }) : super(key: key);

  Future _expandImage(String? foto) async {
    await locator<DialogService>().showCustomDialog(
      variant: DialogType.maksimaImageFileExpand,
      data: {'imageUrl': foto},
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.r),
            child: Container(
              width: 90.w,
              color: Colors.black12,
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: imageUrl != null
                    ? GestureDetector(
                        onTap: () =>
                            imageUrl != null ? _expandImage(imageUrl!) : null,
                        child: Image.network(imageUrl!, fit: BoxFit.cover),
                      )
                    : const AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Center(
                          child: Icon(Icons.image, color: Colors.black26),
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: tsHeading10,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  address,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: CustomColor.primaryBlack.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

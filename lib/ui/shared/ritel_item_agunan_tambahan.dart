import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../application/app/app.locator.dart';
import '../../application/app/constants/icon_constants.dart';
import '../../application/enums/dialog_type.dart';
import '../../application/services/url_launcher_service.dart';
import '../../infrastructure/apis/ritel_master_api.dart';
import 'styles.dart';

class RitelItemAgunanTambahan extends StatelessWidget {
  final String? filePrivate;
  final String label;

  RitelItemAgunanTambahan(
    this.label,
    this.filePrivate, {
    Key? key,
  }) : super(key: key);

  final _ritelMasterAPI = locator<RitelMasterAPI>();

  Future _expandImage(String? foto) async {
    await locator<DialogService>().showCustomDialog(
      variant: DialogType.maksimaImageFileExpand,
      data: {'imageUrl': foto},
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _ritelMasterAPI.getPublicFile(filePrivate ?? ''),
      builder: (context, snapshot) {
        String? file;

        if ((filePrivate ?? '').isNotEmpty) {
          (snapshot.data as Either<String, String>?)?.fold(
            (l) {
              file = null;
            },
            (r) {
              file = r;
              if (kDebugMode) print('PUBLIC IMAGE URL : $file');
            },
          );
        }

        return GestureDetector(
          onTap: () => file.toString().contains('pdf')
              ? locator<URLLauncherService>().browse(file!)
              : (file ?? '').isNotEmpty
                  ? _expandImage(file!)
                  : null,
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: Container(
                    width: 90.w,
                    color:
                        file.toString().contains('pdf') ? null : Colors.black12,
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: file.toString().contains('pdf')
                          ? (file ?? '').isNotEmpty
                              ? Image.asset(
                                  IconConstants.pdf,
                                  scale: 1.5,
                                )
                              : const Center(
                                  child: Icon(
                                    Icons.picture_as_pdf,
                                    color: Colors.black26,
                                  ),
                                )
                          : (file ?? '').isNotEmpty
                              ? Image.network(file!, fit: BoxFit.cover)
                              : const Center(
                                  child: Icon(
                                    Icons.image,
                                    color: Colors.black26,
                                  ),
                                ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    label,
                    style: tsHeading10,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

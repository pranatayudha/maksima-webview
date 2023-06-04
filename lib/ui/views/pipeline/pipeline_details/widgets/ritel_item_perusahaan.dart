import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../application/app/app.locator.dart';
import '../../../../../application/app/constants/custom_color.dart';
import '../../../../../application/app/constants/icon_constants.dart';
import '../../../../../application/enums/dialog_type.dart';
import '../../../../../application/services/url_launcher_service.dart';
import '../../../../../infrastructure/apis/ritel_master_api.dart';
import '../../../../shared/styles.dart';

class RitelItemPerusahaan extends StatelessWidget {
  final String? filePrivate;
  final String label;

  RitelItemPerusahaan(
    this.label,
    this.filePrivate, {
    Key? key,
  }) : super(key: key);

  final RitelMasterAPI _ritelMasterAPI = locator<RitelMasterAPI>();

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

        return Container(
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
                                fit: BoxFit.contain,
                              )
                            : const AspectRatio(
                                aspectRatio: 4 / 3,
                                child: Center(
                                  child: Icon(
                                    Icons.picture_as_pdf,
                                    color: Colors.black26,
                                  ),
                                ),
                              )
                        : (file ?? '').isNotEmpty
                            ? Image.network(file!, fit: BoxFit.cover)
                            : const AspectRatio(
                                aspectRatio: 4 / 3,
                                child: Center(
                                  child:
                                      Icon(Icons.image, color: Colors.black26),
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
                      label,
                      style: tsHeading10,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    GestureDetector(
                      onTap: () {
                        if ((file ?? '').isNotEmpty) {
                          file.toString().contains('pdf')
                              ? locator<URLLauncherService>().browse(file!)
                              : _expandImage(file!);
                        }
                      },
                      child: Text(
                        (file ?? '').isNotEmpty
                            ? 'Lihat'
                            : 'Data Belum Tersedia',
                        style: tsHeading11SecondaryBlue.copyWith(
                          color: (file ?? '').isEmpty
                              ? CustomColor.primaryRed
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

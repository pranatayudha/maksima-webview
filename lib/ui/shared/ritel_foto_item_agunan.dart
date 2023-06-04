import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart' as p;
import 'package:stacked_services/stacked_services.dart';

import '../../application/app/app.locator.dart';
import '../../application/app/constants/icon_constants.dart';
import '../../application/enums/dialog_type.dart';
import '../../application/services/url_launcher_service.dart';
import 'styles.dart';

class RitelFotoItemAgunan extends StatelessWidget {
  final String label;
  final dynamic foto;

  const RitelFotoItemAgunan(
    this.label,
    this.foto, {
    Key? key,
  }) : super(key: key);

  Future _expandImage(String? foto) async {
    await locator<DialogService>().showCustomDialog(
      variant: DialogType.maksimaImageFileExpand,
      data: {'imageUrl': foto},
      barrierDismissible: true,
    );
  }

  String getExtension(String url) {
    try {
      return p.extension(
        url.substring(url.lastIndexOf('/file/'), url.indexOf('?')),
      );
    } catch (e) {
      return '';
    }
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
              child: foto != null
                  ? foto.split('?')[0].split('.').last != 'pdf'
                      ? Image.network(
                          foto,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, trace) => const Center(
                            child: Icon(
                              Icons.image_not_supported,
                            ),
                          ),
                        )
                      : Image.asset(
                          IconConstants.pdf,
                          scale: 1.5,
                        )
                  : Image.asset(
                      IconConstants.pdf,
                      scale: 1.5,
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
                  onTap: (foto != null && (foto?.isNotEmpty ?? false))
                      ? getExtension(foto!) != '.pdf'
                          ? () => _expandImage(foto!)
                          : () => locator<URLLauncherService>().browse(
                                foto!,
                              )
                      : null,
                  child: Text(
                    foto != null ? 'Lihat' : '',
                    style: tsHeading11SecondaryBlue,
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

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart' as p;
import 'package:stacked_services/stacked_services.dart';

import '../../application/app/app.locator.dart';
import '../../application/app/constants/custom_color.dart';
import '../../application/app/constants/icon_constants.dart';
import '../../application/enums/dialog_type.dart';
import '../../application/services/url_launcher_service.dart';
import 'styles.dart';

class UploadItemButtonRitel extends StatelessWidget {
  final String? imageUrl;
  final String label;
  final Function onPressed;
  final String? errorText;
  final double? fontSize;
  final bool? isLoading;
  final bool? enabled;

  const UploadItemButtonRitel({
    required this.imageUrl,
    required this.label,
    required this.onPressed,
    required this.errorText,
    this.fontSize = 16,
    this.isLoading = false,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  Future _expandImage(String imageUrl) async {
    await locator<DialogService>().showCustomDialog(
      variant: DialogType.maksimaImageFileExpand,
      data: {'imageUrl': imageUrl},
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: 46.8.w,
                      height: 35.1.w,
                      color: imageUrl != null && !isLoading!
                          ? getExtension(imageUrl!) == '.pdf'
                              ? Colors.transparent
                              : Colors.black12
                          : Colors.black12,
                      child: imageUrl != null && !isLoading!
                          ? (getExtension(imageUrl!) == '.pdf'
                              ? GestureDetector(
                                  onTap: () =>
                                      locator<URLLauncherService>().browse(
                                    imageUrl!,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      IconConstants.pdf,
                                      scale: 1.5,
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () => _expandImage(imageUrl!),
                                  child: Image.network(
                                    imageUrl!,
                                    fit: BoxFit.cover,
                                  ),
                                ))
                          : const Center(
                              child: Icon(Icons.image, color: Colors.black26),
                            ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: AutoSizeText(
                      label,
                      maxFontSize: 14,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.primaryBlack,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 15.w),
            if (imageUrl == null)
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color.fromRGBO(11, 120, 237, 0.1),
                  side: const BorderSide(
                    color: Color.fromRGBO(72, 158, 251, 0.4),
                  ),
                ),
                onPressed: () => onPressed(),
                child: Text('Upload', style: tsBody5PrimaryColor),
              )
            else if (isLoading!)
              SizedBox(
                height: 20.h,
                width: 25.w,
                child: const CircularProgressIndicator(),
              )
            else if (enabled!)
              IconButton(
                icon: const Icon(Icons.clear),
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () => onPressed(),
              ),
          ],
        ),
        if (errorText != null)
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Text(
              errorText!,
              style: TextStyle(
                color: Theme.of(context).errorColor,
                fontSize: 12.sp,
              ),
            ),
          ),
        Divider(
          color: const Color(0xffC8C8C8).withOpacity(0.4),
          height: 20.h,
          thickness: 1.h,
        ),
      ],
    );
  }
}

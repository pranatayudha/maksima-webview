import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../application/app/app.locator.dart';
import '../../application/app/constants/icon_constants.dart';
import '../../application/enums/dialog_type.dart';
import 'styles.dart';

class UploadItemButtonNew extends StatelessWidget {
  final File? imageFile;
  final String label;
  final Function onPressed;
  final String? errorText;
  final double? fontSize;

  const UploadItemButtonNew({
    required this.imageFile,
    required this.label,
    required this.onPressed,
    required this.errorText,
    this.fontSize = 16,
    Key? key,
  }) : super(key: key);

  Future _expandImage(File imageFile) async {
    await locator<DialogService>().showCustomDialog(
      variant: DialogType.imageFileExpand,
      data: {'imageFile': imageFile},
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (imageFile == null)
          InkWell(
            onTap: () {
              onPressed();
            },
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(8.r),
              color: const Color(0xff99A0AF),
              dashPattern: const [8, 8],
              strokeWidth: 1.5,
              child: Card(
                color: const Color(0xffF8F9FA),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        IconConstants.upload,
                        scale: 4,
                        color: Colors.black,
                      ),
                      SizedBox(width: 11.w),
                      Text(
                        'Tambah Foto',
                        style: TextStyle(fontSize: 14.sp, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        else
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
                        color: Colors.black12,
                        child: imageFile != null
                            ? GestureDetector(
                                onTap: () => _expandImage(imageFile!),
                                child:
                                    Image.file(imageFile!, fit: BoxFit.cover),
                              )
                            : const Center(
                                child: Icon(Icons.image, color: Colors.black26),
                              ),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(label, style: tsHeading10),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15.w),
              if (imageFile == null)
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
              else
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
        SizedBox(height: 16.h),

        // Divider(
        //   color: const Color(0xffC8C8C8).withOpacity(0.4),
        //   height: 20.h,
        //   thickness: 1.h,
        // ),
      ],
    );
  }
}

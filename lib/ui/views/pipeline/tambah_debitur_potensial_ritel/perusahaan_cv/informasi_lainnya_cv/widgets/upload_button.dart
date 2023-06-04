import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart' as p;

import '../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../shared/styles.dart';

class UploadButton extends StatelessWidget {
  final String? urlPrivate;
  final String? urlPublic;
  final String label;
  final Function onPressed;
  final String? errorText;

  const UploadButton({
    required this.urlPrivate,
    required this.urlPublic,
    required this.label,
    required this.onPressed,
    required this.errorText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (urlPrivate == null || urlPrivate == '')
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
                      child: SizedBox(
                        width: 46.8.w,
                        height: 35.1.w,
                        child: urlPrivate != null
                            ? (p.extension(urlPrivate!) == '.jpg' ||
                                    p.extension(urlPrivate!) == '.png' ||
                                    p.extension(urlPrivate!) == '.jpeg')
                                ? Image.network(
                                    urlPublic ?? '',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, child, trace) {
                                      return const Center(
                                        child: Icon(
                                          Icons.image,
                                          color: Colors.black26,
                                        ),
                                      );
                                    },
                                  )
                                : Image.asset(IconConstants.pdf)
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
      ],
    );
  }
}

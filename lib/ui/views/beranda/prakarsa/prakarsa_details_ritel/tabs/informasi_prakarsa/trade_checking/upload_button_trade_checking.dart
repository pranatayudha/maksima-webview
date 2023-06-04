

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../shared/styles.dart';

class UploadButtonTradeChecking extends StatelessWidget {
  final PlatformFile? fileTradeChecking;
  final String nameFile;

  final Function onPressed;
  final String? errorText;
  final double? fontSize;
  final bool? isLoading;

  const UploadButtonTradeChecking({
    required this.fileTradeChecking,
    required this.nameFile,
    required this.onPressed,
    required this.errorText,
    this.fontSize = 16,
    this.isLoading = false,
    Key? key,
  }) : super(key: key);

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
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        fileTradeChecking == null ? 'Trade Checking' : nameFile,
                        style: tsHeading10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 15.w),
            if (fileTradeChecking == null)
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
      ],
    );
  }
}

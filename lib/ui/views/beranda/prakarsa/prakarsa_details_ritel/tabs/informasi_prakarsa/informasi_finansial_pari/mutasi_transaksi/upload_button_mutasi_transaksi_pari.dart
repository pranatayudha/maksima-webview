import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../shared/styles.dart';

class UploadButtonMutasiTransaksiPari extends StatelessWidget {
  final File? fileMutasiTransaksiPari;

  // final String label;
  final String nameFile;

  final Function onPressed;
  final String? errorText;
  final double? fontSize;
  final bool? isLoading;

  const UploadButtonMutasiTransaksiPari({
    required this.fileMutasiTransaksiPari,
    // required this.label,
    required this.nameFile,
    required this.onPressed,
    required this.errorText,
    this.fontSize = 16,
    this.isLoading = false,
    Key? key,
  }) : super(key: key);

  // Future _expandImage(File imageFile) async {
  //   await locator<DialogService>().showCustomDialog(
  //     variant: DialogType.imageFileExpand,
  //     data: {'imageFile': imageFile},
  //     barrierDismissible: true,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(label, style: tsHeading10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(5),
                  //   child: Container(
                  //     width: 46.8.w,
                  //     height: 35.1.w,
                  //     color: Colors.black12,
                  //     child: imageFile != null && !isLoading!
                  //         ? GestureDetector(
                  //             onTap: () => _expandImage(imageFile!),
                  //             child: Image.file(imageFile!, fit: BoxFit.cover))
                  //         : const Center(
                  //             child: Icon(Icons.image, color: Colors.black26),
                  //           ),
                  //   ),
                  // ),
                  // SizedBox(width: 15.w),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        fileMutasiTransaksiPari == null
                            ? 'Mutasi Transaksi'
                            : nameFile,
                        style: tsHeading10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 15.w),
            if (fileMutasiTransaksiPari == null)
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
        // Divider(
        //   color: const Color(0xffC8C8C8).withOpacity(0.4),
        //   height: 20.h,
        //   thickness: 1.h,
        // ),
      ],
    );
  }
}

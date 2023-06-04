import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../application/app/app.locator.dart';
import '../../application/enums/dialog_type.dart';
import 'styles.dart';

class FotoItem extends StatelessWidget {
  final String label;
  final Uint8List? foto;

  const FotoItem(
    this.label,
    this.foto, {
    Key? key,
  }) : super(key: key);

  Future _expandImage(Uint8List foto) async {
    await locator<DialogService>().showCustomDialog(
      variant: DialogType.uInt8ListExpand,
      data: {'image': foto},
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
                child: foto != null
                    ? Image.memory(foto!, fit: BoxFit.cover)
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
                  label,
                  style: tsHeading10,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                GestureDetector(
                  onTap: () => foto != null ? _expandImage(foto!) : null,
                  child: Text('Lihat', style: tsHeading11SecondaryBlue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

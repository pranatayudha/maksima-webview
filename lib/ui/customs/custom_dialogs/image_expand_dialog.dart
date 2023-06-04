import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

class ImageExpandDialog extends StatelessWidget {
  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  const ImageExpandDialog({
    this.request,
    this.completer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Image.file(
        request!.data['imageFile'] as File,
        fit: BoxFit.cover,
      ),
    );
  }
}

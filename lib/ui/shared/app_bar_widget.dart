import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'styles.dart';

class AppBarWidget extends AppBar {
  AppBarWidget.titleWithBackButton({
    Key? key,
    required String title,
    required Function onBackButtonTapped,
    Color? color,
  }) : super(
          key: key,
          elevation: 0,
          backgroundColor: color ?? Colors.white,
          title: Text(title, style: tsHeading6),
          centerTitle: true,
          leading: Container(
            padding: EdgeInsets.zero,
            width: 30.w,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: const Color(0xff606060),
                size: 24.sp,
              ),
              onPressed: () => onBackButtonTapped(),
            ),
          ),
        );
}

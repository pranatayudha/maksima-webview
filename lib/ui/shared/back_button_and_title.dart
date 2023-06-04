import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'styles.dart';

class BackButtonAndTitle extends StatelessWidget {
  final String title;
  final bool centerTitle;
  final IconData? iconData;
  final Function? onPressed;

  const BackButtonAndTitle(
    this.title, {
    this.centerTitle = false,
    this.iconData = Icons.arrow_back,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.w, 0, 20.w, 0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.zero,
            width: 30.w,
            child: IconButton(
              icon: Icon(
                iconData,
                color: const Color(0xff606060),
              ),
              onPressed: onPressed != null
                  ? () => onPressed!()
                  : () => Navigator.pop(context),
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: centerTitle ? 30.w : 0),
              child: Text(
                title,
                style: tsHeading6,
                textAlign: centerTitle ? TextAlign.center : TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

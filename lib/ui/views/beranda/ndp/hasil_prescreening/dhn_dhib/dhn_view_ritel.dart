// ignore_for_file: library_private_types_in_public_api

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../application/app/constants/image_constants.dart';
import '../../../../../shared/network_sensitive.dart';
import '../../../../../shared/styles.dart';

class DHNViewRitel extends StatefulWidget {
  final String? prescreening;
  final String? name;

  const DHNViewRitel({Key? key, this.prescreening, this.name})
      : super(key: key);

  @override
  _DHNViewRitelState createState() => _DHNViewRitelState();
}

class _DHNViewRitelState extends State<DHNViewRitel> {
  @override
  Widget build(BuildContext context) {
    return NetworkSensitive(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Detail Pre-Screening - DHN',
            style: tsHeading6,
          ),
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.prescreening == 'Lolos'
                    ? Image.asset(ImageConstants.dhnSuccess, scale: 2.5)
                    : Image.asset(ImageConstants.dhnDitolak, scale: 2.5),
                SizedBox(height: 16.h),
                AutoSizeText(
                  widget.prescreening == 'Lolos'
                      ? '${widget.name} tidak termasuk dalam kategori DHN'
                      : '${widget.name} termasuk dalam data DHN',
                  style: tsHeading8,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application/app/constants/image_constants.dart';

class ServerMaintenance extends StatelessWidget {
  const ServerMaintenance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(ImageConstants.serverMaintenance),
              SizedBox(height: 55.h),
              Text(
                'Server Maintenance',
                style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 14.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  'Pinang Mikro sedang dalam pemeliharaan sistem, kami akan segera kembali sesaat lagi.',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xff2A2929),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

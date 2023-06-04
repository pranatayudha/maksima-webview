// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../application/app/app.locator.dart';
import '../../../application/services/local_db_service.dart';

class FeedbackSuccessDialog extends StatefulWidget {
  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  const FeedbackSuccessDialog({
    this.request,
    this.completer,
    Key? key,
  }) : super(key: key);

  @override
  _FeedbackSuccessDialogState createState() => _FeedbackSuccessDialogState();
}

class _FeedbackSuccessDialogState extends State<FeedbackSuccessDialog> {
  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();

  @override
  Widget build(BuildContext context) {
    final userName = _localDBService.getUser()!.userName;

    return Dialog(
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 22.h,
              vertical: 80.w,
            ),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Terima kasih ',
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 16.sp,
                  letterSpacing: 0.29.w,
                  height: 1.5.h,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text:
                        ', kritik dan saran Anda dapat membantu kami untuk menjadi lebih baik.',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10.h,
            right: 10.w,
            child: GestureDetector(
              onTap: () => widget.completer!(DialogResponse(confirmed: false)),
              child: ClipOval(
                child: Container(
                  height: 23.56.h,
                  width: 23.56.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black87),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.clear,
                      size: 20.sp,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../application/app/app.locator.dart';
import '../../../../application/app/app.router.dart';
import '../../../../application/app/constants/custom_color.dart';
import '../../../../application/app/constants/image_constants.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/styles.dart';

class PipelineSuccessViewRitel extends StatelessWidget {
  final String? pipelineId;
  final String? debiturName;
  final int? codeTable;

  const PipelineSuccessViewRitel({
    Key? key,
    this.pipelineId,
    this.debiturName,
    this.codeTable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.successBg),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(ImageConstants.success, scale: 3),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Berhasil', style: tsHeading3),
                        SizedBox(height: 16.h),
                        AutoSizeText.rich(
                          TextSpan(
                            text: 'Debitur dengan nama ',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: CustomColor.primaryBlack,
                              height: 1.3.h,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '$debiturName ',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: CustomColor.primaryBlack,
                                  height: 1.3.h,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'telah berhasil ditambahkan ke pipeline dan sedang di pre screening. Cek status pengajuan pada menu Debitur Dalam Proses secara berkala.',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: CustomColor.primaryBlack,
                                  height: 1.3.h,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 4,
                        ),
                      ],
                    ),
                  ),
                ),
                _buildButtonOk(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonOk() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 32),
        child: CustomButton(
          label: 'OK',
          isBusy: false,
          onPressed: () =>
              locator<NavigationService>().clearStackAndShow(Routes.mainView),
        ),
      ),
    );
  }
}

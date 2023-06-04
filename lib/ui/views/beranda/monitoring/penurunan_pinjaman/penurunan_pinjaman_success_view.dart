import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../application/app/app.locator.dart';
import '../../../../../application/app/app.router.dart';
import '../../../../../application/app/constants/custom_color.dart';
import '../../../../../application/app/constants/image_constants.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/styles.dart';

class PenurunanPinjamanSuccessView extends StatelessWidget {
  final Map<String, dynamic> disburseData;

  const PenurunanPinjamanSuccessView({
    Key? key,
    required this.disburseData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###', 'id_ID');

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
                  flex: 3,
                  child: Image.asset(ImageConstants.success, scale: 3),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Penurunan Berhasil', style: tsHeading3),
                        SizedBox(height: 16.h),
                        AutoSizeText.rich(
                          TextSpan(
                            text: 'Penurunan Pinjaman atas nama ',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: CustomColor.primaryBlack,
                              height: 1.3.h,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${disburseData['namaDebitur']} ',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: CustomColor.primaryBlack,
                                  height: 1.3.h,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'sebesar ',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: CustomColor.primaryBlack,
                                  height: 1.3.h,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "Rp. ${formatter.format(int.parse(disburseData['nominalPinjaman']))} ",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: CustomColor.primaryBlack,
                                  height: 1.3.h,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'ke Rekening Pinjaman RAYA ',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: CustomColor.primaryBlack,
                                  height: 1.3.h,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "${disburseData['sumberRekeningPinjaman']} ",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: CustomColor.primaryBlack,
                                  height: 1.3.h,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'berhasil dilakukan dan rekening berhasil ditutup.',
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
          onPressed: () => locator<NavigationService>().navigateTo(
            Routes.monitoringDetailView,
            arguments: MonitoringDetailViewArguments(
              idKelolaan: disburseData['idKelolaan'],
              loanType: disburseData['loanType'],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../application/models/ritel_prakarsa.dart';
import '../prakarsa_viewmodel_ritel.dart';

final formatter = NumberFormat('#,###', 'id_ID');

class PrakarsaCardRitel extends StatelessWidget {
  final Function onPressed;
  final RitelPrakarsa ritelPrakarsa;

  const PrakarsaCardRitel({
    required this.onPressed,
    Key? key,
    required this.ritelPrakarsa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loadingIndicatorPrakarsaListItem.prakarsaId ==
            ritelPrakarsa.prakarsaId
        ? const LinearProgressIndicator()
        : Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: TextButton(
              onPressed: () => onPressed(),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(bottom: 15),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        width: 56.w,
                        height: 56.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: const Color(0xffE6EEF5),
                        ),
                        transform: Matrix4.translationValues(0.0, 15.0, 15.0),
                        child: Center(
                          child: Text(
                            ritelPrakarsa.initial!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 44.w,
                        height: 20.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1,
                              spreadRadius: 0.0001,
                              offset: Offset(0.0, 1.0),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            ritelPrakarsa.loan_typesId == 1 ? 'PTR' : 'PARI',
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff03213E),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Text(
                        ritelPrakarsa.titlePipeline!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xff03213e),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (ritelPrakarsa.loanAmount != null)
                        Text(
                          'Rp. ${formatter.format(int.parse(double.parse(ritelPrakarsa.loanAmount!).toStringAsFixed(0)))} - ${ritelPrakarsa.typePipeline!}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xff66788a),
                          ),
                        )
                      else
                        Text(
                          'Rp. 0 - ${ritelPrakarsa.typePipeline!}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xff66788a),
                          ),
                        ),
                      SizedBox(height: 6.h),
                      if (ritelPrakarsa.statusPrakarsa ==
                          'Lengkapi Informasi Prakarsa')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFEF5EE),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Lengkapi Informasi Prakarsa',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffF07126),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa ==
                          'Prakarsa Ditolak')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Prakarsa Ditolak',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa ==
                          'Offering Letter Ditolak')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Offering Letter Ditolak',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa ==
                          'Siap Dikirim ke Checker')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffEBF8F6),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Siap Dikirim ke Checker',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff38BAA7),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Revisi ADK - 1')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi ADK - 1',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Revisi ADK - 2')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi ADK - 2',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Revisi ADK - 3')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi ADK - 3',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Revisi ADK - 4')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi ADK - 4',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Revisi ADK - 5')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi ADK - 5',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Revisi ADK - 6')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi ADK - 6',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Revisi ADK - 7')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi ADK - 7',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Revisi ADK - 8')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi ADK - 8',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Revisi ADK - 9')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi ADK - 9',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa ==
                          'Revisi ADK - 10')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi ADK - 10',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Revisi CBL - 1')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi CBL - 1',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Revisi CBL - 2')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi CBL - 2',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Revisi CBL - 3')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi CBL - 3',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Revisi CBL - 4')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi CBL - 4',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Revisi CBL - 5')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi CBL - 5',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Revisi CBL - 6')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi CBL - 6',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Revisi CBL - 7')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi CBL - 7',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Revisi CBL - 8')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi CBL - 8',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Revisi CBL - 9')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi CBL - 9',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa ==
                          'Revisi CBL - 10')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi CBL - 10',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa ==
                          'Revisi Pemutus Pusat - 1')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi Pemutus Pusat - 1',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa ==
                          'Revisi Pemutus Pusat - 2')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi Pemutus Pusat - 2',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa ==
                          'Revisi Pemutus Pusat - 3')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi Pemutus Pusat - 3',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa ==
                          'Revisi Pemutus Pusat - 4')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi Pemutus Pusat - 4',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa ==
                          'Revisi Pemutus Pusat - 5')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi Pemutus Pusat - 5',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa ==
                          'Revisi Pemutus Pusat - 6')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi Pemutus Pusat - 6',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa ==
                          'Revisi Pemutus Pusat - 7')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi Pemutus Pusat - 7',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa ==
                          'Revisi Pemutus Pusat - 8')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi Pemutus Pusat - 8',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa ==
                          'Revisi Pemutus Pusat - 9')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi Pemutus Pusat - 9',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa ==
                          'Revisi Pemutus Pusat - 10')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFBE7E9),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Revisi Pemutus Pusat - 10',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD70C24),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Verifikasi ADK')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFFFAE6),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Verifikasi ADK',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffF49300),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Verifikasi CBL')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFFFAE6),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Verifikasi CBL',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffF49300),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa ==
                          'Menunggu Putusan')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFFFAE6),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Menunggu Putusan',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffF49300),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa ==
                          'Putusan Kredit oleh Kadiv')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFFFAE6),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Putusan Kredit oleh Kadiv',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffF49300),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa ==
                          'Offering Debitur')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFFFAE6),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Offering Debitur',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffF49300),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPrakarsa.statusPrakarsa == 'Akad Kredit')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffEBF8F6),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Akad Kredit',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff38BAA7),
                              ),
                            ),
                          ),
                        )
                      else
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffEBF8F6),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              'Pembuatan Fasilitas',
                              maxFontSize: 10,
                              minFontSize: 8,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff38BAA7),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}

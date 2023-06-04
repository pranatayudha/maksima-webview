// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../application/models/ritel_pipelines.dart';
import '../pipeline_viewmodel_ritel.dart';

final formatter = NumberFormat('#,###', 'id_ID');

class PipelineCardRitel extends StatelessWidget {
  final Function onPressed;
  final RitelPipelines ritelPipelines;

  const PipelineCardRitel({
    required this.onPressed,
    Key? key,
    required this.ritelPipelines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loadingIndicatorPipelineListItem.pipelinesId ==
            ritelPipelines.pipelinesId
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
                            ritelPipelines.initial!,
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
                            ritelPipelines.loan_typesId == 1 ? 'PTR' : 'PARI',
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
                        ritelPipelines.titlePipeline!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xff03213e),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (ritelPipelines.loanAmount != null)
                        Text(
                          'Rp. ${formatter.format(int.parse(double.parse(ritelPipelines.loanAmount!).toStringAsFixed(0)))} - ${ritelPipelines.typePipeline!}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xff66788a),
                          ),
                        )
                      else
                        Text(
                          'Rp. 0 - ${ritelPipelines.typePipeline!}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xff66788a),
                          ),
                        ),
                      SizedBox(height: 6.h),
                      if (ritelPipelines.statusScreening ==
                          'Data Belum Lengkap')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFEF5EE),
                          ),
                          child: const Center(
                            child: Text(
                              'Data belum lengkap',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffF07126),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPipelines.statusScreening ==
                          'Belum Pre-Screening')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFEF5EE),
                          ),
                          child: const Center(
                            child: Text(
                              'Belum pre-screening',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffF07126),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPipelines.statusScreening ==
                          'Sedang Pre-Screening')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffFEF5EE),
                          ),
                          child: const Center(
                            child: Text(
                              'Sedang pre-screening',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffF07126),
                              ),
                            ),
                          ),
                        )
                      else if (ritelPipelines.statusScreening ==
                          'Pre-Screening Selesai')
                        Container(
                          width: 108.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xffEBF8F6),
                          ),
                          child: const Center(
                            child: Text(
                              'Pre-screening selesai',
                              style: TextStyle(
                                fontSize: 10,
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
                            color: const Color(0xffFFFAE6),
                          ),
                          child: const Center(
                            child: Text(
                              'Pre-screening gagal',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffF49300),
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

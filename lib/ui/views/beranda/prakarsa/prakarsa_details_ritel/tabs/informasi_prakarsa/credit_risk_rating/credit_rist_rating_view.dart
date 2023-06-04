import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../shared/amount_box.dart';
import '../../../../../../../shared/network_sensitive.dart';
import 'credit_rist_rating_viewmodel.dart';

class CreditRistRating extends StatefulWidget {
  final String prakarsaId;
  final String pipelineId;
  final int codeTable;
  final int loanTypesId;

  const CreditRistRating({
    required this.prakarsaId,
    required this.codeTable,
    required this.loanTypesId,
    required this.pipelineId,
    Key? key,
  }) : super(key: key);

  @override
  State<CreditRistRating> createState() => _CreditRistRatingState();
}

class _CreditRistRatingState extends State<CreditRistRating> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreditRistRatingViewModel>.reactive(
      viewModelBuilder: () => CreditRistRatingViewModel(
        prakarsaId: widget.prakarsaId,
        codeTable: widget.codeTable,
        pipelineId: widget.pipelineId,
        loanTypesId: widget.loanTypesId,
      ),
      builder: (context, vm, child) {
        // ignore: newline-before-return
        return vm.isBusy
            ? Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue[50],
                  ),
                ),
              )
            : mainview(vm);
      },
    );
  }

  NetworkSensitive mainview(CreditRistRatingViewModel vm) {
    final data = vm.detailCRRPrakarsa.data!;

    return NetworkSensitive(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Credit Risk Rating',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20.w, 12.h, 24.w, 16.h),
                color: Colors.white,
                child: Text(
                  'Berikut adalah hasil dari Credit Risk Rating yang telah dilakukan untuk debitur:',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.fromLTRB(64.w, 20.h, 64.w, 20.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: Colors.white,
                ),
                child: Text(
                  data.name!,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.symmetric(vertical: 24.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Credit Risk Rating',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: Color(0xff66788A),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        data.creditRiskRating.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 32.sp,
                          color: data.creditRiskRating! > 650
                              ? Color(0xff11A38E)
                              : Color(0xffD70C24),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        data.creditRiskLabel!,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: Color(0xff03213E),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: data.creditRiskRating! > 650
                                ? Color(0xff1BB0DF)
                                : Color(0xffD70C24),
                            spreadRadius: 1.0,
                          ),
                        ],
                        color: data.creditRiskRating! > 650
                            ? Color(0xffE8F7FC)
                            : Color(0xffFBE7E9),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            data.creditRiskInfo!,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Hasil Credit Risk Rating',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                      ),
                    ),
                    AmountBox(
                      label: 'Aspek Finansial',
                      amount: data.creditRisk!.financial,
                      isRupiah: false,
                    ),
                    AmountBox(
                      label: 'Aspek Non Finansial',
                      amount: data.creditRisk!.nonFinancial,
                      isRupiah: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

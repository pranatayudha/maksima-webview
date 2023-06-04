import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../application/models/ritel_trade_checking.dart';
import '../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../shared/styles.dart';
import '../../../../../../../shared/thick_light_grey_divider.dart';
import 'widget/ritel_file_item_trade_checking.dart';

class TradeCheckingDetails extends StatelessWidget {
  final RitelTradeChecking ritelTradeChecking;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;

  const TradeCheckingDetails({
    Key? key,
    required this.ritelTradeChecking,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NetworkSensitive(
      child: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'Trade Checking',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            actions: [
              if (status <= 2)
                Container(
                  margin: EdgeInsets.only(right: 15.w),
                  padding: EdgeInsets.zero,
                  width: 33.w,
                  child: IconButton(
                    icon: Image.asset(IconConstants.edit),
                    onPressed: () => locator<NavigationService>().navigateTo(
                      Routes.tradeCheckingView,
                      arguments: TradeCheckingViewArguments(
                        prakarsaId: ritelTradeChecking.prakarsaId!,
                        pipelineId: pipelineId,
                        loanTypesId: loanTypesId,
                        status: status,
                        codeTable: codeTable,
                      ),
                    ),
                  ),
                ),
            ],
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 24.sp,
              ),
              onPressed: () => locator<NavigationService>().navigateTo(
                Routes.prakarsaDetailsViewRitel,
                arguments: PrakarsaDetailsViewRitelArguments(
                  index: 1,
                  prakarsaId: ritelTradeChecking.prakarsaId!,
                  pipelineId: pipelineId,
                  loanTypesId: loanTypesId,
                  codeTable: codeTable,
                ),
              ),
            ),
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
                    child: RitelFileItemTradeChecking(
                      file: ritelTradeChecking.pathUploadExcel!,
                      title: ritelTradeChecking.fileName!,
                    ),
                  ),
                  const ThickLightGreyDivider(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.w),
                    child: Text(
                      'Summary Trade Checking',
                      style: tsHeading8,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 8.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hasil Trade Checking:',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xff828896),
                          ),
                        ),
                        Expanded(
                          child: AutoSizeText(
                            ritelTradeChecking.summary!,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff162B3A),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xffCDD3D8)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        children: List.generate(
                          ritelTradeChecking.detailSupplier!.length,
                          (index) => Padding(
                            padding: EdgeInsets.fromLTRB(12.w, 0.h, 12.w, 0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  child: Text(
                                    'Supplier ${index + 1}',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xff828896),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                _buildTitleAndSubtitle(
                                  'Nama Supplier',
                                  ritelTradeChecking
                                      .detailSupplier![index].name!,
                                ),
                                SizedBox(height: 8.h),
                                _buildTitleAndSubtitle(
                                  'Alamat Supplier',
                                  ritelTradeChecking
                                      .detailSupplier![index].addresses!,
                                ),
                                SizedBox(height: 8.h),
                                _buildTitleAndSubtitle(
                                  'No. Handphone',
                                  ritelTradeChecking
                                      .detailSupplier![index].phoneNum!,
                                ),
                                SizedBox(height: 8.h),
                                _buildTitleAndSubtitle(
                                  'Lama Bekerja',
                                  ritelTradeChecking
                                      .detailSupplier![index].lamaBekerja!,
                                ),
                                SizedBox(height: 8.h),
                                if (index + 1 !=
                                    ritelTradeChecking.detailSupplier!.length)
                                  const Divider(thickness: 1.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xffCDD3D8)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        children: List.generate(
                          ritelTradeChecking.detailBuyer!.length,
                          (index) => Padding(
                            padding: EdgeInsets.fromLTRB(12.w, 0.h, 12.w, 0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  child: Text(
                                    'Buyer ${index + 1}',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xff828896),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                _buildTitleAndSubtitle(
                                  'Nama Buyer',
                                  ritelTradeChecking.detailBuyer![index].name!,
                                ),
                                SizedBox(height: 8.h),
                                _buildTitleAndSubtitle(
                                  'Alamat Buyer',
                                  ritelTradeChecking
                                      .detailBuyer![index].addresses!,
                                ),
                                SizedBox(height: 8.h),
                                _buildTitleAndSubtitle(
                                  'No. Handphone',
                                  ritelTradeChecking
                                      .detailBuyer![index].phoneNum!,
                                ),
                                SizedBox(height: 8.h),
                                _buildTitleAndSubtitle(
                                  'Lama Bekerja',
                                  ritelTradeChecking
                                      .detailBuyer![index].lamaBekerja!,
                                ),
                                SizedBox(height: 8.h),
                                if (index + 1 !=
                                    ritelTradeChecking.detailBuyer!.length)
                                  const Divider(thickness: 1.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildTitleAndSubtitle(
    String title,
    String subtitle, {
    Color color = const Color(0xff162B3A),
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            color: const Color(0xff828896),
          ),
        ),
        Expanded(
          child: AutoSizeText(
            subtitle,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

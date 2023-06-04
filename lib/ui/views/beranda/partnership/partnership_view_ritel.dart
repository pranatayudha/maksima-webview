import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../application/app/constants/custom_color.dart';
import '../../../../application/app/constants/image_constants.dart';
import '../../../../application/models/monitoring_pinjaman_detail.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_linear_progress_indicator.dart';
import '../../../shared/dotted_border_button.dart';
import '../../../shared/network_sensitive.dart';
import '../../../shared/styles.dart';
import '../../../shared/thick_light_grey_divider.dart';
import 'partnership_viewmodel_ritel.dart';

class PartnershipViewRitel extends StatefulWidget {
  final String? idKelolaan;
  final String? idPartner;
  final MonitoringPinjamanDetail? pinjamanDetail;
  final int? counter;
  final String? status;
  final int? loanType;

  const PartnershipViewRitel({
    Key? key,
    this.idKelolaan,
    this.idPartner,
    this.pinjamanDetail,
    this.counter,
    this.status,
    this.loanType,
  }) : super(key: key);

  @override
  State<PartnershipViewRitel> createState() => _PartnershipViewRitelState();
}

class _PartnershipViewRitelState extends State<PartnershipViewRitel> {
  int idPartner = 0;

  @override
  void initState() {
    setState(() {
      idPartner = int.parse(widget.idPartner ?? '0');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PartnershipViewModelRitel>.reactive(
      viewModelBuilder: () => PartnershipViewModelRitel(
        idKelolaan: widget.idKelolaan,
        pinjamanDetail: widget.pinjamanDetail,
        counter: widget.counter,
        status: widget.status,
        loanType: widget.loanType,
      ),
      builder: (context, viewModel, child) {
        return NetworkSensitive(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                'Pilih Partner',
                style: tsHeading6,
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              centerTitle: true,
              leadingWidth: 30.w,
              leading: Container(
                margin: EdgeInsets.only(left: 5.w),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: const Color(0xff606060),
                    size: 24.sp,
                  ),
                  onPressed: viewModel.navigateToKonfirmasiPartner,
                ),
              ),
            ),
            body: Container(
              color: Colors.white,
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.w, 0, 20.w, 16.h),
                      child: Text(
                        'Pilih Partner yang tersedia atau tambah Partner untuk melakukan pencairan',
                        style: tsDescription14,
                      ),
                    ),
                    const ThickLightGreyDivider(),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 24.w,
                        right: 16.h,
                        left: 16.h,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'DAFTAR PARTNER',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: CustomColor.primaryBlack40,
                              letterSpacing: 0.5.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (viewModel.isBusy)
                      const CustomLinearProgressIndicator(
                        paddingHorizontal: 0,
                      )
                    else if (viewModel.partners.isEmpty)
                      Padding(
                        padding: EdgeInsets.only(
                          top: 24.w,
                          right: 16.h,
                          left: 16.h,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 24.h),
                            Image.asset(
                              ImageConstants.pipelineEmpty,
                              scale: 3,
                            ),
                            SizedBox(height: 36.w),
                            Text(
                              'Belum ada data Partnership. Tambah Partbership untuk melanjutkan proses pencairan',
                              style: tsBody6,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 60.w),
                          ],
                        ),
                      )
                    else
                      Expanded(
                        child: ListView(
                          children: List.generate(
                            viewModel.partners.length,
                            (index) => InkWell(
                              onTap: () => setState(
                                () => idPartner =
                                    viewModel.partners[index].partnerId!,
                              ),
                              child: Container(
                                padding: EdgeInsets.only(
                                  right: 8.h,
                                  left: 8.h,
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Radio<int>(
                                          // ignore: unnecessary_cast
                                          value: viewModel.partners[index]
                                              .partnerId! as int,
                                          groupValue: idPartner,
                                          onChanged: (flag) {
                                            setState(
                                              // ignore: unnecessary_cast
                                              () => idPartner = viewModel
                                                  .partners[index]
                                                  .partnerId! as int,
                                            );
                                          },
                                          activeColor:
                                              CustomColor.primaryOrange,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              viewModel.partners[index]
                                                      .partnerName ??
                                                  '-',
                                              textAlign: TextAlign.start,
                                              style: tsHeading10,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: CustomColor.darkGrey,
                                                ),
                                                children: [
                                                  const TextSpan(text: 'PIC: '),
                                                  TextSpan(
                                                    text: viewModel
                                                            .partners[index]
                                                            .picName ??
                                                        '-',
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          CustomColor.darkGrey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 35.h,
                                      ),
                                      child: Divider(
                                        color: Colors.grey,
                                        thickness: 1.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
                      child: SafeArea(
                        top: false,
                        child: DottedBorderButton(
                          label: '+ Tambah Partner',
                          onTap: viewModel.navigateToTambahPartnership,
                          // ignore: no-empty-block
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            offset: const Offset(0, -2),
                            color: CustomColor.primaryBlack.withOpacity(0.1),
                          ),
                        ],
                      ),
                      child: CustomButton(
                        label: 'Pilih Partner',
                        onPressed:
                            idPartner != 0 && viewModel.partners.isNotEmpty
                                ? () => viewModel.navigateToTambahPencairan(
                                      idPartner.toString(),
                                    )
                                : null,
                        isBusy: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ignore_for_file: newline-before-return
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../../application/models/ritel_mutasi_rekening.dart';
import '../../../../../../../../../shared/thick_light_grey_divider.dart';
import 'mutasi_rekening_details_item.dart';

class MutasiRekeningDetails extends StatelessWidget {
  final RitelMutasiRekening ritelMutasiRekening;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;
  final int? index;

  const MutasiRekeningDetails({
    Key? key,
    required this.ritelMutasiRekening,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
    this.index,
  }) : super(key: key);

  String convertDateToLocale(String dateString) {
    final inputFormat = DateFormat('dd MMMM yyyy', 'id');
    final date = inputFormat.parse(dateString);
    final outputFormat = DateFormat('dd MMM yy');
    // ignore: newline-before-return
    return outputFormat.format(date).toString();
  }

  @override
  Widget build(BuildContext context) {
    final splitBank = ritelMutasiRekening.bank!.split(' - ');
    final namaBank = splitBank[0];
    final rekeningBank = splitBank[1];
    final formatter = NumberFormat('#,###', 'id_ID');

    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          shadowColor: const Color.fromARGB(255, 125, 131, 137),
          title: Text(
            'Mutasi Rekening',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: GestureDetector(
            onTap: () => locator<NavigationService>().navigateTo(
              Routes.mutasiRekeningView,
              arguments: MutasiRekeningViewArguments(
                prakarsaId: ritelMutasiRekening.prakarsaId!,
                pipelineId: pipelineId,
                loanTypesId: loanTypesId,
                status: status,
                codeTable: codeTable,
              ),
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24.sp,
            ),
          ),
          actions: [
            if (status <= 2)
              Container(
                margin: EdgeInsets.only(right: 15.w),
                padding: EdgeInsets.zero,
                width: 33.w,
                child: IconButton(
                  icon: Image.asset(IconConstants.edit),
                  onPressed: () => locator<NavigationService>().navigateTo(
                    Routes.mutasiRekeningFormView,
                    arguments: MutasiRekeningFormViewArguments(
                      ritelMutasiRekening: ritelMutasiRekening,
                      prakarsaId: ritelMutasiRekening.prakarsaId!,
                      pipelineId: pipelineId,
                      loanTypesId: loanTypesId,
                      status: status,
                      codeTable: codeTable,
                      index: index,
                    ),
                  ),
                ),
              ),
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            if (codeTable != 1)
              _buildSummaryDetailMutasi(namaBank, rekeningBank, formatter),
            const ThickLightGreyDivider(),
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: ritelMutasiRekening.detailMutasi!.length,
              itemBuilder: (context, index) {
                final detailMutasi = ritelMutasiRekening.detailMutasi![index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
                      child: Text(
                        'Mutasi ${index + 1}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: CustomColor.primaryBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    MutasiRekeningDetailsItem(
                      detailMutasi: detailMutasi,
                      prakarsaId: ritelMutasiRekening.prakarsaId!,
                      pipelineId: pipelineId,
                      loanTypesId: loanTypesId,
                      status: status,
                      codeTable: codeTable,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      onWillPop: () async {
        locator<NavigationService>().navigateTo(
          Routes.mutasiRekeningView,
          arguments: MutasiRekeningViewArguments(
            prakarsaId: ritelMutasiRekening.prakarsaId!,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable,
          ),
        );
        return true;
      },
    );
  }

  Padding _buildSummaryDetailMutasi(
    String namaBank,
    String rekeningBank,
    NumberFormat formatter,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleAndSubtitle('Nama Bank', namaBank),
          SizedBox(height: 8.h),
          _buildTitleAndSubtitle('No. Rekening', rekeningBank),
          SizedBox(height: 8.h),
          _buildTitleAndSubtitle(
            'Periode Awal - Periode Akhir',
            ritelMutasiRekening.periode != null
                ? '${convertDateToLocale(
                    ritelMutasiRekening.periode!.split(' - ')[0],
                  )} - ${convertDateToLocale(
                    ritelMutasiRekening.periode!.split(' - ')[1],
                  )}'
                : '-',
          ),
          SizedBox(height: 8.h),
          _buildTitleAndSubtitle(
            'Total Mutasi Kredit',
            ritelMutasiRekening.totalMutasiKredit != null
                ? formatter.format(
                    double.parse(
                      ritelMutasiRekening.totalMutasiKredit!,
                    ),
                  )
                : '-',
          ),
          SizedBox(height: 8.h),
          _buildTitleAndSubtitle(
            'Ratas Mutasi Kredit Tiap bulan',
            ritelMutasiRekening.ratasMutasiKredit != null
                ? formatter.format(
                    double.parse(
                      ritelMutasiRekening.ratasMutasiKredit!,
                    ),
                  )
                : '-',
          ),
          SizedBox(height: 8.h),
          _buildTitleAndSubtitle(
            'Total Mutasi Debet',
            ritelMutasiRekening.totalMutasiDebet != null
                ? formatter.format(
                    double.parse(
                      ritelMutasiRekening.totalMutasiDebet!,
                    ),
                  )
                : '-',
          ),
          SizedBox(height: 8.h),
          _buildTitleAndSubtitle(
            'Ratas Mutasi Debet tiap bulan',
            ritelMutasiRekening.ratasMutasiDebet != null
                ? formatter.format(
                    double.parse(
                      ritelMutasiRekening.ratasMutasiDebet!,
                    ),
                  )
                : '-',
          ),
          SizedBox(height: 8.h),
          _buildTitleAndSubtitle(
            'Total Saldo Akhir',
            ritelMutasiRekening.totalSaldoAKhir != null
                ? formatter.format(
                    double.parse(
                      ritelMutasiRekening.totalSaldoAKhir!,
                    ),
                  )
                : '-',
          ),
        ],
      ),
    );
  }
}

Row _buildTitleAndSubtitle(String title, String subtitle) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 12.sp,
          color: const Color(0xff828896),
        ),
      ),
      Text(
        subtitle,
        style: TextStyle(
          fontSize: 14.sp,
          color: const Color(0xff162B3A),
        ),
      ),
    ],
  );
}

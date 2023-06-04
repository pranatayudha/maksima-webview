import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../application/models/ritel_riwayat_projek.dart';
import '../../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../../shared/thick_light_grey_divider.dart';
import 'widgets/ritel_file_item_riwayat_projek.dart';

class RiwayatProjekDetails extends StatelessWidget {
  final RitelRiwayatProjek ritelRiwayatProjek;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;

  const RiwayatProjekDetails({
    Key? key,
    required this.ritelRiwayatProjek,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 0,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        shadowColor: const Color.fromARGB(255, 125, 131, 137),
        title: Text(
          'Riwayat Projek',
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
                  Routes.riwayatProjekView,
                  arguments: RiwayatProjekViewArguments(
                    prakarsaId: ritelRiwayatProjek.prakarsaId!,
                    ritelRiwayatProjek: ritelRiwayatProjek,
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
            Routes.informasiFinansialView,
            arguments: InformasiFinansialViewArguments(
              prakarsaId: ritelRiwayatProjek.prakarsaId!,
              pipelineId: pipelineId,
              loanTypesId: loanTypesId,
              status: status,
              codeTable: codeTable,
            ),
          ),
        ),
      ),
      body: NetworkSensitive(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
                  child: RitelFileItemRiwayatProjek(
                    file: ritelRiwayatProjek.pathRiwayatProject!,
                    title: ritelRiwayatProjek.namePath!,
                  ),
                ),
                const ThickLightGreyDivider(),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
                  child: Column(
                    children: [
                      _buildTitleAndSubtitle(
                        'Nilai Rata - Rata Proyek',
                        currencyFormat.format(
                          (double.parse(
                            ritelRiwayatProjek.nilaiRataProject!,
                          )),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      _buildTitleAndSubtitle(
                        'Nilai Proyek Tertinggi',
                        currencyFormat.format(
                          double.parse(
                            ritelRiwayatProjek.nilaiProjectTertinggi!,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                for (var index in ritelRiwayatProjek.dataRiwayat!)
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xffCDD3D8)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(12.w, 16.h, 12.w, 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTitleAndSubtitle(
                              'SPK/Invoice',
                              index.spkInvoice!,
                            ),
                            SizedBox(height: 8.h),
                            _buildTitleAndSubtitle(
                              'No. SPK/Invoice',
                              index.numSpkInvoice!,
                            ),
                            SizedBox(height: 8.h),
                            _buildTitleAndSubtitle(
                              'Pemberi Kerja/Konsumen',
                              index.konsumen!,
                            ),
                            SizedBox(height: 8.h),
                            _buildTitleAndSubtitle(
                              'Nama Pekerjaan',
                              index.namaPekerjaan!,
                            ),
                            SizedBox(height: 8.h),
                            _buildTitleAndSubtitle(
                              'Nilai Pesanan/Invoice',
                              currencyFormat
                                  .format(double.parse(index.nilaiInvoice!)),
                              color: const Color(0xff38BAA7),
                            ),
                            SizedBox(height: 8.h),
                            _buildTitleAndSubtitle(
                              'Periode Proyek',
                              index.periodeProyek!.toString(),
                            ),
                            SizedBox(height: 8.h),
                            _buildTitleAndSubtitle(
                              'Status Proyek',
                              index.statusProyek!,
                            ),
                          ],
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
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../application/app/app.locator.dart';
import '../../../../../../application/app/app.router.dart';
import '../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../application/app/constants/image_constants.dart';
import '../../../../../../application/models/ritel_prakarsa_info_prakarsa_header.dart';
import '../../../../../../application/models/ritel_prakarsa_status_pengajuan_body.dart';
import '../tabs/informasi_prakarsa/informasi_revisi/revisi_detail_view.dart';

class PrakarsaDetailsHeaderRitel extends StatelessWidget {
  final RitelPrakarsaInfoPrakarsaHeader header;
  final String prakarsaId;
  final String pipelineId;
  final int codeTable;
  final String? status;
  final RitelPrakarsaStatusPengajuanBodyPTR statusPengajuanBody;

  const PrakarsaDetailsHeaderRitel({
    Key? key,
    required this.header,
    required this.prakarsaId,
    required this.pipelineId,
    required this.codeTable,
    this.status,
    required this.statusPengajuanBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _headerHeight = 180.h;
    final _statusBarHeight = MediaQuery.of(context).padding.top;
    // ignore: newline-before-return
    return Container(
      height: _headerHeight,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(5.w, _statusBarHeight, 5.w, 0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstants.headerBg2),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          _buildAvatar(header),
          const SizedBox(height: 14),
          if (header.status == 'Lengkapi Informasi Prakarsa' ||
              header.status == 'Lengkapi informasi prakarsa')
            _buildStatusBar(
              header.status!,
              'Lengkapi data debitur untuk melanjutkan prakarsa',
              Icons.warning_rounded,
              Color(0xffFFFAE6),
              Color(0xff66788A),
              Color(0xfff49300),
              Color(0xffF49300),
            )
          else if (header.status == 'Revisi ADK - 1' ||
              header.status == 'Revisi ADK - 2' ||
              header.status == 'Revisi ADK - 3' ||
              header.status == 'Revisi ADK - 4' ||
              header.status == 'Revisi ADK - 5' ||
              header.status == 'Revisi ADK - 6' ||
              header.status == 'Revisi ADK - 7' ||
              header.status == 'Revisi ADK - 8' ||
              header.status == 'Revisi ADK - 9' ||
              header.status == 'Revisi ADK - 10' ||
              header.status == 'Revisi CBL - 1' ||
              header.status == 'Revisi CBL - 2' ||
              header.status == 'Revisi CBL - 3' ||
              header.status == 'Revisi CBL - 4' ||
              header.status == 'Revisi CBL - 5' ||
              header.status == 'Revisi CBL - 6' ||
              header.status == 'Revisi CBL - 7' ||
              header.status == 'Revisi CBL - 8' ||
              header.status == 'Revisi CBL - 9' ||
              header.status == 'Revisi CBL - 10' ||
              header.status == 'Revisi Pemutus Pusat - 1' ||
              header.status == 'Revisi Pemutus Pusat - 2' ||
              header.status == 'Revisi Pemutus Pusat - 3' ||
              header.status == 'Revisi Pemutus Pusat - 4' ||
              header.status == 'Revisi Pemutus Pusat - 5' ||
              header.status == 'Revisi Pemutus Pusat - 6' ||
              header.status == 'Revisi Pemutus Pusat - 7' ||
              header.status == 'Revisi Pemutus Pusat - 8' ||
              header.status == 'Revisi Pemutus Pusat - 9' ||
              header.status == 'Revisi Pemutus Pusat - 10')
            _buildStatusRevisiBar(context)
          else if (header.status == 'Siap Dikirim ke Checker')
            _buildStatusReadySendToCheckerBar()
          else if (header.status ==
              'Dokumen dalam proses verifikasi & tandatangan')
            _buildStatusBar(
              header.status!,
              'Sistem akan memberitahu setelah selesai',
              Icons.warning_rounded,
              Color(0xffFFFAE6),
              Color(0xff66788A),
              Color(0xfff49300),
              Color(0xffF49300),
            )
          else if (header.status == 'PTK selesai ditandatangan')
            _buildStatusBar(
              header.status!,
              'Klik untuk melihat',
              Icons.timelapse,
              const Color(0xffE8F7FC),
              Color(0xff66788A),
              Color(0xff1BB0DF),
              Color(0xff1BB0DF),
            )
          else if (header.status == 'Dokumen dalam proses akad kredit')
            _buildStatusBar(
              header.status!,
              'Sistem akan memberitahu setelah selesai',
              Icons.warning_rounded,
              Color(0xffFFFAE6),
              Color(0xff66788A),
              Color(0xfff49300),
              Color(0xffF49300),
            )
          else if (header.status == 'Dokumen dalam proses pembuatan fasilitas')
            _buildStatusBar(
              header.status!,
              'Sistem akan memberitahu setelah selesai',
              Icons.warning_rounded,
              Color(0xffFFFAE6),
              Color(0xff66788A),
              Color(0xfff49300),
              Color(0xffF49300),
            )
          // Akan memakai regexp untuk mencari |
          else if (RegExp(r'\|(\w+)').allMatches(header.status!).isNotEmpty)
            _buildStatusDitolakBar(header.status!),
        ],
      ),
    );
  }

  Padding _buildAvatar(RitelPrakarsaInfoPrakarsaHeader header) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
                    header.initial!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff07539A),
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
                ),
                child: Center(
                  child: Text(
                    header.loan_typesId == '1' ? 'PTR' : 'PARI',
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
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Text(
                  header.title!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // AutoSizeText(
                //   header.pic!,
                //   style: const TextStyle(
                //     color: Colors.white,
                //   ),
                //   minFontSize: 12,
                //   maxFontSize: 12,
                // ),
                Text(
                  header.pic!,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6.h),
                const Text(
                  'Partnership - Tidak Ada',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffF07126),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ignore: long-parameter-list
  Widget _buildStatusBar(
    String title,
    String desc,
    IconData icon,
    Color colorBackground,
    Color colorDesc,
    Color colorIcon,
    Color colorShadow,
  ) {
    return Container(
      margin: EdgeInsets.fromLTRB(14.w, 0, 14.w, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: colorShadow,
            spreadRadius: 1.5,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        color: colorBackground,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
          child: Row(
            children: [
              Icon(
                icon,
                color: colorIcon,
                size: 35,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                    AutoSizeText(
                      desc,
                      style: TextStyle(color: colorDesc),
                      minFontSize: 11,
                      maxFontSize: 11,
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

  Widget _buildStatusRevisiBar(BuildContext context) {
    dynamic revision = 'not initialized';
    for (var i = 0; i < statusPengajuanBody.revisi!.length; i++) {
      if (statusPengajuanBody.revisi[i]['status'] == false ||
          statusPengajuanBody.revisi[i]['status'] == null) {
        revision = statusPengajuanBody.revisi[i];
      }
    }
    // ignore: newline-before-return
    return InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(14.w, 0, 14.w, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffD70C24),
              spreadRadius: 1.5,
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          color: const Color(0xffFBE7E9),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.error,
                  color: Color(0xffD70C24),
                  size: 20,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        header.status!,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      AutoSizeText(
                        revision == 'not initialized'
                            ? '...Waiting'
                            : revision['checker'][0] == 'a'
                                ? 'Klik untuk melihat detil revisi dari ADK'
                                : revision['checker'][0] == 'c'
                                    ? 'Klik untuk melihat detil revisi dari CBL'
                                    : 'Klik untuk melihat detil revisi dari Pusat',
                        style: TextStyle(
                          color: Color(0xff66788A),
                        ),
                        maxFontSize: 12,
                      ),
                    ],
                  ),
                ),
                Image.asset(IconConstants.arrowRight, scale: 4),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        if (revision != 'not initialized') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RevisiDetailView(
                ticket: revision['revisionTicket'],
                checker: revision['checker'][0] == 'a'
                    ? 'adk'
                    : revision['checker'][0] == 'c'
                        ? 'cbl'
                        : 'pemutus',
                id: prakarsaId,
                codeTable: codeTable,
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildStatusDitolakBar(String argu) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(14.w, 0, 14.w, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffD70C24),
              spreadRadius: 1.5,
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          color: const Color(0xffFBE7E9),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(
                      Icons.circle,
                      color: Color(0xffD70C24),
                      size: 25,
                    ),
                    const Icon(
                      Icons.close,
                      color: Color(0xffFBE7E9),
                      size: 15,
                    ),
                  ],
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        header.status!.split('|')[0],
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      AutoSizeText(
                        header.status!.split('|')[1],
                        style: TextStyle(
                          color: Color(0xff66788A),
                        ),
                        maxFontSize: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusReadySendToCheckerBar() {
    return InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(14.w, 0, 14.w, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: const [
            BoxShadow(
              color: Color(0xff1BB0DF),
              spreadRadius: 1.5,
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          color: const Color(0xffE8F7FC),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.timelapse,
                  color: Color(0xff1BB0DF),
                  size: 35,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Info Prakarsa sudah lengkap. Data siap dikirimkan ke Checker',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                      const AutoSizeText(
                        'Periksa kembali sebelum proses verifikasi',
                        style: TextStyle(
                          color: Color(0xff66788A),
                        ),
                        maxFontSize: 12,
                      ),
                    ],
                  ),
                ),
                Image.asset(IconConstants.arrowRight, scale: 4),
              ],
            ),
          ),
        ),
      ),
      onTap: () => locator<NavigationService>().navigateTo(
        Routes.hasilAnalisaPinjamanViewRitel,
        arguments: HasilAnalisaPinjamanViewRitelArguments(
          debiturName: header.title!,
          prakarsaId: prakarsaId,
          pipelineId: pipelineId,
          loanTypesId: int.parse(header.loan_typesId!),
          codeTable: codeTable,
          status: 1,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../../application/models/ritel_informasi_pinjaman.dart';
import '../../../../../../../../../shared/styles.dart';
import '../../../../../../../../../shared/thick_light_grey_divider.dart';

final formatter = NumberFormat('#,###', 'id_ID');

class InformasiPinjamanDetailsPari extends StatelessWidget {
  final RitelInformasiPinjaman ritelInformasiPinjaman;
  final String pipelinesId;
  final int loanTypesId;
  final String prakarsaId;
  final int status;
  final int codeTable;

  const InformasiPinjamanDetailsPari({
    Key? key,
    required this.ritelInformasiPinjaman,
    required this.pipelinesId,
    required this.loanTypesId,
    required this.prakarsaId,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          shadowColor: const Color.fromARGB(255, 125, 131, 137),
          title: const Text(
            'Informasi Pinjaman',
            style: TextStyle(
              color: Colors.black,
              // fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            if (status <= 2)
              GestureDetector(
                onTap: () => locator<NavigationService>().navigateTo(
                  Routes.informasiPinjamanViewPari,
                  arguments: InformasiPinjamanViewPariArguments(
                    ritelInformasiPinjaman: ritelInformasiPinjaman,
                    pipelinesId: pipelinesId,
                    loanTypesId: loanTypesId,
                    prakarsaId: prakarsaId,
                    codeTable: 4,
                  ),
                ),
                child: Image.asset(IconConstants.edit, scale: 3),
              ),
          ],
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24.sp,
            ),
            onTap: () => locator<NavigationService>().navigateTo(
              Routes.prakarsaDetailsViewRitel,
              arguments: PrakarsaDetailsViewRitelArguments(
                index: 1,
                prakarsaId: ritelInformasiPinjaman.prakarsaId!,
                pipelineId: pipelinesId,
                loanTypesId: loanTypesId,
                codeTable: 4,
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 18.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleAndSubtitle('Jenis Kredit', 'Pinang Ritel'),
                  _buildTitleAndSubtitle(
                    'Jenis Fasilitas',
                    'Pinang Maksima - KMK PRK Pinang PARI',
                  ),
                  _buildTitleAndSubtitle(
                    'Tujuan Penggunaan',
                    'Pembayaran Trx Melalui Aplikasi PARI',
                  ),
                  _buildTitleAndSubtitle(
                    'Sifat Kredit',
                    ritelInformasiPinjaman.sifatKredit!,
                  ),
                  _buildTitleAndSubtitle(
                    'Bunga Pinjaman',
                    ritelInformasiPinjaman.bungaPinjaman != null
                        ? '${ritelInformasiPinjaman.bungaPinjaman!}%'
                        : '-',
                  ),
                  _buildTitleAndSubtitle(
                    'Jangka Waktu Fasilitas',
                    ritelInformasiPinjaman.bungaPinjaman != null
                        ? '${ritelInformasiPinjaman.jangkaWaktuFasilitas!} Bulan'
                        : '-',
                  ),
                  _buildTitleAndSubtitle(
                    'Nominal Pengajuan Awal',
                    'Rp. ${formatter.format(double.parse(ritelInformasiPinjaman.nominalPengajuanAwal!))}',
                  ),
                ],
              ),
            ),
            const ThickLightGreyDivider(),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 18.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSubTitle('Perhitungan Kebutuhan Kredit'),
                  _buildTitleAndSubtitle(
                    'Asumsi Perhitungan Kredit',
                    ritelInformasiPinjaman.asumsiPerhitunganKredit!,
                  ),
                  _buildTitleAndSubtitle(
                    'Nilai Transaksi',
                    ritelInformasiPinjaman.nilaiTransaksi != null
                        ? 'Rp. ${formatter.format(double.parse(ritelInformasiPinjaman.nilaiTransaksi!))}'
                        : 'Rp. -',
                  ),
                  _buildTitleAndSubtitle(
                    'Sharing Dana Sendiri',
                    '${ritelInformasiPinjaman.sharingDanaSendiri!}%',
                  ),
                  _buildTitleAndSubtitle(
                    'Maksimal Kredit yand Dapat Diberikan',
                    ritelInformasiPinjaman.maksimalKredit != null
                        ? 'Rp. ${formatter.format(double.parse(ritelInformasiPinjaman.maksimalKredit!))}'
                        : 'Rp. -',
                  ),
                  _buildTitleAndSubtitle(
                    'Rekomendasi Plafond yang Diberikan',
                    ritelInformasiPinjaman.rekomendasiPlafond != null
                        ? 'Rp. ${formatter.format(double.parse(ritelInformasiPinjaman.rekomendasiPlafond!))}'
                        : 'Rp. -',
                  ),
                ],
              ),
            ),
            const ThickLightGreyDivider(),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 18.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSubTitle('Biaya Lainnya'),
                  _buildTitleAndSubtitle(
                    'Biaya Provisi',
                    ritelInformasiPinjaman.biayaProvisi != null
                        ? 'Rp. ${formatter.format(double.parse(ritelInformasiPinjaman.biayaProvisi!))}'
                        : 'Rp. -',
                  ),
                  _buildTitleAndSubtitle(
                    'Biaya Administrasi',
                    ritelInformasiPinjaman.biayaAdministrasi != null
                        ? 'Rp. ${formatter.format(double.parse(ritelInformasiPinjaman.biayaAdministrasi!))}'
                        : 'Rp. -',
                  ),
                  _buildTitleAndSubtitle(
                    'Biaya Premi',
                    ritelInformasiPinjaman.biayaPremi != null
                        ? 'Rp. ${formatter.format(double.parse(ritelInformasiPinjaman.biayaPremi!))}'
                        : 'Rp. -',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onWillPop: () async {
        locator<NavigationService>().navigateTo(
          Routes.prakarsaDetailsViewRitel,
          arguments: PrakarsaDetailsViewRitelArguments(
            index: 1,
            prakarsaId: ritelInformasiPinjaman.prakarsaId!,
            pipelineId: pipelinesId,
            loanTypesId: loanTypesId,
            codeTable: 4,
          ),
        );
        // ignore: newline-before-return
        return true;
      },
    );
  }

  Column _buildTitleAndSubtitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 18.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            color: const Color(0xff828896),
          ),
        ),
        const SizedBox(height: 1.0),
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

  Padding _buildSubTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Text(text, style: tsHeading10),
    );
  }
}

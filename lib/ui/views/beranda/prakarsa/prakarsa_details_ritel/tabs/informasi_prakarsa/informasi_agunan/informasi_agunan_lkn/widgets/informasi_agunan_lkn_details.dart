// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../../application/models/ritel_laporan_kunjungan_nasabah.dart';
import '../../../../../../../../../shared/ritel_foto_item_agunan.dart';
import '../informasi_agunan_lkn_viewmodel.dart';

final formatter = NumberFormat('#,###', 'id_ID');

class InformasiAgunanLknDetails
    extends ViewModelBuilderWidget<InformasiAgunanLKNViewModel> {
  RitelLaporanKunjunganNasabah ritelLaporanKunjunganNasabah;
  int status;
  final int codeTable;

  InformasiAgunanLknDetails({
    Key? key,
    required this.ritelLaporanKunjunganNasabah,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  InformasiAgunanLKNViewModel viewModelBuilder(BuildContext context) =>
      InformasiAgunanLKNViewModel(
        loanTypesId:
            int.parse(ritelLaporanKunjunganNasabah.dataLkn!.loan_typesId!),
        prakarsaId: ritelLaporanKunjunganNasabah.dataLkn!.prakarsaId!,
        pipelineId: ritelLaporanKunjunganNasabah.dataLkn!.pipelinesId!,
        status: status,
        detailsLkn: ritelLaporanKunjunganNasabah,
        codeTable: codeTable,
      );

  @override
  // ignore: long-method
  Widget builder(
    BuildContext context,
    InformasiAgunanLKNViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () async {
        locator<NavigationService>().navigateTo(
          Routes.informasiAgunanViewRitel,
          arguments: InformasiAgunanViewRitelArguments(
            loanTypesId:
                int.parse(ritelLaporanKunjunganNasabah.dataLkn!.loan_typesId!),
            prakarsaId: ritelLaporanKunjunganNasabah.dataLkn!.prakarsaId!,
            pipelineId: ritelLaporanKunjunganNasabah.dataLkn!.pipelinesId!,
            status: status,
            codeTable: codeTable,
          ),
        );
        // ignore: newline-before-return
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          shadowColor: const Color.fromARGB(255, 125, 131, 137),
          title: Text(
            ritelLaporanKunjunganNasabah.name!,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            if (status <= 2)
              GestureDetector(
                onTap: () => locator<NavigationService>().navigateTo(
                  Routes.informasiAgunanLknForm,
                  arguments: InformasiAgunanLknFormArguments(
                    loanTypesId: int.parse(
                      ritelLaporanKunjunganNasabah.dataLkn!.loan_typesId!,
                    ),
                    prakarsaId:
                        ritelLaporanKunjunganNasabah.dataLkn!.prakarsaId!,
                    pipelineId:
                        ritelLaporanKunjunganNasabah.dataLkn!.pipelinesId!,
                    ritelLaporanKunjunganNasabah: ritelLaporanKunjunganNasabah,
                    status: status,
                    codeTable: codeTable,
                  ),
                ),
                child: Image.asset(IconConstants.edit, scale: 3),
              ),
          ],
          leading: GestureDetector(
            onTap: () => locator<NavigationService>().navigateTo(
              Routes.informasiAgunanViewRitel,
              arguments: InformasiAgunanViewRitelArguments(
                loanTypesId: int.parse(
                  ritelLaporanKunjunganNasabah.dataLkn!.loan_typesId!,
                ),
                prakarsaId: ritelLaporanKunjunganNasabah.dataLkn!.prakarsaId!,
                pipelineId: ritelLaporanKunjunganNasabah.dataLkn!.pipelinesId!,
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
                  _buildTitleAndSubtitle(
                    'CB Terdekat',
                    ritelLaporanKunjunganNasabah.dataLkn!.cbName!,
                  ),
                  _buildTitleAndSubtitle(
                    'Waktu Tempuh Lokasi',
                    ritelLaporanKunjunganNasabah.dataLkn!.etaToCB!,
                  ),
                  _buildTitleAndSubtitle(
                    'Jenis Produk Pinjaman',
                    ritelLaporanKunjunganNasabah.dataLkn!.loan_typesId == '1'
                        ? 'Pinang Maksima - KMK PTR'
                        : 'Pinang Maksima - KMK PRK Pinang PARI',
                  ),
                  _buildTitleAndSubtitle(
                    'Nominal Pengajuan Awal',
                    'Rp. ${formatter.format(double.parse(ritelLaporanKunjunganNasabah.dataLkn!.loanAmount!))}',
                  ),
                  _buildTitleAndSubtitle(
                    'Tujuan Kunjungan Nasabah',
                    ritelLaporanKunjunganNasabah.dataLkn!.purposeVisit != null
                        ? ritelLaporanKunjunganNasabah.dataLkn!.purposeVisit!
                        : '-',
                  ),
                  _buildTitleAndSubtitle(
                    'Tanggal Kunjungan Nasabah',
                    ritelLaporanKunjunganNasabah.dataLkn!.dateOfVisit != null
                        ? ritelLaporanKunjunganNasabah.dataLkn!.dateOfVisit!
                        : '-',
                  ),
                  _buildTitleAndSubtitle(
                    'Tag Location Foto Kunjungan',
                    ritelLaporanKunjunganNasabah.dataLkn!.tagLocation!.latLng!,
                  ),
                  const SizedBox(height: 18.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Foto Kunjungan',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xff828896),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Column(
                        children: List.generate(
                          viewModel.listUrlLkn.length,
                          (index) => RitelFotoItemAgunan(
                            'Foto Kunjungan #${index + 1}',
                            viewModel.listUrlLkn[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                  _buildTitleAndSubtitle(
                    'Hasil Kunjungan Nasabah',
                    ritelLaporanKunjunganNasabah.dataLkn!.visitResult != null
                        ? ritelLaporanKunjunganNasabah.dataLkn!.visitResult!
                        : '-',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../application/app/constants/image_constants.dart';
import '../../../../../../../../application/services/url_launcher_service.dart';
import '../../../../../../../shared/styles.dart';
import '../../../../../../../shared/thick_light_grey_divider.dart';
import '../../../prakarsa_details_view_ritel.dart';
import 'informasi_perusahaan_viewmodel.dart';

class InformasiPerusahaanView
    extends ViewModelBuilderWidget<InformasiPerusahaanViewModelRitel> {
  final String prakarsaId;
  final String pipelineId;
  final int status;
  final int codeTable;

  const InformasiPerusahaanView({
    super.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.status,
    required this.codeTable,
  });

  @override
  InformasiPerusahaanViewModelRitel viewModelBuilder(BuildContext context) =>
      InformasiPerusahaanViewModelRitel(
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        status: status,
        codeTable: codeTable,
      );

  @override
  Widget builder(
    BuildContext context,
    InformasiPerusahaanViewModelRitel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => PrakarsaDetailsViewRitel(
              index: 1,
              pipelineId: pipelineId,
              prakarsaId: prakarsaId,
              loanTypesId: 1,
              codeTable: codeTable,
            ),
          ),
        );

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24.sp,
            ),
            onTap: () => Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => PrakarsaDetailsViewRitel(
                  index: 1,
                  pipelineId: pipelineId,
                  prakarsaId: prakarsaId,
                  loanTypesId: 1,
                  codeTable: codeTable,
                ),
              ),
            ),
          ),
          elevation: 0,
          title: Center(
            child: Text(
              'Informasi Perusahaan',
              style: tsHeading6,
            ),
          ),
          actions: [
            Visibility(
              visible: !viewModel.isBusy,
              child: GestureDetector(
                onTap: () => viewModel.navigateToUpdateScreen(context),
                child: Image.asset(IconConstants.edit, scale: 3),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
        ),
        body: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : _buildInfoPerusahaanList(context, viewModel),
      ),
    );
  }

  ListView _buildInfoPerusahaanList(
    BuildContext context,
    InformasiPerusahaanViewModelRitel vm,
  ) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        _buildInfoPerusahaanSection1(vm),
        const ThickLightGreyDivider(),
        _buildInfoPerusahaanSection2(vm),
        const ThickLightGreyDivider(),
        _buildDokumenPerusahaanSection(context, vm),
      ],
    );
  }

  Padding _buildInfoPerusahaanSection1(InformasiPerusahaanViewModelRitel vm) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleAndSubtitle(
            'Jenis Usaha',
            vm.ritelInformasiPerusahaanPt!.typePipeline ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Nama Perusahaan',
            vm.ritelInformasiPerusahaanPt!.companyName ?? '-',
          ),
          _buildTitleAndSubtitle(
            'NPWP Perusahaan',
            vm.ritelInformasiPerusahaanPt!.companyNpwpNum ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Sektor Ekonomi',
            vm.ritelInformasiPerusahaanPt!.economySectorsName ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Sub Sektor Ekonomi',
            vm.ritelInformasiPerusahaanPt!.economySubSectorsName ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Tag Location Alamat Perusahaan',
            vm.ritelInformasiPerusahaanPt!.tagLocation?.name ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Alamat Usaha',
            vm.ritelInformasiPerusahaanPt!.detail ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Kode Pos',
            vm.ritelInformasiPerusahaanPt!.postalCode ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Provinsi',
            vm.ritelInformasiPerusahaanPt!.province ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Kota/Kabupaten',
            vm.ritelInformasiPerusahaanPt!.city ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Kecamatan',
            vm.ritelInformasiPerusahaanPt!.district ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Kelurahan',
            vm.ritelInformasiPerusahaanPt!.village ?? '-',
          ),
          _buildTitleAndSubtitle(
            'RT',
            vm.ritelInformasiPerusahaanPt!.rt ?? '-',
          ),
          _buildTitleAndSubtitle(
            'RW',
            vm.ritelInformasiPerusahaanPt!.rw ?? '-',
          ),
        ],
      ),
    );
  }

  Padding _buildInfoPerusahaanSection2(InformasiPerusahaanViewModelRitel vm) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleAndSubtitle(
            'Tanggal Akta Pendirian',
            vm.ritelInformasiPerusahaanPt!.dateOfDeedEst?.newDate ?? '-',
          ),
          _buildTitleAndSubtitle(
            'No. Akta Pendirian',
            vm.ritelInformasiPerusahaanPt!.deedEstNum ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Tempat Akta Pendirian',
            vm.ritelInformasiPerusahaanPt!.placeOfDeedEst ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Tanggal SK Kumham Pendirian',
            vm.ritelInformasiPerusahaanPt!.dateOfSkKumham?.newDate ?? '-',
          ),
          _buildTitleAndSubtitle(
            'No. SK Kumham Pendirian',
            vm.ritelInformasiPerusahaanPt!.skKumhamNum ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Tanggal Akta Perubahan Terakhir',
            vm.ritelInformasiPerusahaanPt!.latestDateOfDeed?.newDate ?? '-',
          ),
          _buildTitleAndSubtitle(
            'No. Akta Perubahan Terakhir',
            vm.ritelInformasiPerusahaanPt!.latestDeedNum ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Tempat Akta Perubahan Terakhir',
            vm.ritelInformasiPerusahaanPt!.latestPlaceOfDeed ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Tanggal SK Kumham Perubahan Terakhir',
            vm.ritelInformasiPerusahaanPt!.latestDateOfSkKumham?.newDate ?? '-',
          ),
          _buildTitleAndSubtitle(
            'No. SK Kumham Perubahan Terakhir',
            vm.ritelInformasiPerusahaanPt!.latestSkKumhamNum ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Nama Lengkap PIC',
            vm.ritelInformasiPerusahaanPt!.fullnamePIC ?? '-',
          ),
          _buildTitleAndSubtitle(
            'No. Handphone',
            vm.ritelInformasiPerusahaanPt!.phoneNumPIC ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Email',
            vm.ritelInformasiPerusahaanPt!.emailPIC ?? '-',
          ),
        ],
      ),
    );
  }

  Padding _buildDokumenPerusahaanSection(
    BuildContext context,
    InformasiPerusahaanViewModelRitel vm,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'DOKUMEN',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff162B3A),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 18.h),
          _buildDokumenItem(
            context,
            'NPWP Perusahaan',
            vm.fotoNpwpPerusahaanUrl ?? '',
            false,
          ),
          _buildDokumenItem(
            context,
            'Akta Pendirian',
            vm.fotoAktaPendirianUrl ?? '',
            false,
          ),
          _buildDokumenItem(
            context,
            'Akta Perubahan Terakhir',
            vm.fotoAktaPerubahanTerakhirUrl ?? '',
            false,
          ),
          _buildDokumenItem(
            context,
            'SK Kumham Pendirian',
            vm.fotoSkKumhamPendirianTerakhirUrl ?? '',
            false,
          ),
          _buildDokumenItem(
            context,
            'SK Kumham Perubahan Terakhir',
            vm.fotoSkKumhamPerubahanTerakhirUrl ?? '',
            true,
          ),
        ],
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
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xff828896),
          ),
        ),
        const SizedBox(height: 1.0),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff162B3A),
          ),
        ),
      ],
    );
  }

  Column _buildDokumenItem(
    BuildContext context,
    String title,
    String image,
    bool isLast,
  ) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Row(
          children: [
            SizedBox(
              height: 60.h,
              width: 95.w,
              child: CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) => Transform.scale(
                  scale: 0.3,
                  child: const CircularProgressIndicator(
                    strokeWidth: 6.0,
                  ),
                ),
                errorWidget: (context, url, error) {
                  return image.split('?')[0].split('.').last == 'pdf'
                      ? Image.asset(
                          IconConstants.pdf,
                          scale: 1.5,
                        )
                      : Image.asset(
                          ImageConstants.imageNotFound,
                          scale: 0.8,
                        );
                },
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: CustomColor.primaryBlack,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 5.h),
                GestureDetector(
                  onTap: image == ''
                      // ignore: no-empty-block
                      ? () {}
                      : image.split('?')[0].split('.').last != 'pdf'
                          ? () => showDialogImage(context, image)
                          : () => locator<URLLauncherService>().browse(
                                image,
                              ),
                  child: Text(
                    image == '' ? 'Data belum Tersedia ' : 'Lihat',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: image == ''
                          ? const Color(0xffD70C24)
                          : CustomColor.secondaryBlue,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 4.h),
        if (!isLast)
          Divider(
            color: const Color(0xffC8C8C8).withOpacity(0.4),
            thickness: 1.h,
          ),
      ],
    );
  }

  Future showDialogImage(context, image) {
    return showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Center(
            child: Material(
              type: MaterialType.transparency,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  image,
                  scale: 1,
                  errorBuilder: (context, url, error) =>
                      Image.asset(ImageConstants.imageNotFound, scale: 0.2),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

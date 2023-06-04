import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/constants/common.dart';
import '../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../application/app/constants/image_constants.dart';
import '../../../../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../../../../application/helpers/educationFormatter.dart';
import '../../../../../../../../application/services/url_launcher_service.dart';
import '../../../../../../../shared/styles.dart';
import '../../../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_debitur_form_layout.dart';
import 'informasi_debitur_viewmodel.dart';

class InformasiDebiturView
    extends ViewModelBuilderWidget<InformasiDebiturViewModelRitel> {
  final String pipelinesId;
  final String prakarsaId;
  final bool backPipeline;
  final int status;

  const InformasiDebiturView({
    Key? key,
    required this.pipelinesId,
    required this.prakarsaId,
    this.backPipeline = false,
    required this.status,
  }) : super(key: key);

  @override
  InformasiDebiturViewModelRitel viewModelBuilder(BuildContext context) =>
      InformasiDebiturViewModelRitel(
        pipelineId: pipelinesId,
        prakarsaId: prakarsaId,
        status: status,
      );

  @override
  Widget builder(
    BuildContext context,
    InformasiDebiturViewModelRitel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: viewModel.navigateBack,
          icon: Image.asset(
            IconConstants.vector,
            scale: 0.9,
            color: const Color(0xff03213E),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        title: Center(
          child: Text(
            'Informasi Debitur',
            style: tsHeading6,
          ),
        ),
        actions: [
          if (status <= 2)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InformasiDebiturLayout(
                      pipeLinesId: pipelinesId,
                      prakarsaId: prakarsaId,
                      dataDiri: viewModel.ritelPrakarsaPeroranganDataDiri,
                      dataUsaha: viewModel.ritelPrakarsaPeroranganDataUsaha,
                      status: status,
                    ),
                  ),
                );
              },
              child: Image.asset(
                IconConstants.edit,
                scale: 3,
              ),
            )
          else
            Image.asset(
              IconConstants.edit,
              scale: 3,
              color: Colors.transparent,
            ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.transparent,
      ),
      body: viewModel.isBusy
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _buildInfoDebiturList(viewModel, context),
    );
  }

  Container _buildInfoDebiturList(InformasiDebiturViewModelRitel vm, context) {
    return Container(
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          _buildInfoDebiturSection1(vm),
          const ThickLightGreyDivider(),
          _buildInfoDebiturSection2(vm),
          const ThickLightGreyDivider(),
          _buildDokumenDebiturSection(vm, context),
        ],
      ),
    );
  }

  // ignore: long-method
  Padding _buildInfoDebiturSection1(InformasiDebiturViewModelRitel vm) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleAndSubtitle(
            'Jenis Debitur',
            'Perorangan',
          ),
          _buildTitleAndSubtitle(
            'Nama Lengkap Debitur Sesuai KTP',
            vm.ritelPrakarsaPeroranganDataDiri.fullName ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Nomor KTP Debitur',
            vm.ritelPrakarsaPeroranganDataDiri.ktpNum ?? '-',
          ),
          // format tanggal 01-Jan-2021
          // dibuat function convertnya
          _buildTitleAndSubtitle(
            'Tanggal KTP Terbit',
            vm.ritelPrakarsaPeroranganDataDiri.dateOfIssuedKTP!.isNotEmpty
                ? DateStringFormatter.forOutputRitelKTPTerbitInfoDebitur(
                    vm.ritelPrakarsaPeroranganDataDiri.dateOfIssuedKTP!,
                  )
                : '-',
          ),
          // format singkatan agama di ganti ke detail nama agama
          // dibuat function convertnya
          _buildTitleAndSubtitleReligion(
            'Agama',
            vm.ritelPrakarsaPeroranganDataDiri.religion ?? '-',
          ),
          _buildTitleAndSubtitleLastEducation(
            'Pendidikan Terakhir',
            vm.ritelPrakarsaPeroranganDataDiri.lastEducation!.isNotEmpty
                ? EducationFormatter.convertToLongText(
                    vm.ritelPrakarsaPeroranganDataDiri.lastEducation!,
                  )
                : '-',
          ),
          _buildTitleAndSubtitle(
            'Nomor NPWP',
            vm.ritelPrakarsaPeroranganDataDiri.npwpNum!.isNotEmpty
                ? vm.ritelPrakarsaPeroranganDataDiri.npwpNum!
                : '-',
          ),
          _buildTitleAndSubtitle(
            'Tempat Lahir Debitur',
            vm.ritelPrakarsaPeroranganDataDiri.placeOfBirth ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Tanggal Lahir Debitur',
            vm.ritelPrakarsaPeroranganDataDiri.dateOfBirth!.newDate ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Jenis Kelamin',
            vm.ritelPrakarsaPeroranganDataDiri.gender ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Nama Gadis Ibu Kandung Debitur',
            vm.ritelPrakarsaPeroranganDataDiri.motherMaiden!.isNotEmpty
                ? vm.ritelPrakarsaPeroranganDataDiri.motherMaiden!
                : '-',
          ),
          _buildTitleAndSubtitle(
            'Status Perkawinan',
            vm.ritelPrakarsaPeroranganDataDiri.maritalStatus ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Nomor KK',
            vm.ritelPrakarsaPeroranganDataDiri.kkNum ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Jumlah Tanggungan',
            vm.ritelPrakarsaPeroranganDataDiri.numberOfDependents != null
                ? vm.ritelPrakarsaPeroranganDataDiri.numberOfDependents
                    .toString()
                : '-',
          ),
          _buildTitleAndSubtitle(
            'Tag Location Alamat',
            vm.ritelPrakarsaPeroranganDataDiri.tagLocation!.name ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Detail Alamat Tempat Tinggal',
            vm.ritelPrakarsaPeroranganDataDiri.detail ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Kode Pos',
            vm.ritelPrakarsaPeroranganDataDiri.postalCode ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Provinsi',
            vm.ritelPrakarsaPeroranganDataDiri.province ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Kota/Kabupaten',
            vm.ritelPrakarsaPeroranganDataDiri.city ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Kecamatan',
            vm.ritelPrakarsaPeroranganDataDiri.district ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Kelurahan',
            vm.ritelPrakarsaPeroranganDataDiri.village ?? '-',
          ),
          _buildTitleAndSubtitle(
            'RT',
            vm.ritelPrakarsaPeroranganDataDiri.rt!.isNotEmpty
                ? vm.ritelPrakarsaPeroranganDataDiri.rt!
                : '-',
          ),
          _buildTitleAndSubtitle(
            'RW',
            vm.ritelPrakarsaPeroranganDataDiri.rw!.isNotEmpty
                ? vm.ritelPrakarsaPeroranganDataDiri.rw!
                : '-',
          ),
          _buildTitleAndSubtitle(
            'No. Handphone',
            vm.ritelPrakarsaPeroranganDataDiri.phoneNum ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Email',
            vm.ritelPrakarsaPeroranganDataDiri.email!.isNotEmpty
                ? vm.ritelPrakarsaPeroranganDataDiri.email!
                : '-',
          ),
          if (vm.ritelPrakarsaPeroranganDataDiri.maritalStatus == Common.kawin)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleAndSubtitle(
                  'Nomor KTP Pasangan',
                  vm.ritelPrakarsaPeroranganDataDiri.spouseKtpNum ?? '-',
                ),
                _buildTitleAndSubtitle(
                  'Nama Lengkap Pasangan',
                  vm.ritelPrakarsaPeroranganDataDiri.spouseFullname ?? '-',
                ),
                _buildTitleAndSubtitle(
                  'Tempat Lahir Pasangan',
                  vm.ritelPrakarsaPeroranganDataDiri.spousePlaceOfBirth ?? '-',
                ),
                _buildTitleAndSubtitle(
                  'Tanggal Lahir Pasangan',
                  vm.ritelPrakarsaPeroranganDataDiri.spouseDateOfBirth!
                          .newDate ??
                      '-',
                ),
              ],
            ),
        ],
      ),
    );
  }

  Padding _buildInfoDebiturSection2(InformasiDebiturViewModelRitel vm) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: prefer_const_constructors
          Text(
            'INFO USAHA',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff162B3A),
              fontWeight: FontWeight.w600,
            ),
          ),
          _buildTitleAndSubtitle(
            'Info Usaha',
            vm.ritelPrakarsaPeroranganDataUsaha.businessName!.isNotEmpty
                ? vm.ritelPrakarsaPeroranganDataUsaha.businessName!
                : '-',
          ),
          _buildTitleAndSubtitle(
            'Sektor Ekonomi',
            vm.ritelPrakarsaPeroranganDataUsaha.economySectorsName ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Sub-Sektor Ekonomi',
            vm.ritelPrakarsaPeroranganDataUsaha.economySubSectorsName ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Tag Location Alamat',
            vm.ritelPrakarsaPeroranganDataUsaha.tagLocation!.latLng!.isNotEmpty
                ? vm.ritelPrakarsaPeroranganDataUsaha.tagLocation!.name!
                : '-',
          ),
          _buildTitleAndSubtitle(
            'Alamat Usaha',
            vm.ritelPrakarsaPeroranganDataUsaha.detail!.isNotEmpty
                ? vm.ritelPrakarsaPeroranganDataUsaha.detail!
                : '-',
          ),
          _buildTitleAndSubtitle(
            'Kode Pos',
            vm.ritelPrakarsaPeroranganDataUsaha.postalCode!.isNotEmpty
                ? vm.ritelPrakarsaPeroranganDataUsaha.postalCode!
                : '-',
          ),
          _buildTitleAndSubtitle(
            'Provinsi',
            vm.ritelPrakarsaPeroranganDataUsaha.province ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Kota/Kabupaten',
            vm.ritelPrakarsaPeroranganDataUsaha.city ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Kecamatan',
            vm.ritelPrakarsaPeroranganDataUsaha.district!.isNotEmpty
                ? vm.ritelPrakarsaPeroranganDataUsaha.district!
                : '-',
          ),
          _buildTitleAndSubtitle(
            'Kelurahan',
            vm.ritelPrakarsaPeroranganDataUsaha.village!.isNotEmpty
                ? vm.ritelPrakarsaPeroranganDataUsaha.village!
                : '-',
          ),
          _buildTitleAndSubtitle(
            'RT',
            vm.ritelPrakarsaPeroranganDataUsaha.rt!.isNotEmpty
                ? vm.ritelPrakarsaPeroranganDataUsaha.rt!
                : '-',
          ),
          _buildTitleAndSubtitle(
            'RW',
            vm.ritelPrakarsaPeroranganDataUsaha.rw!.isNotEmpty
                ? vm.ritelPrakarsaPeroranganDataUsaha.rw!
                : '-',
          ),
          // _buildTitleAndSubtitle('Partnership', vm.ritelPrakarsaPeroranganDataUsaha.pa),
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

  Column _buildTitleAndSubtitleReligion(String title, String subtitle) {
    late String religionName;

    switch (subtitle) {
      case 'BUD':
        religionName = 'Buddha';
        break;
      case 'HIN':
        religionName = 'Hindu';
        break;
      case 'KAT':
        religionName = 'Katolik';
        break;
      case 'KHC':
        religionName = 'Konghucu';
        break;
      case 'ISL':
        religionName = 'Islam';
        break;
      case 'KRI':
        religionName = 'Protestan';
        break;
      case 'KPC':
        religionName = 'Kepercayaan';
        break;
      case 'ZZZ':
        religionName = 'Lainnya';
        break;
      default:
        religionName = '-';
        break;
    }
    // ignore: newline-before-return
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
          religionName,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff162B3A),
          ),
        ),
      ],
    );
  }

  Column _buildTitleAndSubtitleLastEducation(String title, String subtitle) {
    late String lastEducation;

    switch (subtitle) {
      case 'BT':
        lastEducation = 'Belum Tamat';
        break;
      case 'ZZ':
        lastEducation = 'Lainnya';
        break;
      default:
        lastEducation = subtitle;
        break;
    }
    // ignore: newline-before-return
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
          lastEducation,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff162B3A),
          ),
        ),
      ],
    );
  }

  // ignore: long-method
  Padding _buildDokumenDebiturSection(
    InformasiDebiturViewModelRitel vm,
    context,
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
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          if (vm.ritelPrakarsaPeroranganDataDiri.maritalStatus == Common.kawin)
            Column(
              children: [
                _buildDokumenItem(
                  context,
                  'Foto E-KTP Debitur',
                  vm.ktpFileDbtrControllerPublicUrl ?? '',
                  false,
                ),
                _buildDokumenItem(
                  context,
                  'Foto Selfie Bersama E-KTP',
                  vm.fotoSelfieDbtrControllerPublicUrl ?? '',
                  false,
                ),
                _buildDokumenItem(
                  context,
                  'NPWP Debitur',
                  vm.npwpDbtrControllerPublicUrl ?? '',
                  false,
                ),
                _buildDokumenItem(
                  context,
                  'Foto E-KTP Pasangan',
                  vm.ktpPsgnPathDbtrControllerPublicUrl ?? '',
                  false,
                ),
                _buildDokumenItem(
                  context,
                  'Kartu Keluarga',
                  vm.kkDbtrControllerPublicUrl ?? '',
                  false,
                ),
                _buildDokumenItem(
                  context,
                  'Akta Nikah',
                  vm.aktaNikahControllerPublicUrl ?? '',
                  true,
                ),
              ],
            ),
          if (vm.ritelPrakarsaPeroranganDataDiri.maritalStatus ==
              Common.belumKawin)
            Column(
              children: [
                _buildDokumenItem(
                  context,
                  'Foto E-KTP Debitur',
                  vm.ktpFileDbtrControllerPublicUrl ?? '',
                  false,
                ),
                _buildDokumenItem(
                  context,
                  'Foto Selfie Bersama E-KTP',
                  vm.fotoSelfieDbtrControllerPublicUrl ?? '',
                  false,
                ),
                _buildDokumenItem(
                  context,
                  'NPWP Debitur',
                  vm.npwpDbtrControllerPublicUrl ?? '',
                  false,
                ),
                _buildDokumenItem(
                  context,
                  'Kartu Keluarga',
                  vm.kkDbtrControllerPublicUrl ?? '',
                  true,
                ),
              ],
            ),
          if (vm.ritelPrakarsaPeroranganDataDiri.maritalStatus ==
              Common.ceraiMati)
            Column(
              children: [
                _buildDokumenItem(
                  context,
                  'Foto E-KTP Debitur',
                  vm.ktpFileDbtrControllerPublicUrl ?? '',
                  false,
                ),
                _buildDokumenItem(
                  context,
                  'Foto Selfie Bersama E-KTP',
                  vm.fotoSelfieDbtrControllerPublicUrl ?? '',
                  false,
                ),
                _buildDokumenItem(
                  context,
                  'NPWP Debitur',
                  vm.npwpDbtrControllerPublicUrl ?? '',
                  false,
                ),
                _buildDokumenItem(
                  context,
                  'Kartu Keluarga',
                  vm.kkDbtrControllerPublicUrl ?? '',
                  false,
                ),
                _buildDokumenItem(
                  context,
                  'Sertifikat Kematian',
                  vm.sertifikatKematianControllerPublicUrl ?? '',
                  true,
                ),
              ],
            ),
          if (vm.ritelPrakarsaPeroranganDataDiri.maritalStatus ==
              Common.ceraiHidup)
            Column(
              children: [
                _buildDokumenItem(
                  context,
                  'Foto E-KTP Debitur',
                  vm.ktpFileDbtrControllerPublicUrl ?? '',
                  false,
                ),
                _buildDokumenItem(
                  context,
                  'Foto Selfie Bersama E-KTP',
                  vm.fotoSelfieDbtrControllerPublicUrl ?? '',
                  false,
                ),
                _buildDokumenItem(
                  context,
                  'NPWP Debitur',
                  vm.npwpDbtrControllerPublicUrl ?? '',
                  false,
                ),
                _buildDokumenItem(
                  context,
                  'Kartu Keluarga',
                  vm.kkDbtrControllerPublicUrl ?? '',
                  false,
                ),
                _buildDokumenItem(
                  context,
                  'Akta Cerai',
                  vm.aktaCeraiControllerPublicUrl ?? '',
                  true,
                ),
              ],
            ),
        ],
      ),
    );
  }

  Future showDialogFunc(context, image) {
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
                ),
              ),
            ),
          ),
        );
      },
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
                  onTap: () {
                    if (image.isNotEmpty) {
                      if (image.split('?')[0].split('.').last != 'pdf') {
                        showDialogImage(context, image);
                      } else {
                        locator<URLLauncherService>().browse(
                          image,
                        );
                      }
                    }
                  },
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

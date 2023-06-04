// ignore_for_file: long-method, newline-before-return, long-parameter-list, prefer-conditional-expressions, unused_element, no_leading_underscores_for_local_identifiers, prefer_const_declarations

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../application/app/constants/image_constants.dart';
import '../../../../../../../../application/helpers/legalitas_usaha_type_format.dart';
import '../../../../../../../../application/models/ritel_legalitas_usaha_lainnya.dart';
import '../../../../../../../../application/models/ritel_legalitas_usaha_utama.dart';
import '../../../../../../../../application/models/ritel_prakarsa_perorangan.dart';
import '../../../../../../../shared/custom_button.dart';
import '../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../shared/processing_indicator.dart';
import '../../../../../../../shared/styles.dart';
import '../../../../../../../shared/thick_light_grey_divider.dart';
import 'legalitas_usaha_viewmodel.dart';
import 'widgets/legalitas_usaha_button.dart';
import 'widgets/legalitas_usaha_header.dart';

class LegalitasUsahaView
    extends ViewModelBuilderWidget<LegalitasUsahaViewModel> {
  final String prakarsaId;
  final RitelPrakarsaPerorangan ritelPrakarsaPerorangan;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;

  const LegalitasUsahaView({
    Key? key,
    required this.prakarsaId,
    required this.ritelPrakarsaPerorangan,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  LegalitasUsahaViewModel viewModelBuilder(BuildContext context) =>
      LegalitasUsahaViewModel(
        prakarsaId: prakarsaId,
        ritelPrakarsaPerorangan: ritelPrakarsaPerorangan,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        codeTable: codeTable,
      );

  @override
  Widget builder(
    BuildContext context,
    LegalitasUsahaViewModel viewModel,
    Widget? child,
  ) {
    return NetworkSensitive(
      child: WillPopScope(
        onWillPop: () async {
          viewModel.navigateToInfoPrakarsa();
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            title: Center(
              child: Text(
                'Legalitas Usaha',
                style: tsHeading6,
              ),
            ),
            // leadingWidth: 30.w,
            leading: GestureDetector(
              onTap: viewModel.navigateToInfoPrakarsa,
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 24.sp,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () => _buildModalInfo(context),
                child: Image.asset(IconConstants.info, scale: 2.5),
              ),
            ],
          ),
          body: SafeArea(
            top: false,
            child: (viewModel.isBusy)
                ? Container(
                    color: Colors.white,
                    child: const Center(
                      child: ProcessingIndicator(
                        label: 'Memuat data...',
                        labelColor: CustomColor.primaryBlue,
                      ),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            const LegalitasUsahaHeader(),
                            Container(
                              color: const Color(0xffF8F9FA),
                              padding: EdgeInsets.all(12.w),
                              child: Text(
                                'Dokumen Utama',
                                style: TextStyle(
                                  color: const Color(0xff66788A),
                                  fontSize: 12.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            if (viewModel.isActiveGrid!)
                              _gridViewDokumenUtama(
                                context,
                                viewModel,
                                status,
                                codeTable,
                              ),
                            if (viewModel.isActiveList!)
                              _listViewDokumenUtama(
                                context,
                                viewModel,
                                status,
                                codeTable,
                              ),
                            Container(
                              color: const Color(0xffF8F9FA),
                              padding: EdgeInsets.all(12.w),
                              child: Text(
                                'Dokumen Lainnya',
                                style: TextStyle(
                                  color: const Color(0xff66788A),
                                  fontSize: 12.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            if (viewModel.isActiveGrid!)
                              _gridViewDokumenLainnya(
                                context,
                                viewModel,
                                status,
                                codeTable,
                              ),
                            if (viewModel.isActiveList!)
                              _listViewDokumenLainnya(
                                context,
                                viewModel,
                                status,
                                codeTable,
                              ),
                          ],
                        ),
                      ),
                      if (status <= 2)
                        Column(
                          children: [
                            const ThickLightGreyDivider(),
                            _buildTambahDokumenButton(context, viewModel),
                          ],
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

void _buildModalInfo(BuildContext context) {
  showModalBottomSheet(
    enableDrag: false,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    builder: (BuildContext context) {
      return Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Dokumen Persyaratan',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: CustomColor.primaryBlack80,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.close,
                        color: CustomColor.primaryBlack80,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Dokumen Utama',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: CustomColor.primaryBlack80,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Dokumen Utama adalah dokumen yang wajib ada dari Cadeb. Dokumen tersebut seperti KTP & NPWP Pengurus dan legalitas perusahaan.',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: CustomColor.primaryBlack80,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Divider(thickness: 1.h),
                SizedBox(height: 8.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Dokumen Lainnya',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: CustomColor.primaryBlack80,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Dokumen lainnya adalah dokumen pendukung yang baik jika ada, namun tidak wajib. Dokumen tersebut seperti Company Profile.',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: CustomColor.primaryBlack80,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

void _buildModalHapusDokumen({
  required BuildContext context,
  required LegalitasUsahaViewModel viewModel,
  RitelLegalitasUsahaUtama? ritelLegalitasUsahaUtama,
  RitelLegalitasUsahaLainnya? ritelLegalitasUsahaLainnya,
}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    builder: (BuildContext context) {
      return Wrap(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConstants.trash,
                  scale: 3,
                ),
                SizedBox(height: 16.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Hapus Dokumen',
                      style: tsHeading8,
                    ),
                    SizedBox(height: 8.h),
                    AutoSizeText(
                      'Dokumen kredit yang dihapus tidak dapat dikembalikan. Apakah Anda ingin melanjutkan?',
                      style: tsCaption1,
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomButton(
                            labelColor: CustomColor.darkGrey,
                            color: CustomColor.lightGrey,
                            label: 'Batalkan',
                            onPressed: () => Navigator.of(context).pop(),
                            isBusy: false,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: CustomButton(
                            label: 'Hapus',
                            onPressed: () {
                              Navigator.of(context).pop();

                              if (ritelLegalitasUsahaUtama != null) {
                                viewModel.deleteDokumen(
                                  ritelLegalitasUsahaUtama:
                                      ritelLegalitasUsahaUtama,
                                  ritelLegalitasUsahaLainnya: null,
                                );
                              } else {
                                viewModel.deleteDokumen(
                                  ritelLegalitasUsahaUtama: null,
                                  ritelLegalitasUsahaLainnya:
                                      ritelLegalitasUsahaLainnya,
                                );
                              }
                            },
                            isBusy: false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

void _buildModalAction({
  required BuildContext context,
  required LegalitasUsahaViewModel vm,
  RitelLegalitasUsahaUtama? ritelLegalitasUsahaUtama,
  RitelLegalitasUsahaLainnya? ritelLegalitasUsahaLainnya,
  required int status,
}) {
  showModalBottomSheet(
    enableDrag: false,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    builder: (BuildContext context) {
      if (ritelLegalitasUsahaUtama != null) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LegalitasUsahaTypeFormatter.forOutput(
                          ritelLegalitasUsahaUtama.type!,
                        ),
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: CustomColor.primaryBlack80,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(
                          Icons.close,
                          color: CustomColor.primaryBlack80,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  LegalitasUsahaButton(
                    icon: Icons.edit,
                    label: 'Edit',
                    onPressed: () {
                      Navigator.of(context).pop();
                      vm.navigateToUpdateDokumen(
                        ritelLegalitasUsahaUtama: ritelLegalitasUsahaUtama,
                        ritelLegalitasUsahaLainnya: null,
                        status: status,
                      );
                    },
                  ),
                  LegalitasUsahaButton(
                    icon: Icons.download_sharp,
                    label: 'Download',
                    onPressed: () =>
                        vm.savePDFToDevice(ritelLegalitasUsahaUtama, null),
                  ),
                  if (status <= 2)
                    LegalitasUsahaButton(
                      icon: Icons.delete_rounded,
                      label: 'Hapus',
                      isLast: true,
                      onPressed: () {
                        Navigator.of(context).pop();
                        _buildModalHapusDokumen(
                          context: context,
                          viewModel: vm,
                          ritelLegalitasUsahaUtama: ritelLegalitasUsahaUtama,
                          ritelLegalitasUsahaLainnya: null,
                        );
                      },
                    ),
                ],
              ),
            ),
          ],
        );
      } else {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ritelLegalitasUsahaLainnya!.docName!,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: CustomColor.primaryBlack80,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(
                          Icons.close,
                          color: CustomColor.primaryBlack80,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  LegalitasUsahaButton(
                    icon: Icons.edit,
                    label: 'Edit',
                    onPressed: () {
                      Navigator.of(context).pop();
                      vm.navigateToUpdateDokumen(
                        ritelLegalitasUsahaUtama: null,
                        ritelLegalitasUsahaLainnya: ritelLegalitasUsahaLainnya,
                        status: status,
                      );
                    },
                  ),
                  LegalitasUsahaButton(
                    icon: Icons.download_sharp,
                    label: 'Download',
                    onPressed: () =>
                        vm.savePDFToDevice(null, ritelLegalitasUsahaLainnya),
                  ),
                  if (status <= 2)
                    LegalitasUsahaButton(
                      icon: Icons.delete_rounded,
                      label: 'Hapus',
                      isLast: true,
                      onPressed: () {
                        Navigator.of(context).pop();
                        _buildModalHapusDokumen(
                          context: context,
                          viewModel: vm,
                          ritelLegalitasUsahaUtama: null,
                          ritelLegalitasUsahaLainnya:
                              ritelLegalitasUsahaLainnya,
                        );
                      },
                    ),
                ],
              ),
            ),
          ],
        );
      }
    },
  );
}

/*void _buildModalTambahDokumen(
  BuildContext context,
  LegalitasUsahaViewModel vm,
) {
  showModalBottomSheet(
    enableDrag: false,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    builder: (context) {
      return Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tambah Dokumen Kredit',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: CustomColor.primaryBlack80,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.close,
                        color: CustomColor.primaryBlack80,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                LegalitasUsahaButton(
                  icon: Icons.image,
                  label: 'Galeri',
                  onPressed: () => vm.navigateToTambahDokumen(1),
                ),
                LegalitasUsahaButton(
                  icon: Icons.camera_alt,
                  label: 'Kamera',
                  onPressed: () => vm.navigateToTambahDokumen(2),
                ),
                LegalitasUsahaButton(
                  icon: Icons.folder,
                  label: 'File Manager',
                  isLast: true,
                  onPressed: () => vm.navigateToTambahDokumen(3),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}*/

Padding _buildTambahDokumenButton(
  BuildContext context,
  LegalitasUsahaViewModel vm,
) {
  return Padding(
    padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 16.h),
    child: CustomButton(
      label: 'Tambah Dokumen Kredit',
      radius: 8.r,
      isBusy: false,
      onPressed: () => vm.navigateToTambahDokumen(),
    ),
  );
}

Container _gridViewDokumenUtama(
  BuildContext context,
  LegalitasUsahaViewModel vm,
  int status,
  int codeTable,
) {
  return Container(
    padding: EdgeInsets.fromLTRB(12.w, 16.h, 12.w, 8.h),
    child: vm.ritelLegalitasUsaha!.mainDocument!.isEmpty
        ? Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: const Text('Tidak ada dokumen'),
            ),
          )
        : GridView.builder(
            itemCount: vm.ritelLegalitasUsaha!.mainDocument!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final data = vm.ritelLegalitasUsaha!.mainDocument![index];
              return ViewModelBuilder<LegalitasUsahaViewModel>.reactive(
                viewModelBuilder: () => LegalitasUsahaViewModel(
                  prakarsaId: vm.prakarsaId,
                  ritelPrakarsaPerorangan: vm.ritelPrakarsaPerorangan,
                  pipelineId: vm.pipelineId,
                  loanTypesId: vm.loanTypesId,
                  mainDocument: data,
                  codeTable: codeTable,
                ),
                onModelReady: (viewModel) async {
                  await viewModel.getPublicFileMain(data.path!);
                },
                builder: (context, viewModel, child) {
                  if (viewModel.mainDoc == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return TextButton(
                      onPressed: () => status <= 2
                          ? _buildModalAction(
                              context: context,
                              vm: viewModel,
                              ritelLegalitasUsahaUtama: data,
                              ritelLegalitasUsahaLainnya: null,
                              status: status,
                            )
                          : null,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            if (data.fileType == 'jpg' ||
                                data.fileType == 'png' ||
                                data.fileType == 'jpeg')
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Image.network(
                                    viewModel.mainDoc!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            else
                              Expanded(
                                child: Image.asset(
                                  IconConstants.pdf,
                                  scale: 1,
                                ),
                              ),
                            GestureDetector(
                              onTap: () => status <= 2
                                  ? _buildModalAction(
                                      context: context,
                                      vm: viewModel,
                                      ritelLegalitasUsahaUtama: data,
                                      ritelLegalitasUsahaLainnya: null,
                                      status: status,
                                    )
                                  : null,
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 13.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(width: 5.w),
                                          (data.fileType == 'jpg' ||
                                                  data.fileType == 'png' ||
                                                  data.fileType == 'jpeg')
                                              ? const Icon(
                                                  Icons.image_rounded,
                                                  color: Color(0xffD70C24),
                                                  size: 18,
                                                )
                                              : Image.asset(
                                                  IconConstants.pdf,
                                                  scale: 3,
                                                ),
                                          SizedBox(width: 5.w),
                                          Text(
                                            LegalitasUsahaTypeFormatter
                                                .forOutput(
                                              data.type!,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Image.asset(
                                      IconConstants.dotsVertical,
                                      color: Colors.black,
                                      scale: 2.8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              );
            },
          ),
  );
}

Container _listViewDokumenUtama(
  BuildContext context,
  LegalitasUsahaViewModel vm,
  int status,
  int codeTable,
) {
  return Container(
    padding: EdgeInsets.fromLTRB(12.w, 16.h, 12.w, 8.h),
    child: vm.ritelLegalitasUsaha!.mainDocument!.isEmpty
        ? Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: const Text('Tidak ada dokumen'),
            ),
          )
        : ListView.builder(
            itemCount: vm.ritelLegalitasUsaha!.mainDocument!.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final data = vm.ritelLegalitasUsaha!.mainDocument![index];
              return ViewModelBuilder<LegalitasUsahaViewModel>.reactive(
                viewModelBuilder: () => LegalitasUsahaViewModel(
                  prakarsaId: vm.prakarsaId,
                  ritelPrakarsaPerorangan: vm.ritelPrakarsaPerorangan,
                  pipelineId: vm.pipelineId,
                  loanTypesId: vm.loanTypesId,
                  mainDocument: data,
                  codeTable: codeTable,
                ),
                onModelReady: (viewModel) async {
                  await viewModel.getPublicFileMain(data.path!);
                },
                builder: (context, viewModel, child) {
                  if (viewModel.mainDoc == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return TextButton(
                      onPressed: () => status <= 2
                          ? _buildModalAction(
                              context: context,
                              vm: viewModel,
                              ritelLegalitasUsahaUtama: data,
                              ritelLegalitasUsahaLainnya: null,
                              status: status,
                            )
                          : null,
                      child: Container(
                        height: 100.w,
                        padding: EdgeInsets.all(14),
                        child: Row(
                          children: [
                            if (data.fileType == 'jpg' ||
                                data.fileType == 'png' ||
                                data.fileType == 'jpeg')
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    viewModel.mainDoc!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            else
                              Expanded(
                                child: Image.asset(
                                  IconConstants.pdf,
                                  scale: 1.2,
                                ),
                              ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 15.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LegalitasUsahaTypeFormatter.forOutput(
                                        data.type!,
                                      ),
                                      style: tsBody6,
                                    ),
                                    Text(
                                      data.dateOfDocument!,
                                      style: tsCaption2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              child: Image.asset(
                                IconConstants.dotsVertical,
                                color: Colors.black,
                                scale: 2,
                              ),
                              onTap: () => status <= 2
                                  ? _buildModalAction(
                                      context: context,
                                      vm: viewModel,
                                      ritelLegalitasUsahaUtama: data,
                                      ritelLegalitasUsahaLainnya: null,
                                      status: status,
                                    )
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              );
            },
          ),
  );
}

Container _gridViewDokumenLainnya(
  BuildContext context,
  LegalitasUsahaViewModel vm,
  int status,
  int codeTable,
) {
  return Container(
    padding: EdgeInsets.fromLTRB(12.w, 16.h, 12.w, 8.h),
    child: vm.ritelLegalitasUsaha!.additionalDocument!.isEmpty
        ? Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: const Text('Tidak ada dokumen'),
            ),
          )
        : GridView.builder(
            itemCount: vm.ritelLegalitasUsaha!.additionalDocument!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final data = vm.ritelLegalitasUsaha!.additionalDocument![index];
              return ViewModelBuilder<LegalitasUsahaViewModel>.reactive(
                viewModelBuilder: () => LegalitasUsahaViewModel(
                  prakarsaId: vm.prakarsaId,
                  ritelPrakarsaPerorangan: vm.ritelPrakarsaPerorangan,
                  pipelineId: vm.pipelineId,
                  loanTypesId: vm.loanTypesId,
                  additionalDocument: data,
                  codeTable: codeTable,
                ),
                onModelReady: (viewModel) async {
                  await viewModel.getPublicFileAdditional(data.path!);
                },
                builder: (context, viewModel, child) {
                  if (viewModel.isBusy) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (viewModel.additionalDoc == null) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 4.h),
                        child: const Text('Tidak ada dokumen'),
                      ),
                    );
                  } else {
                    return TextButton(
                      onPressed: () => status <= 2
                          ? _buildModalAction(
                              context: context,
                              vm: viewModel,
                              ritelLegalitasUsahaUtama: null,
                              ritelLegalitasUsahaLainnya: data,
                              status: status,
                            )
                          : null,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            if (data.fileType == 'jpg' ||
                                data.fileType == 'png' ||
                                data.fileType == 'jpeg')
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Image.network(
                                    viewModel.additionalDoc!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            else
                              Expanded(
                                child: Image.asset(
                                  IconConstants.pdf,
                                  scale: 1,
                                ),
                              ),
                            GestureDetector(
                              onTap: () => status <= 2
                                  ? _buildModalAction(
                                      context: context,
                                      vm: viewModel,
                                      ritelLegalitasUsahaUtama: null,
                                      ritelLegalitasUsahaLainnya: data,
                                      status: status,
                                      // path: data.path ?? '',
                                    )
                                  : null,
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 13.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(width: 5.w),
                                        (data.fileType == 'jpg' ||
                                                data.fileType == 'png' ||
                                                data.fileType == 'jpeg')
                                            ? const Icon(
                                                Icons.image_rounded,
                                                color: Color(0xffD70C24),
                                                size: 18,
                                              )
                                            : Image.asset(
                                                IconConstants.pdf,
                                                scale: 3,
                                              ),
                                        SizedBox(width: 5.w),
                                        SizedBox(
                                          width: 100.w,
                                          child: Text(
                                            data.docName!,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                      IconConstants.dotsVertical,
                                      color: Colors.black,
                                      scale: 2.8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              );
            },
          ),
  );
}

Container _listViewDokumenLainnya(
  BuildContext context,
  LegalitasUsahaViewModel vm,
  int status,
  int codeTable,
) {
  return Container(
    padding: EdgeInsets.fromLTRB(12.w, 16.h, 12.w, 8.h),
    child: vm.ritelLegalitasUsaha!.additionalDocument!.isEmpty
        ? Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: const Text('Tidak ada dokumen'),
            ),
          )
        : ListView.builder(
            itemCount: vm.ritelLegalitasUsaha!.additionalDocument!.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final data = vm.ritelLegalitasUsaha!.additionalDocument![index];
              return ViewModelBuilder<LegalitasUsahaViewModel>.reactive(
                viewModelBuilder: () => LegalitasUsahaViewModel(
                  prakarsaId: vm.prakarsaId,
                  ritelPrakarsaPerorangan: vm.ritelPrakarsaPerorangan,
                  pipelineId: vm.pipelineId,
                  loanTypesId: vm.loanTypesId,
                  additionalDocument: data,
                  codeTable: codeTable,
                ),
                onModelReady: (viewModel) async {
                  await viewModel.getPublicFileAdditional(data.path!);
                },
                builder: (context, viewModel, child) {
                  if (viewModel.additionalDoc == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return TextButton(
                      onPressed: () => status <= 2
                          ? _buildModalAction(
                              context: context,
                              vm: viewModel,
                              ritelLegalitasUsahaUtama: null,
                              ritelLegalitasUsahaLainnya: data,
                              status: status,
                            )
                          : null,
                      child: Container(
                        height: 100.w,
                        padding: EdgeInsets.all(14),
                        child: Row(
                          children: [
                            if (data.fileType == 'jpg' ||
                                data.fileType == 'png' ||
                                data.fileType == 'jpeg')
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    viewModel.additionalDoc!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            else
                              Expanded(
                                child: Image.asset(
                                  IconConstants.pdf,
                                  scale: 1.2,
                                ),
                              ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 15.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.docName!,
                                      style: tsBody6,
                                    ),
                                    // Text(
                                    //   data.,
                                    //   style: tsCaption2,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              child: Image.asset(
                                IconConstants.dotsVertical,
                                color: Colors.black,
                                scale: 2,
                              ),
                              onTap: () => status <= 2
                                  ? _buildModalAction(
                                      context: context,
                                      vm: vm,
                                      ritelLegalitasUsahaUtama: null,
                                      ritelLegalitasUsahaLainnya: data,
                                      status: status,
                                    )
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              );
            },
          ),
  );
}

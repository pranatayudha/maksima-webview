import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../application/app/app.locator.dart';
import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../application/app/constants/image_constants.dart';
import '../../../../../../application/services/url_launcher_service.dart';
import '../../../../../shared/styles.dart';
import '../pinjaman_detail_viewmodel.dart';

class DokumenPencairan extends HookViewModelWidget<PinjamanDetailViewModel> {
  const DokumenPencairan({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PinjamanDetailViewModel viewModel,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Lampiran Dokumen Pencairan',
            style: tsHeading8,
          ),
          SizedBox(height: 10.h),
          _buildDokumenItem(
            context,
            'Bukti Konfirmasi',
            viewModel.docConfirmPublicUrl ?? '',
            false,
          ),
          _buildDokumenItem(
            context,
            'Dokumen Underlying',
            viewModel.docUnderlyingPublicUrl ?? '',
            false,
          ),
          _buildDokumenItem(
            context,
            'Surat Permohonan Pencairan',
            viewModel.docSuratPermohonanPencairanPublicUrl ?? '',
            false,
          ),
          _buildDokumenItem(
            context,
            'Surat Pernyataan Debitur',
            viewModel.docSuratPernyataanDebiturPublicUrl ?? '',
            !(viewModel.pinjamanDetail?.disburse?.otherPayment ?? false),
          ),
          if (viewModel.pinjamanDetail?.disburse?.otherPayment ?? false)
            _buildDokumenItem(
              context,
              'Standing Instruction',
              viewModel.docStandingInstructionPublicUrl ?? '',
              true,
            ),
        ],
      ),
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
                    image.isEmpty ? 'Data belum Tersedia ' : 'Lihat',
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

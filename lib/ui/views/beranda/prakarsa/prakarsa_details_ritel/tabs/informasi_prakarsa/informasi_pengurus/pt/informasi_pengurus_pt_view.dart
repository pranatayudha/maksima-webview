import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../../../../shared/thick_light_grey_divider.dart';
import '../../../../../../../pipeline/pipeline_details/widgets/ritel_item_perusahaan.dart';
import '../informasi_pengurus_viewmodel.dart';

class PrakarsaInformasiPengurusPTView
    extends HookViewModelWidget<InformasiPengurusViewModel> {
  final currencyFormatter = NumberFormat('#,###', 'id_ID');

  PrakarsaInformasiPengurusPTView({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return ListView(
      children: [
        _buildInfoPengurusSection1(viewModel),
        const ThickLightGreyDivider(),
        _buildDokumenPengurusSection(context, viewModel),
      ],
    );
  }

  Widget _buildInfoPengurusSection1(InformasiPengurusViewModel viewModel) {
    final index = viewModel.informasiPengurusDataNavigatorIndex;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleAndSubtitle(
            'Nama Pengurus Sesuai KTP ',
            viewModel.ritelInformasiPengurusPT[index].fullName ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Posisi Pengurus',
            viewModel.ritelInformasiPengurusPT[index].jobDescription ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Nomor KTP Pengurus',
            viewModel.ritelInformasiPengurusPT[index].ktpNum ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Nomor NPWP',
            viewModel.ritelInformasiPengurusPT[index].npwpNum ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Jenis kelamin',
            viewModel.ritelInformasiPengurusPT[index].gender ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Tempat Lahir',
            viewModel.ritelInformasiPengurusPT[index].placeOfBirth ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Tanggal Lahir',
            viewModel.ritelInformasiPengurusPT[index].dateOfBirth != null
                ? DateStringFormatter.forOutputRitel(
                    viewModel.ritelInformasiPengurusPT[index].dateOfBirth!,
                  )
                : '-',
          ),
          _buildTitleAndSubtitle(
            'No. Handphone',
            viewModel.ritelInformasiPengurusPT[index].phoneNum ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Email',
            viewModel.ritelInformasiPengurusPT[index].email ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Tag Location Alamat Pengurus',
            viewModel.ritelInformasiPengurusPT[index].tagLocation?.name ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Alamat KTP',
            viewModel.ritelInformasiPengurusPT[index].detail ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Kode Pos',
            viewModel.ritelInformasiPengurusPT[index].postalCode ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Provinsi',
            viewModel.ritelInformasiPengurusPT[index].province ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Kota',
            viewModel.ritelInformasiPengurusPT[index].city ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Kecamatan',
            viewModel.ritelInformasiPengurusPT[index].district ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Kelurahan',
            viewModel.ritelInformasiPengurusPT[index].village ?? '-',
          ),
          _buildTitleAndSubtitle(
            'RW',
            viewModel.ritelInformasiPengurusPT[index].rw ?? '-',
          ),
          _buildTitleAndSubtitle(
            'RT',
            viewModel.ritelInformasiPengurusPT[index].rt ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Persentase Saham',
            viewModel.ritelInformasiPengurusPT[index].sharePercentage != null
                ? '${viewModel.ritelInformasiPengurusPT[index].sharePercentage}%'
                : '-',
          ),
          _buildTitleAndSubtitle(
            'Lembar Saham',
            viewModel.ritelInformasiPengurusPT[index].shares != null
                ? '${viewModel.ritelInformasiPengurusPT[index].shares} lembar'
                : '-',
          ),
          _buildTitleAndSubtitle(
            'Nominal',
            viewModel.ritelInformasiPengurusPT[index].shareNominal != null
                ? currencyFormatter.format(double.parse(
                    viewModel.ritelInformasiPengurusPT[index].shareNominal!,
                  ))
                : '-',
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

  Container _buildDokumenPengurusSection(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return Container(
      color: Colors.white,
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
          RitelItemPerusahaan(
            'Foto e-KTP',
            viewModel
                    .ritelInformasiPengurusPT[
                        viewModel.informasiPengurusDataNavigatorIndex]
                    .ktpPath ??
                '',
          ),
          RitelItemPerusahaan(
            'NPWP Pengurus',
            viewModel
                    .ritelInformasiPengurusPT[
                        viewModel.informasiPengurusDataNavigatorIndex]
                    .npwpPath ??
                '',
          ),
        ],
      ),
    );
  }
}

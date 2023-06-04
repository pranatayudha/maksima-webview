import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../application/app/constants/common.dart';
import '../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../application/helpers/education_string_formatter.dart';
import '../../../../../application/helpers/religion_string_formatter.dart';
import '../../../../shared/ritel_foto_item.dart';
import '../../../../shared/thick_light_grey_divider.dart';
import '../pipeline_details_viewmodel_pari.dart';
import 'pari_label_and_value.dart';

class PariDataDiriDetails
    extends HookViewModelWidget<PipelineDetailsViewModelPari> {
  const PariDataDiriDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PipelineDetailsViewModelPari viewModel,
  ) {
    return Stack(
      children: [
        viewModel.informasiDataDiri != null
            ? ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  const ThickLightGreyDivider(),
                  _buildInfoDataDiriSection(viewModel),
                  const ThickLightGreyDivider(),
                  _buildDokumenPeroranganSection(viewModel),
                ],
              )
            : const Center(child: Text('null')),
      ],
    );
  }

  // ignore: long-method
  Padding _buildInfoDataDiriSection(PipelineDetailsViewModelPari vm) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PariLabelAndValue(
            'Jenis Debitur',
            'Perorangan',
          ),
          PariLabelAndValue(
            'ID Account Pari',
            vm.setStringResponse(
              vm.informasiDataDiri?.idAccountPari ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Nama Lengkap Debitur Sesuai KTP',
            vm.setStringResponse(
              vm.informasiDataDiri?.fullName ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Nomor KTP Debitur',
            vm.setStringResponse(
              vm.informasiDataDiri?.ktpNum ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Tanggal KTP Terbit',
            vm.informasiDataDiri?.dateOfIssuedKTP != null
                ? DateStringFormatter.forOutputRitel(
                    vm.setStringResponse(
                      vm.informasiDataDiri!.dateOfIssuedKTP!,
                    ),
                  )
                : '-',
          ),
          PariLabelAndValue(
            'Nomor NPWP Debitur',
            vm.setStringResponse(
              vm.informasiDataDiri?.npwpNum ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Nomor KK Debitur',
            vm.setStringResponse(
              vm.informasiDataDiri?.kkNum ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Jumlah Tanggungan',
            vm.informasiDataDiri?.numberOfDependents != null
                ? vm.setStringResponse(
                    vm.informasiDataDiri!.numberOfDependents!.toString(),
                  )
                : '-',
          ),
          PariLabelAndValue(
            'Tempat Lahir',
            vm.setStringResponse(
              vm.informasiDataDiri?.placeOfBirth ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Tanggal Lahir',
            vm.setStringResponse(
              vm.informasiDataDiri?.dateOfBirth?.newDate ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Pendidikan Terakhir Debitur',
            EducationStringFormatter.forOutput(
              vm.setStringResponse(
                vm.informasiDataDiri?.lastEducation ?? '-',
              ),
            ),
          ),
          PariLabelAndValue(
            'Agama',
            ReligionStringFormatter.forOutput(
              vm.setStringResponse(
                vm.informasiDataDiri?.religion ?? '-',
              ),
            ),
          ),
          PariLabelAndValue(
            'Jenis Kelamin',
            vm.setStringResponse(
              vm.informasiDataDiri?.gender ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Nama Gadis Ibu Kandung',
            vm.setStringResponse(
              vm.informasiDataDiri?.motherMaiden ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Status Perkawinan',
            vm.setStringResponse(
              vm.informasiDataDiri?.maritalStatus ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Tag Location Alamat',
            vm.setStringResponse(
              vm.informasiDataDiri?.tagLocation?.name ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Detail Alamat',
            vm.setStringResponse(
              vm.informasiDataDiri?.detail ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Kode Pos',
            vm.setStringResponse(
              vm.informasiDataDiri?.postalCode ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Provinsi',
            vm.setStringResponse(
              vm.informasiDataDiri?.province ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Kota/Kabupaten',
            vm.setStringResponse(
              vm.informasiDataDiri?.city ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Kecamatan',
            vm.setStringResponse(
              vm.informasiDataDiri?.district ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Kelurahan',
            vm.setStringResponse(
              vm.informasiDataDiri?.village ?? '-',
            ),
          ),
          PariLabelAndValue(
            'RT',
            vm.setStringResponse(
              vm.informasiDataDiri?.rt ?? '-',
            ),
          ),
          PariLabelAndValue(
            'RW',
            vm.setStringResponse(
              vm.informasiDataDiri?.rw ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Nomor Handphone',
            vm.setStringResponse(
              vm.informasiDataDiri?.phoneNum ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Email',
            vm.setStringResponse(
              vm.informasiDataDiri?.email ?? '-',
            ),
          ),
          if (vm.informasiDataDiri!.maritalStatus! == Common.kawin)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PariLabelAndValue(
                  'Nomor KTP Pasangan',
                  vm.setStringResponse(
                    vm.informasiDataDiri?.spouseKtpNum ?? '-',
                  ),
                ),
                PariLabelAndValue(
                  'Nama Lengkap Pasangan',
                  vm.setStringResponse(
                    vm.informasiDataDiri!.spouseFullname ?? '-',
                  ),
                ),
                PariLabelAndValue(
                  'Tempat Lahir Pasangan',
                  vm.setStringResponse(
                    vm.informasiDataDiri!.spousePlaceOfBirth ?? '-',
                  ),
                ),
                PariLabelAndValue(
                  'Tanggal Lahir Pasangan',
                  vm.setStringResponse(
                    vm.informasiDataDiri?.spouseDateOfBirth?.newDate ?? '-',
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Padding _buildDokumenPeroranganSection(PipelineDetailsViewModelPari vm) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 0.h),
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
          RitelFotoItem('Foto E-KTP Debitur', vm.fotoKtpDebitur),
          RitelFotoItem('Foto Selfie Bersama E-KTP', vm.fotoKtpSelfie),
          RitelFotoItem('NPWP Debitur', vm.fotoNpwpDebitur),
          RitelFotoItem('Kartu Keluarga', vm.fotoKartuKeluargaDebitur),
          if (vm.informasiDataDiri!.maritalStatus! == Common.kawin)
            Column(
              children: [
                RitelFotoItem('Foto E-KTP Pasangan', vm.fotoKtpPasangan),
                RitelFotoItem('Akta Nikah', vm.fotoAktaNikah),
              ],
            )
          else if (vm.informasiDataDiri!.maritalStatus! == Common.ceraiHidup)
            RitelFotoItem('Akta Cerai', vm.fotoAktaCerai)
          else if (vm.informasiDataDiri!.maritalStatus! == Common.ceraiMati)
            RitelFotoItem('Sertifikat Kematian', vm.suratKematian),
        ],
      ),
    );
  }
}

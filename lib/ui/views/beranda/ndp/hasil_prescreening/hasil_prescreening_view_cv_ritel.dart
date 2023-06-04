// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../application/app/constants/custom_color.dart';
import '../../../../../application/app/constants/image_constants.dart';
import '../../../../shared/app_bar_widget_close.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/styles.dart';
import '../../../../shared/thick_light_grey_divider.dart';
import 'detail_prescreening_button.dart';
import 'dhn_dhib/dhn_view_ritel.dart';
import 'dukcapil/dukcapil_view_ritel.dart';
import 'hasil_prescreening_viewmodel_ritel.dart';
import 'lpg_ritel/lpg_view_ritel.dart';
import 'slik/slik_view_ritel.dart';

class HasilPrescreeningViewPerusahaanCVRitel
    extends ViewModelBuilderWidget<HasilPrescreeningViewModelRitel> {
  final String pipelineFlagId;
  final String codeTable;
  final bool fromPrakarsaDetails;

  const HasilPrescreeningViewPerusahaanCVRitel({
    Key? key,
    required this.pipelineFlagId,
    required this.codeTable,
    this.fromPrakarsaDetails = true,
  }) : super(key: key);

  @override
  HasilPrescreeningViewModelRitel viewModelBuilder(BuildContext context) =>
      HasilPrescreeningViewModelRitel(
        pipelineflagId: pipelineFlagId,
        codeTable: int.parse(codeTable),
      );

  @override
  Widget builder(
    BuildContext context,
    HasilPrescreeningViewModelRitel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidgetClose.titleWithBackButton(
        title: 'Hasil Pre-Screening',
        onBackButtonTapped: () => Navigator.pop(context),
      ),
      body: viewModel.isBusy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                  child: Text(
                    'Berikut adalah hasil dari Pre-Screening yang telah dilakukan untuk debitur:',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                  ),
                ),
                _funcProfilePerusahaan(context, viewModel, fromPrakarsaDetails),
                Container(
                  padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
                  child: Text(
                    'DETAIL PRE-SCREENING',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5.w,
                      color: CustomColor.primaryBlack.withOpacity(0.9),
                    ),
                  ),
                ),
                _funcListResultPrescreeningPerusahaan(context, viewModel),
                ThickLightGreyDivider(),
                for (var i = 1;
                    i < viewModel.listPengurus['summaryScreening'].length;
                    i++)
                  Column(
                    children: [
                      _funcListResultPrescreeningPengurusCV(
                        context,
                        viewModel.listPengurus['summaryScreening'][i],
                        pipelineFlagId,
                        int.parse(codeTable),
                      ),
                      ThickLightGreyDivider(),
                    ],
                  ),
                if (viewModel.ritelHasilPrescreeningHeaderCV.resultScreening ==
                    'Pre-Screening Ditolak')
                  _buildButtonDeletePreScreening(context, viewModel),
              ],
            ),
    );
  }
}

Container _funcProfilePerusahaan(
  BuildContext context,
  HasilPrescreeningViewModelRitel vm,
  bool fromPrakarsaDetails,
) {
  return Container(
    padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 11.h),
    color: Colors.grey.shade200,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          margin: EdgeInsets.only(bottom: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: const [subtleBoxShadows],
          ),
          child: Column(
            children: [
              Text(
                vm.ritelHasilPrescreeningHeaderCV.titlePipeline!,
                style: tsHeading8,
              ),
              SizedBox(height: 4.h),
              Text(
                'Nomor NPWP: ${vm.ritelHasilPrescreeningHeaderCV.npwpNumb}',
                style: tsCaption1,
              ),
            ],
          ),
        ),
        if (vm.ritelHasilPrescreeningHeaderCV.resultScreening == 'DITOLAK' ||
            vm.ritelHasilPrescreeningHeaderCV.resultScreening ==
                'Pre-Screening Ditolak') ...[
          _funcStatusPrescreeningDitolak(),
          _funcStatusPrescreeningDitolakDescription(),
        ],
        if (vm.ritelHasilPrescreeningHeaderCV.resultScreening == 'LOLOS')
          _funcStatusPrescreeningLolos(context, vm, fromPrakarsaDetails),
        if (vm.ritelHasilPrescreeningHeaderCV.resultScreening == 'N/A')
          _funcPrescreeningNA(vm),
      ],
    ),
  );
}

// ignore: long-method
Container _funcListResultPrescreeningPengurusCV(
  BuildContext context,
  dynamic data,
  String id,
  int codeTable,
) {
  return Container(
    padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data['data']['name'],
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5.w,
            color: CustomColor.primaryBlack.withOpacity(0.9),
          ),
        ),
        SizedBox(height: 16.h),
        DetailPrescreeningButton(
          label: 'Dukcapil',
          description: data['data']['dukcapil']['status'],
          color: data['data']['dukcapil']['status'] == 'Lolos'
              ? Colors.green
              : CustomColor.secondaryRed80,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (builder) => DukcapilViewRitel(
                id: id,
                mgmt: int.parse(data['mgmt']),
                prescreening: data['data']['dukcapil']['status'],
                summaryDebiturKtpNumber: data['data']['dukcapil']['reason'][0],
                summaryDebiturName: data['data']['dukcapil']['reason'][1],
                summaryDebiturPlaceOfBirth: data['data']['dukcapil']['reason']
                    [2],
                summaryDebiturBirthDate: data['data']['dukcapil']['reason'][3],
                summaryDebiturKtpPhoto: data['data']['dukcapil']['reason'][4],
                codeTable: codeTable,
              ),
            ),
          ),
        ),
        DetailPrescreeningButton(
          label: 'SLIK',
          description: data['data']['slik']['status'],
          color: data['data']['slik']['status'] == 'Lolos'
              ? Colors.green
              : CustomColor.secondaryRed80,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (builder) => SlikViewRitel(
                name: data['data']['name'],
                prescreening: data['data']['slik']['status'],
                url: data['data']['slik']['path'] != null
                    ? data['data']['slik']['path']!
                    : '',
              ),
            ),
          ),
        ),
        DetailPrescreeningButton(
          label: 'DHN',
          description: data['data']['dhn']['status'],
          color: data['data']['dhn']['status'] == 'Lolos'
              ? Colors.green
              : CustomColor.secondaryRed80,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (builder) => DHNViewRitel(
                prescreening: data['data']['dhn']['status'],
                name: data['data']['name'],
              ),
            ),
          ),
          endSection: true,
        ),
        if (data['spouseData'] != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['spouseData']['name'],
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5.w,
                  color: CustomColor.primaryBlack.withOpacity(0.9),
                ),
              ),
              SizedBox(height: 16.h),
              DetailPrescreeningButton(
                label: 'Dukcapil',
                description: data['spouseData']['dukcapil']['status'],
                color: data['spouseData']['dukcapil']['status'] == 'Lolos'
                    ? Colors.green
                    : CustomColor.secondaryRed80,
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => DukcapilViewRitel(
                      id: id,
                      mgmt: int.parse(data['mgmt']),
                      prescreening: data['spouseData']['dukcapil']['status'],
                      summarySpouseKtpNumber: data['spouseData']['dukcapil']
                          ['reason'][0],
                      summarySpouseName: data['spouseData']['dukcapil']
                          ['reason'][1],
                      summarySpousePlaceOfBirth: data['spouseData']['dukcapil']
                          ['reason'][2],
                      summarySpouseBirthDate: data['spouseData']['dukcapil']
                          ['reason'][3],
                      summarySpouseKtpPhoto: data['spouseData']['dukcapil']
                          ['reason'][4],
                      codeTable: codeTable,
                    ),
                  ),
                ),
              ),
              DetailPrescreeningButton(
                label: 'SLIK',
                description: data['spouseData']['slik']['status'],
                color: data['spouseData']['slik']['status'] == 'Lolos'
                    ? Colors.green
                    : CustomColor.secondaryRed80,
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => SlikViewRitel(
                      name: data['spouseData']['name'],
                      prescreening: data['spouseData']['slik']['status'],
                      url: data['spouseData']['slik']['path'] != null
                          ? data['spouseData']['slik']['path']!
                          : '',
                    ),
                  ),
                ),
              ),
              DetailPrescreeningButton(
                label: 'DHN',
                description: data['spouseData']['dhn']['status'],
                color: data['spouseData']['dhn']['status'] == 'Lolos'
                    ? Colors.green
                    : CustomColor.secondaryRed80,
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => DHNViewRitel(
                      prescreening: data['spouseData']['dhn']['status'],
                      name: data['spouseData']['name'],
                    ),
                  ),
                ),
                endSection: true,
              ),
            ],
          ),
      ],
    ),
  );
}

// Container _funcListResultPrescreeningPengurusPT() {
//   return Container(
//     padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           '[nama-pengurus_1]',
//           style: TextStyle(
//             fontSize: 14.sp,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 0.5.w,
//             color: CustomColor.primaryBlack.withOpacity(0.9),
//           ),
//         ),
//         SizedBox(height: 16.h),
//         DetailPrescreeningButton(
//           label: 'Dukcapil',
//           description: 'Lolos',
//           color: 2.isEven ? Colors.green : CustomColor.secondaryRed80,
//           onPressed: () {},
//         ),
//         DetailPrescreeningButton(
//           label: 'SLIK',
//           description: 'Lolos',
//           color: 2.isEven ? Colors.green : CustomColor.secondaryRed80,
//           onPressed: () {},
//         ),
//         DetailPrescreeningButton(
//           label: 'DHN',
//           description: 'Lolos',
//           color: 2.isEven ? Colors.green : CustomColor.secondaryRed80,
//           onPressed: () {},
//           endSection: true,
//         ),
//       ],
//     ),
//   );
// }

Container _funcListResultPrescreeningPerusahaan(
  BuildContext context,
  HasilPrescreeningViewModelRitel vm,
) {
  final nameProfile = vm.listPengurus['summaryScreening'][0]['data'];
  // ignore: newline-before-return
  return Container(
    padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nameProfile['name'],
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5.w,
            color: CustomColor.primaryBlack.withOpacity(0.9),
          ),
        ),
        SizedBox(height: 16.h),
        DetailPrescreeningButton(
          label: 'LPG',
          description: nameProfile['lpg']['status'],
          color: nameProfile['lpg']['status'] == 'Lolos'
              ? Colors.green
              : CustomColor.secondaryRed80,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (builder) => LPGViewRitel(
                prescreening: nameProfile['lpg']['status'],
                name: nameProfile['name'],
              ),
            ),
          ),
        ),
        DetailPrescreeningButton(
          label: 'SLIK',
          description: nameProfile['slik']['status'],
          color: nameProfile['slik']['status'] == 'Lolos'
              ? Colors.green
              : CustomColor.secondaryRed80,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (builder) => SlikViewRitel(
                name: nameProfile['name'],
                prescreening: nameProfile['slik']['status'],
                url: nameProfile['slik']['path'] ?? '',
              ),
            ),
          ),
        ),
        DetailPrescreeningButton(
          label: 'DHN',
          description: nameProfile['dhn']['status'],
          color: nameProfile['dhn']['status'] == 'Lolos'
              ? Colors.green
              : CustomColor.secondaryRed80,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (builder) => DHNViewRitel(
                prescreening: nameProfile['dhn']['status'],
                name: nameProfile['name'],
              ),
            ),
          ),
          endSection: true,
        ),
      ],
    ),
  );
}

Container _funcStatusPrescreeningLolos(
  BuildContext context,
  HasilPrescreeningViewModelRitel vm,
  bool fromPrakarsaDetails,
) {
  return Container(
    padding: EdgeInsets.fromLTRB(
      16.w,
      18.h,
      16.w,
      20.h,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: const [subtleBoxShadows],
    ),
    child: Column(
      children: [
        Text(
          'Hasil Pre-Screening'.toUpperCase(),
          style: tsCaption1,
        ),
        SizedBox(height: 4.h),
        Text(
          vm.ritelHasilPrescreeningHeaderCV.resultScreening!.toUpperCase(),
          style: tsHeading5SecondaryGreen,
        ),
        if (fromPrakarsaDetails)
          Column(
            children: [
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: CustomButton(
                  label: 'LANJUT PRAKARSA',
                  onPressed: () => _buildLanjutPrakarsa(
                    context,
                    vm,
                  ),
                  isBusy: false,
                ),
              ),
            ],
          ),
      ],
    ),
  );
}

void _buildLanjutPrakarsa(
  BuildContext context,
  HasilPrescreeningViewModelRitel viewModel,
) {
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
                  ImageConstants.dokumenProcess,
                  scale: 3,
                ),
                SizedBox(height: 16.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Data ${viewModel.ritelHasilPrescreeningHeaderCV.titlePipeline} akan dikirim ke menu Prakarsa',
                      style: tsHeading8,
                    ),
                    SizedBox(height: 8.h),
                    AutoSizeText(
                      'Bila dilanjutkan proses tidak dapat dibatalkan',
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
                            label: 'Lanjut',
                            onPressed: () => {
                              Navigator.of(context).pop(),
                              viewModel.sendToPrakarsa(),
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

Container _funcStatusPrescreeningDitolakDescription() {
  return Container(
    padding: EdgeInsets.fromLTRB(
      16.w,
      18.h,
      16.w,
      20.h,
    ),
    margin: const EdgeInsets.only(bottom: 0),
    height: 93.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(12.r),
        bottomRight: Radius.circular(12.r),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Debitur yang diajukan belum memenuhi syarat prakarsa pinjaman. Anda dapat memprakarsai kembali dalam waktu 1 minggu.',
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: const Color.fromRGBO(
              22,
              43,
              58,
              0.6,
            ),
          ),
        ),
      ],
    ),
  );
}

Container _funcStatusPrescreeningDitolak() {
  return Container(
    padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
    height: 32.h,
    decoration: BoxDecoration(
      color: const Color.fromRGBO(
        242,
        63,
        63,
        0.4,
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12.r),
        topRight: Radius.circular(12.r),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Pre-Screening Ditolak',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(
              218,
              23,
              23,
              0.8,
            ),
          ),
        ),
      ],
    ),
  );
}

Container _funcPrescreeningNA(HasilPrescreeningViewModelRitel viewModel) {
  return Container(
    padding: EdgeInsets.fromLTRB(
      16.w,
      18.h,
      16.w,
      20.h,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: const [subtleBoxShadows],
    ),
    child: Column(
      children: [
        Text(
          'Hasil Pre-Screening',
          style: tsCaption1.copyWith(fontSize: 14.sp),
        ),
        SizedBox(height: 4.h),
        Text(
          'N/A'.toUpperCase(),
          style: TextStyle(
            color: const Color(0xffF49300),
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: CustomButton(
            label: 'Kirim Kembali Prescreening',
            onPressed: viewModel.runPrescreeningPTCV,
            isBusy: false,
          ),
        ),
      ],
    ),
  );
}

Container _buildButtonDeletePreScreening(
  BuildContext context,
  HasilPrescreeningViewModelRitel viewModel,
) {
  return Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.only(top: 18),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(12),
        topLeft: Radius.circular(12),
      ),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(40, 41, 61, 0.08),
          blurRadius: 8,
          offset: Offset(0, 2),
        ),
        BoxShadow(
          color: Color.fromRGBO(96, 97, 112, 0.24),
          blurRadius: 32,
          offset: Offset(0, 20),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomButton(
            label: 'Hapus Data',
            color: const Color(0xffD70C24),
            onPressed: () => _buildPopUpDelete(context, viewModel),
            isBusy: false,
          ),
        ),
      ],
    ),
  );
}

void _buildPopUpDelete(
  BuildContext context,
  HasilPrescreeningViewModelRitel vm,
) {
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
                  ImageConstants.trash, // Dicari kembali non finansialnya
                  scale: 3,
                ),
                SizedBox(height: 16.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Hapus data ${vm.ritelHasilPrescreeningHeaderCV.titlePipeline}',
                      style: tsHeading8,
                    ),
                    SizedBox(height: 8.h),
                    AutoSizeText(
                      'Data akan dihapus dari pipeline dan diarsipkan',
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
                            label: 'Hapus Data',
                            color: Color(0xffD70C24),
                            onPressed: () => vm.deleteScreening(context),
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

// ignore_for_file: library_private_types_in_public_api

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../application/app/constants/image_constants.dart';
import '../../../../../../../../../application/services/local_db_service.dart';
import '../../../../../../../../shared/custom_button.dart';
import '../../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../../shared/styles.dart';
import '../../../../../../../../shared/thick_light_grey_divider.dart';
import '../informasi_non_finansial_viewmodel.dart';
import 'informasi_non_finansial_page_1_A.dart';

class SummaryNonFinansial extends StatefulWidget {
  final String prakarsaId;
  final String name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const SummaryNonFinansial({
    Key? key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  _SummaryNonFinansialState createState() => _SummaryNonFinansialState();
}

class _SummaryNonFinansialState extends State<SummaryNonFinansial> {
  final MaksimaLocalDBService _localDBService =
      locator<MaksimaLocalDBService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InformasiNonFinansialViewModel>.reactive(
      viewModelBuilder: () => InformasiNonFinansialViewModel(
        prakarsaId: widget.prakarsaId,
        name: widget.name,
        pipelineId: widget.pipelineId,
        loanTypesId: widget.loanTypesId,
        codeTable: widget.codeTable,
      ),
      builder: (context, vm, child) {
        final getName = _localDBService.ritelGetPrakarsaId('name');
        final getId = _localDBService.ritelGetPrakarsaId('id');
        final values = _localDBService.getAllValuesNonFinansial();

        // Modal muncul ketika submit di tekan
        void buildLanjutSummaryPrakarsa() {
          showModalBottomSheet(
            isScrollControlled: true,
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
                        SizedBox(height: 8.h),
                        Container(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Image.asset(
                              IconConstants
                                  .x, // Dicari kembali non finansialnya
                              scale: 2.5,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Image.asset(
                          ImageConstants
                              .nonFinansial, // Dicari kembali non finansialnya
                          scale: 3,
                        ),
                        SizedBox(height: 16.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Informasi Non Finansial Selesai',
                              style: tsHeading6,
                            ),
                            SizedBox(height: 8.h),
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: AutoSizeText(
                                'Dengan menekan tombol selesai, maka Informasi Non Finansial Calon Debitur tidak dapat diubah dan selesai.',
                                style: TextStyle(
                                  height: 2,
                                  fontSize: 14.sp,
                                  color: const Color(0xff66788A),
                                ),
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    labelColor: const Color(0xff027DEF),
                                    label: 'Batalkan',
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    isOutlineButton: true,
                                    isBusy: false,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: CustomButton(
                                    label: 'Submit',
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      vm.postNonFinansialData();
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

        // Button Fix di bawah page
        Align buildButton() {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      isBusy: false,
                      labelColor: const Color(0xff07539A),
                      color: const Color(0xff027DEF),
                      labelSize: 18,
                      label: 'Edit',
                      isOutlineButton: true,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: CustomButton(
                      isBusy: false,
                      radius: 8.r,
                      label: 'Submit',
                      onPressed: () => buildLanjutSummaryPrakarsa(),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        // component list jawaban
        Container buildRingkasanFasilitasItem(String label, String value) {
          return Container(
            margin: EdgeInsets.only(bottom: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200.w,
                  child: AutoSizeText(
                    label,
                    style: tsDarkGrey,
                    maxLines: 3,
                  ),
                ),
                Text(value, style: tsHeading10Black80),
              ],
            ),
          );
        }

        // Modal muncuk ketika klik back arrow
        Future showDialogWhenBack(context) {
          return showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: Material(
                  type: MaterialType.transparency,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImageConstants.headerBg2),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 60,
                        child: Text(
                          'Informasi!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(19),
                            bottomRight: Radius.circular(10),
                          ),
                          color: Color(0xffF6F6F8),
                        ),
                        padding: const EdgeInsets.all(16),
                        height: 90.h,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          children: [
                            Text(
                              'Apa anda yakin untuk kembali ?',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Text(
                                    'Kembali',
                                    style: TextStyle(
                                      color: CustomColor.darkGrey,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                GestureDetector(
                                  onTap: () {
                                    vm.backToPrakarsa();
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (builder) =>
                                            InformasiNonFinasialPageOneA(
                                          name: getName!,
                                          prakarsaId: getId!,
                                          pipelineId: widget.pipelineId,
                                          loanTypesId: widget.loanTypesId,
                                          codeTable: widget.codeTable,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Yakin',
                                    style: TextStyle(
                                      color: const Color(0xff027DEF),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }

        var key = 'answer';
        // ignore: newline-before-return
        return NetworkSensitive(
          child: WillPopScope(
            onWillPop: () async {
              if (!vm.isAfterSubmit) {
                showDialogWhenBack(context);
              } else {
                vm.backToPrakarsa();
                vm.navigateToInfoPrakarsa();
              }

              return true;
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0,
                centerTitle: true,
                shadowColor: Colors.transparent,
                title: Text(
                  'Summary',
                  style: tsHeading6,
                ),
                leadingWidth: 30.w,
                leading: Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: const Color(0xff606060),
                      size: 24.sp,
                    ),
                    onPressed: !vm.isAfterSubmit
                        ? () => showDialogWhenBack(context)
                        : () {
                            vm.backToPrakarsa();
                            vm.navigateToInfoPrakarsa();
                          },
                  ),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(16.w, 16.h, 28.w, 10.h),
                          child: Text(
                            'Berikut adalah hasil yang didapatkan dari input non finansial:',
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.black),
                          ),
                        ),
                        // Container(
                        //   padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                        //   child: SizedBox(
                        //     width: 328.w,
                        //     height: 80.h,
                        //     child: Card(
                        //         color: const Color(0xffF6F6F8),
                        //         child: Column(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           children: [
                        //             Text(
                        //               'Total Non Finansial',
                        //               style: tsHeading12,
                        //               textAlign: TextAlign.center,
                        //             ),
                        //             SizedBox(height: 5.h),
                        //             Text(
                        //               '600',
                        //               style: tsHeadingSecondaryBlack,
                        //               textAlign: TextAlign.center,
                        //             ),
                        //           ],
                        //         )),
                        //   ),
                        // ),
                        const ThickLightGreyDivider(),
                        Container(
                          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1. Karakter',
                                style: tsHeading10,
                              ),
                              SizedBox(height: 16.h),
                              buildRingkasanFasilitasItem(
                                'Tingkat Kepercayaan',
                                values[0]['answer'].toString(),
                              ),
                              buildRingkasanFasilitasItem(
                                'Pengelolaan Rekening Bank',
                                values[1]['answer'].toString(),
                              ),
                              buildRingkasanFasilitasItem(
                                'Reputasi Bisnis',
                                values[2]['answer'].toString(),
                              ),
                              buildRingkasanFasilitasItem(
                                'Perilaku Pribadi Debitur',
                                values[3]['answer'].toString(),
                              ),
                            ],
                          ),
                        ),
                        const ThickLightGreyDivider(),
                        Container(
                          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '2. Posisi Pasar',
                                style: tsHeading10,
                              ),
                              SizedBox(height: 16.h),
                              buildRingkasanFasilitasItem(
                                'Kualitas Produk/Jasa',
                                values[4]['answer'].toString(),
                              ),
                              buildRingkasanFasilitasItem(
                                'Strategi dan Ketergantungan',
                                values[5]['answer'].toString(),
                              ),
                              buildRingkasanFasilitasItem(
                                'Lokasi Usaha',
                                values[6]['answer'].toString(),
                              ),
                            ],
                          ),
                        ),
                        const ThickLightGreyDivider(),
                        Container(
                          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '3. Situasi Persaingan',
                                style: tsHeading10,
                              ),
                              SizedBox(height: 16.h),
                              buildRingkasanFasilitasItem(
                                'Perkembangan pasar, peluang mendapatkan laba dan persaingan',
                                values[7]['answer'].toString(),
                              ),
                            ],
                          ),
                        ),
                        const ThickLightGreyDivider(),
                        Container(
                          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '4. Manajemen',
                                style: tsHeading10,
                              ),
                              SizedBox(height: 16.h),
                              buildRingkasanFasilitasItem(
                                'Kualifikasi Komersial',
                                values[8]['answer'].toString(),
                              ),
                              buildRingkasanFasilitasItem(
                                'Kualifikasi Teknis',
                                values[9]['answer'].toString(),
                              ),
                              buildRingkasanFasilitasItem(
                                'Struktur Internal Perusahaan',
                                values[10]['answer'].toString(),
                              ),
                            ],
                          ),
                        ),
                        const ThickLightGreyDivider(),
                        Container(
                          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '5. Prospek Industri',
                                style: tsHeading10,
                              ),
                              SizedBox(height: 16.h),
                              buildRingkasanFasilitasItem(
                                'Prospek Industri',
                                values[11]['answer'].toString(),
                              ),
                            ],
                          ),
                        ),
                        const ThickLightGreyDivider(),
                        Container(
                          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '6. Jaminan',
                                style: tsHeading10,
                              ),
                              SizedBox(height: 16.h),
                              buildRingkasanFasilitasItem(
                                'Coverage Agunan',
                                values[12]['answer'].toString(),
                              ),
                              buildRingkasanFasilitasItem(
                                'Hubungan Kepemilikan Agunan dengan Debitur',
                                values[13]['answer'].toString(),
                              ),
                              buildRingkasanFasilitasItem(
                                'Marketabilitas Agunan',
                                values[14][key].toString(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!vm.isAfterSubmit) buildButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

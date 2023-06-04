import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../application/models/ritel_prakarsa_info_prakarsa_header.dart';
import '../../../../../../../application/models/ritel_prakarsa_perorangan.dart';
import '../../../../../../../application/models/ritel_prakarsa_status_pengajuan_body.dart';
import '../informasi_prakarsa/informasi_revisi/revisi_detail_view.dart';
import 'status_pengajuan_viewmodel.dart';
import 'widgets/task_item.dart';
import 'widgets/task_item_revisi.dart';

class StatusPengajuan extends ViewModelBuilderWidget<StatusPengajuanViewModel> {
  final String prakarsaId;
  final String? pipelineId;
  final RitelPrakarsaInfoPrakarsaHeader header;
  final RitelPrakarsaStatusPengajuanBodyPTR statusPengajuan;
  final RitelPrakarsaPerorangan prakarsaPerorangan;
  final int loanTypesId;
  final int codeTable;
  final int approvalStep;

  const StatusPengajuan({
    Key? key,
    required this.prakarsaId,
    this.pipelineId,
    required this.header,
    required this.statusPengajuan,
    required this.prakarsaPerorangan,
    required this.loanTypesId,
    required this.codeTable,
    required this.approvalStep,
  }) : super(key: key);

  @override
  StatusPengajuanViewModel viewModelBuilder(BuildContext context) =>
      StatusPengajuanViewModel(
        header: header,
        prakarsaId: prakarsaId,
        pipelineId: pipelineId,
        prakarsaPerorangan: prakarsaPerorangan,
        loanTypesId: loanTypesId,
        codeTable: codeTable,
      );

  @override
  Widget builder(
    BuildContext context,
    StatusPengajuanViewModel viewModel,
    Widget? child,
  ) {
    return Container(
      color: Colors.white,
      child: viewModel.isBusy
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: EdgeInsets.fromLTRB(18.75.w, 23.h, 18.75.w, 23.h),
              shrinkWrap: true,
              children: [
                TaskItem(
                  task: 'Isi Pre-Screening Nasabah',
                  currentTask: statusPengajuan.pre_screening_approved!,
                  statusDone: statusPengajuan.pre_screening_approved,
                  isFailed: false,
                ),
                _buildPreScreeningDisetujui(viewModel),
                _buildStepperIsiAnalisaPinjamanNasabah(viewModel),
                _buildStepperHasilAnalisaPinjaman(viewModel),
                // STEPPER STATUS PENGAJUAN REVISI ADK - NANDA HASYIM
                if ((statusPengajuan.revisi ?? []).length > 0)
                  for (var i = 0; i < statusPengajuan.revisi.length; i++)
                    _buildStepperRevisi(i, context),
                _buildStepperVerifikasiADK(),
                // kredit blom dipilih ketika approval step = 1
                if (approvalStep == 1)
                  const TaskItem(
                    task: 'Putusan Kredit',
                    currentTask: 0,
                    statusDone: 0,
                    isFailed: false,
                  ),
                if (approvalStep == 3 || approvalStep == 4) ...[
                  _buildStepperVerifikasiCBL(),
                  _buildStepperPutusanPusat(viewModel),
                ],
                if (codeTable == 4 || approvalStep == 2)
                  _buildStepperPutusanCBL(),
                _buildStepperOfferingLetter(),
                _buildStepperAkadKredit(),
                _buildStepperFasilitas(),
              ],
            ),
    );
  }

  TaskItem _buildPreScreeningDisetujui(StatusPengajuanViewModel viewModel) {
    return TaskItem(
      task: 'Pre-Screening Disetujui',
      description: 'Pre-Screening Perusahaan telah disetujui',
      textButtonLabel: 'Lihat Hasil Pre-Screening',
      onTextButtonLabelPressed: viewModel.navigateToHasilPreScreening,
      currentTask: statusPengajuan.pre_screening_approved!,
      //viewModel.preScreeningCurrentTask,
      statusDone: statusPengajuan.pre_screening_approved,
      isFailed: false,
      forceVisibleTextButton: true,
      hasDescription: true,
    );
  }

  TaskItem _buildStepperIsiAnalisaPinjamanNasabah(
    StatusPengajuanViewModel viewModel,
  ) {
    return TaskItem(
      task: 'Isi Analisa Pinjaman Nasabah',
      textButtonLabel: statusPengajuan.analisa_pinjaman_nasabah == 1
          ? 'Lengkapi Informasi Prakarsa'
          : '',
      onTextButtonLabelPressed: statusPengajuan.analisa_pinjaman_nasabah == 1
          ? viewModel.navigateToInfoPrakarsa
          : null,
      currentTask: statusPengajuan.analisa_pinjaman_nasabah!,
      statusDone: statusPengajuan.analisa_pinjaman_nasabah,
      isFailed: false,
      forceVisibleTextButton:
          statusPengajuan.analisa_pinjaman_nasabah == 1 ? true : false,
    );
  }

  TaskItem _buildStepperFasilitas() {
    return TaskItem(
      task: 'Proses Pembuatan Fasilitas',
      currentTask: statusPengajuan.proses_pembuatan_fasilitas!,
      //viewModel.prosesPembuatanFasilitasCurrentTask,
      statusDone: statusPengajuan.proses_pembuatan_fasilitas,
      isFailed: statusPengajuan.proses_pembuatan_fasilitas == 3 ? true : false,
      isLast: true,
    );
  }

  TaskItem _buildStepperAkadKredit() {
    return TaskItem(
      task: 'Proses Akad Kredit',
      currentTask: statusPengajuan
          .proses_akad_kredit!, // viewModel.prosesAkadKreditCurrentTask,
      statusDone: statusPengajuan.proses_akad_kredit,
      isFailed: false,
    );
  }

  TaskItem _buildStepperOfferingLetter() {
    return TaskItem(
      task: statusPengajuan.offering_debitur == 3
          ? 'Offering Letter Ditolak'
          : 'Offering Debitur',
      currentTask: statusPengajuan
          .offering_debitur!, //viewModel.offeringDebiturCurrentTask,
      statusDone: statusPengajuan.offering_debitur,
      isFailed: statusPengajuan.offering_debitur == 3 ? true : false,
    );
  }

  TaskItem _buildStepperPutusanCBL() {
    return TaskItem(
      task: statusPengajuan.putusan_kredit_CBL!.status == 3
          ? 'Pemutus Menolak Memberikan Kredit'
          : 'Putusan Kredit oleh CBL',
      description: statusPengajuan.putusan_kredit_CBL!.status == 2 ||
              statusPengajuan.putusan_kredit_CBL!.status == 3
          ? statusPengajuan.putusan_kredit_CBL!.arguments ?? 'Disetujui'
          : 'Dokumen sedang dalam proses verifikasi oleh CBL. Sistem akan menginformasikan jika proses telah selesai',
      textButtonLabel: statusPengajuan.putusan_kredit_CBL!.status == 2
          ? 'Telah diverifikasi oleh CBL'
          : null,
      // ignore: no-empty-block
      onTextButtonLabelPressed: () {},
      currentTask: statusPengajuan.putusan_kredit_CBL!.status!,
      statusDone: statusPengajuan.putusan_kredit_CBL!.status,
      isFailed: statusPengajuan.putusan_kredit_CBL!.status == 3 ? true : false,
      forceVisibleTextButton:
          statusPengajuan.putusan_kredit_CBL!.status == 2 ? true : false,
      hasDescription: statusPengajuan.putusan_kredit_CBL!.status == 3 ||
              statusPengajuan.putusan_kredit_CBL!.status == 2
          ? true
          : false,
      colorTextButton: const Color(0xff38BAA7),
    );
  }

  TaskItem _buildStepperPutusanPusat(StatusPengajuanViewModel viewModel) {
    return TaskItem(
      task: statusPengajuan.putusan_kredit_kadiv!.status == 3
          ? 'Pemutus Menolak Memberikan Kredit'
          : approvalStep == 3
              ? 'Putusan Kredit oleh Wakadiv'
              : approvalStep == 4
                  ? 'Putusan Kredit oleh Kadiv'
                  : 'Putusan Kredit',
      description: statusPengajuan.putusan_kredit_kadiv!.arguments!,
      textButtonLabel: statusPengajuan.putusan_kredit_kadiv!.status! == 2
          ? 'Lihat PTK'
          : null,
      onTextButtonLabelPressed:
          statusPengajuan.putusan_kredit_kadiv!.status! == 2
              ? viewModel.navigateToHasilAnalisaPinjaman
              : null,
      currentTask: statusPengajuan.putusan_kredit_kadiv!.status!,
      //viewModel.putusanKreditCurrentTask,
      statusDone: statusPengajuan.putusan_kredit_kadiv!.status!,
      isFailed:
          statusPengajuan.putusan_kredit_kadiv!.status! == 3 ? true : false,
      forceVisibleTextButton:
          statusPengajuan.putusan_kredit_kadiv!.status! == 2 ? true : false,
      hasDescription: statusPengajuan.putusan_kredit_kadiv!.status! == 3 ||
              statusPengajuan.putusan_kredit_kadiv!.status! == 2
          ? true
          : false,
    );
  }

  TaskItem _buildStepperVerifikasiCBL() {
    return TaskItem(
      task: 'Verifikasi CBL',
      description: statusPengajuan.verifikasi_CBL!.status! == 2
          ? statusPengajuan.verifikasi_CBL!.arguments!
          : 'Dokumen sedang dalam proses verifikasi oleh CBL. Sistem akan menginformasikan jika proses telah selesai',
      textButtonLabel: statusPengajuan.verifikasi_CBL!.status! == 2
          ? 'Telah diverifikasi oleh CBL'
          : null,
      // ignore: no-empty-block
      onTextButtonLabelPressed: () {},
      currentTask: statusPengajuan.verifikasi_CBL!.status!,
      statusDone: statusPengajuan.verifikasi_CBL!.status!,
      isFailed: false,
      forceVisibleTextButton:
          statusPengajuan.verifikasi_CBL!.status! == 2 ? true : false,
      hasDescription: statusPengajuan.verifikasi_CBL!.status! == 1 ||
              statusPengajuan.verifikasi_CBL!.status! == 2
          ? true
          : false,
      colorTextButton: const Color(0xff38BAA7),
    );
  }

  TaskItem _buildStepperVerifikasiADK() {
    return TaskItem(
      task: 'Verifikasi ADK Cabang',
      description: statusPengajuan.verifikasi_ADK_cabang!.status! == 2
          ? statusPengajuan.verifikasi_ADK_cabang!.arguments!
          : 'Dokumen sedang dalam proses verifikasi oleh ADK. Sistem akan menginformasikan jika proses telah selesai',
      textButtonLabel: statusPengajuan.verifikasi_ADK_cabang!.status! == 2
          ? 'Telah diverifikasi oleh ADK'
          : null,
      // ignore: no-empty-block
      onTextButtonLabelPressed: () {},
      currentTask: statusPengajuan.verifikasi_ADK_cabang!.status!,
      //viewModel.verifikasiADKCurrentTask,
      statusDone: statusPengajuan.verifikasi_ADK_cabang!.status!,
      isFailed: false,
      forceVisibleTextButton:
          statusPengajuan.verifikasi_ADK_cabang!.status! == 1 ||
                  statusPengajuan.verifikasi_ADK_cabang!.status! == 2
              ? true
              : false,
      hasDescription: statusPengajuan.verifikasi_ADK_cabang!.status! == 1 ||
              statusPengajuan.verifikasi_ADK_cabang!.status! == 2
          ? true
          : false,
      colorTextButton: const Color(0xff38BAA7),
    );
  }

  Column _buildStepperRevisi(int i, BuildContext context) {
    return Column(
      children: [
        TaskItemRevisi(
          task:
              // 'Revisi ${statusPengajuan.revisi[i]['checker'].split(' ')[0].toUpperCase()} - ${statusPengajuan.revisi[i]['checker'].split(' ')[1]}',
              statusPengajuan.revisi[i]['checker'][0] != 'p'
                  ? 'Revisi ${statusPengajuan.revisi[i]['checker'].split(' ')[0].toUpperCase()} - ${statusPengajuan.revisi[i]['checker'].split(' ')[1]}'
                  : 'Revisi Pemutus ${statusPengajuan.revisi[i]['checker'].split(' ')[1]}',
          textButtonLabel: 'Lihat Catatan Revisi',
          onTextButtonLabelPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RevisiDetailView(
                  ticket: statusPengajuan.revisi[i]['revisionTicket'],
                  checker: statusPengajuan.revisi[i]['checker'][0] == 'a'
                      ? 'adk'
                      : statusPengajuan.revisi[i]['checker'][0] == 'c'
                          ? 'cbl'
                          : 'pemutus',
                  id: prakarsaId,
                  codeTable: codeTable,
                ),
              ),
            );
          },
          isCurrentTask: statusPengajuan.revisi[i]['status'] == null ||
                  !statusPengajuan.revisi[i]['status']
              ? true
              : false,
          isDone: statusPengajuan.revisi[i]['status'] == null ||
                  !statusPengajuan.revisi[i]['status']
              ? false
              : true,
          isFailed: false,
          forceVisibleTextButton: true,
        ),
      ],
    );
  }

  TaskItem _buildStepperHasilAnalisaPinjaman(
    StatusPengajuanViewModel viewModel,
  ) {
    return TaskItem(
      task: 'Hasil Analisa Pinjaman',
      description: statusPengajuan.hasil_analisa_pinjaman == 1
          ? 'Lengkapi Informasi Prakarsa Debitur agar sistem membuat PTK secara otomatis'
          : '',
      textButtonLabel: statusPengajuan.hasil_analisa_pinjaman == 2 &&
                  statusPengajuan.putusan_kredit_kadiv!.status != 2 ||
              statusPengajuan.hasil_analisa_pinjaman == 1
          ? 'Lihat Draft PTK'
          : null,
      onTextButtonLabelPressed: statusPengajuan.hasil_analisa_pinjaman == 2 &&
                  statusPengajuan.putusan_kredit_kadiv!.status != 2 ||
              statusPengajuan.hasil_analisa_pinjaman == 1
          ? viewModel.navigateToHasilAnalisaPinjaman
          : null,
      currentTask: statusPengajuan.hasil_analisa_pinjaman!,
      //viewModel.hasilAnalisaPinjamanCurrentTask,
      statusDone: statusPengajuan.hasil_analisa_pinjaman,
      isFailed: false,
      forceVisibleTextButton: statusPengajuan.hasil_analisa_pinjaman == 2 &&
              statusPengajuan.putusan_kredit_kadiv!.status != 2 ||
          statusPengajuan.hasil_analisa_pinjaman == 1,
      hasDescription: statusPengajuan.hasil_analisa_pinjaman == 1,
    );
  }
}

// ignore_for_file: no-boolean-literal-compare, non_constant_identifier_names, unrelated_type_equality_checks

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../application/app/app.locator.dart';
import '../../../../../../../application/app/app.router.dart';
import '../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../application/models/ritel_prakarsa_info_prakarsa_header.dart';
import '../../../../../../../application/models/ritel_prakarsa_perorangan.dart';
import '../../../../../../../application/models/ritel_prakarsa_status_pengajuan.dart';
import '../../../../../../../infrastructure/apis/ritel_prakarsa_api.dart';

class StatusPengajuanViewModel extends FutureViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final RitelPrakarsaAPI _ritelPrakarsaAPI = locator<RitelPrakarsaAPI>();
  final DialogService _dialogService = locator<DialogService>();

  final int codeTable;
  String prakarsaId;
  String? pipelineId;
  RitelPrakarsaPerorangan prakarsaPerorangan;
  RitelPrakarsaInfoPrakarsaHeader header;
  int loanTypesId;

  StatusPengajuanViewModel({
    required this.prakarsaId,
    required this.header,
    this.pipelineId,
    required this.prakarsaPerorangan,
    required this.loanTypesId,
    required this.codeTable,
  });

  bool get preScreeningCurrentTask => pre_screening_approved == false;

  bool get isiAnalisaPinjamanaCurrentTask =>
      pre_screening_approved && analisa_pinjaman_nasabah == false;

  bool get hasilAnalisaPinjamanCurrentTask =>
      pre_screening_approved &&
      analisa_pinjaman_nasabah &&
      hasil_analisa_pinjaman == false;

  bool get revisiAdk1CurrentTask =>
      pre_screening_approved &&
      analisa_pinjaman_nasabah &&
      hasil_analisa_pinjaman &&
      revisi_adk_1 == false;

  bool get revisiAdk2CurrentTask =>
      pre_screening_approved &&
      analisa_pinjaman_nasabah &&
      hasil_analisa_pinjaman &&
      revisi_adk_1 &&
      revisi_adk_2 == false;

  bool get revisiAdk3CurrentTask =>
      pre_screening_approved &&
      analisa_pinjaman_nasabah &&
      hasil_analisa_pinjaman &&
      revisi_adk_1 &&
      revisi_adk_2 &&
      revisi_adk_3 == false;

  bool get revisiCbl1CurrentTask =>
      ritelPrakaraStatusPengajuan.body!.revisi.length ==
              4
          ? pre_screening_approved &&
              analisa_pinjaman_nasabah &&
              hasil_analisa_pinjaman &&
              revisi_adk_1 &&
              revisi_adk_2 &&
              revisi_adk_3 &&
              revisi_cbl_1 == false
          : pre_screening_approved &&
              analisa_pinjaman_nasabah &&
              hasil_analisa_pinjaman &&
              revisi_adk_1 &&
              revisi_adk_2 &&
              revisi_cbl_1 == false;

  // Kondisi berdasarkan jumlah panjang array
  // penambahan kondisi disetiap current task setelah stepper revisi
  bool get verifikasiADKCurrentTask =>
      ritelPrakaraStatusPengajuan.body!.revisi.length == 0
          ? pre_screening_approved &&
              analisa_pinjaman_nasabah &&
              hasil_analisa_pinjaman &&
              verifikasi_ADK_cabang == false
          : pre_screening_approved &&
              analisa_pinjaman_nasabah &&
              hasil_analisa_pinjaman &&
              revisi_cbl_1 &&
              verifikasi_ADK_cabang == false;

  bool get verifikasiCBLCurrentTask =>
      ritelPrakaraStatusPengajuan.body!.revisi.length == 0
          ? pre_screening_approved &&
              analisa_pinjaman_nasabah &&
              hasil_analisa_pinjaman &&
              verifikasi_ADK_cabang &&
              verifikasi_CBL == false
          : pre_screening_approved &&
              analisa_pinjaman_nasabah &&
              hasil_analisa_pinjaman &&
              verifikasi_ADK_cabang &&
              revisi_cbl_1 &&
              verifikasi_CBL == false;

  bool get putusanKreditCurrentTask =>
      ritelPrakaraStatusPengajuan.body!.revisi.length == 0
          ? pre_screening_approved &&
              analisa_pinjaman_nasabah &&
              hasil_analisa_pinjaman &&
              verifikasi_ADK_cabang &&
              verifikasi_CBL &&
              putusan_kredit_kadiv == false
          : pre_screening_approved &&
              analisa_pinjaman_nasabah &&
              hasil_analisa_pinjaman &&
              revisi_cbl_1 &&
              verifikasi_ADK_cabang &&
              verifikasi_CBL &&
              putusan_kredit_kadiv == false;

  bool get offeringDebiturCurrentTask =>
      ritelPrakaraStatusPengajuan.body!.revisi.length == 0
          ? pre_screening_approved &&
              analisa_pinjaman_nasabah &&
              hasil_analisa_pinjaman &&
              verifikasi_ADK_cabang &&
              verifikasi_CBL &&
              putusan_kredit_kadiv &&
              offering_debitur == false
          : pre_screening_approved &&
              analisa_pinjaman_nasabah &&
              hasil_analisa_pinjaman &&
              revisi_cbl_1 &&
              verifikasi_ADK_cabang &&
              verifikasi_CBL &&
              putusan_kredit_kadiv &&
              offering_debitur == false;

  bool get prosesAkadKreditCurrentTask =>
      ritelPrakaraStatusPengajuan.body!.revisi.length == 0
          ? pre_screening_approved &&
              analisa_pinjaman_nasabah &&
              hasil_analisa_pinjaman &&
              verifikasi_ADK_cabang &&
              verifikasi_CBL &&
              putusan_kredit_kadiv &&
              offering_debitur &&
              proses_akad_kredit == false
          : pre_screening_approved &&
              analisa_pinjaman_nasabah &&
              hasil_analisa_pinjaman &&
              revisi_cbl_1 &&
              verifikasi_ADK_cabang &&
              verifikasi_CBL &&
              putusan_kredit_kadiv &&
              offering_debitur &&
              proses_akad_kredit == false;

  bool get prosesPembuatanFasilitasCurrentTask =>
      ritelPrakaraStatusPengajuan.body!.revisi.length == 0
          ? pre_screening_approved &&
              analisa_pinjaman_nasabah &&
              hasil_analisa_pinjaman &&
              verifikasi_ADK_cabang &&
              verifikasi_CBL &&
              putusan_kredit_kadiv &&
              offering_debitur &&
              proses_akad_kredit &&
              proses_pembuatan_fasilitas == false
          : pre_screening_approved &&
              analisa_pinjaman_nasabah &&
              hasil_analisa_pinjaman &&
              revisi_cbl_1 &&
              verifikasi_ADK_cabang &&
              verifikasi_CBL &&
              putusan_kredit_kadiv &&
              offering_debitur &&
              proses_akad_kredit &&
              proses_pembuatan_fasilitas == false;

  bool get pre_screening_approved =>
      ritelPrakaraStatusPengajuan.body!.pre_screening_approved == null ||
              ritelPrakaraStatusPengajuan.body!.pre_screening_approved == false
          ? false
          : true;

  bool get analisa_pinjaman_nasabah =>
      ritelPrakaraStatusPengajuan.body!.analisa_pinjaman_nasabah == null ||
              ritelPrakaraStatusPengajuan.body!.analisa_pinjaman_nasabah ==
                  false
          ? false
          : true;

  bool get hasil_analisa_pinjaman =>
      ritelPrakaraStatusPengajuan.body!.hasil_analisa_pinjaman == null ||
              ritelPrakaraStatusPengajuan.body!.hasil_analisa_pinjaman == false
          ? false
          : true;

  bool get revisi_adk_1 =>
      ritelPrakaraStatusPengajuan.body!.revisi.length == 1 &&
              ritelPrakaraStatusPengajuan.body!.revisi[0]['status'] == true
          ? true
          : false;

  bool get revisi_adk_2 =>
      ritelPrakaraStatusPengajuan.body!.revisi.length == 2 &&
              ritelPrakaraStatusPengajuan.body!.revisi[1]['status'] == true
          ? true
          : false;

  bool get revisi_adk_3 => ritelPrakaraStatusPengajuan.body!.revisi.length ==
              3 &&
          ritelPrakaraStatusPengajuan.body!.revisi[2]['checker'] == 'adk 3' &&
          ritelPrakaraStatusPengajuan.body!.revisi[2]['status'] == true
      ? true
      : false;

  bool get revisi_cbl_1 =>
      ritelPrakaraStatusPengajuan.body!.revisi.length == 3 &&
                  ritelPrakaraStatusPengajuan.body!.revisi[2]['checker'] ==
                      'cbl 1' &&
                  ritelPrakaraStatusPengajuan.body!.revisi[2]['status'] ==
                      true ||
              ritelPrakaraStatusPengajuan.body!.revisi.length == 4 &&
                  ritelPrakaraStatusPengajuan.body!.revisi[3]['checker'] ==
                      'cbl 1' &&
                  ritelPrakaraStatusPengajuan.body!.revisi[3]['status'] == true
          ? true
          : false;

  bool get verifikasi_ADK_cabang =>
      ritelPrakaraStatusPengajuan.body!.verifikasi_ADK_cabang == null ||
              ritelPrakaraStatusPengajuan.body!.verifikasi_ADK_cabang == false
          ? false
          : true;

  bool get verifikasi_CBL =>
      ritelPrakaraStatusPengajuan.body!.verifikasi_CBL == null ||
              ritelPrakaraStatusPengajuan.body!.verifikasi_CBL == false
          ? false
          : true;

  bool get putusan_kredit_kadiv =>
      ritelPrakaraStatusPengajuan.body!.putusan_kredit_kadiv == null ||
              ritelPrakaraStatusPengajuan.body!.putusan_kredit_kadiv == false
          ? false
          : true;

  bool get offering_debitur =>
      ritelPrakaraStatusPengajuan.body!.offering_debitur == null ||
              ritelPrakaraStatusPengajuan.body!.offering_debitur == false
          ? false
          : true;

  bool get proses_akad_kredit =>
      ritelPrakaraStatusPengajuan.body!.proses_akad_kredit == null ||
              ritelPrakaraStatusPengajuan.body!.proses_akad_kredit == false
          ? false
          : true;

  bool get proses_pembuatan_fasilitas =>
      ritelPrakaraStatusPengajuan.body!.proses_pembuatan_fasilitas == null ||
              ritelPrakaraStatusPengajuan.body!.proses_pembuatan_fasilitas ==
                  false
          ? false
          : true;

  RitelPrakarsaStatusPengajuan? _ritelPrakarsaStatusPengajuan;

  RitelPrakarsaStatusPengajuan get ritelPrakaraStatusPengajuan =>
      _ritelPrakarsaStatusPengajuan!;

  @override
  Future futureToRun() async {
    setBusy(true);
    await fetchStatusPengajuan();
    setBusy(false);
  }

  Future fetchStatusPengajuan() async {
    final res = await runBusyFuture(
      _ritelPrakarsaAPI.fetchStatusPengajuan(prakarsaId, codeTable),
    );

    res.fold(
      (l) => _showErrorDialog('Gagal memuat data'),
      (ritelPrakarsaStatusPengajuan) {
        _ritelPrakarsaStatusPengajuan = ritelPrakarsaStatusPengajuan;
      },
    );
  }

  void navigateToHasilPreScreening() {
    if (codeTable == 3 || codeTable == 2) {
      _navigationService.navigateTo(
        Routes.hasilPrescreeningViewPerusahaanCVRitel,
        arguments: HasilPrescreeningViewPerusahaanCVRitelArguments(
          pipelineFlagId: prakarsaPerorangan.pipeline_flagId!,
          codeTable: codeTable.toString(),
          fromPrakarsaDetails: false,
        ),
      );
    } else {
      _navigationService.navigateTo(
        Routes.hasilPrescreeningViewRitel,
        arguments: HasilPrescreeningViewRitelArguments(
          pipelineflagId: prakarsaPerorangan.pipeline_flagId,
          name: prakarsaPerorangan.fullName,
          ktpNum: prakarsaPerorangan.ktpNum,
          fromPrakarsaDetails: true,
        ),
      );
    }
  }

  void navigateToInfoPrakarsa() {
    _navigationService.navigateTo(
      Routes.prakarsaDetailsViewRitel,
      arguments: PrakarsaDetailsViewRitelArguments(
        index: 1,
        prakarsaId: prakarsaId,
        pipelineId: pipelineId!,
        loanTypesId: loanTypesId,
        codeTable: codeTable,
      ),
      preventDuplicates: false,
    );
  }

  void navigateToHasilAnalisaPinjaman() {
    _navigationService.navigateTo(
      Routes.hasilAnalisaPinjamanViewRitel,
      arguments: HasilAnalisaPinjamanViewRitelArguments(
        debiturName: header.title!,
        prakarsaId: prakarsaId,
        pipelineId: pipelineId!,
        loanTypesId: loanTypesId,
        codeTable: codeTable,
        status: ritelPrakaraStatusPengajuan.body!.hasil_analisa_pinjaman,
      ),
    );
  }

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Gagal',
      description: errorMessage,
      mainButtonTitle: 'COBA LAGI',
    );
  }
}

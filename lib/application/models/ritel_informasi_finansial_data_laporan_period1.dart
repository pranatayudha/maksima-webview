// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_informasi_finansial_data_laporan_period1.freezed.dart';
part 'ritel_informasi_finansial_data_laporan_period1.g.dart';

@freezed
class RitelFinansialDataLaporanPeriodOne
    with _$RitelFinansialDataLaporanPeriodOne {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelFinansialDataLaporanPeriodOne({
    String? periode,
    int? yearsCalculation,
    String? dateOfCalculationFirst,
    String? dateOfCalculationLast,
    String? financialTypeAnalysis,
    String? neraca_kasBank,
    String? neraca_piutangDagang,
    String? neraca_persediaan,
    String? neraca_aktivaLancarLainnya,
    String? neraca_aktivaLancar,
    String? neraca_tanah,
    String? neraca_bangunan,
    String? neraca_mesinPeralatan,
    String? neraca_kendaraan,
    String? neraca_inventarisKantor,
    String? neraca_aktivaTetapLainnya,
    String? neraca_akumulasiPenyusutan,
    String? neraca_totalAktivaTetap,
    String? neraca_totalAktiva,
    String? neraca_hutangDagang,
    String? neraca_hutangBank12Bulan,
    String? neraca_hutangJangkaPendekLainnya,
    String? neraca_totalHutangJangkaPendek,
    String? neraca_hutangJangkaPanjang,
    String? neraca_hutangBankJangkaPanjang,
    String? neraca_totalHutangJangkaPanjang,
    String? neraca_totalHutang,
    String? neraca_modalDisetor,
    String? neraca_labaDitahan,
    String? neraca_labaBerjalan,
    String? neraca_penyesuaianModal,
    String? neraca_totalModal,
    String? neraca_totalPasiva,
    String? labaRugi_penjualan,
    String? labaRugi_biayaHPP,
    String? labaRugi_labaKotor,
    String? labaRugi_biayaPenjualan,
    String? labaRugi_biayaAdministrasiUmum,
    String? labaRugi_biayaOperasional,
    String? labaRugi_labaOperasional,
    String? labaRugi_biayaPenyusutan,
    String? labaRugi_biayaBunga,
    String? labaRugi_pendapatanLainnya,
    String? labaRugi_biayaOperasionalLainnya,
    String? labaRugi_biayaLainnya,
    String? labaRugi_labaSebelumPajak,
    String? labaRugi_pajak,
    String? labaRugi_labaBersih,
  }) = _RitelFinansialDataLaporanPeriodOne;

  factory RitelFinansialDataLaporanPeriodOne.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RitelFinansialDataLaporanPeriodOneFromJson(json);
}

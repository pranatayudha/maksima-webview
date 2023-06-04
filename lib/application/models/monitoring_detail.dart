// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'monitoring_detail.freezed.dart';

part 'monitoring_detail.g.dart';

@freezed
class MonitoringDetail with _$MonitoringDetail {
  @JsonSerializable(explicitToJson: true)
  const factory MonitoringDetail({
    Header? header,
    @JsonKey(name: 'summary_pinjaman') SummaryPinjaman? summaryPinjaman,
    List<Pinjaman>? pinjaman,
  }) = _MonitoringDetail;

  factory MonitoringDetail.fromJson(Map<String, dynamic> json) =>
      _$MonitoringDetailFromJson(json);
}

@freezed
class Header with _$Header {
  @JsonSerializable(explicitToJson: true)
  const factory Header({
    @JsonKey(name: 'id_Kelolaan') String? idKelolaan,
    String? bisniName,
    String? namaDebitur,
    String? phonenum,
    String? initial,
    String? partner,
    int? loanType,
    String? bungaPinjaman,
    String? picName,
    String? picPhone,
  }) = _Header;

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
}

@freezed
class SummaryPinjaman with _$SummaryPinjaman {
  @JsonSerializable(explicitToJson: true)
  const factory SummaryPinjaman({
    String? plafond,
    String? outstanding,
    int? kelonggaranTarik,
    String? tunggakanBunga,
    String? biayaDenda,
    String? totalKewajiban,
    String? kolektabilitas,
    String? totalCadanganBunga,
    String? accrue,
    String? numFasilitas,
    String? numRekSimpanan,
    String? numRekEscrow,
    String? numRekPinjaman,
    String? saldoOperasional,
  }) = _SummaryPinjaman;

  factory SummaryPinjaman.fromJson(Map<String, dynamic> json) =>
      _$SummaryPinjamanFromJson(json);
}

@freezed
class Pinjaman with _$Pinjaman {
  @JsonSerializable(explicitToJson: true)
  const factory Pinjaman({
    @JsonKey(name: 'id_Pinjaman') String? idPinjaman,
    String? nominalOutstanding,
    String? tglJatuhTempoInvoice,
    String? noDokUnderlying,
    String? informasiTanggalPengajuan,
    String? jumlahHariPinjaman,
    String? nominalUnderlying,
    String? cadanganBunga,
    String? jthtempoCadanganBunga,
    String? statusDisburse,
  }) = _Pinjaman;

  factory Pinjaman.fromJson(Map<String, dynamic> json) =>
      _$PinjamanFromJson(json);
}

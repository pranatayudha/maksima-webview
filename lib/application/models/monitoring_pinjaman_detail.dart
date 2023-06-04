// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'monitoring_pinjaman_detail.freezed.dart';

part 'monitoring_pinjaman_detail.g.dart';

@freezed
class MonitoringPinjamanDetail with _$MonitoringPinjamanDetail {
  @JsonSerializable(explicitToJson: true)
  const factory MonitoringPinjamanDetail({
    String? kelolaanId,
    @JsonKey(name: 'id_Pinjaman') String? disburseId,
    String? nominalOutstanding,
    String? tglJatuhTempoInvoice,
    String? cadanganBunga,
    String? jthtempoCadanganBunga,
    String? statusDisburse,
    String? namaBankPencairan,
    String? numBankPencairan,
    String? saldoOperasional,
    String? namaBankEscrow,
    String? numBankEscrow,
    String? saldoEscrow,
    String? role,
    String? notes,
    Partnership? partnership,
    Disburse? disburse,
  }) = _MonitoringPinjamanDetail;

  factory MonitoringPinjamanDetail.fromJson(Map<String, dynamic> json) =>
      _$MonitoringPinjamanDetailFromJson(json);
}

@freezed
class Partnership with _$Partnership {
  @JsonSerializable(explicitToJson: true)
  const factory Partnership({
    String? idPartner,
    String? parnerName,
    String? picJabatan,
    String? picEmail,
    String? picName,
    String? picNum,
    String? confirmDate,
    String? typeDocUnderLying,
    String? nameDocUnderlying,
    String? dateDocUnderlying,
    String? noDokUnderlying,
    String? nominalUnderlying,
    String? endDateUnderlying,
    String? typeConfirm,
    bool? konfirmBouwheer,
    String? docConfirm,
  }) = _Partnership;

  factory Partnership.fromJson(Map<String, dynamic> json) =>
      _$PartnershipFromJson(json);
}

@freezed
class Disburse with _$Disburse {
  @JsonSerializable(explicitToJson: true)
  const factory Disburse({
    String? namaDebitur,
    String? bungaPinjaman,
    int? limitTersedia,
    String? numDocUnderlying,
    String? amountUnderlying,
    String? ppn,
    String? endDateUnderlying,
    int? cadanganBungaTempo,
    int? sharingDanaSendiri,
    String? amountDisburse,
    String? cadanganBunga,
    String? endDateTempoCadanganBunga,
    dynamic jumlahHariPinjaman,
    String? namaBankPencairan,
    String? numBankPencairan,
    String? namaBankEscrow,
    String? numBankEscrow,
    String? docUnderlying,
    String? docSuratPermohonanPencairan,
    String? docSuratPernyataanDebitur,
    String? docStandingInstruction,
    String? tanggalPengajuan,
    String? namaBankPembayaran,
    String? numBankPembayaran,
    String? pemilikBankPembayaran,
    bool? otherPayment,
  }) = _Disburse;

  factory Disburse.fromJson(Map<String, dynamic> json) =>
      _$DisburseFromJson(json);
}

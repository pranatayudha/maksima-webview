// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring_pinjaman_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MonitoringPinjamanDetail _$$_MonitoringPinjamanDetailFromJson(
        Map<String, dynamic> json) =>
    _$_MonitoringPinjamanDetail(
      kelolaanId: json['kelolaanId'] as String?,
      disburseId: json['id_Pinjaman'] as String?,
      nominalOutstanding: json['nominalOutstanding'] as String?,
      tglJatuhTempoInvoice: json['tglJatuhTempoInvoice'] as String?,
      cadanganBunga: json['cadanganBunga'] as String?,
      jthtempoCadanganBunga: json['jthtempoCadanganBunga'] as String?,
      statusDisburse: json['statusDisburse'] as String?,
      namaBankPencairan: json['namaBankPencairan'] as String?,
      numBankPencairan: json['numBankPencairan'] as String?,
      saldoOperasional: json['saldoOperasional'] as String?,
      namaBankEscrow: json['namaBankEscrow'] as String?,
      numBankEscrow: json['numBankEscrow'] as String?,
      saldoEscrow: json['saldoEscrow'] as String?,
      role: json['role'] as String?,
      notes: json['notes'] as String?,
      partnership: json['partnership'] == null
          ? null
          : Partnership.fromJson(json['partnership'] as Map<String, dynamic>),
      disburse: json['disburse'] == null
          ? null
          : Disburse.fromJson(json['disburse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MonitoringPinjamanDetailToJson(
        _$_MonitoringPinjamanDetail instance) =>
    <String, dynamic>{
      'kelolaanId': instance.kelolaanId,
      'id_Pinjaman': instance.disburseId,
      'nominalOutstanding': instance.nominalOutstanding,
      'tglJatuhTempoInvoice': instance.tglJatuhTempoInvoice,
      'cadanganBunga': instance.cadanganBunga,
      'jthtempoCadanganBunga': instance.jthtempoCadanganBunga,
      'statusDisburse': instance.statusDisburse,
      'namaBankPencairan': instance.namaBankPencairan,
      'numBankPencairan': instance.numBankPencairan,
      'saldoOperasional': instance.saldoOperasional,
      'namaBankEscrow': instance.namaBankEscrow,
      'numBankEscrow': instance.numBankEscrow,
      'saldoEscrow': instance.saldoEscrow,
      'role': instance.role,
      'notes': instance.notes,
      'partnership': instance.partnership?.toJson(),
      'disburse': instance.disburse?.toJson(),
    };

_$_Partnership _$$_PartnershipFromJson(Map<String, dynamic> json) =>
    _$_Partnership(
      idPartner: json['idPartner'] as String?,
      parnerName: json['parnerName'] as String?,
      picJabatan: json['picJabatan'] as String?,
      picEmail: json['picEmail'] as String?,
      picName: json['picName'] as String?,
      picNum: json['picNum'] as String?,
      confirmDate: json['confirmDate'] as String?,
      typeDocUnderLying: json['typeDocUnderLying'] as String?,
      nameDocUnderlying: json['nameDocUnderlying'] as String?,
      dateDocUnderlying: json['dateDocUnderlying'] as String?,
      noDokUnderlying: json['noDokUnderlying'] as String?,
      nominalUnderlying: json['nominalUnderlying'] as String?,
      endDateUnderlying: json['endDateUnderlying'] as String?,
      typeConfirm: json['typeConfirm'] as String?,
      konfirmBouwheer: json['konfirmBouwheer'] as bool?,
      docConfirm: json['docConfirm'] as String?,
    );

Map<String, dynamic> _$$_PartnershipToJson(_$_Partnership instance) =>
    <String, dynamic>{
      'idPartner': instance.idPartner,
      'parnerName': instance.parnerName,
      'picJabatan': instance.picJabatan,
      'picEmail': instance.picEmail,
      'picName': instance.picName,
      'picNum': instance.picNum,
      'confirmDate': instance.confirmDate,
      'typeDocUnderLying': instance.typeDocUnderLying,
      'nameDocUnderlying': instance.nameDocUnderlying,
      'dateDocUnderlying': instance.dateDocUnderlying,
      'noDokUnderlying': instance.noDokUnderlying,
      'nominalUnderlying': instance.nominalUnderlying,
      'endDateUnderlying': instance.endDateUnderlying,
      'typeConfirm': instance.typeConfirm,
      'konfirmBouwheer': instance.konfirmBouwheer,
      'docConfirm': instance.docConfirm,
    };

_$_Disburse _$$_DisburseFromJson(Map<String, dynamic> json) => _$_Disburse(
      namaDebitur: json['namaDebitur'] as String?,
      bungaPinjaman: json['bungaPinjaman'] as String?,
      limitTersedia: json['limitTersedia'] as int?,
      numDocUnderlying: json['numDocUnderlying'] as String?,
      amountUnderlying: json['amountUnderlying'] as String?,
      ppn: json['ppn'] as String?,
      endDateUnderlying: json['endDateUnderlying'] as String?,
      cadanganBungaTempo: json['cadanganBungaTempo'] as int?,
      sharingDanaSendiri: json['sharingDanaSendiri'] as int?,
      amountDisburse: json['amountDisburse'] as String?,
      cadanganBunga: json['cadanganBunga'] as String?,
      endDateTempoCadanganBunga: json['endDateTempoCadanganBunga'] as String?,
      jumlahHariPinjaman: json['jumlahHariPinjaman'],
      namaBankPencairan: json['namaBankPencairan'] as String?,
      numBankPencairan: json['numBankPencairan'] as String?,
      namaBankEscrow: json['namaBankEscrow'] as String?,
      numBankEscrow: json['numBankEscrow'] as String?,
      docUnderlying: json['docUnderlying'] as String?,
      docSuratPermohonanPencairan:
          json['docSuratPermohonanPencairan'] as String?,
      docSuratPernyataanDebitur: json['docSuratPernyataanDebitur'] as String?,
      docStandingInstruction: json['docStandingInstruction'] as String?,
      tanggalPengajuan: json['tanggalPengajuan'] as String?,
      namaBankPembayaran: json['namaBankPembayaran'] as String?,
      numBankPembayaran: json['numBankPembayaran'] as String?,
      pemilikBankPembayaran: json['pemilikBankPembayaran'] as String?,
      otherPayment: json['otherPayment'] as bool?,
    );

Map<String, dynamic> _$$_DisburseToJson(_$_Disburse instance) =>
    <String, dynamic>{
      'namaDebitur': instance.namaDebitur,
      'bungaPinjaman': instance.bungaPinjaman,
      'limitTersedia': instance.limitTersedia,
      'numDocUnderlying': instance.numDocUnderlying,
      'amountUnderlying': instance.amountUnderlying,
      'ppn': instance.ppn,
      'endDateUnderlying': instance.endDateUnderlying,
      'cadanganBungaTempo': instance.cadanganBungaTempo,
      'sharingDanaSendiri': instance.sharingDanaSendiri,
      'amountDisburse': instance.amountDisburse,
      'cadanganBunga': instance.cadanganBunga,
      'endDateTempoCadanganBunga': instance.endDateTempoCadanganBunga,
      'jumlahHariPinjaman': instance.jumlahHariPinjaman,
      'namaBankPencairan': instance.namaBankPencairan,
      'numBankPencairan': instance.numBankPencairan,
      'namaBankEscrow': instance.namaBankEscrow,
      'numBankEscrow': instance.numBankEscrow,
      'docUnderlying': instance.docUnderlying,
      'docSuratPermohonanPencairan': instance.docSuratPermohonanPencairan,
      'docSuratPernyataanDebitur': instance.docSuratPernyataanDebitur,
      'docStandingInstruction': instance.docStandingInstruction,
      'tanggalPengajuan': instance.tanggalPengajuan,
      'namaBankPembayaran': instance.namaBankPembayaran,
      'numBankPembayaran': instance.numBankPembayaran,
      'pemilikBankPembayaran': instance.pemilikBankPembayaran,
      'otherPayment': instance.otherPayment,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MonitoringDetail _$$_MonitoringDetailFromJson(Map<String, dynamic> json) =>
    _$_MonitoringDetail(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      summaryPinjaman: json['summary_pinjaman'] == null
          ? null
          : SummaryPinjaman.fromJson(
              json['summary_pinjaman'] as Map<String, dynamic>),
      pinjaman: (json['pinjaman'] as List<dynamic>?)
          ?.map((e) => Pinjaman.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MonitoringDetailToJson(_$_MonitoringDetail instance) =>
    <String, dynamic>{
      'header': instance.header?.toJson(),
      'summary_pinjaman': instance.summaryPinjaman?.toJson(),
      'pinjaman': instance.pinjaman?.map((e) => e.toJson()).toList(),
    };

_$_Header _$$_HeaderFromJson(Map<String, dynamic> json) => _$_Header(
      idKelolaan: json['id_Kelolaan'] as String?,
      bisniName: json['bisniName'] as String?,
      namaDebitur: json['namaDebitur'] as String?,
      phonenum: json['phonenum'] as String?,
      initial: json['initial'] as String?,
      partner: json['partner'] as String?,
      loanType: json['loanType'] as int?,
      bungaPinjaman: json['bungaPinjaman'] as String?,
      picName: json['picName'] as String?,
      picPhone: json['picPhone'] as String?,
    );

Map<String, dynamic> _$$_HeaderToJson(_$_Header instance) => <String, dynamic>{
      'id_Kelolaan': instance.idKelolaan,
      'bisniName': instance.bisniName,
      'namaDebitur': instance.namaDebitur,
      'phonenum': instance.phonenum,
      'initial': instance.initial,
      'partner': instance.partner,
      'loanType': instance.loanType,
      'bungaPinjaman': instance.bungaPinjaman,
      'picName': instance.picName,
      'picPhone': instance.picPhone,
    };

_$_SummaryPinjaman _$$_SummaryPinjamanFromJson(Map<String, dynamic> json) =>
    _$_SummaryPinjaman(
      plafond: json['plafond'] as String?,
      outstanding: json['outstanding'] as String?,
      kelonggaranTarik: json['kelonggaranTarik'] as int?,
      tunggakanBunga: json['tunggakanBunga'] as String?,
      biayaDenda: json['biayaDenda'] as String?,
      totalKewajiban: json['totalKewajiban'] as String?,
      kolektabilitas: json['kolektabilitas'] as String?,
      totalCadanganBunga: json['totalCadanganBunga'] as String?,
      accrue: json['accrue'] as String?,
      numFasilitas: json['numFasilitas'] as String?,
      numRekSimpanan: json['numRekSimpanan'] as String?,
      numRekEscrow: json['numRekEscrow'] as String?,
      numRekPinjaman: json['numRekPinjaman'] as String?,
      saldoOperasional: json['saldoOperasional'] as String?,
    );

Map<String, dynamic> _$$_SummaryPinjamanToJson(_$_SummaryPinjaman instance) =>
    <String, dynamic>{
      'plafond': instance.plafond,
      'outstanding': instance.outstanding,
      'kelonggaranTarik': instance.kelonggaranTarik,
      'tunggakanBunga': instance.tunggakanBunga,
      'biayaDenda': instance.biayaDenda,
      'totalKewajiban': instance.totalKewajiban,
      'kolektabilitas': instance.kolektabilitas,
      'totalCadanganBunga': instance.totalCadanganBunga,
      'accrue': instance.accrue,
      'numFasilitas': instance.numFasilitas,
      'numRekSimpanan': instance.numRekSimpanan,
      'numRekEscrow': instance.numRekEscrow,
      'numRekPinjaman': instance.numRekPinjaman,
      'saldoOperasional': instance.saldoOperasional,
    };

_$_Pinjaman _$$_PinjamanFromJson(Map<String, dynamic> json) => _$_Pinjaman(
      idPinjaman: json['id_Pinjaman'] as String?,
      nominalOutstanding: json['nominalOutstanding'] as String?,
      tglJatuhTempoInvoice: json['tglJatuhTempoInvoice'] as String?,
      noDokUnderlying: json['noDokUnderlying'] as String?,
      informasiTanggalPengajuan: json['informasiTanggalPengajuan'] as String?,
      jumlahHariPinjaman: json['jumlahHariPinjaman'] as String?,
      nominalUnderlying: json['nominalUnderlying'] as String?,
      cadanganBunga: json['cadanganBunga'] as String?,
      jthtempoCadanganBunga: json['jthtempoCadanganBunga'] as String?,
      statusDisburse: json['statusDisburse'] as String?,
    );

Map<String, dynamic> _$$_PinjamanToJson(_$_Pinjaman instance) =>
    <String, dynamic>{
      'id_Pinjaman': instance.idPinjaman,
      'nominalOutstanding': instance.nominalOutstanding,
      'tglJatuhTempoInvoice': instance.tglJatuhTempoInvoice,
      'noDokUnderlying': instance.noDokUnderlying,
      'informasiTanggalPengajuan': instance.informasiTanggalPengajuan,
      'jumlahHariPinjaman': instance.jumlahHariPinjaman,
      'nominalUnderlying': instance.nominalUnderlying,
      'cadanganBunga': instance.cadanganBunga,
      'jthtempoCadanganBunga': instance.jthtempoCadanganBunga,
      'statusDisburse': instance.statusDisburse,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_monitoring_detail_pinjaman.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelMonitoringDetailPinjaman _$$_RitelMonitoringDetailPinjamanFromJson(
        Map json) =>
    _$_RitelMonitoringDetailPinjaman(
      nominalRitelMonitoringDetailPinjaman:
          json['nominalRitelMonitoringDetailPinjaman'] as String?,
      tglJatuhTempoInvoice: json['tglJatuhTempoInvoice'] as String?,
      kolektabilitas: json['kolektabilitas'],
      pokok: json['pokok'],
      bunga: json['bunga'],
      denda: json['denda'],
      cadanganBunga: json['cadanganBunga'] as int?,
      jthtempoCadanganBunga: json['jthtempoCadanganBunga'] as String?,
      totalKewajiban: json['totalKewajiban'],
      statusDisburse: json['statusDisburse'] as String?,
    );

Map<String, dynamic> _$$_RitelMonitoringDetailPinjamanToJson(
        _$_RitelMonitoringDetailPinjaman instance) =>
    <String, dynamic>{
      'nominalRitelMonitoringDetailPinjaman':
          instance.nominalRitelMonitoringDetailPinjaman,
      'tglJatuhTempoInvoice': instance.tglJatuhTempoInvoice,
      'kolektabilitas': instance.kolektabilitas,
      'pokok': instance.pokok,
      'bunga': instance.bunga,
      'denda': instance.denda,
      'cadanganBunga': instance.cadanganBunga,
      'jthtempoCadanganBunga': instance.jthtempoCadanganBunga,
      'totalKewajiban': instance.totalKewajiban,
      'statusDisburse': instance.statusDisburse,
    };

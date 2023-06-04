// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring_list_item_ritel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MonitoringListItemRitel _$$_MonitoringListItemRitelFromJson(Map json) =>
    $checkedCreate(
      r'_$_MonitoringListItemRitel',
      json,
      ($checkedConvert) {
        final val = _$_MonitoringListItemRitel(
          idKelolaan: $checkedConvert('idKelolaan', (v) => v as String?),
          cif: $checkedConvert('cif', (v) => v as String?),
          bungaPinjaman: $checkedConvert('bungaPinjaman', (v) => v as String?),
          pinjamanAktif: $checkedConvert('pinjaman_aktif', (v) => v as String?),
          totalPinjaman: $checkedConvert('total_pinjaman', (v) => v as String?),
          namaDebitur: $checkedConvert('namaDebitur', (v) => v as String?),
          initial: $checkedConvert('initial', (v) => v as String?),
          plafond: $checkedConvert('plafond', (v) => v as String?),
          loanType: $checkedConvert('loanType', (v) => v as int?),
          status: $checkedConvert('status', (v) => v as String?),
          activeTransaction:
              $checkedConvert('activeTransaction', (v) => v as int?),
          totalTransaction:
              $checkedConvert('totalTransaction', (v) => v as String?),
          amoutLastTransaction:
              $checkedConvert('amoutLastTransaction', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'pinjamanAktif': 'pinjaman_aktif',
        'totalPinjaman': 'total_pinjaman'
      },
    );

Map<String, dynamic> _$$_MonitoringListItemRitelToJson(
        _$_MonitoringListItemRitel instance) =>
    <String, dynamic>{
      'idKelolaan': instance.idKelolaan,
      'cif': instance.cif,
      'bungaPinjaman': instance.bungaPinjaman,
      'pinjaman_aktif': instance.pinjamanAktif,
      'total_pinjaman': instance.totalPinjaman,
      'namaDebitur': instance.namaDebitur,
      'initial': instance.initial,
      'plafond': instance.plafond,
      'loanType': instance.loanType,
      'status': instance.status,
      'activeTransaction': instance.activeTransaction,
      'totalTransaction': instance.totalTransaction,
      'amoutLastTransaction': instance.amoutLastTransaction,
    };

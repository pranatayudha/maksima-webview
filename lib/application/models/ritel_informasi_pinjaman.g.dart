// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_informasi_pinjaman.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelInformasiPinjaman _$$_RitelInformasiPinjamanFromJson(Map json) =>
    $checkedCreate(
      r'_$_RitelInformasiPinjaman',
      json,
      ($checkedConvert) {
        final val = _$_RitelInformasiPinjaman(
          id: $checkedConvert('id', (v) => v as String?),
          prakarsaId: $checkedConvert('prakarsaId', (v) => v as String?),
          jenisKredit: $checkedConvert('jenisKredit', (v) => v as String?),
          loanTypesId: $checkedConvert('loanTypesId', (v) => v as int?),
          tujuanPenggunaan:
              $checkedConvert('tujuanPenggunaan', (v) => v as String?),
          sifatKredit: $checkedConvert('sifatKredit', (v) => v as String?),
          bungaPinjaman: $checkedConvert('bungaPinjaman', (v) => v as String?),
          jangkaWaktuFasilitas:
              $checkedConvert('jangkaWaktuFasilitas', (v) => v as int?),
          nominalPengajuanAwal:
              $checkedConvert('nominalPengajuanAwal', (v) => v as String?),
          asumsiPerhitunganKredit:
              $checkedConvert('asumsiPerhitunganKredit', (v) => v as String?),
          nilaiProyek: $checkedConvert('nilaiProyek', (v) => v as String?),
          asumsiPPN: $checkedConvert('asumsiPPN', (v) => v as String?),
          nilaiProyekSetelahPPN:
              $checkedConvert('nilaiProyekSetelahPPN', (v) => v as String?),
          asumsiLaba: $checkedConvert('asumsiLaba', (v) => v as String?),
          biayaProyekNetto:
              $checkedConvert('biayaProyekNetto', (v) => v as String?),
          sharingDanaSendiri:
              $checkedConvert('sharingDanaSendiri', (v) => v as int?),
          biayaProyekNettoSDS:
              $checkedConvert('biayaProyekNettoSDS', (v) => v as String?),
          asumsiUangMuka:
              $checkedConvert('asumsiUangMuka', (v) => v as String?),
          besarKMKPTR: $checkedConvert('besarKMKPTR', (v) => v as String?),
          kreditBankLain:
              $checkedConvert('kreditBankLain', (v) => v as String?),
          maksimalKredit:
              $checkedConvert('maksimalKredit', (v) => v as String?),
          rekomendasiPlafond:
              $checkedConvert('rekomendasiPlafond', (v) => v as String?),
          biayaProvisi: $checkedConvert('biayaProvisi', (v) => v as String?),
          biayaAdministrasi:
              $checkedConvert('biayaAdministrasi', (v) => v as String?),
          biayaPremi: $checkedConvert('biayaPremi', (v) => v as String?),
          nilaiTransaksi:
              $checkedConvert('nilaiTransaksi', (v) => v as String?),
          suratPermohonanPath:
              $checkedConvert('suratPermohonanPath', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelInformasiPinjamanToJson(
        _$_RitelInformasiPinjaman instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prakarsaId': instance.prakarsaId,
      'jenisKredit': instance.jenisKredit,
      'loanTypesId': instance.loanTypesId,
      'tujuanPenggunaan': instance.tujuanPenggunaan,
      'sifatKredit': instance.sifatKredit,
      'bungaPinjaman': instance.bungaPinjaman,
      'jangkaWaktuFasilitas': instance.jangkaWaktuFasilitas,
      'nominalPengajuanAwal': instance.nominalPengajuanAwal,
      'asumsiPerhitunganKredit': instance.asumsiPerhitunganKredit,
      'nilaiProyek': instance.nilaiProyek,
      'asumsiPPN': instance.asumsiPPN,
      'nilaiProyekSetelahPPN': instance.nilaiProyekSetelahPPN,
      'asumsiLaba': instance.asumsiLaba,
      'biayaProyekNetto': instance.biayaProyekNetto,
      'sharingDanaSendiri': instance.sharingDanaSendiri,
      'biayaProyekNettoSDS': instance.biayaProyekNettoSDS,
      'asumsiUangMuka': instance.asumsiUangMuka,
      'besarKMKPTR': instance.besarKMKPTR,
      'kreditBankLain': instance.kreditBankLain,
      'maksimalKredit': instance.maksimalKredit,
      'rekomendasiPlafond': instance.rekomendasiPlafond,
      'biayaProvisi': instance.biayaProvisi,
      'biayaAdministrasi': instance.biayaAdministrasi,
      'biayaPremi': instance.biayaPremi,
      'nilaiTransaksi': instance.nilaiTransaksi,
      'suratPermohonanPath': instance.suratPermohonanPath,
    };

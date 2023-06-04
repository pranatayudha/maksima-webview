// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_informasi_agunan_tambahan_detail_motor.freezed.dart';
part 'ritel_informasi_agunan_tambahan_detail_motor.g.dart';

@freezed
class RitelInformasiAgunanTambahanDetailMotor
    with _$RitelInformasiAgunanTambahanDetailMotor {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelInformasiAgunanTambahanDetailMotor({
    String? id,
    String? prakarsaId,
    String? jenisPengikatan,
    String? jenisKendaraan,
    String? merk,
    int? tahunKeluar,
    String? warna,
    String? numRangkaMesin,
    String? numBPKB,
    String? numSTNK,
    String? kepemilikkan,
    String? namaPemilik,
    List<String>? pathFotoAgunanTambahan,
    List<String>? pathDataPembanding,
    String? NPW,
    String? NL,
    String? PNPW,
    String? PNL,
    String? nilaiPengikatan,
    bool? delFlag,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) = _RitelInformasiAgunanTambahanDetailMotor;

  factory RitelInformasiAgunanTambahanDetailMotor.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RitelInformasiAgunanTambahanDetailMotorFromJson(json);
}

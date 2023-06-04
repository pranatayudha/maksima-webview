// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_informasi_agunan_tambahan_detail_tanah_bangunan.freezed.dart';
part 'ritel_informasi_agunan_tambahan_detail_tanah_bangunan.g.dart';

@freezed
class RitelInformasiAgunanTambahanDetailTanahBangunan
    with _$RitelInformasiAgunanTambahanDetailTanahBangunan {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelInformasiAgunanTambahanDetailTanahBangunan({
    String? id,
    String? prakarsaId,
    String? jenisPengikatan,
    String? luasTanah,
    String? luasBangunan,
    String? numResiIMB,
    String? numIMB,
    String? addressesId,
    String? NOP,
    String? jenisSertifikat,
    String? numSertifikat,
    String? namaPemilik,
    String? jatuhTempo,
    List<String>? pathBuktiBayarPBBTerakhir,
    List<String>? pathFotoAgunanTambahan,
    List<String>? pathDataPembanding,
    bool? delFlag,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
    String? NPW,
    String? NL,
    String? PNPW,
    String? PNL,
    String? nilaiPengikatan,
    int? jenisAgunanTambahan,
  }) = _RitelInformasiAgunanTambahanDetailTanahBangunan;

  factory RitelInformasiAgunanTambahanDetailTanahBangunan.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RitelInformasiAgunanTambahanDetailTanahBangunanFromJson(json);
}

// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_tag_location.dart';

part 'ritel_informasi_agunan_tambahan_detail_tanah.freezed.dart';
part 'ritel_informasi_agunan_tambahan_detail_tanah.g.dart';

@freezed
class RitelInformasiAgunanTambahanDetailTanah
    with _$RitelInformasiAgunanTambahanDetailTanah {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelInformasiAgunanTambahanDetailTanah({
    String? id,
    String? prakarsaId,
    String? jenisPengikatan,
    String? luasTanah,
    String? NOP,
    String? jenisSertifikat,
    String? numSertifikat,
    String? namaPemilik,
    String? jatuhTempo,
    List<String>? pathBuktiBayarPBBTerakhir,
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
    RitelTagLocation? tagLocation,
    String? detail,
    String? postalCode,
    String? province,
    String? city,
    String? district,
    String? village,
    String? rt,
    String? rw,
  }) = _RitelInformasiAgunanTambahanDetailTanah;

  factory RitelInformasiAgunanTambahanDetailTanah.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RitelInformasiAgunanTambahanDetailTanahFromJson(json);
}

// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_informasi_agunan_tambahan_detail_mesin.freezed.dart';
part 'ritel_informasi_agunan_tambahan_detail_mesin.g.dart';

@freezed
class RitelInformasiAgunanTambahanDetailMesin
    with _$RitelInformasiAgunanTambahanDetailMesin {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelInformasiAgunanTambahanDetailMesin({
    String? id,
    String? prakarsaId,
    String? jenisPengikatan,
    String? numMesin,
    String? numFaktur,
    String? namaPemilik,
    List<String>? pathFotoMesin,
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
  }) = _RitelInformasiAgunanTambahanDetailMesin;

  factory RitelInformasiAgunanTambahanDetailMesin.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RitelInformasiAgunanTambahanDetailMesinFromJson(json);
}

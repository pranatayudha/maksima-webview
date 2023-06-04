// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_informasi_agunan_tambahan.freezed.dart';
part 'ritel_informasi_agunan_tambahan.g.dart';

@freezed
class RitelInformasiAgunanTambahan with _$RitelInformasiAgunanTambahan {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelInformasiAgunanTambahan({
    String? codeTable,
    String? id,
    String? prakarsaId,
    String? status,
  }) = _RitelInformasiAgunanTambahan;

  factory RitelInformasiAgunanTambahan.fromJson(Map<String, dynamic> json) =>
      _$RitelInformasiAgunanTambahanFromJson(json);
}

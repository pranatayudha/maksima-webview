// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_prakarsa_informasi_agunan_lkn.freezed.dart';
part 'ritel_prakarsa_informasi_agunan_lkn.g.dart';

@freezed
class RitelPrakarsaInformasiAgunanLKN with _$RitelPrakarsaInformasiAgunanLKN {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaInformasiAgunanLKN({
    bool? status,
  }) = _RitelPrakarsaInformasiAgunanLKN;

  factory RitelPrakarsaInformasiAgunanLKN.fromJson(Map<String, dynamic> json) =>
      _$RitelPrakarsaInformasiAgunanLKNFromJson(json);
}

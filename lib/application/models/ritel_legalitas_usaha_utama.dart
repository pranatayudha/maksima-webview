import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_legalitas_usaha_utama.freezed.dart';
part 'ritel_legalitas_usaha_utama.g.dart';

@freezed
class RitelLegalitasUsahaUtama with _$RitelLegalitasUsahaUtama {
  // ignore: invalid_annotation_target
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelLegalitasUsahaUtama({
    String? type,
    String? number,
    String? path,
    String? dateOfDocument,
    String? fileType,
  }) = _RitelLegalitasUsahaUtama;

  factory RitelLegalitasUsahaUtama.fromJson(Map<String, dynamic> json) =>
      _$RitelLegalitasUsahaUtamaFromJson(json);
}

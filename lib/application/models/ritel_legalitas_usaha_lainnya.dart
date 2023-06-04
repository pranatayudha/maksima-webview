import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_legalitas_usaha_lainnya.freezed.dart';
part 'ritel_legalitas_usaha_lainnya.g.dart';

@freezed
class RitelLegalitasUsahaLainnya with _$RitelLegalitasUsahaLainnya {
  // ignore: invalid_annotation_target
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelLegalitasUsahaLainnya({
    String? docName,
    String? path,
    String? fileType,
  }) = _RitelLegalitasUsahaLainnya;

  factory RitelLegalitasUsahaLainnya.fromJson(Map<String, dynamic> json) =>
      _$RitelLegalitasUsahaLainnyaFromJson(json);
}

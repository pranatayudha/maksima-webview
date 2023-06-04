import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_legalitas_usaha_lainnya.dart';
import 'ritel_legalitas_usaha_utama.dart';

part 'ritel_legalitas_usaha.freezed.dart';
part 'ritel_legalitas_usaha.g.dart';

@freezed
class RitelLegalitasUsaha with _$RitelLegalitasUsaha {
  // ignore: invalid_annotation_target
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelLegalitasUsaha({
    List<RitelLegalitasUsahaUtama>? mainDocument,
    List<RitelLegalitasUsahaLainnya>? additionalDocument,
  }) = _RitelLegalitasUsaha;

  factory RitelLegalitasUsaha.fromJson(Map<String, dynamic> json) =>
      _$RitelLegalitasUsahaFromJson(json);
}

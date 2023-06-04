import 'package:freezed_annotation/freezed_annotation.dart';

part 'slik.freezed.dart';
part 'slik.g.dart';

@freezed
class SLIK with _$SLIK {
  // ignore: invalid_annotation_target
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory SLIK({
    int? id,
    int? screeningId,
    int? status,
    String? statusCode,
    String? messages,
    Map<String, dynamic>? content,
    String? updatedAt,
  }) = _SLIK;

  factory SLIK.fromJson(Map<String, dynamic> json) => _$SLIKFromJson(json);
}

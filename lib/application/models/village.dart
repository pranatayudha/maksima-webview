import 'package:freezed_annotation/freezed_annotation.dart';

part 'village.freezed.dart';
part 'village.g.dart';

@freezed
class Village with _$Village {
  // ignore: invalid_annotation_target
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory Village({
    String? villageCode,
    String? village,
  }) = _Village;

  factory Village.fromJson(Map<String, dynamic> json) =>
      _$VillageFromJson(json);
}

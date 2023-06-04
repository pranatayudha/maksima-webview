import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_tag_location.freezed.dart';
part 'ritel_tag_location.g.dart';

@freezed
class RitelTagLocation with _$RitelTagLocation {
  // ignore: invalid_annotation_target
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelTagLocation({
    String? latLng,
    String? name,
  }) = _RitelTagLocation;

  factory RitelTagLocation.fromJson(Map<String, dynamic> json) =>
      _$RitelTagLocationFromJson(json);
}

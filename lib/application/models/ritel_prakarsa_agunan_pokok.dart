import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_prakarsa_agunan_pokok.freezed.dart';
part 'ritel_prakarsa_agunan_pokok.g.dart';

@freezed
class RitelPrakarsaAgunanPokok with _$RitelPrakarsaAgunanPokok {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaAgunanPokok({
    String? id,
    String? prakarsaId,
    String? status,
  }) = _RitelPrakarsaAgunanPokok;

  factory RitelPrakarsaAgunanPokok.fromJson(Map<String, dynamic> json) =>
      _$RitelPrakarsaAgunanPokokFromJson(json);
}

// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_kalkulasi_kredit.freezed.dart';
part 'ritel_kalkulasi_kredit.g.dart';

@freezed
class RitelKalkulasiKredit with _$RitelKalkulasiKredit {
  // ignore: invalid_annotation_target
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelKalkulasiKredit({
    String? prakarsaId,
    String? tipeKalkulasi,
    dynamic nilaiProyek,
    dynamic asumsiPPN,
    dynamic nilaiProyekSetelahPPN,
    dynamic asumsiLaba,
    dynamic biayaProyekNetto,
    dynamic sharingDanaSendiri,
    dynamic SDS,
    dynamic nilaiTransaksi,
    dynamic maksimalKredit,
  }) = _RitelKalkulasiKredit;

  factory RitelKalkulasiKredit.fromJson(Map<String, dynamic> json) =>
      _$RitelKalkulasiKreditFromJson(json);
}

// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_prakarsa_agunan_pokok_detail.freezed.dart';
part 'ritel_prakarsa_agunan_pokok_detail.g.dart';

@freezed
class RitelPrakarsaAgunanPokokDetail with _$RitelPrakarsaAgunanPokokDetail {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPrakarsaAgunanPokokDetail({
    String? id,
    String? prakarsaId,
    int? jenisAgunanPokok,
    String? pathUploadExcel,
    String? jenisPengikatan,
    List<String>? pathFotoAgunanPersediaan,
    String? NPW,
    String? NL,
    String? PNPW,
    String? PNL,
    String? nilaiPengikatan,
    String? nominalTotalPiutang,
    String? jumlahStock,
    String? totalNilaiPasarWajarAgunan,
  }) = _RitelPrakarsaAgunanPokokDetail;

  factory RitelPrakarsaAgunanPokokDetail.fromJson(Map<String, dynamic> json) =>
      _$RitelPrakarsaAgunanPokokDetailFromJson(json);
}

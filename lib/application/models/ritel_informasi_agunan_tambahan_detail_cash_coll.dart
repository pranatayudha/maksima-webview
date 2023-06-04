// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ritel_informasi_agunan_tambahan_detail_cash_coll.freezed.dart';
part 'ritel_informasi_agunan_tambahan_detail_cash_coll.g.dart';

@freezed
class RitelInformasiAgunanTambahanDetailCashCollateral
    with _$RitelInformasiAgunanTambahanDetailCashCollateral {
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelInformasiAgunanTambahanDetailCashCollateral({
    String? id,
    String? prakarsaId,
    String? jenisPengikatan,
    String? jenisCashCollateral,
    String? numRekening,
    String? namaPemilik,
    String? numBukuTabungan,
    String? pathFotoBukuTabungan,
    String? numBilyet,
    String? jatuhTempoBilyet,
    String? pathSertifikatBilyet,
    String? NPW,
    String? NL,
    String? PNPW,
    String? PNL,
    String? nilaiPengikatan,
    bool? delFlag,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) = _RitelInformasiAgunanTambahanDetailCashCollateral;

  factory RitelInformasiAgunanTambahanDetailCashCollateral.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RitelInformasiAgunanTambahanDetailCashCollateralFromJson(json);
}

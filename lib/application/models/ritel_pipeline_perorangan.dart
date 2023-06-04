import 'package:freezed_annotation/freezed_annotation.dart';

import 'ritel_informasi_data_diri.dart';
import 'ritel_informasi_lainnya.dart';
import 'ritel_informasi_usaha.dart';

part 'ritel_pipeline_perorangan.freezed.dart';
part 'ritel_pipeline_perorangan.g.dart';

@freezed
class RitelPipelinePerorangan with _$RitelPipelinePerorangan {
  // ignore: invalid_annotation_target
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory RitelPipelinePerorangan({
    RitelInformasiDataDiri? ritelInformasiDataDiri,
    RitelInformasiUsaha? ritelInformasiUsaha,
    RitelInformasiLainnya? ritelInformasiLainnya,
  }) = _RitelPipelinePerorangan;

  factory RitelPipelinePerorangan.fromJson(Map<String, dynamic> json) =>
      _$RitelPipelinePeroranganFromJson(json);
}

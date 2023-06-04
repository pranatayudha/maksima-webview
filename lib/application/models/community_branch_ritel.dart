import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_branch_ritel.freezed.dart';
part 'community_branch_ritel.g.dart';

@freezed
class CommunityBranchRitel with _$CommunityBranchRitel {
  // ignore: invalid_annotation_target
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory CommunityBranchRitel({
    String? id,
    String? code,
    String? name,
  }) = _CommunityBranchRitel;

  factory CommunityBranchRitel.fromJson(Map<String, dynamic> json) =>
      _$CommunityBranchRitelFromJson(json);
}

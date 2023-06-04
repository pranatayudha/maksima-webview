// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_branch_ritel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommunityBranchRitel _$$_CommunityBranchRitelFromJson(Map json) =>
    $checkedCreate(
      r'_$_CommunityBranchRitel',
      json,
      ($checkedConvert) {
        final val = _$_CommunityBranchRitel(
          id: $checkedConvert('id', (v) => v as String?),
          code: $checkedConvert('code', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_CommunityBranchRitelToJson(
        _$_CommunityBranchRitel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };

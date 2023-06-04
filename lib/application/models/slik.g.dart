// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slik.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SLIK _$$_SLIKFromJson(Map json) => $checkedCreate(
      r'_$_SLIK',
      json,
      ($checkedConvert) {
        final val = _$_SLIK(
          id: $checkedConvert('id', (v) => v as int?),
          screeningId: $checkedConvert('screeningId', (v) => v as int?),
          status: $checkedConvert('status', (v) => v as int?),
          statusCode: $checkedConvert('statusCode', (v) => v as String?),
          messages: $checkedConvert('messages', (v) => v as String?),
          content: $checkedConvert(
              'content',
              (v) => (v as Map?)?.map(
                    (k, e) => MapEntry(k as String, e),
                  )),
          updatedAt: $checkedConvert('updatedAt', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_SLIKToJson(_$_SLIK instance) => <String, dynamic>{
      'id': instance.id,
      'screeningId': instance.screeningId,
      'status': instance.status,
      'statusCode': instance.statusCode,
      'messages': instance.messages,
      'content': instance.content,
      'updatedAt': instance.updatedAt,
    };

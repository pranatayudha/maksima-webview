// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_date_of_birth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelDateOfBirth _$$_RitelDateOfBirthFromJson(Map json) => $checkedCreate(
      r'_$_RitelDateOfBirth',
      json,
      ($checkedConvert) {
        final val = _$_RitelDateOfBirth(
          date: $checkedConvert('date', (v) => v as String?),
          newDate: $checkedConvert('newDate', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelDateOfBirthToJson(_$_RitelDateOfBirth instance) =>
    <String, dynamic>{
      'date': instance.date,
      'newDate': instance.newDate,
    };

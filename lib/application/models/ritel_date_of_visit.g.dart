// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_date_of_visit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelDateOfVisit _$$_RitelDateOfVisitFromJson(Map json) => $checkedCreate(
      r'_$_RitelDateOfVisit',
      json,
      ($checkedConvert) {
        final val = _$_RitelDateOfVisit(
          date: $checkedConvert('date', (v) => v as String?),
          newDate: $checkedConvert('newDate', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelDateOfVisitToJson(_$_RitelDateOfVisit instance) =>
    <String, dynamic>{
      'date': instance.date,
      'newDate': instance.newDate,
    };

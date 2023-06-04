// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ritel_informasi_finansial_menu_stepper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RitelFinansialMenuStepper _$$_RitelFinansialMenuStepperFromJson(Map json) =>
    $checkedCreate(
      r'_$_RitelFinansialMenuStepper',
      json,
      ($checkedConvert) {
        final val = _$_RitelFinansialMenuStepper(
          informasiFinansial: $checkedConvert('informasiFinansial', (v) => v),
          mutasiRekening: $checkedConvert('mutasiRekening', (v) => v),
          riwayatProject: $checkedConvert('riwayatProject', (v) => v),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RitelFinansialMenuStepperToJson(
        _$_RitelFinansialMenuStepper instance) =>
    <String, dynamic>{
      'informasiFinansial': instance.informasiFinansial,
      'mutasiRekening': instance.mutasiRekening,
      'riwayatProject': instance.riwayatProject,
    };

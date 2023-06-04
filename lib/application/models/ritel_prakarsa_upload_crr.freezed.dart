// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_prakarsa_upload_crr.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelPrakarsaUploadCRR _$RitelPrakarsaUploadCRRFromJson(
    Map<String, dynamic> json) {
  return _RitelPrakarsaUploadCRR.fromJson(json);
}

/// @nodoc
mixin _$RitelPrakarsaUploadCRR {
  bool? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelPrakarsaUploadCRRCopyWith<RitelPrakarsaUploadCRR> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelPrakarsaUploadCRRCopyWith<$Res> {
  factory $RitelPrakarsaUploadCRRCopyWith(RitelPrakarsaUploadCRR value,
          $Res Function(RitelPrakarsaUploadCRR) then) =
      _$RitelPrakarsaUploadCRRCopyWithImpl<$Res, RitelPrakarsaUploadCRR>;
  @useResult
  $Res call({bool? status});
}

/// @nodoc
class _$RitelPrakarsaUploadCRRCopyWithImpl<$Res,
        $Val extends RitelPrakarsaUploadCRR>
    implements $RitelPrakarsaUploadCRRCopyWith<$Res> {
  _$RitelPrakarsaUploadCRRCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RitelPrakarsaUploadCRRCopyWith<$Res>
    implements $RitelPrakarsaUploadCRRCopyWith<$Res> {
  factory _$$_RitelPrakarsaUploadCRRCopyWith(_$_RitelPrakarsaUploadCRR value,
          $Res Function(_$_RitelPrakarsaUploadCRR) then) =
      __$$_RitelPrakarsaUploadCRRCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status});
}

/// @nodoc
class __$$_RitelPrakarsaUploadCRRCopyWithImpl<$Res>
    extends _$RitelPrakarsaUploadCRRCopyWithImpl<$Res,
        _$_RitelPrakarsaUploadCRR>
    implements _$$_RitelPrakarsaUploadCRRCopyWith<$Res> {
  __$$_RitelPrakarsaUploadCRRCopyWithImpl(_$_RitelPrakarsaUploadCRR _value,
      $Res Function(_$_RitelPrakarsaUploadCRR) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$_RitelPrakarsaUploadCRR(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_RitelPrakarsaUploadCRR implements _RitelPrakarsaUploadCRR {
  _$_RitelPrakarsaUploadCRR({this.status});

  factory _$_RitelPrakarsaUploadCRR.fromJson(Map<String, dynamic> json) =>
      _$$_RitelPrakarsaUploadCRRFromJson(json);

  @override
  final bool? status;

  @override
  String toString() {
    return 'RitelPrakarsaUploadCRR(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelPrakarsaUploadCRR &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelPrakarsaUploadCRRCopyWith<_$_RitelPrakarsaUploadCRR> get copyWith =>
      __$$_RitelPrakarsaUploadCRRCopyWithImpl<_$_RitelPrakarsaUploadCRR>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelPrakarsaUploadCRRToJson(
      this,
    );
  }
}

abstract class _RitelPrakarsaUploadCRR implements RitelPrakarsaUploadCRR {
  factory _RitelPrakarsaUploadCRR({final bool? status}) =
      _$_RitelPrakarsaUploadCRR;

  factory _RitelPrakarsaUploadCRR.fromJson(Map<String, dynamic> json) =
      _$_RitelPrakarsaUploadCRR.fromJson;

  @override
  bool? get status;
  @override
  @JsonKey(ignore: true)
  _$$_RitelPrakarsaUploadCRRCopyWith<_$_RitelPrakarsaUploadCRR> get copyWith =>
      throw _privateConstructorUsedError;
}

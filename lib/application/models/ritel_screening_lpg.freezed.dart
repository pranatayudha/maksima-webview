// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_screening_lpg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelScreeningLPG _$RitelScreeningLPGFromJson(Map<String, dynamic> json) {
  return _RitelScreeningLPG.fromJson(json);
}

/// @nodoc
mixin _$RitelScreeningLPG {
  String? get status => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelScreeningLPGCopyWith<RitelScreeningLPG> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelScreeningLPGCopyWith<$Res> {
  factory $RitelScreeningLPGCopyWith(
          RitelScreeningLPG value, $Res Function(RitelScreeningLPG) then) =
      _$RitelScreeningLPGCopyWithImpl<$Res, RitelScreeningLPG>;
  @useResult
  $Res call({String? status, String? reason});
}

/// @nodoc
class _$RitelScreeningLPGCopyWithImpl<$Res, $Val extends RitelScreeningLPG>
    implements $RitelScreeningLPGCopyWith<$Res> {
  _$RitelScreeningLPGCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RitelScreeningLPGCopyWith<$Res>
    implements $RitelScreeningLPGCopyWith<$Res> {
  factory _$$_RitelScreeningLPGCopyWith(_$_RitelScreeningLPG value,
          $Res Function(_$_RitelScreeningLPG) then) =
      __$$_RitelScreeningLPGCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? reason});
}

/// @nodoc
class __$$_RitelScreeningLPGCopyWithImpl<$Res>
    extends _$RitelScreeningLPGCopyWithImpl<$Res, _$_RitelScreeningLPG>
    implements _$$_RitelScreeningLPGCopyWith<$Res> {
  __$$_RitelScreeningLPGCopyWithImpl(
      _$_RitelScreeningLPG _value, $Res Function(_$_RitelScreeningLPG) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? reason = freezed,
  }) {
    return _then(_$_RitelScreeningLPG(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_RitelScreeningLPG implements _RitelScreeningLPG {
  _$_RitelScreeningLPG({this.status, this.reason});

  factory _$_RitelScreeningLPG.fromJson(Map<String, dynamic> json) =>
      _$$_RitelScreeningLPGFromJson(json);

  @override
  final String? status;
  @override
  final String? reason;

  @override
  String toString() {
    return 'RitelScreeningLPG(status: $status, reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelScreeningLPG &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelScreeningLPGCopyWith<_$_RitelScreeningLPG> get copyWith =>
      __$$_RitelScreeningLPGCopyWithImpl<_$_RitelScreeningLPG>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelScreeningLPGToJson(
      this,
    );
  }
}

abstract class _RitelScreeningLPG implements RitelScreeningLPG {
  factory _RitelScreeningLPG({final String? status, final String? reason}) =
      _$_RitelScreeningLPG;

  factory _RitelScreeningLPG.fromJson(Map<String, dynamic> json) =
      _$_RitelScreeningLPG.fromJson;

  @override
  String? get status;
  @override
  String? get reason;
  @override
  @JsonKey(ignore: true)
  _$$_RitelScreeningLPGCopyWith<_$_RitelScreeningLPG> get copyWith =>
      throw _privateConstructorUsedError;
}

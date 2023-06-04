// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_screening_dukcapil.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelScreeningDukcapil _$RitelScreeningDukcapilFromJson(
    Map<String, dynamic> json) {
  return _RitelScreeningDukcapil.fromJson(json);
}

/// @nodoc
mixin _$RitelScreeningDukcapil {
  String? get status => throw _privateConstructorUsedError;
  dynamic get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelScreeningDukcapilCopyWith<RitelScreeningDukcapil> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelScreeningDukcapilCopyWith<$Res> {
  factory $RitelScreeningDukcapilCopyWith(RitelScreeningDukcapil value,
          $Res Function(RitelScreeningDukcapil) then) =
      _$RitelScreeningDukcapilCopyWithImpl<$Res, RitelScreeningDukcapil>;
  @useResult
  $Res call({String? status, dynamic reason});
}

/// @nodoc
class _$RitelScreeningDukcapilCopyWithImpl<$Res,
        $Val extends RitelScreeningDukcapil>
    implements $RitelScreeningDukcapilCopyWith<$Res> {
  _$RitelScreeningDukcapilCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RitelScreeningDukcapilCopyWith<$Res>
    implements $RitelScreeningDukcapilCopyWith<$Res> {
  factory _$$_RitelScreeningDukcapilCopyWith(_$_RitelScreeningDukcapil value,
          $Res Function(_$_RitelScreeningDukcapil) then) =
      __$$_RitelScreeningDukcapilCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, dynamic reason});
}

/// @nodoc
class __$$_RitelScreeningDukcapilCopyWithImpl<$Res>
    extends _$RitelScreeningDukcapilCopyWithImpl<$Res,
        _$_RitelScreeningDukcapil>
    implements _$$_RitelScreeningDukcapilCopyWith<$Res> {
  __$$_RitelScreeningDukcapilCopyWithImpl(_$_RitelScreeningDukcapil _value,
      $Res Function(_$_RitelScreeningDukcapil) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? reason = null,
  }) {
    return _then(_$_RitelScreeningDukcapil(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_RitelScreeningDukcapil implements _RitelScreeningDukcapil {
  _$_RitelScreeningDukcapil({this.status, this.reason});

  factory _$_RitelScreeningDukcapil.fromJson(Map<String, dynamic> json) =>
      _$$_RitelScreeningDukcapilFromJson(json);

  @override
  final String? status;
  @override
  final dynamic reason;

  @override
  String toString() {
    return 'RitelScreeningDukcapil(status: $status, reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelScreeningDukcapil &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.reason, reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(reason));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelScreeningDukcapilCopyWith<_$_RitelScreeningDukcapil> get copyWith =>
      __$$_RitelScreeningDukcapilCopyWithImpl<_$_RitelScreeningDukcapil>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelScreeningDukcapilToJson(
      this,
    );
  }
}

abstract class _RitelScreeningDukcapil implements RitelScreeningDukcapil {
  factory _RitelScreeningDukcapil(
      {final String? status, final dynamic reason}) = _$_RitelScreeningDukcapil;

  factory _RitelScreeningDukcapil.fromJson(Map<String, dynamic> json) =
      _$_RitelScreeningDukcapil.fromJson;

  @override
  String? get status;
  @override
  dynamic get reason;
  @override
  @JsonKey(ignore: true)
  _$$_RitelScreeningDukcapilCopyWith<_$_RitelScreeningDukcapil> get copyWith =>
      throw _privateConstructorUsedError;
}

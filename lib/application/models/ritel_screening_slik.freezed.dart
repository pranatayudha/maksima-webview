// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_screening_slik.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelScreeningSlik _$RitelScreeningSlikFromJson(Map<String, dynamic> json) {
  return _RitelScreeningSlik.fromJson(json);
}

/// @nodoc
mixin _$RitelScreeningSlik {
  String? get status => throw _privateConstructorUsedError;
  dynamic get reason => throw _privateConstructorUsedError;
  dynamic get path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelScreeningSlikCopyWith<RitelScreeningSlik> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelScreeningSlikCopyWith<$Res> {
  factory $RitelScreeningSlikCopyWith(
          RitelScreeningSlik value, $Res Function(RitelScreeningSlik) then) =
      _$RitelScreeningSlikCopyWithImpl<$Res, RitelScreeningSlik>;
  @useResult
  $Res call({String? status, dynamic reason, dynamic path});
}

/// @nodoc
class _$RitelScreeningSlikCopyWithImpl<$Res, $Val extends RitelScreeningSlik>
    implements $RitelScreeningSlikCopyWith<$Res> {
  _$RitelScreeningSlikCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? reason = null,
    Object? path = null,
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
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RitelScreeningSlikCopyWith<$Res>
    implements $RitelScreeningSlikCopyWith<$Res> {
  factory _$$_RitelScreeningSlikCopyWith(_$_RitelScreeningSlik value,
          $Res Function(_$_RitelScreeningSlik) then) =
      __$$_RitelScreeningSlikCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, dynamic reason, dynamic path});
}

/// @nodoc
class __$$_RitelScreeningSlikCopyWithImpl<$Res>
    extends _$RitelScreeningSlikCopyWithImpl<$Res, _$_RitelScreeningSlik>
    implements _$$_RitelScreeningSlikCopyWith<$Res> {
  __$$_RitelScreeningSlikCopyWithImpl(
      _$_RitelScreeningSlik _value, $Res Function(_$_RitelScreeningSlik) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? reason = null,
    Object? path = null,
  }) {
    return _then(_$_RitelScreeningSlik(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as dynamic,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_RitelScreeningSlik implements _RitelScreeningSlik {
  _$_RitelScreeningSlik({this.status, this.reason, this.path});

  factory _$_RitelScreeningSlik.fromJson(Map<String, dynamic> json) =>
      _$$_RitelScreeningSlikFromJson(json);

  @override
  final String? status;
  @override
  final dynamic reason;
  @override
  final dynamic path;

  @override
  String toString() {
    return 'RitelScreeningSlik(status: $status, reason: $reason, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelScreeningSlik &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.reason, reason) &&
            const DeepCollectionEquality().equals(other.path, path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(reason),
      const DeepCollectionEquality().hash(path));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelScreeningSlikCopyWith<_$_RitelScreeningSlik> get copyWith =>
      __$$_RitelScreeningSlikCopyWithImpl<_$_RitelScreeningSlik>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelScreeningSlikToJson(
      this,
    );
  }
}

abstract class _RitelScreeningSlik implements RitelScreeningSlik {
  factory _RitelScreeningSlik(
      {final String? status,
      final dynamic reason,
      final dynamic path}) = _$_RitelScreeningSlik;

  factory _RitelScreeningSlik.fromJson(Map<String, dynamic> json) =
      _$_RitelScreeningSlik.fromJson;

  @override
  String? get status;
  @override
  dynamic get reason;
  @override
  dynamic get path;
  @override
  @JsonKey(ignore: true)
  _$$_RitelScreeningSlikCopyWith<_$_RitelScreeningSlik> get copyWith =>
      throw _privateConstructorUsedError;
}

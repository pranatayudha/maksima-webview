// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_prakarsa_legalitas_usaha.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelPrakarsaLegalitasUsaha _$RitelPrakarsaLegalitasUsahaFromJson(
    Map<String, dynamic> json) {
  return _RitelPrakarsaLegalitasUsaha.fromJson(json);
}

/// @nodoc
mixin _$RitelPrakarsaLegalitasUsaha {
  bool? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelPrakarsaLegalitasUsahaCopyWith<RitelPrakarsaLegalitasUsaha>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelPrakarsaLegalitasUsahaCopyWith<$Res> {
  factory $RitelPrakarsaLegalitasUsahaCopyWith(
          RitelPrakarsaLegalitasUsaha value,
          $Res Function(RitelPrakarsaLegalitasUsaha) then) =
      _$RitelPrakarsaLegalitasUsahaCopyWithImpl<$Res,
          RitelPrakarsaLegalitasUsaha>;
  @useResult
  $Res call({bool? status});
}

/// @nodoc
class _$RitelPrakarsaLegalitasUsahaCopyWithImpl<$Res,
        $Val extends RitelPrakarsaLegalitasUsaha>
    implements $RitelPrakarsaLegalitasUsahaCopyWith<$Res> {
  _$RitelPrakarsaLegalitasUsahaCopyWithImpl(this._value, this._then);

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
abstract class _$$_RitelPrakarsaLegalitasUsahaCopyWith<$Res>
    implements $RitelPrakarsaLegalitasUsahaCopyWith<$Res> {
  factory _$$_RitelPrakarsaLegalitasUsahaCopyWith(
          _$_RitelPrakarsaLegalitasUsaha value,
          $Res Function(_$_RitelPrakarsaLegalitasUsaha) then) =
      __$$_RitelPrakarsaLegalitasUsahaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status});
}

/// @nodoc
class __$$_RitelPrakarsaLegalitasUsahaCopyWithImpl<$Res>
    extends _$RitelPrakarsaLegalitasUsahaCopyWithImpl<$Res,
        _$_RitelPrakarsaLegalitasUsaha>
    implements _$$_RitelPrakarsaLegalitasUsahaCopyWith<$Res> {
  __$$_RitelPrakarsaLegalitasUsahaCopyWithImpl(
      _$_RitelPrakarsaLegalitasUsaha _value,
      $Res Function(_$_RitelPrakarsaLegalitasUsaha) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$_RitelPrakarsaLegalitasUsaha(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_RitelPrakarsaLegalitasUsaha implements _RitelPrakarsaLegalitasUsaha {
  _$_RitelPrakarsaLegalitasUsaha({this.status});

  factory _$_RitelPrakarsaLegalitasUsaha.fromJson(Map<String, dynamic> json) =>
      _$$_RitelPrakarsaLegalitasUsahaFromJson(json);

  @override
  final bool? status;

  @override
  String toString() {
    return 'RitelPrakarsaLegalitasUsaha(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelPrakarsaLegalitasUsaha &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelPrakarsaLegalitasUsahaCopyWith<_$_RitelPrakarsaLegalitasUsaha>
      get copyWith => __$$_RitelPrakarsaLegalitasUsahaCopyWithImpl<
          _$_RitelPrakarsaLegalitasUsaha>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelPrakarsaLegalitasUsahaToJson(
      this,
    );
  }
}

abstract class _RitelPrakarsaLegalitasUsaha
    implements RitelPrakarsaLegalitasUsaha {
  factory _RitelPrakarsaLegalitasUsaha({final bool? status}) =
      _$_RitelPrakarsaLegalitasUsaha;

  factory _RitelPrakarsaLegalitasUsaha.fromJson(Map<String, dynamic> json) =
      _$_RitelPrakarsaLegalitasUsaha.fromJson;

  @override
  bool? get status;
  @override
  @JsonKey(ignore: true)
  _$$_RitelPrakarsaLegalitasUsahaCopyWith<_$_RitelPrakarsaLegalitasUsaha>
      get copyWith => throw _privateConstructorUsedError;
}

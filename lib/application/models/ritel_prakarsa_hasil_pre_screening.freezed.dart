// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_prakarsa_hasil_pre_screening.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelPrakarsaHasilPreScreening _$RitelPrakarsaHasilPreScreeningFromJson(
    Map<String, dynamic> json) {
  return _RitelPrakarsaHasilPreScreening.fromJson(json);
}

/// @nodoc
mixin _$RitelPrakarsaHasilPreScreening {
  bool? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelPrakarsaHasilPreScreeningCopyWith<RitelPrakarsaHasilPreScreening>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelPrakarsaHasilPreScreeningCopyWith<$Res> {
  factory $RitelPrakarsaHasilPreScreeningCopyWith(
          RitelPrakarsaHasilPreScreening value,
          $Res Function(RitelPrakarsaHasilPreScreening) then) =
      _$RitelPrakarsaHasilPreScreeningCopyWithImpl<$Res,
          RitelPrakarsaHasilPreScreening>;
  @useResult
  $Res call({bool? status});
}

/// @nodoc
class _$RitelPrakarsaHasilPreScreeningCopyWithImpl<$Res,
        $Val extends RitelPrakarsaHasilPreScreening>
    implements $RitelPrakarsaHasilPreScreeningCopyWith<$Res> {
  _$RitelPrakarsaHasilPreScreeningCopyWithImpl(this._value, this._then);

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
abstract class _$$_RitelPrakarsaHasilPreScreeningCopyWith<$Res>
    implements $RitelPrakarsaHasilPreScreeningCopyWith<$Res> {
  factory _$$_RitelPrakarsaHasilPreScreeningCopyWith(
          _$_RitelPrakarsaHasilPreScreening value,
          $Res Function(_$_RitelPrakarsaHasilPreScreening) then) =
      __$$_RitelPrakarsaHasilPreScreeningCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status});
}

/// @nodoc
class __$$_RitelPrakarsaHasilPreScreeningCopyWithImpl<$Res>
    extends _$RitelPrakarsaHasilPreScreeningCopyWithImpl<$Res,
        _$_RitelPrakarsaHasilPreScreening>
    implements _$$_RitelPrakarsaHasilPreScreeningCopyWith<$Res> {
  __$$_RitelPrakarsaHasilPreScreeningCopyWithImpl(
      _$_RitelPrakarsaHasilPreScreening _value,
      $Res Function(_$_RitelPrakarsaHasilPreScreening) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$_RitelPrakarsaHasilPreScreening(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_RitelPrakarsaHasilPreScreening
    implements _RitelPrakarsaHasilPreScreening {
  _$_RitelPrakarsaHasilPreScreening({this.status});

  factory _$_RitelPrakarsaHasilPreScreening.fromJson(
          Map<String, dynamic> json) =>
      _$$_RitelPrakarsaHasilPreScreeningFromJson(json);

  @override
  final bool? status;

  @override
  String toString() {
    return 'RitelPrakarsaHasilPreScreening(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelPrakarsaHasilPreScreening &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelPrakarsaHasilPreScreeningCopyWith<_$_RitelPrakarsaHasilPreScreening>
      get copyWith => __$$_RitelPrakarsaHasilPreScreeningCopyWithImpl<
          _$_RitelPrakarsaHasilPreScreening>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelPrakarsaHasilPreScreeningToJson(
      this,
    );
  }
}

abstract class _RitelPrakarsaHasilPreScreening
    implements RitelPrakarsaHasilPreScreening {
  factory _RitelPrakarsaHasilPreScreening({final bool? status}) =
      _$_RitelPrakarsaHasilPreScreening;

  factory _RitelPrakarsaHasilPreScreening.fromJson(Map<String, dynamic> json) =
      _$_RitelPrakarsaHasilPreScreening.fromJson;

  @override
  bool? get status;
  @override
  @JsonKey(ignore: true)
  _$$_RitelPrakarsaHasilPreScreeningCopyWith<_$_RitelPrakarsaHasilPreScreening>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_prakarsa_informasi_finansial.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelPrakarsaInformasiFinansial _$RitelPrakarsaInformasiFinansialFromJson(
    Map<String, dynamic> json) {
  return _RitelPrakarsaInformasiFinansial.fromJson(json);
}

/// @nodoc
mixin _$RitelPrakarsaInformasiFinansial {
  bool? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelPrakarsaInformasiFinansialCopyWith<RitelPrakarsaInformasiFinansial>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelPrakarsaInformasiFinansialCopyWith<$Res> {
  factory $RitelPrakarsaInformasiFinansialCopyWith(
          RitelPrakarsaInformasiFinansial value,
          $Res Function(RitelPrakarsaInformasiFinansial) then) =
      _$RitelPrakarsaInformasiFinansialCopyWithImpl<$Res,
          RitelPrakarsaInformasiFinansial>;
  @useResult
  $Res call({bool? status});
}

/// @nodoc
class _$RitelPrakarsaInformasiFinansialCopyWithImpl<$Res,
        $Val extends RitelPrakarsaInformasiFinansial>
    implements $RitelPrakarsaInformasiFinansialCopyWith<$Res> {
  _$RitelPrakarsaInformasiFinansialCopyWithImpl(this._value, this._then);

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
abstract class _$$_RitelPrakarsaInformasiFinansialCopyWith<$Res>
    implements $RitelPrakarsaInformasiFinansialCopyWith<$Res> {
  factory _$$_RitelPrakarsaInformasiFinansialCopyWith(
          _$_RitelPrakarsaInformasiFinansial value,
          $Res Function(_$_RitelPrakarsaInformasiFinansial) then) =
      __$$_RitelPrakarsaInformasiFinansialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status});
}

/// @nodoc
class __$$_RitelPrakarsaInformasiFinansialCopyWithImpl<$Res>
    extends _$RitelPrakarsaInformasiFinansialCopyWithImpl<$Res,
        _$_RitelPrakarsaInformasiFinansial>
    implements _$$_RitelPrakarsaInformasiFinansialCopyWith<$Res> {
  __$$_RitelPrakarsaInformasiFinansialCopyWithImpl(
      _$_RitelPrakarsaInformasiFinansial _value,
      $Res Function(_$_RitelPrakarsaInformasiFinansial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$_RitelPrakarsaInformasiFinansial(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_RitelPrakarsaInformasiFinansial
    implements _RitelPrakarsaInformasiFinansial {
  _$_RitelPrakarsaInformasiFinansial({this.status});

  factory _$_RitelPrakarsaInformasiFinansial.fromJson(
          Map<String, dynamic> json) =>
      _$$_RitelPrakarsaInformasiFinansialFromJson(json);

  @override
  final bool? status;

  @override
  String toString() {
    return 'RitelPrakarsaInformasiFinansial(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelPrakarsaInformasiFinansial &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelPrakarsaInformasiFinansialCopyWith<
          _$_RitelPrakarsaInformasiFinansial>
      get copyWith => __$$_RitelPrakarsaInformasiFinansialCopyWithImpl<
          _$_RitelPrakarsaInformasiFinansial>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelPrakarsaInformasiFinansialToJson(
      this,
    );
  }
}

abstract class _RitelPrakarsaInformasiFinansial
    implements RitelPrakarsaInformasiFinansial {
  factory _RitelPrakarsaInformasiFinansial({final bool? status}) =
      _$_RitelPrakarsaInformasiFinansial;

  factory _RitelPrakarsaInformasiFinansial.fromJson(Map<String, dynamic> json) =
      _$_RitelPrakarsaInformasiFinansial.fromJson;

  @override
  bool? get status;
  @override
  @JsonKey(ignore: true)
  _$$_RitelPrakarsaInformasiFinansialCopyWith<
          _$_RitelPrakarsaInformasiFinansial>
      get copyWith => throw _privateConstructorUsedError;
}

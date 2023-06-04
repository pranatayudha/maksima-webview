// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_prakarsa_informasi_pinjaman.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelPrakarsaInformasiPinjaman _$RitelPrakarsaInformasiPinjamanFromJson(
    Map<String, dynamic> json) {
  return _RitelPrakarsaInformasiPinjaman.fromJson(json);
}

/// @nodoc
mixin _$RitelPrakarsaInformasiPinjaman {
  bool? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelPrakarsaInformasiPinjamanCopyWith<RitelPrakarsaInformasiPinjaman>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelPrakarsaInformasiPinjamanCopyWith<$Res> {
  factory $RitelPrakarsaInformasiPinjamanCopyWith(
          RitelPrakarsaInformasiPinjaman value,
          $Res Function(RitelPrakarsaInformasiPinjaman) then) =
      _$RitelPrakarsaInformasiPinjamanCopyWithImpl<$Res,
          RitelPrakarsaInformasiPinjaman>;
  @useResult
  $Res call({bool? status});
}

/// @nodoc
class _$RitelPrakarsaInformasiPinjamanCopyWithImpl<$Res,
        $Val extends RitelPrakarsaInformasiPinjaman>
    implements $RitelPrakarsaInformasiPinjamanCopyWith<$Res> {
  _$RitelPrakarsaInformasiPinjamanCopyWithImpl(this._value, this._then);

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
abstract class _$$_RitelPrakarsaInformasiPinjamanCopyWith<$Res>
    implements $RitelPrakarsaInformasiPinjamanCopyWith<$Res> {
  factory _$$_RitelPrakarsaInformasiPinjamanCopyWith(
          _$_RitelPrakarsaInformasiPinjaman value,
          $Res Function(_$_RitelPrakarsaInformasiPinjaman) then) =
      __$$_RitelPrakarsaInformasiPinjamanCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status});
}

/// @nodoc
class __$$_RitelPrakarsaInformasiPinjamanCopyWithImpl<$Res>
    extends _$RitelPrakarsaInformasiPinjamanCopyWithImpl<$Res,
        _$_RitelPrakarsaInformasiPinjaman>
    implements _$$_RitelPrakarsaInformasiPinjamanCopyWith<$Res> {
  __$$_RitelPrakarsaInformasiPinjamanCopyWithImpl(
      _$_RitelPrakarsaInformasiPinjaman _value,
      $Res Function(_$_RitelPrakarsaInformasiPinjaman) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$_RitelPrakarsaInformasiPinjaman(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_RitelPrakarsaInformasiPinjaman
    implements _RitelPrakarsaInformasiPinjaman {
  _$_RitelPrakarsaInformasiPinjaman({this.status});

  factory _$_RitelPrakarsaInformasiPinjaman.fromJson(
          Map<String, dynamic> json) =>
      _$$_RitelPrakarsaInformasiPinjamanFromJson(json);

  @override
  final bool? status;

  @override
  String toString() {
    return 'RitelPrakarsaInformasiPinjaman(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelPrakarsaInformasiPinjaman &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelPrakarsaInformasiPinjamanCopyWith<_$_RitelPrakarsaInformasiPinjaman>
      get copyWith => __$$_RitelPrakarsaInformasiPinjamanCopyWithImpl<
          _$_RitelPrakarsaInformasiPinjaman>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelPrakarsaInformasiPinjamanToJson(
      this,
    );
  }
}

abstract class _RitelPrakarsaInformasiPinjaman
    implements RitelPrakarsaInformasiPinjaman {
  factory _RitelPrakarsaInformasiPinjaman({final bool? status}) =
      _$_RitelPrakarsaInformasiPinjaman;

  factory _RitelPrakarsaInformasiPinjaman.fromJson(Map<String, dynamic> json) =
      _$_RitelPrakarsaInformasiPinjaman.fromJson;

  @override
  bool? get status;
  @override
  @JsonKey(ignore: true)
  _$$_RitelPrakarsaInformasiPinjamanCopyWith<_$_RitelPrakarsaInformasiPinjaman>
      get copyWith => throw _privateConstructorUsedError;
}

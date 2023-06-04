// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_prakarsa_agunan_pokok.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelPrakarsaAgunanPokok _$RitelPrakarsaAgunanPokokFromJson(
    Map<String, dynamic> json) {
  return _RitelPrakarsaAgunanPokok.fromJson(json);
}

/// @nodoc
mixin _$RitelPrakarsaAgunanPokok {
  String? get id => throw _privateConstructorUsedError;
  String? get prakarsaId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelPrakarsaAgunanPokokCopyWith<RitelPrakarsaAgunanPokok> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelPrakarsaAgunanPokokCopyWith<$Res> {
  factory $RitelPrakarsaAgunanPokokCopyWith(RitelPrakarsaAgunanPokok value,
          $Res Function(RitelPrakarsaAgunanPokok) then) =
      _$RitelPrakarsaAgunanPokokCopyWithImpl<$Res, RitelPrakarsaAgunanPokok>;
  @useResult
  $Res call({String? id, String? prakarsaId, String? status});
}

/// @nodoc
class _$RitelPrakarsaAgunanPokokCopyWithImpl<$Res,
        $Val extends RitelPrakarsaAgunanPokok>
    implements $RitelPrakarsaAgunanPokokCopyWith<$Res> {
  _$RitelPrakarsaAgunanPokokCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? prakarsaId = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      prakarsaId: freezed == prakarsaId
          ? _value.prakarsaId
          : prakarsaId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RitelPrakarsaAgunanPokokCopyWith<$Res>
    implements $RitelPrakarsaAgunanPokokCopyWith<$Res> {
  factory _$$_RitelPrakarsaAgunanPokokCopyWith(
          _$_RitelPrakarsaAgunanPokok value,
          $Res Function(_$_RitelPrakarsaAgunanPokok) then) =
      __$$_RitelPrakarsaAgunanPokokCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? prakarsaId, String? status});
}

/// @nodoc
class __$$_RitelPrakarsaAgunanPokokCopyWithImpl<$Res>
    extends _$RitelPrakarsaAgunanPokokCopyWithImpl<$Res,
        _$_RitelPrakarsaAgunanPokok>
    implements _$$_RitelPrakarsaAgunanPokokCopyWith<$Res> {
  __$$_RitelPrakarsaAgunanPokokCopyWithImpl(_$_RitelPrakarsaAgunanPokok _value,
      $Res Function(_$_RitelPrakarsaAgunanPokok) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? prakarsaId = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_RitelPrakarsaAgunanPokok(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      prakarsaId: freezed == prakarsaId
          ? _value.prakarsaId
          : prakarsaId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_RitelPrakarsaAgunanPokok implements _RitelPrakarsaAgunanPokok {
  _$_RitelPrakarsaAgunanPokok({this.id, this.prakarsaId, this.status});

  factory _$_RitelPrakarsaAgunanPokok.fromJson(Map<String, dynamic> json) =>
      _$$_RitelPrakarsaAgunanPokokFromJson(json);

  @override
  final String? id;
  @override
  final String? prakarsaId;
  @override
  final String? status;

  @override
  String toString() {
    return 'RitelPrakarsaAgunanPokok(id: $id, prakarsaId: $prakarsaId, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelPrakarsaAgunanPokok &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.prakarsaId, prakarsaId) ||
                other.prakarsaId == prakarsaId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, prakarsaId, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelPrakarsaAgunanPokokCopyWith<_$_RitelPrakarsaAgunanPokok>
      get copyWith => __$$_RitelPrakarsaAgunanPokokCopyWithImpl<
          _$_RitelPrakarsaAgunanPokok>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelPrakarsaAgunanPokokToJson(
      this,
    );
  }
}

abstract class _RitelPrakarsaAgunanPokok implements RitelPrakarsaAgunanPokok {
  factory _RitelPrakarsaAgunanPokok(
      {final String? id,
      final String? prakarsaId,
      final String? status}) = _$_RitelPrakarsaAgunanPokok;

  factory _RitelPrakarsaAgunanPokok.fromJson(Map<String, dynamic> json) =
      _$_RitelPrakarsaAgunanPokok.fromJson;

  @override
  String? get id;
  @override
  String? get prakarsaId;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_RitelPrakarsaAgunanPokokCopyWith<_$_RitelPrakarsaAgunanPokok>
      get copyWith => throw _privateConstructorUsedError;
}

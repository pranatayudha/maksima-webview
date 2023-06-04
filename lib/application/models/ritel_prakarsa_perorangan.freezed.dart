// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_prakarsa_perorangan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelPrakarsaPerorangan _$RitelPrakarsaPeroranganFromJson(
    Map<String, dynamic> json) {
  return _RitelPrakarsaPerorangan.fromJson(json);
}

/// @nodoc
mixin _$RitelPrakarsaPerorangan {
  String? get id => throw _privateConstructorUsedError;
  String? get pipeline_flagId => throw _privateConstructorUsedError;
  String? get ktpNum => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelPrakarsaPeroranganCopyWith<RitelPrakarsaPerorangan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelPrakarsaPeroranganCopyWith<$Res> {
  factory $RitelPrakarsaPeroranganCopyWith(RitelPrakarsaPerorangan value,
          $Res Function(RitelPrakarsaPerorangan) then) =
      _$RitelPrakarsaPeroranganCopyWithImpl<$Res, RitelPrakarsaPerorangan>;
  @useResult
  $Res call(
      {String? id, String? pipeline_flagId, String? ktpNum, String? fullName});
}

/// @nodoc
class _$RitelPrakarsaPeroranganCopyWithImpl<$Res,
        $Val extends RitelPrakarsaPerorangan>
    implements $RitelPrakarsaPeroranganCopyWith<$Res> {
  _$RitelPrakarsaPeroranganCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? pipeline_flagId = freezed,
    Object? ktpNum = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      pipeline_flagId: freezed == pipeline_flagId
          ? _value.pipeline_flagId
          : pipeline_flagId // ignore: cast_nullable_to_non_nullable
              as String?,
      ktpNum: freezed == ktpNum
          ? _value.ktpNum
          : ktpNum // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RitelPrakarsaPeroranganCopyWith<$Res>
    implements $RitelPrakarsaPeroranganCopyWith<$Res> {
  factory _$$_RitelPrakarsaPeroranganCopyWith(_$_RitelPrakarsaPerorangan value,
          $Res Function(_$_RitelPrakarsaPerorangan) then) =
      __$$_RitelPrakarsaPeroranganCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id, String? pipeline_flagId, String? ktpNum, String? fullName});
}

/// @nodoc
class __$$_RitelPrakarsaPeroranganCopyWithImpl<$Res>
    extends _$RitelPrakarsaPeroranganCopyWithImpl<$Res,
        _$_RitelPrakarsaPerorangan>
    implements _$$_RitelPrakarsaPeroranganCopyWith<$Res> {
  __$$_RitelPrakarsaPeroranganCopyWithImpl(_$_RitelPrakarsaPerorangan _value,
      $Res Function(_$_RitelPrakarsaPerorangan) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? pipeline_flagId = freezed,
    Object? ktpNum = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_$_RitelPrakarsaPerorangan(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      pipeline_flagId: freezed == pipeline_flagId
          ? _value.pipeline_flagId
          : pipeline_flagId // ignore: cast_nullable_to_non_nullable
              as String?,
      ktpNum: freezed == ktpNum
          ? _value.ktpNum
          : ktpNum // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_RitelPrakarsaPerorangan implements _RitelPrakarsaPerorangan {
  _$_RitelPrakarsaPerorangan(
      {this.id, this.pipeline_flagId, this.ktpNum, this.fullName});

  factory _$_RitelPrakarsaPerorangan.fromJson(Map<String, dynamic> json) =>
      _$$_RitelPrakarsaPeroranganFromJson(json);

  @override
  final String? id;
  @override
  final String? pipeline_flagId;
  @override
  final String? ktpNum;
  @override
  final String? fullName;

  @override
  String toString() {
    return 'RitelPrakarsaPerorangan(id: $id, pipeline_flagId: $pipeline_flagId, ktpNum: $ktpNum, fullName: $fullName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelPrakarsaPerorangan &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pipeline_flagId, pipeline_flagId) ||
                other.pipeline_flagId == pipeline_flagId) &&
            (identical(other.ktpNum, ktpNum) || other.ktpNum == ktpNum) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, pipeline_flagId, ktpNum, fullName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelPrakarsaPeroranganCopyWith<_$_RitelPrakarsaPerorangan>
      get copyWith =>
          __$$_RitelPrakarsaPeroranganCopyWithImpl<_$_RitelPrakarsaPerorangan>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelPrakarsaPeroranganToJson(
      this,
    );
  }
}

abstract class _RitelPrakarsaPerorangan implements RitelPrakarsaPerorangan {
  factory _RitelPrakarsaPerorangan(
      {final String? id,
      final String? pipeline_flagId,
      final String? ktpNum,
      final String? fullName}) = _$_RitelPrakarsaPerorangan;

  factory _RitelPrakarsaPerorangan.fromJson(Map<String, dynamic> json) =
      _$_RitelPrakarsaPerorangan.fromJson;

  @override
  String? get id;
  @override
  String? get pipeline_flagId;
  @override
  String? get ktpNum;
  @override
  String? get fullName;
  @override
  @JsonKey(ignore: true)
  _$$_RitelPrakarsaPeroranganCopyWith<_$_RitelPrakarsaPerorangan>
      get copyWith => throw _privateConstructorUsedError;
}

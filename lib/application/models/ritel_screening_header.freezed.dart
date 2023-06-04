// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_screening_header.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelScreeningHeader _$RitelScreeningHeaderFromJson(Map<String, dynamic> json) {
  return _RitelScreeningHeader.fromJson(json);
}

/// @nodoc
mixin _$RitelScreeningHeader {
  String? get pipeline_flagId => throw _privateConstructorUsedError;
  String? get pipelinesId => throw _privateConstructorUsedError;
  int? get codeTable => throw _privateConstructorUsedError;
  String? get resultScreening => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelScreeningHeaderCopyWith<RitelScreeningHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelScreeningHeaderCopyWith<$Res> {
  factory $RitelScreeningHeaderCopyWith(RitelScreeningHeader value,
          $Res Function(RitelScreeningHeader) then) =
      _$RitelScreeningHeaderCopyWithImpl<$Res, RitelScreeningHeader>;
  @useResult
  $Res call(
      {String? pipeline_flagId,
      String? pipelinesId,
      int? codeTable,
      String? resultScreening});
}

/// @nodoc
class _$RitelScreeningHeaderCopyWithImpl<$Res,
        $Val extends RitelScreeningHeader>
    implements $RitelScreeningHeaderCopyWith<$Res> {
  _$RitelScreeningHeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pipeline_flagId = freezed,
    Object? pipelinesId = freezed,
    Object? codeTable = freezed,
    Object? resultScreening = freezed,
  }) {
    return _then(_value.copyWith(
      pipeline_flagId: freezed == pipeline_flagId
          ? _value.pipeline_flagId
          : pipeline_flagId // ignore: cast_nullable_to_non_nullable
              as String?,
      pipelinesId: freezed == pipelinesId
          ? _value.pipelinesId
          : pipelinesId // ignore: cast_nullable_to_non_nullable
              as String?,
      codeTable: freezed == codeTable
          ? _value.codeTable
          : codeTable // ignore: cast_nullable_to_non_nullable
              as int?,
      resultScreening: freezed == resultScreening
          ? _value.resultScreening
          : resultScreening // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RitelScreeningHeaderCopyWith<$Res>
    implements $RitelScreeningHeaderCopyWith<$Res> {
  factory _$$_RitelScreeningHeaderCopyWith(_$_RitelScreeningHeader value,
          $Res Function(_$_RitelScreeningHeader) then) =
      __$$_RitelScreeningHeaderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? pipeline_flagId,
      String? pipelinesId,
      int? codeTable,
      String? resultScreening});
}

/// @nodoc
class __$$_RitelScreeningHeaderCopyWithImpl<$Res>
    extends _$RitelScreeningHeaderCopyWithImpl<$Res, _$_RitelScreeningHeader>
    implements _$$_RitelScreeningHeaderCopyWith<$Res> {
  __$$_RitelScreeningHeaderCopyWithImpl(_$_RitelScreeningHeader _value,
      $Res Function(_$_RitelScreeningHeader) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pipeline_flagId = freezed,
    Object? pipelinesId = freezed,
    Object? codeTable = freezed,
    Object? resultScreening = freezed,
  }) {
    return _then(_$_RitelScreeningHeader(
      pipeline_flagId: freezed == pipeline_flagId
          ? _value.pipeline_flagId
          : pipeline_flagId // ignore: cast_nullable_to_non_nullable
              as String?,
      pipelinesId: freezed == pipelinesId
          ? _value.pipelinesId
          : pipelinesId // ignore: cast_nullable_to_non_nullable
              as String?,
      codeTable: freezed == codeTable
          ? _value.codeTable
          : codeTable // ignore: cast_nullable_to_non_nullable
              as int?,
      resultScreening: freezed == resultScreening
          ? _value.resultScreening
          : resultScreening // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_RitelScreeningHeader implements _RitelScreeningHeader {
  _$_RitelScreeningHeader(
      {this.pipeline_flagId,
      this.pipelinesId,
      this.codeTable,
      this.resultScreening});

  factory _$_RitelScreeningHeader.fromJson(Map<String, dynamic> json) =>
      _$$_RitelScreeningHeaderFromJson(json);

  @override
  final String? pipeline_flagId;
  @override
  final String? pipelinesId;
  @override
  final int? codeTable;
  @override
  final String? resultScreening;

  @override
  String toString() {
    return 'RitelScreeningHeader(pipeline_flagId: $pipeline_flagId, pipelinesId: $pipelinesId, codeTable: $codeTable, resultScreening: $resultScreening)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelScreeningHeader &&
            (identical(other.pipeline_flagId, pipeline_flagId) ||
                other.pipeline_flagId == pipeline_flagId) &&
            (identical(other.pipelinesId, pipelinesId) ||
                other.pipelinesId == pipelinesId) &&
            (identical(other.codeTable, codeTable) ||
                other.codeTable == codeTable) &&
            (identical(other.resultScreening, resultScreening) ||
                other.resultScreening == resultScreening));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, pipeline_flagId, pipelinesId, codeTable, resultScreening);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelScreeningHeaderCopyWith<_$_RitelScreeningHeader> get copyWith =>
      __$$_RitelScreeningHeaderCopyWithImpl<_$_RitelScreeningHeader>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelScreeningHeaderToJson(
      this,
    );
  }
}

abstract class _RitelScreeningHeader implements RitelScreeningHeader {
  factory _RitelScreeningHeader(
      {final String? pipeline_flagId,
      final String? pipelinesId,
      final int? codeTable,
      final String? resultScreening}) = _$_RitelScreeningHeader;

  factory _RitelScreeningHeader.fromJson(Map<String, dynamic> json) =
      _$_RitelScreeningHeader.fromJson;

  @override
  String? get pipeline_flagId;
  @override
  String? get pipelinesId;
  @override
  int? get codeTable;
  @override
  String? get resultScreening;
  @override
  @JsonKey(ignore: true)
  _$$_RitelScreeningHeaderCopyWith<_$_RitelScreeningHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

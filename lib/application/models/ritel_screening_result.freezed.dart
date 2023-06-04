// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_screening_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelScreeningResult _$RitelScreeningResultFromJson(Map<String, dynamic> json) {
  return _RitelScreeningResult.fromJson(json);
}

/// @nodoc
mixin _$RitelScreeningResult {
  RitelScreeningHeader? get header => throw _privateConstructorUsedError;
  dynamic get screeningSummary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelScreeningResultCopyWith<RitelScreeningResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelScreeningResultCopyWith<$Res> {
  factory $RitelScreeningResultCopyWith(RitelScreeningResult value,
          $Res Function(RitelScreeningResult) then) =
      _$RitelScreeningResultCopyWithImpl<$Res, RitelScreeningResult>;
  @useResult
  $Res call({RitelScreeningHeader? header, dynamic screeningSummary});

  $RitelScreeningHeaderCopyWith<$Res>? get header;
}

/// @nodoc
class _$RitelScreeningResultCopyWithImpl<$Res,
        $Val extends RitelScreeningResult>
    implements $RitelScreeningResultCopyWith<$Res> {
  _$RitelScreeningResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? screeningSummary = null,
  }) {
    return _then(_value.copyWith(
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as RitelScreeningHeader?,
      screeningSummary: null == screeningSummary
          ? _value.screeningSummary
          : screeningSummary // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RitelScreeningHeaderCopyWith<$Res>? get header {
    if (_value.header == null) {
      return null;
    }

    return $RitelScreeningHeaderCopyWith<$Res>(_value.header!, (value) {
      return _then(_value.copyWith(header: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RitelScreeningResultCopyWith<$Res>
    implements $RitelScreeningResultCopyWith<$Res> {
  factory _$$_RitelScreeningResultCopyWith(_$_RitelScreeningResult value,
          $Res Function(_$_RitelScreeningResult) then) =
      __$$_RitelScreeningResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RitelScreeningHeader? header, dynamic screeningSummary});

  @override
  $RitelScreeningHeaderCopyWith<$Res>? get header;
}

/// @nodoc
class __$$_RitelScreeningResultCopyWithImpl<$Res>
    extends _$RitelScreeningResultCopyWithImpl<$Res, _$_RitelScreeningResult>
    implements _$$_RitelScreeningResultCopyWith<$Res> {
  __$$_RitelScreeningResultCopyWithImpl(_$_RitelScreeningResult _value,
      $Res Function(_$_RitelScreeningResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? screeningSummary = null,
  }) {
    return _then(_$_RitelScreeningResult(
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as RitelScreeningHeader?,
      screeningSummary: null == screeningSummary
          ? _value.screeningSummary
          : screeningSummary // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_RitelScreeningResult implements _RitelScreeningResult {
  _$_RitelScreeningResult({this.header, this.screeningSummary});

  factory _$_RitelScreeningResult.fromJson(Map<String, dynamic> json) =>
      _$$_RitelScreeningResultFromJson(json);

  @override
  final RitelScreeningHeader? header;
  @override
  final dynamic screeningSummary;

  @override
  String toString() {
    return 'RitelScreeningResult(header: $header, screeningSummary: $screeningSummary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelScreeningResult &&
            (identical(other.header, header) || other.header == header) &&
            const DeepCollectionEquality()
                .equals(other.screeningSummary, screeningSummary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, header,
      const DeepCollectionEquality().hash(screeningSummary));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelScreeningResultCopyWith<_$_RitelScreeningResult> get copyWith =>
      __$$_RitelScreeningResultCopyWithImpl<_$_RitelScreeningResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelScreeningResultToJson(
      this,
    );
  }
}

abstract class _RitelScreeningResult implements RitelScreeningResult {
  factory _RitelScreeningResult(
      {final RitelScreeningHeader? header,
      final dynamic screeningSummary}) = _$_RitelScreeningResult;

  factory _RitelScreeningResult.fromJson(Map<String, dynamic> json) =
      _$_RitelScreeningResult.fromJson;

  @override
  RitelScreeningHeader? get header;
  @override
  dynamic get screeningSummary;
  @override
  @JsonKey(ignore: true)
  _$$_RitelScreeningResultCopyWith<_$_RitelScreeningResult> get copyWith =>
      throw _privateConstructorUsedError;
}

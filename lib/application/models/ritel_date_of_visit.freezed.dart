// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_date_of_visit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelDateOfVisit _$RitelDateOfVisitFromJson(Map<String, dynamic> json) {
  return _RitelDateOfVisit.fromJson(json);
}

/// @nodoc
mixin _$RitelDateOfVisit {
  String? get date => throw _privateConstructorUsedError;
  String? get newDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelDateOfVisitCopyWith<RitelDateOfVisit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelDateOfVisitCopyWith<$Res> {
  factory $RitelDateOfVisitCopyWith(
          RitelDateOfVisit value, $Res Function(RitelDateOfVisit) then) =
      _$RitelDateOfVisitCopyWithImpl<$Res, RitelDateOfVisit>;
  @useResult
  $Res call({String? date, String? newDate});
}

/// @nodoc
class _$RitelDateOfVisitCopyWithImpl<$Res, $Val extends RitelDateOfVisit>
    implements $RitelDateOfVisitCopyWith<$Res> {
  _$RitelDateOfVisitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? newDate = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      newDate: freezed == newDate
          ? _value.newDate
          : newDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RitelDateOfVisitCopyWith<$Res>
    implements $RitelDateOfVisitCopyWith<$Res> {
  factory _$$_RitelDateOfVisitCopyWith(
          _$_RitelDateOfVisit value, $Res Function(_$_RitelDateOfVisit) then) =
      __$$_RitelDateOfVisitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? date, String? newDate});
}

/// @nodoc
class __$$_RitelDateOfVisitCopyWithImpl<$Res>
    extends _$RitelDateOfVisitCopyWithImpl<$Res, _$_RitelDateOfVisit>
    implements _$$_RitelDateOfVisitCopyWith<$Res> {
  __$$_RitelDateOfVisitCopyWithImpl(
      _$_RitelDateOfVisit _value, $Res Function(_$_RitelDateOfVisit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? newDate = freezed,
  }) {
    return _then(_$_RitelDateOfVisit(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      newDate: freezed == newDate
          ? _value.newDate
          : newDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_RitelDateOfVisit implements _RitelDateOfVisit {
  _$_RitelDateOfVisit({this.date, this.newDate});

  factory _$_RitelDateOfVisit.fromJson(Map<String, dynamic> json) =>
      _$$_RitelDateOfVisitFromJson(json);

  @override
  final String? date;
  @override
  final String? newDate;

  @override
  String toString() {
    return 'RitelDateOfVisit(date: $date, newDate: $newDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelDateOfVisit &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.newDate, newDate) || other.newDate == newDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, newDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelDateOfVisitCopyWith<_$_RitelDateOfVisit> get copyWith =>
      __$$_RitelDateOfVisitCopyWithImpl<_$_RitelDateOfVisit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelDateOfVisitToJson(
      this,
    );
  }
}

abstract class _RitelDateOfVisit implements RitelDateOfVisit {
  factory _RitelDateOfVisit({final String? date, final String? newDate}) =
      _$_RitelDateOfVisit;

  factory _RitelDateOfVisit.fromJson(Map<String, dynamic> json) =
      _$_RitelDateOfVisit.fromJson;

  @override
  String? get date;
  @override
  String? get newDate;
  @override
  @JsonKey(ignore: true)
  _$$_RitelDateOfVisitCopyWith<_$_RitelDateOfVisit> get copyWith =>
      throw _privateConstructorUsedError;
}

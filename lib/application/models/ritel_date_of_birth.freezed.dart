// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_date_of_birth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelDateOfBirth _$RitelDateOfBirthFromJson(Map<String, dynamic> json) {
  return _RitelDateOfBirth.fromJson(json);
}

/// @nodoc
mixin _$RitelDateOfBirth {
  String? get date => throw _privateConstructorUsedError;
  String? get newDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelDateOfBirthCopyWith<RitelDateOfBirth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelDateOfBirthCopyWith<$Res> {
  factory $RitelDateOfBirthCopyWith(
          RitelDateOfBirth value, $Res Function(RitelDateOfBirth) then) =
      _$RitelDateOfBirthCopyWithImpl<$Res, RitelDateOfBirth>;
  @useResult
  $Res call({String? date, String? newDate});
}

/// @nodoc
class _$RitelDateOfBirthCopyWithImpl<$Res, $Val extends RitelDateOfBirth>
    implements $RitelDateOfBirthCopyWith<$Res> {
  _$RitelDateOfBirthCopyWithImpl(this._value, this._then);

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
abstract class _$$_RitelDateOfBirthCopyWith<$Res>
    implements $RitelDateOfBirthCopyWith<$Res> {
  factory _$$_RitelDateOfBirthCopyWith(
          _$_RitelDateOfBirth value, $Res Function(_$_RitelDateOfBirth) then) =
      __$$_RitelDateOfBirthCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? date, String? newDate});
}

/// @nodoc
class __$$_RitelDateOfBirthCopyWithImpl<$Res>
    extends _$RitelDateOfBirthCopyWithImpl<$Res, _$_RitelDateOfBirth>
    implements _$$_RitelDateOfBirthCopyWith<$Res> {
  __$$_RitelDateOfBirthCopyWithImpl(
      _$_RitelDateOfBirth _value, $Res Function(_$_RitelDateOfBirth) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? newDate = freezed,
  }) {
    return _then(_$_RitelDateOfBirth(
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
class _$_RitelDateOfBirth implements _RitelDateOfBirth {
  _$_RitelDateOfBirth({this.date, this.newDate});

  factory _$_RitelDateOfBirth.fromJson(Map<String, dynamic> json) =>
      _$$_RitelDateOfBirthFromJson(json);

  @override
  final String? date;
  @override
  final String? newDate;

  @override
  String toString() {
    return 'RitelDateOfBirth(date: $date, newDate: $newDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelDateOfBirth &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.newDate, newDate) || other.newDate == newDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, newDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelDateOfBirthCopyWith<_$_RitelDateOfBirth> get copyWith =>
      __$$_RitelDateOfBirthCopyWithImpl<_$_RitelDateOfBirth>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelDateOfBirthToJson(
      this,
    );
  }
}

abstract class _RitelDateOfBirth implements RitelDateOfBirth {
  factory _RitelDateOfBirth({final String? date, final String? newDate}) =
      _$_RitelDateOfBirth;

  factory _RitelDateOfBirth.fromJson(Map<String, dynamic> json) =
      _$_RitelDateOfBirth.fromJson;

  @override
  String? get date;
  @override
  String? get newDate;
  @override
  @JsonKey(ignore: true)
  _$$_RitelDateOfBirthCopyWith<_$_RitelDateOfBirth> get copyWith =>
      throw _privateConstructorUsedError;
}

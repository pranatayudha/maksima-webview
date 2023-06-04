// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_trade_checking_stepper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelTradeCheckingStepper _$RitelTradeCheckingStepperFromJson(
    Map<String, dynamic> json) {
  return _RitelTradeCheckingStepper.fromJson(json);
}

/// @nodoc
mixin _$RitelTradeCheckingStepper {
  bool? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelTradeCheckingStepperCopyWith<RitelTradeCheckingStepper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelTradeCheckingStepperCopyWith<$Res> {
  factory $RitelTradeCheckingStepperCopyWith(RitelTradeCheckingStepper value,
          $Res Function(RitelTradeCheckingStepper) then) =
      _$RitelTradeCheckingStepperCopyWithImpl<$Res, RitelTradeCheckingStepper>;
  @useResult
  $Res call({bool? status});
}

/// @nodoc
class _$RitelTradeCheckingStepperCopyWithImpl<$Res,
        $Val extends RitelTradeCheckingStepper>
    implements $RitelTradeCheckingStepperCopyWith<$Res> {
  _$RitelTradeCheckingStepperCopyWithImpl(this._value, this._then);

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
abstract class _$$_RitelTradeCheckingStepperCopyWith<$Res>
    implements $RitelTradeCheckingStepperCopyWith<$Res> {
  factory _$$_RitelTradeCheckingStepperCopyWith(
          _$_RitelTradeCheckingStepper value,
          $Res Function(_$_RitelTradeCheckingStepper) then) =
      __$$_RitelTradeCheckingStepperCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status});
}

/// @nodoc
class __$$_RitelTradeCheckingStepperCopyWithImpl<$Res>
    extends _$RitelTradeCheckingStepperCopyWithImpl<$Res,
        _$_RitelTradeCheckingStepper>
    implements _$$_RitelTradeCheckingStepperCopyWith<$Res> {
  __$$_RitelTradeCheckingStepperCopyWithImpl(
      _$_RitelTradeCheckingStepper _value,
      $Res Function(_$_RitelTradeCheckingStepper) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$_RitelTradeCheckingStepper(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_RitelTradeCheckingStepper implements _RitelTradeCheckingStepper {
  _$_RitelTradeCheckingStepper({this.status});

  factory _$_RitelTradeCheckingStepper.fromJson(Map<String, dynamic> json) =>
      _$$_RitelTradeCheckingStepperFromJson(json);

  @override
  final bool? status;

  @override
  String toString() {
    return 'RitelTradeCheckingStepper(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelTradeCheckingStepper &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelTradeCheckingStepperCopyWith<_$_RitelTradeCheckingStepper>
      get copyWith => __$$_RitelTradeCheckingStepperCopyWithImpl<
          _$_RitelTradeCheckingStepper>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelTradeCheckingStepperToJson(
      this,
    );
  }
}

abstract class _RitelTradeCheckingStepper implements RitelTradeCheckingStepper {
  factory _RitelTradeCheckingStepper({final bool? status}) =
      _$_RitelTradeCheckingStepper;

  factory _RitelTradeCheckingStepper.fromJson(Map<String, dynamic> json) =
      _$_RitelTradeCheckingStepper.fromJson;

  @override
  bool? get status;
  @override
  @JsonKey(ignore: true)
  _$$_RitelTradeCheckingStepperCopyWith<_$_RitelTradeCheckingStepper>
      get copyWith => throw _privateConstructorUsedError;
}

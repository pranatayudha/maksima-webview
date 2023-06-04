// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_tag_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelTagLocation _$RitelTagLocationFromJson(Map<String, dynamic> json) {
  return _RitelTagLocation.fromJson(json);
}

/// @nodoc
mixin _$RitelTagLocation {
  String? get latLng => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelTagLocationCopyWith<RitelTagLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelTagLocationCopyWith<$Res> {
  factory $RitelTagLocationCopyWith(
          RitelTagLocation value, $Res Function(RitelTagLocation) then) =
      _$RitelTagLocationCopyWithImpl<$Res, RitelTagLocation>;
  @useResult
  $Res call({String? latLng, String? name});
}

/// @nodoc
class _$RitelTagLocationCopyWithImpl<$Res, $Val extends RitelTagLocation>
    implements $RitelTagLocationCopyWith<$Res> {
  _$RitelTagLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latLng = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      latLng: freezed == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RitelTagLocationCopyWith<$Res>
    implements $RitelTagLocationCopyWith<$Res> {
  factory _$$_RitelTagLocationCopyWith(
          _$_RitelTagLocation value, $Res Function(_$_RitelTagLocation) then) =
      __$$_RitelTagLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? latLng, String? name});
}

/// @nodoc
class __$$_RitelTagLocationCopyWithImpl<$Res>
    extends _$RitelTagLocationCopyWithImpl<$Res, _$_RitelTagLocation>
    implements _$$_RitelTagLocationCopyWith<$Res> {
  __$$_RitelTagLocationCopyWithImpl(
      _$_RitelTagLocation _value, $Res Function(_$_RitelTagLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latLng = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_RitelTagLocation(
      latLng: freezed == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_RitelTagLocation implements _RitelTagLocation {
  _$_RitelTagLocation({this.latLng, this.name});

  factory _$_RitelTagLocation.fromJson(Map<String, dynamic> json) =>
      _$$_RitelTagLocationFromJson(json);

  @override
  final String? latLng;
  @override
  final String? name;

  @override
  String toString() {
    return 'RitelTagLocation(latLng: $latLng, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelTagLocation &&
            (identical(other.latLng, latLng) || other.latLng == latLng) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latLng, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelTagLocationCopyWith<_$_RitelTagLocation> get copyWith =>
      __$$_RitelTagLocationCopyWithImpl<_$_RitelTagLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelTagLocationToJson(
      this,
    );
  }
}

abstract class _RitelTagLocation implements RitelTagLocation {
  factory _RitelTagLocation({final String? latLng, final String? name}) =
      _$_RitelTagLocation;

  factory _RitelTagLocation.fromJson(Map<String, dynamic> json) =
      _$_RitelTagLocation.fromJson;

  @override
  String? get latLng;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_RitelTagLocationCopyWith<_$_RitelTagLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

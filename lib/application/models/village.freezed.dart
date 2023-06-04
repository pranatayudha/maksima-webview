// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'village.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Village _$VillageFromJson(Map<String, dynamic> json) {
  return _Village.fromJson(json);
}

/// @nodoc
mixin _$Village {
  String? get villageCode => throw _privateConstructorUsedError;
  String? get village => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VillageCopyWith<Village> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VillageCopyWith<$Res> {
  factory $VillageCopyWith(Village value, $Res Function(Village) then) =
      _$VillageCopyWithImpl<$Res, Village>;
  @useResult
  $Res call({String? villageCode, String? village});
}

/// @nodoc
class _$VillageCopyWithImpl<$Res, $Val extends Village>
    implements $VillageCopyWith<$Res> {
  _$VillageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? villageCode = freezed,
    Object? village = freezed,
  }) {
    return _then(_value.copyWith(
      villageCode: freezed == villageCode
          ? _value.villageCode
          : villageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      village: freezed == village
          ? _value.village
          : village // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VillageCopyWith<$Res> implements $VillageCopyWith<$Res> {
  factory _$$_VillageCopyWith(
          _$_Village value, $Res Function(_$_Village) then) =
      __$$_VillageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? villageCode, String? village});
}

/// @nodoc
class __$$_VillageCopyWithImpl<$Res>
    extends _$VillageCopyWithImpl<$Res, _$_Village>
    implements _$$_VillageCopyWith<$Res> {
  __$$_VillageCopyWithImpl(_$_Village _value, $Res Function(_$_Village) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? villageCode = freezed,
    Object? village = freezed,
  }) {
    return _then(_$_Village(
      villageCode: freezed == villageCode
          ? _value.villageCode
          : villageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      village: freezed == village
          ? _value.village
          : village // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_Village implements _Village {
  _$_Village({this.villageCode, this.village});

  factory _$_Village.fromJson(Map<String, dynamic> json) =>
      _$$_VillageFromJson(json);

  @override
  final String? villageCode;
  @override
  final String? village;

  @override
  String toString() {
    return 'Village(villageCode: $villageCode, village: $village)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Village &&
            (identical(other.villageCode, villageCode) ||
                other.villageCode == villageCode) &&
            (identical(other.village, village) || other.village == village));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, villageCode, village);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VillageCopyWith<_$_Village> get copyWith =>
      __$$_VillageCopyWithImpl<_$_Village>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VillageToJson(
      this,
    );
  }
}

abstract class _Village implements Village {
  factory _Village({final String? villageCode, final String? village}) =
      _$_Village;

  factory _Village.fromJson(Map<String, dynamic> json) = _$_Village.fromJson;

  @override
  String? get villageCode;
  @override
  String? get village;
  @override
  @JsonKey(ignore: true)
  _$$_VillageCopyWith<_$_Village> get copyWith =>
      throw _privateConstructorUsedError;
}

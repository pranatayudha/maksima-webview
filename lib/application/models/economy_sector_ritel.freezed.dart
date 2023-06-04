// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'economy_sector_ritel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EconomySectorRitel _$EconomySectorRitelFromJson(Map<String, dynamic> json) {
  return _EconomySectorRitel.fromJson(json);
}

/// @nodoc
mixin _$EconomySectorRitel {
  String? get economy_sectorsId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EconomySectorRitelCopyWith<EconomySectorRitel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EconomySectorRitelCopyWith<$Res> {
  factory $EconomySectorRitelCopyWith(
          EconomySectorRitel value, $Res Function(EconomySectorRitel) then) =
      _$EconomySectorRitelCopyWithImpl<$Res, EconomySectorRitel>;
  @useResult
  $Res call({String? economy_sectorsId, String? name});
}

/// @nodoc
class _$EconomySectorRitelCopyWithImpl<$Res, $Val extends EconomySectorRitel>
    implements $EconomySectorRitelCopyWith<$Res> {
  _$EconomySectorRitelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? economy_sectorsId = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      economy_sectorsId: freezed == economy_sectorsId
          ? _value.economy_sectorsId
          : economy_sectorsId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EconomySectorRitelCopyWith<$Res>
    implements $EconomySectorRitelCopyWith<$Res> {
  factory _$$_EconomySectorRitelCopyWith(_$_EconomySectorRitel value,
          $Res Function(_$_EconomySectorRitel) then) =
      __$$_EconomySectorRitelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? economy_sectorsId, String? name});
}

/// @nodoc
class __$$_EconomySectorRitelCopyWithImpl<$Res>
    extends _$EconomySectorRitelCopyWithImpl<$Res, _$_EconomySectorRitel>
    implements _$$_EconomySectorRitelCopyWith<$Res> {
  __$$_EconomySectorRitelCopyWithImpl(
      _$_EconomySectorRitel _value, $Res Function(_$_EconomySectorRitel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? economy_sectorsId = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_EconomySectorRitel(
      economy_sectorsId: freezed == economy_sectorsId
          ? _value.economy_sectorsId
          : economy_sectorsId // ignore: cast_nullable_to_non_nullable
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
class _$_EconomySectorRitel implements _EconomySectorRitel {
  _$_EconomySectorRitel({this.economy_sectorsId, this.name});

  factory _$_EconomySectorRitel.fromJson(Map<String, dynamic> json) =>
      _$$_EconomySectorRitelFromJson(json);

  @override
  final String? economy_sectorsId;
  @override
  final String? name;

  @override
  String toString() {
    return 'EconomySectorRitel(economy_sectorsId: $economy_sectorsId, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EconomySectorRitel &&
            (identical(other.economy_sectorsId, economy_sectorsId) ||
                other.economy_sectorsId == economy_sectorsId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, economy_sectorsId, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EconomySectorRitelCopyWith<_$_EconomySectorRitel> get copyWith =>
      __$$_EconomySectorRitelCopyWithImpl<_$_EconomySectorRitel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EconomySectorRitelToJson(
      this,
    );
  }
}

abstract class _EconomySectorRitel implements EconomySectorRitel {
  factory _EconomySectorRitel(
      {final String? economy_sectorsId,
      final String? name}) = _$_EconomySectorRitel;

  factory _EconomySectorRitel.fromJson(Map<String, dynamic> json) =
      _$_EconomySectorRitel.fromJson;

  @override
  String? get economy_sectorsId;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_EconomySectorRitelCopyWith<_$_EconomySectorRitel> get copyWith =>
      throw _privateConstructorUsedError;
}

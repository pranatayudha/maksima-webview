// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'filter_ritel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FilterRitel _$FilterRitelFromJson(Map<String, dynamic> json) {
  return _FilterRitel.fromJson(json);
}

/// @nodoc
mixin _$FilterRitel {
  String? get name => throw _privateConstructorUsedError;
  int? get value => throw _privateConstructorUsedError;
  bool? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilterRitelCopyWith<FilterRitel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterRitelCopyWith<$Res> {
  factory $FilterRitelCopyWith(
          FilterRitel value, $Res Function(FilterRitel) then) =
      _$FilterRitelCopyWithImpl<$Res, FilterRitel>;
  @useResult
  $Res call({String? name, int? value, bool? status});
}

/// @nodoc
class _$FilterRitelCopyWithImpl<$Res, $Val extends FilterRitel>
    implements $FilterRitelCopyWith<$Res> {
  _$FilterRitelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? value = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterRitelCopyWith<$Res>
    implements $FilterRitelCopyWith<$Res> {
  factory _$$_FilterRitelCopyWith(
          _$_FilterRitel value, $Res Function(_$_FilterRitel) then) =
      __$$_FilterRitelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, int? value, bool? status});
}

/// @nodoc
class __$$_FilterRitelCopyWithImpl<$Res>
    extends _$FilterRitelCopyWithImpl<$Res, _$_FilterRitel>
    implements _$$_FilterRitelCopyWith<$Res> {
  __$$_FilterRitelCopyWithImpl(
      _$_FilterRitel _value, $Res Function(_$_FilterRitel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? value = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_FilterRitel(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_FilterRitel implements _FilterRitel {
  _$_FilterRitel({this.name, this.value, this.status});

  factory _$_FilterRitel.fromJson(Map<String, dynamic> json) =>
      _$$_FilterRitelFromJson(json);

  @override
  final String? name;
  @override
  final int? value;
  @override
  final bool? status;

  @override
  String toString() {
    return 'FilterRitel(name: $name, value: $value, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterRitel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, value, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterRitelCopyWith<_$_FilterRitel> get copyWith =>
      __$$_FilterRitelCopyWithImpl<_$_FilterRitel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FilterRitelToJson(
      this,
    );
  }
}

abstract class _FilterRitel implements FilterRitel {
  factory _FilterRitel(
      {final String? name,
      final int? value,
      final bool? status}) = _$_FilterRitel;

  factory _FilterRitel.fromJson(Map<String, dynamic> json) =
      _$_FilterRitel.fromJson;

  @override
  String? get name;
  @override
  int? get value;
  @override
  bool? get status;
  @override
  @JsonKey(ignore: true)
  _$$_FilterRitelCopyWith<_$_FilterRitel> get copyWith =>
      throw _privateConstructorUsedError;
}

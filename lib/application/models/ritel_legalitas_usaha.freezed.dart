// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_legalitas_usaha.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelLegalitasUsaha _$RitelLegalitasUsahaFromJson(Map<String, dynamic> json) {
  return _RitelLegalitasUsaha.fromJson(json);
}

/// @nodoc
mixin _$RitelLegalitasUsaha {
  List<RitelLegalitasUsahaUtama>? get mainDocument =>
      throw _privateConstructorUsedError;
  List<RitelLegalitasUsahaLainnya>? get additionalDocument =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelLegalitasUsahaCopyWith<RitelLegalitasUsaha> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelLegalitasUsahaCopyWith<$Res> {
  factory $RitelLegalitasUsahaCopyWith(
          RitelLegalitasUsaha value, $Res Function(RitelLegalitasUsaha) then) =
      _$RitelLegalitasUsahaCopyWithImpl<$Res, RitelLegalitasUsaha>;
  @useResult
  $Res call(
      {List<RitelLegalitasUsahaUtama>? mainDocument,
      List<RitelLegalitasUsahaLainnya>? additionalDocument});
}

/// @nodoc
class _$RitelLegalitasUsahaCopyWithImpl<$Res, $Val extends RitelLegalitasUsaha>
    implements $RitelLegalitasUsahaCopyWith<$Res> {
  _$RitelLegalitasUsahaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainDocument = freezed,
    Object? additionalDocument = freezed,
  }) {
    return _then(_value.copyWith(
      mainDocument: freezed == mainDocument
          ? _value.mainDocument
          : mainDocument // ignore: cast_nullable_to_non_nullable
              as List<RitelLegalitasUsahaUtama>?,
      additionalDocument: freezed == additionalDocument
          ? _value.additionalDocument
          : additionalDocument // ignore: cast_nullable_to_non_nullable
              as List<RitelLegalitasUsahaLainnya>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RitelLegalitasUsahaCopyWith<$Res>
    implements $RitelLegalitasUsahaCopyWith<$Res> {
  factory _$$_RitelLegalitasUsahaCopyWith(_$_RitelLegalitasUsaha value,
          $Res Function(_$_RitelLegalitasUsaha) then) =
      __$$_RitelLegalitasUsahaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<RitelLegalitasUsahaUtama>? mainDocument,
      List<RitelLegalitasUsahaLainnya>? additionalDocument});
}

/// @nodoc
class __$$_RitelLegalitasUsahaCopyWithImpl<$Res>
    extends _$RitelLegalitasUsahaCopyWithImpl<$Res, _$_RitelLegalitasUsaha>
    implements _$$_RitelLegalitasUsahaCopyWith<$Res> {
  __$$_RitelLegalitasUsahaCopyWithImpl(_$_RitelLegalitasUsaha _value,
      $Res Function(_$_RitelLegalitasUsaha) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainDocument = freezed,
    Object? additionalDocument = freezed,
  }) {
    return _then(_$_RitelLegalitasUsaha(
      mainDocument: freezed == mainDocument
          ? _value._mainDocument
          : mainDocument // ignore: cast_nullable_to_non_nullable
              as List<RitelLegalitasUsahaUtama>?,
      additionalDocument: freezed == additionalDocument
          ? _value._additionalDocument
          : additionalDocument // ignore: cast_nullable_to_non_nullable
              as List<RitelLegalitasUsahaLainnya>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_RitelLegalitasUsaha implements _RitelLegalitasUsaha {
  _$_RitelLegalitasUsaha(
      {final List<RitelLegalitasUsahaUtama>? mainDocument,
      final List<RitelLegalitasUsahaLainnya>? additionalDocument})
      : _mainDocument = mainDocument,
        _additionalDocument = additionalDocument;

  factory _$_RitelLegalitasUsaha.fromJson(Map<String, dynamic> json) =>
      _$$_RitelLegalitasUsahaFromJson(json);

  final List<RitelLegalitasUsahaUtama>? _mainDocument;
  @override
  List<RitelLegalitasUsahaUtama>? get mainDocument {
    final value = _mainDocument;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<RitelLegalitasUsahaLainnya>? _additionalDocument;
  @override
  List<RitelLegalitasUsahaLainnya>? get additionalDocument {
    final value = _additionalDocument;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RitelLegalitasUsaha(mainDocument: $mainDocument, additionalDocument: $additionalDocument)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelLegalitasUsaha &&
            const DeepCollectionEquality()
                .equals(other._mainDocument, _mainDocument) &&
            const DeepCollectionEquality()
                .equals(other._additionalDocument, _additionalDocument));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_mainDocument),
      const DeepCollectionEquality().hash(_additionalDocument));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelLegalitasUsahaCopyWith<_$_RitelLegalitasUsaha> get copyWith =>
      __$$_RitelLegalitasUsahaCopyWithImpl<_$_RitelLegalitasUsaha>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelLegalitasUsahaToJson(
      this,
    );
  }
}

abstract class _RitelLegalitasUsaha implements RitelLegalitasUsaha {
  factory _RitelLegalitasUsaha(
          {final List<RitelLegalitasUsahaUtama>? mainDocument,
          final List<RitelLegalitasUsahaLainnya>? additionalDocument}) =
      _$_RitelLegalitasUsaha;

  factory _RitelLegalitasUsaha.fromJson(Map<String, dynamic> json) =
      _$_RitelLegalitasUsaha.fromJson;

  @override
  List<RitelLegalitasUsahaUtama>? get mainDocument;
  @override
  List<RitelLegalitasUsahaLainnya>? get additionalDocument;
  @override
  @JsonKey(ignore: true)
  _$$_RitelLegalitasUsahaCopyWith<_$_RitelLegalitasUsaha> get copyWith =>
      throw _privateConstructorUsedError;
}

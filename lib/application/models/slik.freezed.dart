// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'slik.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SLIK _$SLIKFromJson(Map<String, dynamic> json) {
  return _SLIK.fromJson(json);
}

/// @nodoc
mixin _$SLIK {
  int? get id => throw _privateConstructorUsedError;
  int? get screeningId => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get statusCode => throw _privateConstructorUsedError;
  String? get messages => throw _privateConstructorUsedError;
  Map<String, dynamic>? get content => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SLIKCopyWith<SLIK> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SLIKCopyWith<$Res> {
  factory $SLIKCopyWith(SLIK value, $Res Function(SLIK) then) =
      _$SLIKCopyWithImpl<$Res, SLIK>;
  @useResult
  $Res call(
      {int? id,
      int? screeningId,
      int? status,
      String? statusCode,
      String? messages,
      Map<String, dynamic>? content,
      String? updatedAt});
}

/// @nodoc
class _$SLIKCopyWithImpl<$Res, $Val extends SLIK>
    implements $SLIKCopyWith<$Res> {
  _$SLIKCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? screeningId = freezed,
    Object? status = freezed,
    Object? statusCode = freezed,
    Object? messages = freezed,
    Object? content = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      screeningId: freezed == screeningId
          ? _value.screeningId
          : screeningId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SLIKCopyWith<$Res> implements $SLIKCopyWith<$Res> {
  factory _$$_SLIKCopyWith(_$_SLIK value, $Res Function(_$_SLIK) then) =
      __$$_SLIKCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? screeningId,
      int? status,
      String? statusCode,
      String? messages,
      Map<String, dynamic>? content,
      String? updatedAt});
}

/// @nodoc
class __$$_SLIKCopyWithImpl<$Res> extends _$SLIKCopyWithImpl<$Res, _$_SLIK>
    implements _$$_SLIKCopyWith<$Res> {
  __$$_SLIKCopyWithImpl(_$_SLIK _value, $Res Function(_$_SLIK) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? screeningId = freezed,
    Object? status = freezed,
    Object? statusCode = freezed,
    Object? messages = freezed,
    Object? content = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_SLIK(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      screeningId: freezed == screeningId
          ? _value.screeningId
          : screeningId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_SLIK implements _SLIK {
  _$_SLIK(
      {this.id,
      this.screeningId,
      this.status,
      this.statusCode,
      this.messages,
      final Map<String, dynamic>? content,
      this.updatedAt})
      : _content = content;

  factory _$_SLIK.fromJson(Map<String, dynamic> json) => _$$_SLIKFromJson(json);

  @override
  final int? id;
  @override
  final int? screeningId;
  @override
  final int? status;
  @override
  final String? statusCode;
  @override
  final String? messages;
  final Map<String, dynamic>? _content;
  @override
  Map<String, dynamic>? get content {
    final value = _content;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'SLIK(id: $id, screeningId: $screeningId, status: $status, statusCode: $statusCode, messages: $messages, content: $content, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SLIK &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.screeningId, screeningId) ||
                other.screeningId == screeningId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.messages, messages) ||
                other.messages == messages) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      screeningId,
      status,
      statusCode,
      messages,
      const DeepCollectionEquality().hash(_content),
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SLIKCopyWith<_$_SLIK> get copyWith =>
      __$$_SLIKCopyWithImpl<_$_SLIK>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SLIKToJson(
      this,
    );
  }
}

abstract class _SLIK implements SLIK {
  factory _SLIK(
      {final int? id,
      final int? screeningId,
      final int? status,
      final String? statusCode,
      final String? messages,
      final Map<String, dynamic>? content,
      final String? updatedAt}) = _$_SLIK;

  factory _SLIK.fromJson(Map<String, dynamic> json) = _$_SLIK.fromJson;

  @override
  int? get id;
  @override
  int? get screeningId;
  @override
  int? get status;
  @override
  String? get statusCode;
  @override
  String? get messages;
  @override
  Map<String, dynamic>? get content;
  @override
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_SLIKCopyWith<_$_SLIK> get copyWith => throw _privateConstructorUsedError;
}

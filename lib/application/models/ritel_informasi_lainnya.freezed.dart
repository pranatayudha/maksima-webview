// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_informasi_lainnya.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelInformasiLainnya _$RitelInformasiLainnyaFromJson(
    Map<String, dynamic> json) {
  return _RitelInformasiLainnya.fromJson(json);
}

/// @nodoc
mixin _$RitelInformasiLainnya {
  String? get community_branchesId => throw _privateConstructorUsedError;
  String? get cbName => throw _privateConstructorUsedError;
  String? get etaToCB => throw _privateConstructorUsedError;
  String? get loan_typesId => throw _privateConstructorUsedError;
  String? get loanAmount => throw _privateConstructorUsedError;
  RitelTagLocation? get tagLocation => throw _privateConstructorUsedError;
  String? get dateOfVisit => throw _privateConstructorUsedError;
  String? get purposeVisit => throw _privateConstructorUsedError;
  String? get ratingPARI => throw _privateConstructorUsedError;
  String? get transactionFrequency => throw _privateConstructorUsedError;
  String? get visitResult => throw _privateConstructorUsedError;
  List<dynamic>? get visitPath => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelInformasiLainnyaCopyWith<RitelInformasiLainnya> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelInformasiLainnyaCopyWith<$Res> {
  factory $RitelInformasiLainnyaCopyWith(RitelInformasiLainnya value,
          $Res Function(RitelInformasiLainnya) then) =
      _$RitelInformasiLainnyaCopyWithImpl<$Res, RitelInformasiLainnya>;
  @useResult
  $Res call(
      {String? community_branchesId,
      String? cbName,
      String? etaToCB,
      String? loan_typesId,
      String? loanAmount,
      RitelTagLocation? tagLocation,
      String? dateOfVisit,
      String? purposeVisit,
      String? ratingPARI,
      String? transactionFrequency,
      String? visitResult,
      List<dynamic>? visitPath,
      String? createdAt,
      String? createdBy});

  $RitelTagLocationCopyWith<$Res>? get tagLocation;
}

/// @nodoc
class _$RitelInformasiLainnyaCopyWithImpl<$Res,
        $Val extends RitelInformasiLainnya>
    implements $RitelInformasiLainnyaCopyWith<$Res> {
  _$RitelInformasiLainnyaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? community_branchesId = freezed,
    Object? cbName = freezed,
    Object? etaToCB = freezed,
    Object? loan_typesId = freezed,
    Object? loanAmount = freezed,
    Object? tagLocation = freezed,
    Object? dateOfVisit = freezed,
    Object? purposeVisit = freezed,
    Object? ratingPARI = freezed,
    Object? transactionFrequency = freezed,
    Object? visitResult = freezed,
    Object? visitPath = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
  }) {
    return _then(_value.copyWith(
      community_branchesId: freezed == community_branchesId
          ? _value.community_branchesId
          : community_branchesId // ignore: cast_nullable_to_non_nullable
              as String?,
      cbName: freezed == cbName
          ? _value.cbName
          : cbName // ignore: cast_nullable_to_non_nullable
              as String?,
      etaToCB: freezed == etaToCB
          ? _value.etaToCB
          : etaToCB // ignore: cast_nullable_to_non_nullable
              as String?,
      loan_typesId: freezed == loan_typesId
          ? _value.loan_typesId
          : loan_typesId // ignore: cast_nullable_to_non_nullable
              as String?,
      loanAmount: freezed == loanAmount
          ? _value.loanAmount
          : loanAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      tagLocation: freezed == tagLocation
          ? _value.tagLocation
          : tagLocation // ignore: cast_nullable_to_non_nullable
              as RitelTagLocation?,
      dateOfVisit: freezed == dateOfVisit
          ? _value.dateOfVisit
          : dateOfVisit // ignore: cast_nullable_to_non_nullable
              as String?,
      purposeVisit: freezed == purposeVisit
          ? _value.purposeVisit
          : purposeVisit // ignore: cast_nullable_to_non_nullable
              as String?,
      ratingPARI: freezed == ratingPARI
          ? _value.ratingPARI
          : ratingPARI // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionFrequency: freezed == transactionFrequency
          ? _value.transactionFrequency
          : transactionFrequency // ignore: cast_nullable_to_non_nullable
              as String?,
      visitResult: freezed == visitResult
          ? _value.visitResult
          : visitResult // ignore: cast_nullable_to_non_nullable
              as String?,
      visitPath: freezed == visitPath
          ? _value.visitPath
          : visitPath // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RitelTagLocationCopyWith<$Res>? get tagLocation {
    if (_value.tagLocation == null) {
      return null;
    }

    return $RitelTagLocationCopyWith<$Res>(_value.tagLocation!, (value) {
      return _then(_value.copyWith(tagLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RitelInformasiLainnyaCopyWith<$Res>
    implements $RitelInformasiLainnyaCopyWith<$Res> {
  factory _$$_RitelInformasiLainnyaCopyWith(_$_RitelInformasiLainnya value,
          $Res Function(_$_RitelInformasiLainnya) then) =
      __$$_RitelInformasiLainnyaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? community_branchesId,
      String? cbName,
      String? etaToCB,
      String? loan_typesId,
      String? loanAmount,
      RitelTagLocation? tagLocation,
      String? dateOfVisit,
      String? purposeVisit,
      String? ratingPARI,
      String? transactionFrequency,
      String? visitResult,
      List<dynamic>? visitPath,
      String? createdAt,
      String? createdBy});

  @override
  $RitelTagLocationCopyWith<$Res>? get tagLocation;
}

/// @nodoc
class __$$_RitelInformasiLainnyaCopyWithImpl<$Res>
    extends _$RitelInformasiLainnyaCopyWithImpl<$Res, _$_RitelInformasiLainnya>
    implements _$$_RitelInformasiLainnyaCopyWith<$Res> {
  __$$_RitelInformasiLainnyaCopyWithImpl(_$_RitelInformasiLainnya _value,
      $Res Function(_$_RitelInformasiLainnya) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? community_branchesId = freezed,
    Object? cbName = freezed,
    Object? etaToCB = freezed,
    Object? loan_typesId = freezed,
    Object? loanAmount = freezed,
    Object? tagLocation = freezed,
    Object? dateOfVisit = freezed,
    Object? purposeVisit = freezed,
    Object? ratingPARI = freezed,
    Object? transactionFrequency = freezed,
    Object? visitResult = freezed,
    Object? visitPath = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
  }) {
    return _then(_$_RitelInformasiLainnya(
      community_branchesId: freezed == community_branchesId
          ? _value.community_branchesId
          : community_branchesId // ignore: cast_nullable_to_non_nullable
              as String?,
      cbName: freezed == cbName
          ? _value.cbName
          : cbName // ignore: cast_nullable_to_non_nullable
              as String?,
      etaToCB: freezed == etaToCB
          ? _value.etaToCB
          : etaToCB // ignore: cast_nullable_to_non_nullable
              as String?,
      loan_typesId: freezed == loan_typesId
          ? _value.loan_typesId
          : loan_typesId // ignore: cast_nullable_to_non_nullable
              as String?,
      loanAmount: freezed == loanAmount
          ? _value.loanAmount
          : loanAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      tagLocation: freezed == tagLocation
          ? _value.tagLocation
          : tagLocation // ignore: cast_nullable_to_non_nullable
              as RitelTagLocation?,
      dateOfVisit: freezed == dateOfVisit
          ? _value.dateOfVisit
          : dateOfVisit // ignore: cast_nullable_to_non_nullable
              as String?,
      purposeVisit: freezed == purposeVisit
          ? _value.purposeVisit
          : purposeVisit // ignore: cast_nullable_to_non_nullable
              as String?,
      ratingPARI: freezed == ratingPARI
          ? _value.ratingPARI
          : ratingPARI // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionFrequency: freezed == transactionFrequency
          ? _value.transactionFrequency
          : transactionFrequency // ignore: cast_nullable_to_non_nullable
              as String?,
      visitResult: freezed == visitResult
          ? _value.visitResult
          : visitResult // ignore: cast_nullable_to_non_nullable
              as String?,
      visitPath: freezed == visitPath
          ? _value._visitPath
          : visitPath // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_RitelInformasiLainnya implements _RitelInformasiLainnya {
  _$_RitelInformasiLainnya(
      {this.community_branchesId,
      this.cbName,
      this.etaToCB,
      this.loan_typesId,
      this.loanAmount,
      this.tagLocation,
      this.dateOfVisit,
      this.purposeVisit,
      this.ratingPARI,
      this.transactionFrequency,
      this.visitResult,
      final List<dynamic>? visitPath,
      this.createdAt,
      this.createdBy})
      : _visitPath = visitPath;

  factory _$_RitelInformasiLainnya.fromJson(Map<String, dynamic> json) =>
      _$$_RitelInformasiLainnyaFromJson(json);

  @override
  final String? community_branchesId;
  @override
  final String? cbName;
  @override
  final String? etaToCB;
  @override
  final String? loan_typesId;
  @override
  final String? loanAmount;
  @override
  final RitelTagLocation? tagLocation;
  @override
  final String? dateOfVisit;
  @override
  final String? purposeVisit;
  @override
  final String? ratingPARI;
  @override
  final String? transactionFrequency;
  @override
  final String? visitResult;
  final List<dynamic>? _visitPath;
  @override
  List<dynamic>? get visitPath {
    final value = _visitPath;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? createdAt;
  @override
  final String? createdBy;

  @override
  String toString() {
    return 'RitelInformasiLainnya(community_branchesId: $community_branchesId, cbName: $cbName, etaToCB: $etaToCB, loan_typesId: $loan_typesId, loanAmount: $loanAmount, tagLocation: $tagLocation, dateOfVisit: $dateOfVisit, purposeVisit: $purposeVisit, ratingPARI: $ratingPARI, transactionFrequency: $transactionFrequency, visitResult: $visitResult, visitPath: $visitPath, createdAt: $createdAt, createdBy: $createdBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelInformasiLainnya &&
            (identical(other.community_branchesId, community_branchesId) ||
                other.community_branchesId == community_branchesId) &&
            (identical(other.cbName, cbName) || other.cbName == cbName) &&
            (identical(other.etaToCB, etaToCB) || other.etaToCB == etaToCB) &&
            (identical(other.loan_typesId, loan_typesId) ||
                other.loan_typesId == loan_typesId) &&
            (identical(other.loanAmount, loanAmount) ||
                other.loanAmount == loanAmount) &&
            (identical(other.tagLocation, tagLocation) ||
                other.tagLocation == tagLocation) &&
            (identical(other.dateOfVisit, dateOfVisit) ||
                other.dateOfVisit == dateOfVisit) &&
            (identical(other.purposeVisit, purposeVisit) ||
                other.purposeVisit == purposeVisit) &&
            (identical(other.ratingPARI, ratingPARI) ||
                other.ratingPARI == ratingPARI) &&
            (identical(other.transactionFrequency, transactionFrequency) ||
                other.transactionFrequency == transactionFrequency) &&
            (identical(other.visitResult, visitResult) ||
                other.visitResult == visitResult) &&
            const DeepCollectionEquality()
                .equals(other._visitPath, _visitPath) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      community_branchesId,
      cbName,
      etaToCB,
      loan_typesId,
      loanAmount,
      tagLocation,
      dateOfVisit,
      purposeVisit,
      ratingPARI,
      transactionFrequency,
      visitResult,
      const DeepCollectionEquality().hash(_visitPath),
      createdAt,
      createdBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelInformasiLainnyaCopyWith<_$_RitelInformasiLainnya> get copyWith =>
      __$$_RitelInformasiLainnyaCopyWithImpl<_$_RitelInformasiLainnya>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelInformasiLainnyaToJson(
      this,
    );
  }
}

abstract class _RitelInformasiLainnya implements RitelInformasiLainnya {
  factory _RitelInformasiLainnya(
      {final String? community_branchesId,
      final String? cbName,
      final String? etaToCB,
      final String? loan_typesId,
      final String? loanAmount,
      final RitelTagLocation? tagLocation,
      final String? dateOfVisit,
      final String? purposeVisit,
      final String? ratingPARI,
      final String? transactionFrequency,
      final String? visitResult,
      final List<dynamic>? visitPath,
      final String? createdAt,
      final String? createdBy}) = _$_RitelInformasiLainnya;

  factory _RitelInformasiLainnya.fromJson(Map<String, dynamic> json) =
      _$_RitelInformasiLainnya.fromJson;

  @override
  String? get community_branchesId;
  @override
  String? get cbName;
  @override
  String? get etaToCB;
  @override
  String? get loan_typesId;
  @override
  String? get loanAmount;
  @override
  RitelTagLocation? get tagLocation;
  @override
  String? get dateOfVisit;
  @override
  String? get purposeVisit;
  @override
  String? get ratingPARI;
  @override
  String? get transactionFrequency;
  @override
  String? get visitResult;
  @override
  List<dynamic>? get visitPath;
  @override
  String? get createdAt;
  @override
  String? get createdBy;
  @override
  @JsonKey(ignore: true)
  _$$_RitelInformasiLainnyaCopyWith<_$_RitelInformasiLainnya> get copyWith =>
      throw _privateConstructorUsedError;
}

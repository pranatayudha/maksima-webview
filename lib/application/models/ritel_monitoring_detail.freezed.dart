// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ritel_monitoring_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RitelMonitoringDetail _$RitelMonitoringDetailFromJson(
    Map<String, dynamic> json) {
  return _RitelMonitoringDetail.fromJson(json);
}

/// @nodoc
mixin _$RitelMonitoringDetail {
  RitelMonitoringDetailHeader? get header => throw _privateConstructorUsedError;
  RitelMonitoringDetailSummary? get summary_pinjaman =>
      throw _privateConstructorUsedError;
  List<RitelMonitoringDetailPinjaman>? get pinjaman =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RitelMonitoringDetailCopyWith<RitelMonitoringDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RitelMonitoringDetailCopyWith<$Res> {
  factory $RitelMonitoringDetailCopyWith(RitelMonitoringDetail value,
          $Res Function(RitelMonitoringDetail) then) =
      _$RitelMonitoringDetailCopyWithImpl<$Res, RitelMonitoringDetail>;
  @useResult
  $Res call(
      {RitelMonitoringDetailHeader? header,
      RitelMonitoringDetailSummary? summary_pinjaman,
      List<RitelMonitoringDetailPinjaman>? pinjaman});

  $RitelMonitoringDetailHeaderCopyWith<$Res>? get header;
  $RitelMonitoringDetailSummaryCopyWith<$Res>? get summary_pinjaman;
}

/// @nodoc
class _$RitelMonitoringDetailCopyWithImpl<$Res,
        $Val extends RitelMonitoringDetail>
    implements $RitelMonitoringDetailCopyWith<$Res> {
  _$RitelMonitoringDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? summary_pinjaman = freezed,
    Object? pinjaman = freezed,
  }) {
    return _then(_value.copyWith(
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as RitelMonitoringDetailHeader?,
      summary_pinjaman: freezed == summary_pinjaman
          ? _value.summary_pinjaman
          : summary_pinjaman // ignore: cast_nullable_to_non_nullable
              as RitelMonitoringDetailSummary?,
      pinjaman: freezed == pinjaman
          ? _value.pinjaman
          : pinjaman // ignore: cast_nullable_to_non_nullable
              as List<RitelMonitoringDetailPinjaman>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RitelMonitoringDetailHeaderCopyWith<$Res>? get header {
    if (_value.header == null) {
      return null;
    }

    return $RitelMonitoringDetailHeaderCopyWith<$Res>(_value.header!, (value) {
      return _then(_value.copyWith(header: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RitelMonitoringDetailSummaryCopyWith<$Res>? get summary_pinjaman {
    if (_value.summary_pinjaman == null) {
      return null;
    }

    return $RitelMonitoringDetailSummaryCopyWith<$Res>(_value.summary_pinjaman!,
        (value) {
      return _then(_value.copyWith(summary_pinjaman: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RitelMonitoringDetailCopyWith<$Res>
    implements $RitelMonitoringDetailCopyWith<$Res> {
  factory _$$_RitelMonitoringDetailCopyWith(_$_RitelMonitoringDetail value,
          $Res Function(_$_RitelMonitoringDetail) then) =
      __$$_RitelMonitoringDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RitelMonitoringDetailHeader? header,
      RitelMonitoringDetailSummary? summary_pinjaman,
      List<RitelMonitoringDetailPinjaman>? pinjaman});

  @override
  $RitelMonitoringDetailHeaderCopyWith<$Res>? get header;
  @override
  $RitelMonitoringDetailSummaryCopyWith<$Res>? get summary_pinjaman;
}

/// @nodoc
class __$$_RitelMonitoringDetailCopyWithImpl<$Res>
    extends _$RitelMonitoringDetailCopyWithImpl<$Res, _$_RitelMonitoringDetail>
    implements _$$_RitelMonitoringDetailCopyWith<$Res> {
  __$$_RitelMonitoringDetailCopyWithImpl(_$_RitelMonitoringDetail _value,
      $Res Function(_$_RitelMonitoringDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? summary_pinjaman = freezed,
    Object? pinjaman = freezed,
  }) {
    return _then(_$_RitelMonitoringDetail(
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as RitelMonitoringDetailHeader?,
      summary_pinjaman: freezed == summary_pinjaman
          ? _value.summary_pinjaman
          : summary_pinjaman // ignore: cast_nullable_to_non_nullable
              as RitelMonitoringDetailSummary?,
      pinjaman: freezed == pinjaman
          ? _value._pinjaman
          : pinjaman // ignore: cast_nullable_to_non_nullable
              as List<RitelMonitoringDetailPinjaman>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(anyMap: true, explicitToJson: true)
class _$_RitelMonitoringDetail implements _RitelMonitoringDetail {
  _$_RitelMonitoringDetail(
      {this.header,
      this.summary_pinjaman,
      final List<RitelMonitoringDetailPinjaman>? pinjaman})
      : _pinjaman = pinjaman;

  factory _$_RitelMonitoringDetail.fromJson(Map<String, dynamic> json) =>
      _$$_RitelMonitoringDetailFromJson(json);

  @override
  final RitelMonitoringDetailHeader? header;
  @override
  final RitelMonitoringDetailSummary? summary_pinjaman;
  final List<RitelMonitoringDetailPinjaman>? _pinjaman;
  @override
  List<RitelMonitoringDetailPinjaman>? get pinjaman {
    final value = _pinjaman;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RitelMonitoringDetail(header: $header, summary_pinjaman: $summary_pinjaman, pinjaman: $pinjaman)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RitelMonitoringDetail &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.summary_pinjaman, summary_pinjaman) ||
                other.summary_pinjaman == summary_pinjaman) &&
            const DeepCollectionEquality().equals(other._pinjaman, _pinjaman));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, header, summary_pinjaman,
      const DeepCollectionEquality().hash(_pinjaman));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RitelMonitoringDetailCopyWith<_$_RitelMonitoringDetail> get copyWith =>
      __$$_RitelMonitoringDetailCopyWithImpl<_$_RitelMonitoringDetail>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RitelMonitoringDetailToJson(
      this,
    );
  }
}

abstract class _RitelMonitoringDetail implements RitelMonitoringDetail {
  factory _RitelMonitoringDetail(
          {final RitelMonitoringDetailHeader? header,
          final RitelMonitoringDetailSummary? summary_pinjaman,
          final List<RitelMonitoringDetailPinjaman>? pinjaman}) =
      _$_RitelMonitoringDetail;

  factory _RitelMonitoringDetail.fromJson(Map<String, dynamic> json) =
      _$_RitelMonitoringDetail.fromJson;

  @override
  RitelMonitoringDetailHeader? get header;
  @override
  RitelMonitoringDetailSummary? get summary_pinjaman;
  @override
  List<RitelMonitoringDetailPinjaman>? get pinjaman;
  @override
  @JsonKey(ignore: true)
  _$$_RitelMonitoringDetailCopyWith<_$_RitelMonitoringDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

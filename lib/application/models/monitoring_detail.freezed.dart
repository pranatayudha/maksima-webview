// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'monitoring_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MonitoringDetail _$MonitoringDetailFromJson(Map<String, dynamic> json) {
  return _MonitoringDetail.fromJson(json);
}

/// @nodoc
mixin _$MonitoringDetail {
  Header? get header => throw _privateConstructorUsedError;
  @JsonKey(name: 'summary_pinjaman')
  SummaryPinjaman? get summaryPinjaman => throw _privateConstructorUsedError;
  List<Pinjaman>? get pinjaman => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonitoringDetailCopyWith<MonitoringDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonitoringDetailCopyWith<$Res> {
  factory $MonitoringDetailCopyWith(
          MonitoringDetail value, $Res Function(MonitoringDetail) then) =
      _$MonitoringDetailCopyWithImpl<$Res, MonitoringDetail>;
  @useResult
  $Res call(
      {Header? header,
      @JsonKey(name: 'summary_pinjaman') SummaryPinjaman? summaryPinjaman,
      List<Pinjaman>? pinjaman});

  $HeaderCopyWith<$Res>? get header;
  $SummaryPinjamanCopyWith<$Res>? get summaryPinjaman;
}

/// @nodoc
class _$MonitoringDetailCopyWithImpl<$Res, $Val extends MonitoringDetail>
    implements $MonitoringDetailCopyWith<$Res> {
  _$MonitoringDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? summaryPinjaman = freezed,
    Object? pinjaman = freezed,
  }) {
    return _then(_value.copyWith(
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as Header?,
      summaryPinjaman: freezed == summaryPinjaman
          ? _value.summaryPinjaman
          : summaryPinjaman // ignore: cast_nullable_to_non_nullable
              as SummaryPinjaman?,
      pinjaman: freezed == pinjaman
          ? _value.pinjaman
          : pinjaman // ignore: cast_nullable_to_non_nullable
              as List<Pinjaman>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HeaderCopyWith<$Res>? get header {
    if (_value.header == null) {
      return null;
    }

    return $HeaderCopyWith<$Res>(_value.header!, (value) {
      return _then(_value.copyWith(header: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SummaryPinjamanCopyWith<$Res>? get summaryPinjaman {
    if (_value.summaryPinjaman == null) {
      return null;
    }

    return $SummaryPinjamanCopyWith<$Res>(_value.summaryPinjaman!, (value) {
      return _then(_value.copyWith(summaryPinjaman: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MonitoringDetailCopyWith<$Res>
    implements $MonitoringDetailCopyWith<$Res> {
  factory _$$_MonitoringDetailCopyWith(
          _$_MonitoringDetail value, $Res Function(_$_MonitoringDetail) then) =
      __$$_MonitoringDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Header? header,
      @JsonKey(name: 'summary_pinjaman') SummaryPinjaman? summaryPinjaman,
      List<Pinjaman>? pinjaman});

  @override
  $HeaderCopyWith<$Res>? get header;
  @override
  $SummaryPinjamanCopyWith<$Res>? get summaryPinjaman;
}

/// @nodoc
class __$$_MonitoringDetailCopyWithImpl<$Res>
    extends _$MonitoringDetailCopyWithImpl<$Res, _$_MonitoringDetail>
    implements _$$_MonitoringDetailCopyWith<$Res> {
  __$$_MonitoringDetailCopyWithImpl(
      _$_MonitoringDetail _value, $Res Function(_$_MonitoringDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = freezed,
    Object? summaryPinjaman = freezed,
    Object? pinjaman = freezed,
  }) {
    return _then(_$_MonitoringDetail(
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as Header?,
      summaryPinjaman: freezed == summaryPinjaman
          ? _value.summaryPinjaman
          : summaryPinjaman // ignore: cast_nullable_to_non_nullable
              as SummaryPinjaman?,
      pinjaman: freezed == pinjaman
          ? _value._pinjaman
          : pinjaman // ignore: cast_nullable_to_non_nullable
              as List<Pinjaman>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_MonitoringDetail implements _MonitoringDetail {
  const _$_MonitoringDetail(
      {this.header,
      @JsonKey(name: 'summary_pinjaman') this.summaryPinjaman,
      final List<Pinjaman>? pinjaman})
      : _pinjaman = pinjaman;

  factory _$_MonitoringDetail.fromJson(Map<String, dynamic> json) =>
      _$$_MonitoringDetailFromJson(json);

  @override
  final Header? header;
  @override
  @JsonKey(name: 'summary_pinjaman')
  final SummaryPinjaman? summaryPinjaman;
  final List<Pinjaman>? _pinjaman;
  @override
  List<Pinjaman>? get pinjaman {
    final value = _pinjaman;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MonitoringDetail(header: $header, summaryPinjaman: $summaryPinjaman, pinjaman: $pinjaman)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MonitoringDetail &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.summaryPinjaman, summaryPinjaman) ||
                other.summaryPinjaman == summaryPinjaman) &&
            const DeepCollectionEquality().equals(other._pinjaman, _pinjaman));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, header, summaryPinjaman,
      const DeepCollectionEquality().hash(_pinjaman));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MonitoringDetailCopyWith<_$_MonitoringDetail> get copyWith =>
      __$$_MonitoringDetailCopyWithImpl<_$_MonitoringDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MonitoringDetailToJson(
      this,
    );
  }
}

abstract class _MonitoringDetail implements MonitoringDetail {
  const factory _MonitoringDetail(
      {final Header? header,
      @JsonKey(name: 'summary_pinjaman') final SummaryPinjaman? summaryPinjaman,
      final List<Pinjaman>? pinjaman}) = _$_MonitoringDetail;

  factory _MonitoringDetail.fromJson(Map<String, dynamic> json) =
      _$_MonitoringDetail.fromJson;

  @override
  Header? get header;
  @override
  @JsonKey(name: 'summary_pinjaman')
  SummaryPinjaman? get summaryPinjaman;
  @override
  List<Pinjaman>? get pinjaman;
  @override
  @JsonKey(ignore: true)
  _$$_MonitoringDetailCopyWith<_$_MonitoringDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

Header _$HeaderFromJson(Map<String, dynamic> json) {
  return _Header.fromJson(json);
}

/// @nodoc
mixin _$Header {
  @JsonKey(name: 'id_Kelolaan')
  String? get idKelolaan => throw _privateConstructorUsedError;
  String? get bisniName => throw _privateConstructorUsedError;
  String? get namaDebitur => throw _privateConstructorUsedError;
  String? get phonenum => throw _privateConstructorUsedError;
  String? get initial => throw _privateConstructorUsedError;
  String? get partner => throw _privateConstructorUsedError;
  int? get loanType => throw _privateConstructorUsedError;
  String? get bungaPinjaman => throw _privateConstructorUsedError;
  String? get picName => throw _privateConstructorUsedError;
  String? get picPhone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeaderCopyWith<Header> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeaderCopyWith<$Res> {
  factory $HeaderCopyWith(Header value, $Res Function(Header) then) =
      _$HeaderCopyWithImpl<$Res, Header>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_Kelolaan') String? idKelolaan,
      String? bisniName,
      String? namaDebitur,
      String? phonenum,
      String? initial,
      String? partner,
      int? loanType,
      String? bungaPinjaman,
      String? picName,
      String? picPhone});
}

/// @nodoc
class _$HeaderCopyWithImpl<$Res, $Val extends Header>
    implements $HeaderCopyWith<$Res> {
  _$HeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idKelolaan = freezed,
    Object? bisniName = freezed,
    Object? namaDebitur = freezed,
    Object? phonenum = freezed,
    Object? initial = freezed,
    Object? partner = freezed,
    Object? loanType = freezed,
    Object? bungaPinjaman = freezed,
    Object? picName = freezed,
    Object? picPhone = freezed,
  }) {
    return _then(_value.copyWith(
      idKelolaan: freezed == idKelolaan
          ? _value.idKelolaan
          : idKelolaan // ignore: cast_nullable_to_non_nullable
              as String?,
      bisniName: freezed == bisniName
          ? _value.bisniName
          : bisniName // ignore: cast_nullable_to_non_nullable
              as String?,
      namaDebitur: freezed == namaDebitur
          ? _value.namaDebitur
          : namaDebitur // ignore: cast_nullable_to_non_nullable
              as String?,
      phonenum: freezed == phonenum
          ? _value.phonenum
          : phonenum // ignore: cast_nullable_to_non_nullable
              as String?,
      initial: freezed == initial
          ? _value.initial
          : initial // ignore: cast_nullable_to_non_nullable
              as String?,
      partner: freezed == partner
          ? _value.partner
          : partner // ignore: cast_nullable_to_non_nullable
              as String?,
      loanType: freezed == loanType
          ? _value.loanType
          : loanType // ignore: cast_nullable_to_non_nullable
              as int?,
      bungaPinjaman: freezed == bungaPinjaman
          ? _value.bungaPinjaman
          : bungaPinjaman // ignore: cast_nullable_to_non_nullable
              as String?,
      picName: freezed == picName
          ? _value.picName
          : picName // ignore: cast_nullable_to_non_nullable
              as String?,
      picPhone: freezed == picPhone
          ? _value.picPhone
          : picPhone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HeaderCopyWith<$Res> implements $HeaderCopyWith<$Res> {
  factory _$$_HeaderCopyWith(_$_Header value, $Res Function(_$_Header) then) =
      __$$_HeaderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_Kelolaan') String? idKelolaan,
      String? bisniName,
      String? namaDebitur,
      String? phonenum,
      String? initial,
      String? partner,
      int? loanType,
      String? bungaPinjaman,
      String? picName,
      String? picPhone});
}

/// @nodoc
class __$$_HeaderCopyWithImpl<$Res>
    extends _$HeaderCopyWithImpl<$Res, _$_Header>
    implements _$$_HeaderCopyWith<$Res> {
  __$$_HeaderCopyWithImpl(_$_Header _value, $Res Function(_$_Header) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idKelolaan = freezed,
    Object? bisniName = freezed,
    Object? namaDebitur = freezed,
    Object? phonenum = freezed,
    Object? initial = freezed,
    Object? partner = freezed,
    Object? loanType = freezed,
    Object? bungaPinjaman = freezed,
    Object? picName = freezed,
    Object? picPhone = freezed,
  }) {
    return _then(_$_Header(
      idKelolaan: freezed == idKelolaan
          ? _value.idKelolaan
          : idKelolaan // ignore: cast_nullable_to_non_nullable
              as String?,
      bisniName: freezed == bisniName
          ? _value.bisniName
          : bisniName // ignore: cast_nullable_to_non_nullable
              as String?,
      namaDebitur: freezed == namaDebitur
          ? _value.namaDebitur
          : namaDebitur // ignore: cast_nullable_to_non_nullable
              as String?,
      phonenum: freezed == phonenum
          ? _value.phonenum
          : phonenum // ignore: cast_nullable_to_non_nullable
              as String?,
      initial: freezed == initial
          ? _value.initial
          : initial // ignore: cast_nullable_to_non_nullable
              as String?,
      partner: freezed == partner
          ? _value.partner
          : partner // ignore: cast_nullable_to_non_nullable
              as String?,
      loanType: freezed == loanType
          ? _value.loanType
          : loanType // ignore: cast_nullable_to_non_nullable
              as int?,
      bungaPinjaman: freezed == bungaPinjaman
          ? _value.bungaPinjaman
          : bungaPinjaman // ignore: cast_nullable_to_non_nullable
              as String?,
      picName: freezed == picName
          ? _value.picName
          : picName // ignore: cast_nullable_to_non_nullable
              as String?,
      picPhone: freezed == picPhone
          ? _value.picPhone
          : picPhone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Header implements _Header {
  const _$_Header(
      {@JsonKey(name: 'id_Kelolaan') this.idKelolaan,
      this.bisniName,
      this.namaDebitur,
      this.phonenum,
      this.initial,
      this.partner,
      this.loanType,
      this.bungaPinjaman,
      this.picName,
      this.picPhone});

  factory _$_Header.fromJson(Map<String, dynamic> json) =>
      _$$_HeaderFromJson(json);

  @override
  @JsonKey(name: 'id_Kelolaan')
  final String? idKelolaan;
  @override
  final String? bisniName;
  @override
  final String? namaDebitur;
  @override
  final String? phonenum;
  @override
  final String? initial;
  @override
  final String? partner;
  @override
  final int? loanType;
  @override
  final String? bungaPinjaman;
  @override
  final String? picName;
  @override
  final String? picPhone;

  @override
  String toString() {
    return 'Header(idKelolaan: $idKelolaan, bisniName: $bisniName, namaDebitur: $namaDebitur, phonenum: $phonenum, initial: $initial, partner: $partner, loanType: $loanType, bungaPinjaman: $bungaPinjaman, picName: $picName, picPhone: $picPhone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Header &&
            (identical(other.idKelolaan, idKelolaan) ||
                other.idKelolaan == idKelolaan) &&
            (identical(other.bisniName, bisniName) ||
                other.bisniName == bisniName) &&
            (identical(other.namaDebitur, namaDebitur) ||
                other.namaDebitur == namaDebitur) &&
            (identical(other.phonenum, phonenum) ||
                other.phonenum == phonenum) &&
            (identical(other.initial, initial) || other.initial == initial) &&
            (identical(other.partner, partner) || other.partner == partner) &&
            (identical(other.loanType, loanType) ||
                other.loanType == loanType) &&
            (identical(other.bungaPinjaman, bungaPinjaman) ||
                other.bungaPinjaman == bungaPinjaman) &&
            (identical(other.picName, picName) || other.picName == picName) &&
            (identical(other.picPhone, picPhone) ||
                other.picPhone == picPhone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idKelolaan,
      bisniName,
      namaDebitur,
      phonenum,
      initial,
      partner,
      loanType,
      bungaPinjaman,
      picName,
      picPhone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HeaderCopyWith<_$_Header> get copyWith =>
      __$$_HeaderCopyWithImpl<_$_Header>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HeaderToJson(
      this,
    );
  }
}

abstract class _Header implements Header {
  const factory _Header(
      {@JsonKey(name: 'id_Kelolaan') final String? idKelolaan,
      final String? bisniName,
      final String? namaDebitur,
      final String? phonenum,
      final String? initial,
      final String? partner,
      final int? loanType,
      final String? bungaPinjaman,
      final String? picName,
      final String? picPhone}) = _$_Header;

  factory _Header.fromJson(Map<String, dynamic> json) = _$_Header.fromJson;

  @override
  @JsonKey(name: 'id_Kelolaan')
  String? get idKelolaan;
  @override
  String? get bisniName;
  @override
  String? get namaDebitur;
  @override
  String? get phonenum;
  @override
  String? get initial;
  @override
  String? get partner;
  @override
  int? get loanType;
  @override
  String? get bungaPinjaman;
  @override
  String? get picName;
  @override
  String? get picPhone;
  @override
  @JsonKey(ignore: true)
  _$$_HeaderCopyWith<_$_Header> get copyWith =>
      throw _privateConstructorUsedError;
}

SummaryPinjaman _$SummaryPinjamanFromJson(Map<String, dynamic> json) {
  return _SummaryPinjaman.fromJson(json);
}

/// @nodoc
mixin _$SummaryPinjaman {
  String? get plafond => throw _privateConstructorUsedError;
  String? get outstanding => throw _privateConstructorUsedError;
  int? get kelonggaranTarik => throw _privateConstructorUsedError;
  String? get tunggakanBunga => throw _privateConstructorUsedError;
  String? get biayaDenda => throw _privateConstructorUsedError;
  String? get totalKewajiban => throw _privateConstructorUsedError;
  String? get kolektabilitas => throw _privateConstructorUsedError;
  String? get totalCadanganBunga => throw _privateConstructorUsedError;
  String? get accrue => throw _privateConstructorUsedError;
  String? get numFasilitas => throw _privateConstructorUsedError;
  String? get numRekSimpanan => throw _privateConstructorUsedError;
  String? get numRekEscrow => throw _privateConstructorUsedError;
  String? get numRekPinjaman => throw _privateConstructorUsedError;
  String? get saldoOperasional => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SummaryPinjamanCopyWith<SummaryPinjaman> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryPinjamanCopyWith<$Res> {
  factory $SummaryPinjamanCopyWith(
          SummaryPinjaman value, $Res Function(SummaryPinjaman) then) =
      _$SummaryPinjamanCopyWithImpl<$Res, SummaryPinjaman>;
  @useResult
  $Res call(
      {String? plafond,
      String? outstanding,
      int? kelonggaranTarik,
      String? tunggakanBunga,
      String? biayaDenda,
      String? totalKewajiban,
      String? kolektabilitas,
      String? totalCadanganBunga,
      String? accrue,
      String? numFasilitas,
      String? numRekSimpanan,
      String? numRekEscrow,
      String? numRekPinjaman,
      String? saldoOperasional});
}

/// @nodoc
class _$SummaryPinjamanCopyWithImpl<$Res, $Val extends SummaryPinjaman>
    implements $SummaryPinjamanCopyWith<$Res> {
  _$SummaryPinjamanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plafond = freezed,
    Object? outstanding = freezed,
    Object? kelonggaranTarik = freezed,
    Object? tunggakanBunga = freezed,
    Object? biayaDenda = freezed,
    Object? totalKewajiban = freezed,
    Object? kolektabilitas = freezed,
    Object? totalCadanganBunga = freezed,
    Object? accrue = freezed,
    Object? numFasilitas = freezed,
    Object? numRekSimpanan = freezed,
    Object? numRekEscrow = freezed,
    Object? numRekPinjaman = freezed,
    Object? saldoOperasional = freezed,
  }) {
    return _then(_value.copyWith(
      plafond: freezed == plafond
          ? _value.plafond
          : plafond // ignore: cast_nullable_to_non_nullable
              as String?,
      outstanding: freezed == outstanding
          ? _value.outstanding
          : outstanding // ignore: cast_nullable_to_non_nullable
              as String?,
      kelonggaranTarik: freezed == kelonggaranTarik
          ? _value.kelonggaranTarik
          : kelonggaranTarik // ignore: cast_nullable_to_non_nullable
              as int?,
      tunggakanBunga: freezed == tunggakanBunga
          ? _value.tunggakanBunga
          : tunggakanBunga // ignore: cast_nullable_to_non_nullable
              as String?,
      biayaDenda: freezed == biayaDenda
          ? _value.biayaDenda
          : biayaDenda // ignore: cast_nullable_to_non_nullable
              as String?,
      totalKewajiban: freezed == totalKewajiban
          ? _value.totalKewajiban
          : totalKewajiban // ignore: cast_nullable_to_non_nullable
              as String?,
      kolektabilitas: freezed == kolektabilitas
          ? _value.kolektabilitas
          : kolektabilitas // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCadanganBunga: freezed == totalCadanganBunga
          ? _value.totalCadanganBunga
          : totalCadanganBunga // ignore: cast_nullable_to_non_nullable
              as String?,
      accrue: freezed == accrue
          ? _value.accrue
          : accrue // ignore: cast_nullable_to_non_nullable
              as String?,
      numFasilitas: freezed == numFasilitas
          ? _value.numFasilitas
          : numFasilitas // ignore: cast_nullable_to_non_nullable
              as String?,
      numRekSimpanan: freezed == numRekSimpanan
          ? _value.numRekSimpanan
          : numRekSimpanan // ignore: cast_nullable_to_non_nullable
              as String?,
      numRekEscrow: freezed == numRekEscrow
          ? _value.numRekEscrow
          : numRekEscrow // ignore: cast_nullable_to_non_nullable
              as String?,
      numRekPinjaman: freezed == numRekPinjaman
          ? _value.numRekPinjaman
          : numRekPinjaman // ignore: cast_nullable_to_non_nullable
              as String?,
      saldoOperasional: freezed == saldoOperasional
          ? _value.saldoOperasional
          : saldoOperasional // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SummaryPinjamanCopyWith<$Res>
    implements $SummaryPinjamanCopyWith<$Res> {
  factory _$$_SummaryPinjamanCopyWith(
          _$_SummaryPinjaman value, $Res Function(_$_SummaryPinjaman) then) =
      __$$_SummaryPinjamanCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? plafond,
      String? outstanding,
      int? kelonggaranTarik,
      String? tunggakanBunga,
      String? biayaDenda,
      String? totalKewajiban,
      String? kolektabilitas,
      String? totalCadanganBunga,
      String? accrue,
      String? numFasilitas,
      String? numRekSimpanan,
      String? numRekEscrow,
      String? numRekPinjaman,
      String? saldoOperasional});
}

/// @nodoc
class __$$_SummaryPinjamanCopyWithImpl<$Res>
    extends _$SummaryPinjamanCopyWithImpl<$Res, _$_SummaryPinjaman>
    implements _$$_SummaryPinjamanCopyWith<$Res> {
  __$$_SummaryPinjamanCopyWithImpl(
      _$_SummaryPinjaman _value, $Res Function(_$_SummaryPinjaman) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plafond = freezed,
    Object? outstanding = freezed,
    Object? kelonggaranTarik = freezed,
    Object? tunggakanBunga = freezed,
    Object? biayaDenda = freezed,
    Object? totalKewajiban = freezed,
    Object? kolektabilitas = freezed,
    Object? totalCadanganBunga = freezed,
    Object? accrue = freezed,
    Object? numFasilitas = freezed,
    Object? numRekSimpanan = freezed,
    Object? numRekEscrow = freezed,
    Object? numRekPinjaman = freezed,
    Object? saldoOperasional = freezed,
  }) {
    return _then(_$_SummaryPinjaman(
      plafond: freezed == plafond
          ? _value.plafond
          : plafond // ignore: cast_nullable_to_non_nullable
              as String?,
      outstanding: freezed == outstanding
          ? _value.outstanding
          : outstanding // ignore: cast_nullable_to_non_nullable
              as String?,
      kelonggaranTarik: freezed == kelonggaranTarik
          ? _value.kelonggaranTarik
          : kelonggaranTarik // ignore: cast_nullable_to_non_nullable
              as int?,
      tunggakanBunga: freezed == tunggakanBunga
          ? _value.tunggakanBunga
          : tunggakanBunga // ignore: cast_nullable_to_non_nullable
              as String?,
      biayaDenda: freezed == biayaDenda
          ? _value.biayaDenda
          : biayaDenda // ignore: cast_nullable_to_non_nullable
              as String?,
      totalKewajiban: freezed == totalKewajiban
          ? _value.totalKewajiban
          : totalKewajiban // ignore: cast_nullable_to_non_nullable
              as String?,
      kolektabilitas: freezed == kolektabilitas
          ? _value.kolektabilitas
          : kolektabilitas // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCadanganBunga: freezed == totalCadanganBunga
          ? _value.totalCadanganBunga
          : totalCadanganBunga // ignore: cast_nullable_to_non_nullable
              as String?,
      accrue: freezed == accrue
          ? _value.accrue
          : accrue // ignore: cast_nullable_to_non_nullable
              as String?,
      numFasilitas: freezed == numFasilitas
          ? _value.numFasilitas
          : numFasilitas // ignore: cast_nullable_to_non_nullable
              as String?,
      numRekSimpanan: freezed == numRekSimpanan
          ? _value.numRekSimpanan
          : numRekSimpanan // ignore: cast_nullable_to_non_nullable
              as String?,
      numRekEscrow: freezed == numRekEscrow
          ? _value.numRekEscrow
          : numRekEscrow // ignore: cast_nullable_to_non_nullable
              as String?,
      numRekPinjaman: freezed == numRekPinjaman
          ? _value.numRekPinjaman
          : numRekPinjaman // ignore: cast_nullable_to_non_nullable
              as String?,
      saldoOperasional: freezed == saldoOperasional
          ? _value.saldoOperasional
          : saldoOperasional // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SummaryPinjaman implements _SummaryPinjaman {
  const _$_SummaryPinjaman(
      {this.plafond,
      this.outstanding,
      this.kelonggaranTarik,
      this.tunggakanBunga,
      this.biayaDenda,
      this.totalKewajiban,
      this.kolektabilitas,
      this.totalCadanganBunga,
      this.accrue,
      this.numFasilitas,
      this.numRekSimpanan,
      this.numRekEscrow,
      this.numRekPinjaman,
      this.saldoOperasional});

  factory _$_SummaryPinjaman.fromJson(Map<String, dynamic> json) =>
      _$$_SummaryPinjamanFromJson(json);

  @override
  final String? plafond;
  @override
  final String? outstanding;
  @override
  final int? kelonggaranTarik;
  @override
  final String? tunggakanBunga;
  @override
  final String? biayaDenda;
  @override
  final String? totalKewajiban;
  @override
  final String? kolektabilitas;
  @override
  final String? totalCadanganBunga;
  @override
  final String? accrue;
  @override
  final String? numFasilitas;
  @override
  final String? numRekSimpanan;
  @override
  final String? numRekEscrow;
  @override
  final String? numRekPinjaman;
  @override
  final String? saldoOperasional;

  @override
  String toString() {
    return 'SummaryPinjaman(plafond: $plafond, outstanding: $outstanding, kelonggaranTarik: $kelonggaranTarik, tunggakanBunga: $tunggakanBunga, biayaDenda: $biayaDenda, totalKewajiban: $totalKewajiban, kolektabilitas: $kolektabilitas, totalCadanganBunga: $totalCadanganBunga, accrue: $accrue, numFasilitas: $numFasilitas, numRekSimpanan: $numRekSimpanan, numRekEscrow: $numRekEscrow, numRekPinjaman: $numRekPinjaman, saldoOperasional: $saldoOperasional)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SummaryPinjaman &&
            (identical(other.plafond, plafond) || other.plafond == plafond) &&
            (identical(other.outstanding, outstanding) ||
                other.outstanding == outstanding) &&
            (identical(other.kelonggaranTarik, kelonggaranTarik) ||
                other.kelonggaranTarik == kelonggaranTarik) &&
            (identical(other.tunggakanBunga, tunggakanBunga) ||
                other.tunggakanBunga == tunggakanBunga) &&
            (identical(other.biayaDenda, biayaDenda) ||
                other.biayaDenda == biayaDenda) &&
            (identical(other.totalKewajiban, totalKewajiban) ||
                other.totalKewajiban == totalKewajiban) &&
            (identical(other.kolektabilitas, kolektabilitas) ||
                other.kolektabilitas == kolektabilitas) &&
            (identical(other.totalCadanganBunga, totalCadanganBunga) ||
                other.totalCadanganBunga == totalCadanganBunga) &&
            (identical(other.accrue, accrue) || other.accrue == accrue) &&
            (identical(other.numFasilitas, numFasilitas) ||
                other.numFasilitas == numFasilitas) &&
            (identical(other.numRekSimpanan, numRekSimpanan) ||
                other.numRekSimpanan == numRekSimpanan) &&
            (identical(other.numRekEscrow, numRekEscrow) ||
                other.numRekEscrow == numRekEscrow) &&
            (identical(other.numRekPinjaman, numRekPinjaman) ||
                other.numRekPinjaman == numRekPinjaman) &&
            (identical(other.saldoOperasional, saldoOperasional) ||
                other.saldoOperasional == saldoOperasional));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      plafond,
      outstanding,
      kelonggaranTarik,
      tunggakanBunga,
      biayaDenda,
      totalKewajiban,
      kolektabilitas,
      totalCadanganBunga,
      accrue,
      numFasilitas,
      numRekSimpanan,
      numRekEscrow,
      numRekPinjaman,
      saldoOperasional);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SummaryPinjamanCopyWith<_$_SummaryPinjaman> get copyWith =>
      __$$_SummaryPinjamanCopyWithImpl<_$_SummaryPinjaman>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SummaryPinjamanToJson(
      this,
    );
  }
}

abstract class _SummaryPinjaman implements SummaryPinjaman {
  const factory _SummaryPinjaman(
      {final String? plafond,
      final String? outstanding,
      final int? kelonggaranTarik,
      final String? tunggakanBunga,
      final String? biayaDenda,
      final String? totalKewajiban,
      final String? kolektabilitas,
      final String? totalCadanganBunga,
      final String? accrue,
      final String? numFasilitas,
      final String? numRekSimpanan,
      final String? numRekEscrow,
      final String? numRekPinjaman,
      final String? saldoOperasional}) = _$_SummaryPinjaman;

  factory _SummaryPinjaman.fromJson(Map<String, dynamic> json) =
      _$_SummaryPinjaman.fromJson;

  @override
  String? get plafond;
  @override
  String? get outstanding;
  @override
  int? get kelonggaranTarik;
  @override
  String? get tunggakanBunga;
  @override
  String? get biayaDenda;
  @override
  String? get totalKewajiban;
  @override
  String? get kolektabilitas;
  @override
  String? get totalCadanganBunga;
  @override
  String? get accrue;
  @override
  String? get numFasilitas;
  @override
  String? get numRekSimpanan;
  @override
  String? get numRekEscrow;
  @override
  String? get numRekPinjaman;
  @override
  String? get saldoOperasional;
  @override
  @JsonKey(ignore: true)
  _$$_SummaryPinjamanCopyWith<_$_SummaryPinjaman> get copyWith =>
      throw _privateConstructorUsedError;
}

Pinjaman _$PinjamanFromJson(Map<String, dynamic> json) {
  return _Pinjaman.fromJson(json);
}

/// @nodoc
mixin _$Pinjaman {
  @JsonKey(name: 'id_Pinjaman')
  String? get idPinjaman => throw _privateConstructorUsedError;
  String? get nominalOutstanding => throw _privateConstructorUsedError;
  String? get tglJatuhTempoInvoice => throw _privateConstructorUsedError;
  String? get noDokUnderlying => throw _privateConstructorUsedError;
  String? get informasiTanggalPengajuan => throw _privateConstructorUsedError;
  String? get jumlahHariPinjaman => throw _privateConstructorUsedError;
  String? get nominalUnderlying => throw _privateConstructorUsedError;
  String? get cadanganBunga => throw _privateConstructorUsedError;
  String? get jthtempoCadanganBunga => throw _privateConstructorUsedError;
  String? get statusDisburse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PinjamanCopyWith<Pinjaman> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PinjamanCopyWith<$Res> {
  factory $PinjamanCopyWith(Pinjaman value, $Res Function(Pinjaman) then) =
      _$PinjamanCopyWithImpl<$Res, Pinjaman>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_Pinjaman') String? idPinjaman,
      String? nominalOutstanding,
      String? tglJatuhTempoInvoice,
      String? noDokUnderlying,
      String? informasiTanggalPengajuan,
      String? jumlahHariPinjaman,
      String? nominalUnderlying,
      String? cadanganBunga,
      String? jthtempoCadanganBunga,
      String? statusDisburse});
}

/// @nodoc
class _$PinjamanCopyWithImpl<$Res, $Val extends Pinjaman>
    implements $PinjamanCopyWith<$Res> {
  _$PinjamanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPinjaman = freezed,
    Object? nominalOutstanding = freezed,
    Object? tglJatuhTempoInvoice = freezed,
    Object? noDokUnderlying = freezed,
    Object? informasiTanggalPengajuan = freezed,
    Object? jumlahHariPinjaman = freezed,
    Object? nominalUnderlying = freezed,
    Object? cadanganBunga = freezed,
    Object? jthtempoCadanganBunga = freezed,
    Object? statusDisburse = freezed,
  }) {
    return _then(_value.copyWith(
      idPinjaman: freezed == idPinjaman
          ? _value.idPinjaman
          : idPinjaman // ignore: cast_nullable_to_non_nullable
              as String?,
      nominalOutstanding: freezed == nominalOutstanding
          ? _value.nominalOutstanding
          : nominalOutstanding // ignore: cast_nullable_to_non_nullable
              as String?,
      tglJatuhTempoInvoice: freezed == tglJatuhTempoInvoice
          ? _value.tglJatuhTempoInvoice
          : tglJatuhTempoInvoice // ignore: cast_nullable_to_non_nullable
              as String?,
      noDokUnderlying: freezed == noDokUnderlying
          ? _value.noDokUnderlying
          : noDokUnderlying // ignore: cast_nullable_to_non_nullable
              as String?,
      informasiTanggalPengajuan: freezed == informasiTanggalPengajuan
          ? _value.informasiTanggalPengajuan
          : informasiTanggalPengajuan // ignore: cast_nullable_to_non_nullable
              as String?,
      jumlahHariPinjaman: freezed == jumlahHariPinjaman
          ? _value.jumlahHariPinjaman
          : jumlahHariPinjaman // ignore: cast_nullable_to_non_nullable
              as String?,
      nominalUnderlying: freezed == nominalUnderlying
          ? _value.nominalUnderlying
          : nominalUnderlying // ignore: cast_nullable_to_non_nullable
              as String?,
      cadanganBunga: freezed == cadanganBunga
          ? _value.cadanganBunga
          : cadanganBunga // ignore: cast_nullable_to_non_nullable
              as String?,
      jthtempoCadanganBunga: freezed == jthtempoCadanganBunga
          ? _value.jthtempoCadanganBunga
          : jthtempoCadanganBunga // ignore: cast_nullable_to_non_nullable
              as String?,
      statusDisburse: freezed == statusDisburse
          ? _value.statusDisburse
          : statusDisburse // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PinjamanCopyWith<$Res> implements $PinjamanCopyWith<$Res> {
  factory _$$_PinjamanCopyWith(
          _$_Pinjaman value, $Res Function(_$_Pinjaman) then) =
      __$$_PinjamanCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_Pinjaman') String? idPinjaman,
      String? nominalOutstanding,
      String? tglJatuhTempoInvoice,
      String? noDokUnderlying,
      String? informasiTanggalPengajuan,
      String? jumlahHariPinjaman,
      String? nominalUnderlying,
      String? cadanganBunga,
      String? jthtempoCadanganBunga,
      String? statusDisburse});
}

/// @nodoc
class __$$_PinjamanCopyWithImpl<$Res>
    extends _$PinjamanCopyWithImpl<$Res, _$_Pinjaman>
    implements _$$_PinjamanCopyWith<$Res> {
  __$$_PinjamanCopyWithImpl(
      _$_Pinjaman _value, $Res Function(_$_Pinjaman) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPinjaman = freezed,
    Object? nominalOutstanding = freezed,
    Object? tglJatuhTempoInvoice = freezed,
    Object? noDokUnderlying = freezed,
    Object? informasiTanggalPengajuan = freezed,
    Object? jumlahHariPinjaman = freezed,
    Object? nominalUnderlying = freezed,
    Object? cadanganBunga = freezed,
    Object? jthtempoCadanganBunga = freezed,
    Object? statusDisburse = freezed,
  }) {
    return _then(_$_Pinjaman(
      idPinjaman: freezed == idPinjaman
          ? _value.idPinjaman
          : idPinjaman // ignore: cast_nullable_to_non_nullable
              as String?,
      nominalOutstanding: freezed == nominalOutstanding
          ? _value.nominalOutstanding
          : nominalOutstanding // ignore: cast_nullable_to_non_nullable
              as String?,
      tglJatuhTempoInvoice: freezed == tglJatuhTempoInvoice
          ? _value.tglJatuhTempoInvoice
          : tglJatuhTempoInvoice // ignore: cast_nullable_to_non_nullable
              as String?,
      noDokUnderlying: freezed == noDokUnderlying
          ? _value.noDokUnderlying
          : noDokUnderlying // ignore: cast_nullable_to_non_nullable
              as String?,
      informasiTanggalPengajuan: freezed == informasiTanggalPengajuan
          ? _value.informasiTanggalPengajuan
          : informasiTanggalPengajuan // ignore: cast_nullable_to_non_nullable
              as String?,
      jumlahHariPinjaman: freezed == jumlahHariPinjaman
          ? _value.jumlahHariPinjaman
          : jumlahHariPinjaman // ignore: cast_nullable_to_non_nullable
              as String?,
      nominalUnderlying: freezed == nominalUnderlying
          ? _value.nominalUnderlying
          : nominalUnderlying // ignore: cast_nullable_to_non_nullable
              as String?,
      cadanganBunga: freezed == cadanganBunga
          ? _value.cadanganBunga
          : cadanganBunga // ignore: cast_nullable_to_non_nullable
              as String?,
      jthtempoCadanganBunga: freezed == jthtempoCadanganBunga
          ? _value.jthtempoCadanganBunga
          : jthtempoCadanganBunga // ignore: cast_nullable_to_non_nullable
              as String?,
      statusDisburse: freezed == statusDisburse
          ? _value.statusDisburse
          : statusDisburse // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Pinjaman implements _Pinjaman {
  const _$_Pinjaman(
      {@JsonKey(name: 'id_Pinjaman') this.idPinjaman,
      this.nominalOutstanding,
      this.tglJatuhTempoInvoice,
      this.noDokUnderlying,
      this.informasiTanggalPengajuan,
      this.jumlahHariPinjaman,
      this.nominalUnderlying,
      this.cadanganBunga,
      this.jthtempoCadanganBunga,
      this.statusDisburse});

  factory _$_Pinjaman.fromJson(Map<String, dynamic> json) =>
      _$$_PinjamanFromJson(json);

  @override
  @JsonKey(name: 'id_Pinjaman')
  final String? idPinjaman;
  @override
  final String? nominalOutstanding;
  @override
  final String? tglJatuhTempoInvoice;
  @override
  final String? noDokUnderlying;
  @override
  final String? informasiTanggalPengajuan;
  @override
  final String? jumlahHariPinjaman;
  @override
  final String? nominalUnderlying;
  @override
  final String? cadanganBunga;
  @override
  final String? jthtempoCadanganBunga;
  @override
  final String? statusDisburse;

  @override
  String toString() {
    return 'Pinjaman(idPinjaman: $idPinjaman, nominalOutstanding: $nominalOutstanding, tglJatuhTempoInvoice: $tglJatuhTempoInvoice, noDokUnderlying: $noDokUnderlying, informasiTanggalPengajuan: $informasiTanggalPengajuan, jumlahHariPinjaman: $jumlahHariPinjaman, nominalUnderlying: $nominalUnderlying, cadanganBunga: $cadanganBunga, jthtempoCadanganBunga: $jthtempoCadanganBunga, statusDisburse: $statusDisburse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pinjaman &&
            (identical(other.idPinjaman, idPinjaman) ||
                other.idPinjaman == idPinjaman) &&
            (identical(other.nominalOutstanding, nominalOutstanding) ||
                other.nominalOutstanding == nominalOutstanding) &&
            (identical(other.tglJatuhTempoInvoice, tglJatuhTempoInvoice) ||
                other.tglJatuhTempoInvoice == tglJatuhTempoInvoice) &&
            (identical(other.noDokUnderlying, noDokUnderlying) ||
                other.noDokUnderlying == noDokUnderlying) &&
            (identical(other.informasiTanggalPengajuan,
                    informasiTanggalPengajuan) ||
                other.informasiTanggalPengajuan == informasiTanggalPengajuan) &&
            (identical(other.jumlahHariPinjaman, jumlahHariPinjaman) ||
                other.jumlahHariPinjaman == jumlahHariPinjaman) &&
            (identical(other.nominalUnderlying, nominalUnderlying) ||
                other.nominalUnderlying == nominalUnderlying) &&
            (identical(other.cadanganBunga, cadanganBunga) ||
                other.cadanganBunga == cadanganBunga) &&
            (identical(other.jthtempoCadanganBunga, jthtempoCadanganBunga) ||
                other.jthtempoCadanganBunga == jthtempoCadanganBunga) &&
            (identical(other.statusDisburse, statusDisburse) ||
                other.statusDisburse == statusDisburse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idPinjaman,
      nominalOutstanding,
      tglJatuhTempoInvoice,
      noDokUnderlying,
      informasiTanggalPengajuan,
      jumlahHariPinjaman,
      nominalUnderlying,
      cadanganBunga,
      jthtempoCadanganBunga,
      statusDisburse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PinjamanCopyWith<_$_Pinjaman> get copyWith =>
      __$$_PinjamanCopyWithImpl<_$_Pinjaman>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PinjamanToJson(
      this,
    );
  }
}

abstract class _Pinjaman implements Pinjaman {
  const factory _Pinjaman(
      {@JsonKey(name: 'id_Pinjaman') final String? idPinjaman,
      final String? nominalOutstanding,
      final String? tglJatuhTempoInvoice,
      final String? noDokUnderlying,
      final String? informasiTanggalPengajuan,
      final String? jumlahHariPinjaman,
      final String? nominalUnderlying,
      final String? cadanganBunga,
      final String? jthtempoCadanganBunga,
      final String? statusDisburse}) = _$_Pinjaman;

  factory _Pinjaman.fromJson(Map<String, dynamic> json) = _$_Pinjaman.fromJson;

  @override
  @JsonKey(name: 'id_Pinjaman')
  String? get idPinjaman;
  @override
  String? get nominalOutstanding;
  @override
  String? get tglJatuhTempoInvoice;
  @override
  String? get noDokUnderlying;
  @override
  String? get informasiTanggalPengajuan;
  @override
  String? get jumlahHariPinjaman;
  @override
  String? get nominalUnderlying;
  @override
  String? get cadanganBunga;
  @override
  String? get jthtempoCadanganBunga;
  @override
  String? get statusDisburse;
  @override
  @JsonKey(ignore: true)
  _$$_PinjamanCopyWith<_$_Pinjaman> get copyWith =>
      throw _privateConstructorUsedError;
}

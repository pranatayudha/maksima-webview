class RitelInformasiFinansialPari {
  bool? success;
  Data? data;
  String? message;
  int? code;

  RitelInformasiFinansialPari({
    this.success,
    this.data,
    this.message,
    this.code,
  });

  RitelInformasiFinansialPari.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['code'] = code;

    return data;
  }
}

class Data {
  String? prakarsaId;
  String? periode;
  String? financialTypeAnalysis;
  String? neracaPiutangDagang;
  String? neracaPersediaan;
  String? neracaAktivaLancarLainnya;
  String? neracaAktivaLancar;
  String? neracaTanah;
  String? neracaBangunan;
  String? neracaMesinPeralatan;
  String? neracaKendaraan;
  String? neracaInventarisKantor;
  String? neracaAktivaTetapLainnya;
  String? neracaAkumulasiPenyusutan;
  String? neracaTotalAktivaTetap;
  String? neracaTotalAktiva;
  String? neracaHutangDagang;
  String? neracaHutangJangkaPendekLainnya;
  String? neracaTotalHutangJangkaPendek;
  String? neracaHutangJangkaPanjang;
  String? neracaHutangBankJangkaPanjang;
  String? neracaTotalHutangJangkaPanjang;
  String? neracaTotalHutang;
  String? neracaModalDisetor;
  String? neracaLabaDitahan;
  String? neracaLabaBerjalan;
  String? neracaPenyesuaianModal;
  String? neracaTotalModal;
  String? neracaTotalPasiva;
  String? labaRugiPenjualan;
  String? labaRugiBiayaHPP;
  String? labaRugiLabaKotor;
  String? labaRugiBiayaPenjualan;
  String? labaRugiBiayaAdministrasiUmum;
  String? labaRugiBiayaOperasional;
  String? labaRugiLabaOperasional;
  String? labaRugiBiayaPenyusutan;
  String? labaRugiBiayaBunga;
  String? labaRugiPendapatanLainnya;
  String? labaRugiBiayaOperasionalLainnya;
  String? labaRugiBiayaLainnya;
  String? labaRugiLabaSebelumPajak;
  String? labaRugiPajak;
  String? labaRugiLabaBersih;
  String? dER;
  String? rOE;
  String? cR;
  String? rOA;
  String? iCR;
  String? dOP;
  String? qR;
  String? rOI;
  String? dOI;
  String? nWCPositif;
  String? dOR;
  String? eBITDA;
  String? nPM;
  bool? delFlag;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;
  String? dateOfCalculationFirst;
  String? dateOfCalculationLast;
  String? neracaKasBank;
  String? neracaHutangBank12Bulan;
  String? cerminanMutasiPari;
  String? cerminanPenjualan;

  Data({
    this.prakarsaId,
    this.periode,
    this.financialTypeAnalysis,
    this.neracaPiutangDagang,
    this.neracaPersediaan,
    this.neracaAktivaLancarLainnya,
    this.neracaAktivaLancar,
    this.neracaTanah,
    this.neracaBangunan,
    this.neracaMesinPeralatan,
    this.neracaKendaraan,
    this.neracaInventarisKantor,
    this.neracaAktivaTetapLainnya,
    this.neracaAkumulasiPenyusutan,
    this.neracaTotalAktivaTetap,
    this.neracaTotalAktiva,
    this.neracaHutangDagang,
    this.neracaHutangJangkaPendekLainnya,
    this.neracaTotalHutangJangkaPendek,
    this.neracaHutangJangkaPanjang,
    this.neracaHutangBankJangkaPanjang,
    this.neracaTotalHutangJangkaPanjang,
    this.neracaTotalHutang,
    this.neracaModalDisetor,
    this.neracaLabaDitahan,
    this.neracaLabaBerjalan,
    this.neracaPenyesuaianModal,
    this.neracaTotalModal,
    this.neracaTotalPasiva,
    this.labaRugiPenjualan,
    this.labaRugiBiayaHPP,
    this.labaRugiLabaKotor,
    this.labaRugiBiayaPenjualan,
    this.labaRugiBiayaAdministrasiUmum,
    this.labaRugiBiayaOperasional,
    this.labaRugiLabaOperasional,
    this.labaRugiBiayaPenyusutan,
    this.labaRugiBiayaBunga,
    this.labaRugiPendapatanLainnya,
    this.labaRugiBiayaOperasionalLainnya,
    this.labaRugiBiayaLainnya,
    this.labaRugiLabaSebelumPajak,
    this.labaRugiPajak,
    this.labaRugiLabaBersih,
    this.dER,
    this.rOE,
    this.cR,
    this.rOA,
    this.iCR,
    this.dOP,
    this.qR,
    this.rOI,
    this.dOI,
    this.nWCPositif,
    this.dOR,
    this.eBITDA,
    this.nPM,
    this.delFlag,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.dateOfCalculationFirst,
    this.dateOfCalculationLast,
    this.neracaKasBank,
    this.neracaHutangBank12Bulan,
    this.cerminanMutasiPari,
    this.cerminanPenjualan,
  });

  Data.fromJson(Map<String, dynamic> json) {
    prakarsaId = json['prakarsaId'];
    periode = json['periode'];
    financialTypeAnalysis = json['financialTypeAnalysis'];
    neracaPiutangDagang = json['neraca_piutangDagang'];
    neracaPersediaan = json['neraca_persediaan'];
    neracaAktivaLancarLainnya = json['neraca_aktivaLancarLainnya'];
    neracaAktivaLancar = json['neraca_aktivaLancar'];
    neracaTanah = json['neraca_tanah'];
    neracaBangunan = json['neraca_bangunan'];
    neracaMesinPeralatan = json['neraca_mesinPeralatan'];
    neracaKendaraan = json['neraca_kendaraan'];
    neracaInventarisKantor = json['neraca_inventarisKantor'];
    neracaAktivaTetapLainnya = json['neraca_aktivaTetapLainnya'];
    neracaAkumulasiPenyusutan = json['neraca_akumulasiPenyusutan'];
    neracaTotalAktivaTetap = json['neraca_totalAktivaTetap'];
    neracaTotalAktiva = json['neraca_totalAktiva'];
    neracaHutangDagang = json['neraca_hutangDagang'];
    neracaHutangJangkaPendekLainnya = json['neraca_hutangJangkaPendekLainnya'];
    neracaTotalHutangJangkaPendek = json['neraca_totalHutangJangkaPendek'];
    neracaHutangJangkaPanjang = json['neraca_hutangJangkaPanjang'];
    neracaHutangBankJangkaPanjang = json['neraca_hutangBankJangkaPanjang'];
    neracaTotalHutangJangkaPanjang = json['neraca_totalHutangJangkaPanjang'];
    neracaTotalHutang = json['neraca_totalHutang'];
    neracaModalDisetor = json['neraca_modalDisetor'];
    neracaLabaDitahan = json['neraca_labaDitahan'];
    neracaLabaBerjalan = json['neraca_labaBerjalan'];
    neracaPenyesuaianModal = json['neraca_penyesuaianModal'];
    neracaTotalModal = json['neraca_totalModal'];
    neracaTotalPasiva = json['neraca_totalPasiva'];
    labaRugiPenjualan = json['labaRugi_penjualan'];
    labaRugiBiayaHPP = json['labaRugi_biayaHPP'];
    labaRugiLabaKotor = json['labaRugi_labaKotor'];
    labaRugiBiayaPenjualan = json['labaRugi_biayaPenjualan'];
    labaRugiBiayaAdministrasiUmum = json['labaRugi_biayaAdministrasiUmum'];
    labaRugiBiayaOperasional = json['labaRugi_biayaOperasional'];
    labaRugiLabaOperasional = json['labaRugi_labaOperasional'];
    labaRugiBiayaPenyusutan = json['labaRugi_biayaPenyusutan'];
    labaRugiBiayaBunga = json['labaRugi_biayaBunga'];
    labaRugiPendapatanLainnya = json['labaRugi_pendapatanLainnya'];
    labaRugiBiayaOperasionalLainnya = json['labaRugi_biayaOperasionalLainnya'];
    labaRugiBiayaLainnya = json['labaRugi_biayaLainnya'];
    labaRugiLabaSebelumPajak = json['labaRugi_labaSebelumPajak'];
    labaRugiPajak = json['labaRugi_pajak'];
    labaRugiLabaBersih = json['labaRugi_labaBersih'];
    dER = json['DER'];
    rOE = json['ROE'];
    cR = json['CR'];
    rOA = json['ROA'];
    iCR = json['ICR'];
    dOP = json['DOP'];
    qR = json['QR'];
    rOI = json['ROI'];
    dOI = json['DOI'];
    nWCPositif = json['NWC_Positif'];
    dOR = json['DOR'];
    eBITDA = json['EBITDA'];
    nPM = json['NPM'];
    delFlag = json['delFlag'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
    dateOfCalculationFirst = json['dateOfCalculationFirst'];
    dateOfCalculationLast = json['dateOfCalculationLast'];
    neracaKasBank = json['neraca_kasBank'];
    neracaHutangBank12Bulan = json['neraca_hutangBank12Bulan'];
    cerminanMutasiPari = json['cerminanMutasiPari'];
    cerminanPenjualan = json['cerminanPenjualan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prakarsaId'] = prakarsaId;
    data['periode'] = periode;
    data['financialTypeAnalysis'] = financialTypeAnalysis;
    data['neraca_piutangDagang'] = neracaPiutangDagang;
    data['neraca_persediaan'] = neracaPersediaan;
    data['neraca_aktivaLancarLainnya'] = neracaAktivaLancarLainnya;
    data['neraca_aktivaLancar'] = neracaAktivaLancar;
    data['neraca_tanah'] = neracaTanah;
    data['neraca_bangunan'] = neracaBangunan;
    data['neraca_mesinPeralatan'] = neracaMesinPeralatan;
    data['neraca_kendaraan'] = neracaKendaraan;
    data['neraca_inventarisKantor'] = neracaInventarisKantor;
    data['neraca_aktivaTetapLainnya'] = neracaAktivaTetapLainnya;
    data['neraca_akumulasiPenyusutan'] = neracaAkumulasiPenyusutan;
    data['neraca_totalAktivaTetap'] = neracaTotalAktivaTetap;
    data['neraca_totalAktiva'] = neracaTotalAktiva;
    data['neraca_hutangDagang'] = neracaHutangDagang;
    data['neraca_hutangJangkaPendekLainnya'] = neracaHutangJangkaPendekLainnya;
    data['neraca_totalHutangJangkaPendek'] = neracaTotalHutangJangkaPendek;
    data['neraca_hutangJangkaPanjang'] = neracaHutangJangkaPanjang;
    data['neraca_hutangBankJangkaPanjang'] = neracaHutangBankJangkaPanjang;
    data['neraca_totalHutangJangkaPanjang'] = neracaTotalHutangJangkaPanjang;
    data['neraca_totalHutang'] = neracaTotalHutang;
    data['neraca_modalDisetor'] = neracaModalDisetor;
    data['neraca_labaDitahan'] = neracaLabaDitahan;
    data['neraca_labaBerjalan'] = neracaLabaBerjalan;
    data['neraca_penyesuaianModal'] = neracaPenyesuaianModal;
    data['neraca_totalModal'] = neracaTotalModal;
    data['neraca_totalPasiva'] = neracaTotalPasiva;
    data['labaRugi_penjualan'] = labaRugiPenjualan;
    data['labaRugi_biayaHPP'] = labaRugiBiayaHPP;
    data['labaRugi_labaKotor'] = labaRugiLabaKotor;
    data['labaRugi_biayaPenjualan'] = labaRugiBiayaPenjualan;
    data['labaRugi_biayaAdministrasiUmum'] = labaRugiBiayaAdministrasiUmum;
    data['labaRugi_biayaOperasional'] = labaRugiBiayaOperasional;
    data['labaRugi_labaOperasional'] = labaRugiLabaOperasional;
    data['labaRugi_biayaPenyusutan'] = labaRugiBiayaPenyusutan;
    data['labaRugi_biayaBunga'] = labaRugiBiayaBunga;
    data['labaRugi_pendapatanLainnya'] = labaRugiPendapatanLainnya;
    data['labaRugi_biayaOperasionalLainnya'] = labaRugiBiayaOperasionalLainnya;
    data['labaRugi_biayaLainnya'] = labaRugiBiayaLainnya;
    data['labaRugi_labaSebelumPajak'] = labaRugiLabaSebelumPajak;
    data['labaRugi_pajak'] = labaRugiPajak;
    data['labaRugi_labaBersih'] = labaRugiLabaBersih;
    data['DER'] = dER;
    data['ROE'] = rOE;
    data['CR'] = cR;
    data['ROA'] = rOA;
    data['ICR'] = iCR;
    data['DOP'] = dOP;
    data['QR'] = qR;
    data['ROI'] = rOI;
    data['DOI'] = dOI;
    data['NWC_Positif'] = nWCPositif;
    data['DOR'] = dOR;
    data['EBITDA'] = eBITDA;
    data['NPM'] = nPM;
    data['delFlag'] = delFlag;
    data['createdAt'] = createdAt;
    data['createdBy'] = createdBy;
    data['updatedAt'] = updatedAt;
    data['updatedBy'] = updatedBy;
    data['dateOfCalculationFirst'] = dateOfCalculationFirst;
    data['dateOfCalculationLast'] = dateOfCalculationLast;
    data['neraca_kasBank'] = neracaKasBank;
    data['neraca_hutangBank12Bulan'] = neracaHutangBank12Bulan;
    data['cerminanMutasiPari'] = cerminanMutasiPari;
    data['cerminanPenjualan'] = cerminanPenjualan;

    return data;
  }
}
